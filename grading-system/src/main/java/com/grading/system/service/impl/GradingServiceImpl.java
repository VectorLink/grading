package com.grading.system.service.impl;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.Optional;
import java.util.Set;
import java.util.function.Function;
import java.util.stream.Collectors;
import javax.annotation.Resource;
import com.alibaba.fastjson2.JSON;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.grading.common.constant.Constants;
import com.grading.common.core.domain.entity.SysUser;
import com.grading.common.core.domain.model.LoginUser;
import com.grading.common.enums.GradingTypeEnum;
import com.grading.common.enums.RoleTypeEnum;
import com.grading.common.utils.SecurityUtils;
import com.grading.system.domain.Grading;
import com.grading.system.domain.GradingContent;
import com.grading.system.domain.GradingContentDetail;
import com.grading.system.domain.GradingTemplateMeta;
import com.grading.system.mapper.GradingMapper;
import com.grading.system.model.bo.GradingContentMeta;
import com.grading.system.model.bo.GradingScore;
import com.grading.system.model.bo.GradingTitleMeta;
import com.grading.system.model.param.GradingUserParam;
import com.grading.system.model.param.GradingUserQueryParam;
import com.grading.system.model.resp.UserGradingResp;
import com.grading.system.service.IGradingContentDetailService;
import com.grading.system.service.IGradingContentService;
import com.grading.system.service.IGradingService;
import com.grading.system.service.IGradingTemplateMetaService;
import com.grading.system.service.ISysRoleService;
import com.grading.system.service.ISysUserService;
import org.apache.commons.collections4.CollectionUtils;
import org.apache.commons.lang3.BooleanUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;
import lombok.extern.slf4j.Slf4j;

/**
 * 考核Service业务层处理
 *
 * @author ruoyi
 * @date 2025-04-18
 */
@Service
@Slf4j
public class GradingServiceImpl extends ServiceImpl<GradingMapper, Grading> implements IGradingService {
    @Resource
    private ISysUserService iSysUserService;
    @Resource
    private IGradingTemplateMetaService iGradingTemplateMetaService;
    @Resource
    private IGradingContentService iGradingContentService;
    @Resource
    private ISysRoleService iSysRoleService;
    @Resource
    private IGradingContentDetailService iGradingContentDetailService;

    @Override
    @Transactional(rollbackFor = Exception.class)
    public UserGradingResp getUserGrading(GradingUserQueryParam param) {
        Assert.notNull(param.getUserId(), "用户ID不能为空！");
        SysUser sysUser = iSysUserService.selectUserById(param.getUserId());
        Assert.notNull(sysUser, "用户不存在");


        //获取当前登录人信息
        LoginUser loginUser = SecurityUtils.getLoginUser();

        List<GradingTemplateMeta> gradingTemplateMetas = iGradingTemplateMetaService.listGradingTypeTitle(param.getType());

        List<GradingTitleMeta> titleMetas = convert(getUserTitleMeta(param.getUserId(), loginUser, gradingTemplateMetas));
        //判断是否存在，如果存在就获取，不存在需要新建一个考核单
        UserGradingResp userGradingResp = new UserGradingResp();
        userGradingResp.setTitles(titleMetas);
        Grading grading = lambdaQuery().eq(Grading::getUserId, param.getUserId())
                .eq(Grading::getGradingType, param.getType())
                .eq(Grading::getGradingMonth, param.getYearMonth().format(DateTimeFormatter.ofPattern(Constants.GRADING_MONTH_PATTERN))).one();

        List<String> titleMetaCodes = titleMetas.stream().map(GradingTitleMeta::getCode).collect(Collectors.toList());
        if (Objects.nonNull(grading)) {
            userGradingResp.setUserId(param.getUserId());
            userGradingResp.setGradingId(grading.getId());
            userGradingResp.setGradingName(grading.getGradingName());
            userGradingResp.setGradingMonth(grading.getGradingMonth());
            //获取考核内容
            userGradingResp.setContents(iGradingContentService.listGradingContentByGradingId(grading.getId(), titleMetaCodes));
        } else {
            //生成考核表
            //验证一下创建是否合理
            Set<String> sysRoles = iSysRoleService.selectRolePermissionByUserId(param.getUserId());

            if (CollectionUtils.isEmpty(sysRoles)) {
                throw new RuntimeException("用户" + sysUser.getUserName() + "未分配角色，请先分配角色!");
            }
            GradingTypeEnum gradingTypeEnum = GradingTypeEnum.fromType(param.getType());
            List<GradingTypeEnum> gradingTypeEnums = sysRoles.stream()
                    .map(RoleTypeEnum::fromPermissionCode)
                    .map(RoleTypeEnum::getGradingType)
                    .flatMap(Collection::stream).collect(Collectors.toList());
            if (!gradingTypeEnums.contains(gradingTypeEnum)) {
                throw new RuntimeException("用户无权限生成该类型考核表");
            }

            Grading newInstance = Grading.builder()
                    .gradingEndTime(param.getYearMonth().atEndOfMonth().atTime(23, 59, 59))
                    .gradingStartTime(param.getYearMonth().atDay(1).atTime(0, 0, 0))
                    .gradingMonth(param.getYearMonth().format(DateTimeFormatter.ofPattern(Constants.GRADING_MONTH_PATTERN)))
                    .gradingType(param.getType())
                    .gradingName(gradingTypeEnum.getName())
                    .userId(param.getUserId())
                    .createUserId(loginUser.getUserId())
                    .createTime(LocalDateTime.now())
                    .updateTime(LocalDateTime.now())
                    .updateUserId(loginUser.getUserId())
                    .build();
            newInstance.setStatus(BooleanUtils.toInteger(LocalDateTime.now().compareTo(newInstance.getGradingStartTime()) > 0
                    && LocalDateTime.now().compareTo(newInstance.getGradingEndTime()) < 0));
            saveOrUpdate(newInstance);
            userGradingResp.setUserId(param.getUserId());
            userGradingResp.setGradingName(newInstance.getGradingName());
            userGradingResp.setGradingMonth(newInstance.getGradingMonth());
            userGradingResp.setGradingId(newInstance.getId());
            //插入系统级参数
            List<GradingContent> systemContent = iGradingContentService.createContent(newInstance.getId(), gradingTemplateMetas);
            Map<Long, String> metaMap = gradingTemplateMetas.stream().collect(Collectors.toMap(GradingTemplateMeta::getId, GradingTemplateMeta::getCode));
            List<GradingContentMeta> contentMetas = systemContent.stream().map(
                    l -> GradingContentMeta.builder()
                            .content(l.getContent())
                            .mergeColumn(BooleanUtils.toBoolean(l.getMergeColumn()))
                            .mergeRow(BooleanUtils.toBoolean(l.getMergeRow()))
                            .rowId(l.getRowId())
                            .systemValue(BooleanUtils.toBoolean(l.getSystemValue()))
                            .titleCode(Optional.ofNullable(metaMap.get(l.getTemplateMetaId())).orElse(StringUtils.EMPTY))
                            .contentId(l.getId().toString())
                            .build()
            ).collect(Collectors.toList());

            userGradingResp.setContents(contentMetas);

        }

        return userGradingResp;
    }

    /**
     * 获取用户可以接触到的数据
     * @param userId 考核对象Id
     * @param loginUser 登录人
     * @param gradingTemplateMetas 数据模版
     * @return
     */
    private List<GradingTemplateMeta> getUserTitleMeta(Long userId, LoginUser loginUser, List<GradingTemplateMeta> gradingTemplateMetas) {
        return gradingTemplateMetas.stream()
                .filter(f -> {
                    //不校验权限
                    if (!f.getPermValid() || SecurityUtils.isAdmin(loginUser.getUserId()) || loginUser.getUserId().equals(userId)) {
                        return true;
                    }
                    //校验权限
                    if (loginUser.getPermissions().contains(f.getRightCode())) {
                        return true;
                    }
                    return false;
                }).collect(Collectors.toList());

    }

    private List<GradingTitleMeta> convert(List<GradingTemplateMeta> templateMetas) {
        return templateMetas.stream().map(l ->
                GradingTitleMeta.builder()
                        .code(l.getCode())
                        .name(l.getName())
                        .sort(l.getSort())
                        .build()
        ).collect(Collectors.toList());
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void grading(GradingUserParam param) {
        Assert.notNull(param.getGradingId(),"考核单Id不能为空！");
        Grading grading = getById(param.getGradingId());
        Assert.notNull(grading,"考核单不存在！");
        Assert.isTrue(grading.getStatus().equals(1),"考核单不在考核中！");
        Assert.notEmpty(param.getScores(),"考核分数不能为空！");
        //登录人信息
        LoginUser loginUser = SecurityUtils.getLoginUser();

        //过滤出操作人可以操作的评分数据
        log.info("用户：{}开始对考核表：{}，考核日期：{}进行评分，参数：{}",loginUser.getUsername(),grading.getGradingName(),grading.getGradingMonth(), JSON.toJSONString(param));

        List<GradingTemplateMeta> gradingTemplateMetas = iGradingTemplateMetaService.listGradingTypeTitle(grading.getGradingType());
        //获取用户可以处理的执行表格
        Set<Long> userTitleMeta = getUserTitleMeta(grading.getUserId(), loginUser, gradingTemplateMetas).stream().map(GradingTemplateMeta::getId).collect(Collectors.toSet());

        List<Long> contentIds = param.getScores().stream().map(GradingScore::getContentId).map(Long::valueOf).collect(Collectors.toList());

        List<GradingContent> gradingContents = iGradingContentService.listByIds(contentIds);

        Set<Long> templateMetaId = gradingContents.stream().map(GradingContent::getTemplateMetaId).collect(Collectors.toSet());

        //验证一下操作权限
        if (templateMetaId.stream().filter(l->!userTitleMeta.contains(l)).findAny().isPresent()) {
            throw new RuntimeException("用户操作无权限操作！");
        }

        //开始评分
        //分数MAP
        Map<Long, BigDecimal> contentScoreMap = param.getScores().stream().collect(Collectors.toMap(l->Long.valueOf(l.getContentId()), GradingScore::getScore));
        //判断是否已经评分过
        List<GradingContentDetail> gradingContentDetails = iGradingContentDetailService.listGradingContentDetail(loginUser.getUserId(), contentIds);
        //修改分数
        if (CollectionUtils.isNotEmpty(gradingContentDetails)){
            for (GradingContentDetail gradingContentDetail : gradingContentDetails) {
                Optional.ofNullable(contentScoreMap.get(gradingContentDetail.getContentId()))
                        .ifPresent(gradingContentDetail::setScore);
                gradingContentDetail.setUpdateTime(LocalDateTime.now());
            }
        } else {
            contentScoreMap.forEach((contentId, score) ->
                    gradingContentDetails.add(GradingContentDetail.builder()
                            .contentId(contentId)
                            .score(score)
                            .gradingUserId(loginUser.getUserId())
                            .createTime(LocalDateTime.now())
                            .updateTime(LocalDateTime.now())
                            .build()


                    ));
        }

       //保存评分数据
        iGradingContentDetailService.saveOrUpdateBatch(gradingContentDetails);

        //再次计算平均分
        iGradingContentService.calculateAverageScore(contentIds);
    }
}
