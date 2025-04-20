package com.grading.system.service.impl;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.Optional;
import java.util.Set;
import java.util.stream.Collectors;
import javax.annotation.Resource;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.grading.common.constant.Constants;
import com.grading.common.core.domain.entity.SysUser;
import com.grading.common.core.domain.model.LoginUser;
import com.grading.common.enums.GradingTypeEnum;
import com.grading.common.enums.RoleTypeEnum;
import com.grading.common.utils.SecurityUtils;
import com.grading.system.domain.Grading;
import com.grading.system.domain.GradingContent;
import com.grading.system.domain.GradingTemplateMeta;
import com.grading.system.mapper.GradingMapper;
import com.grading.system.model.bo.GradingContentMeta;
import com.grading.system.model.bo.GradingTitleMeta;
import com.grading.system.model.param.GradingUserParam;
import com.grading.system.model.resp.UserGradingResp;
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

/**
 * 考核Service业务层处理
 *
 * @author ruoyi
 * @date 2025-04-18
 */
@Service
public class GradingServiceImpl extends ServiceImpl<GradingMapper, Grading> implements IGradingService {
    @Resource
    private ISysUserService iSysUserService;
    @Resource
    private IGradingTemplateMetaService iGradingTemplateMetaService;
    @Resource
    private IGradingContentService iGradingContentService;
    @Resource
    private ISysRoleService iSysRoleService;

    @Override
    @Transactional(rollbackFor = Exception.class)
    public UserGradingResp getUserGrading(GradingUserParam param) {
        Assert.notNull(param.getUserId(), "用户ID不能为空！");
        SysUser sysUser = iSysUserService.selectUserById(param.getUserId());
        Assert.notNull(sysUser, "用户不存在");


        //获取当前登录人信息
        LoginUser loginUser = SecurityUtils.getLoginUser();

        List<GradingTemplateMeta> gradingTemplateMetas = iGradingTemplateMetaService.listGradingTypeTitle(param.getType());

        List<GradingTitleMeta> titleMetas = gradingTemplateMetas.stream()
                .filter(f -> {
                    //不校验权限
                    if (!f.getPermValid() || SecurityUtils.isAdmin(loginUser.getUserId()) || loginUser.getUserId().equals(param.getUserId())) {
                        return true;
                    }
                    //校验权限
                    if (loginUser.getPermissions().contains(f.getRightCode())) {
                        return true;
                    }
                    return false;
                })
                .map(l ->
                        GradingTitleMeta.builder()
                                .code(l.getCode())
                                .name(l.getName())
                                .sort(l.getSort())
                                .build()
                ).collect(Collectors.toList());
        //判断是否存在，如果存在就获取，不存在需要新建一个考核单
        UserGradingResp userGradingResp = new UserGradingResp();
        userGradingResp.setTitles(titleMetas);
        Grading grading = lambdaQuery().eq(Grading::getUserId, param.getUserId())
                .eq(Grading::getGradingType, param.getType())
                .eq(Grading::getGradingMonth, param.getYearMonth().format(DateTimeFormatter.ofPattern(Constants.GRADING_MONTH_PATTERN))).one();

        List<String> titleMetaCodes = titleMetas.stream().map(GradingTitleMeta::getCode).collect(Collectors.toList());
        if (Objects.nonNull(grading)) {
            userGradingResp.setUserId(param.getUserId());
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
}
