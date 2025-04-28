package com.grading.system.service.impl;

import java.time.LocalDateTime;
import java.util.Objects;
import java.util.Optional;
import javax.annotation.Resource;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.grading.common.core.domain.entity.SysUser;
import com.grading.common.enums.QuestionnaireTypeEnum;
import com.grading.common.utils.SecurityUtils;
import com.grading.system.domain.Questionnaire;
import com.grading.system.domain.QuestionnaireTemplate;
import com.grading.system.mapper.QuestionnaireMapper;
import com.grading.system.model.param.QuestionnaireQueryParam;
import com.grading.system.model.param.QuestionnaireSubmitParam;
import com.grading.system.model.resp.QuestionnaireResp;
import com.grading.system.service.IQuestionnaireService;
import com.grading.system.service.IQuestionnaireTemplateService;
import com.grading.system.service.ISysUserService;
import org.apache.commons.lang3.ObjectUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class QuestionnaireServiceImpl extends ServiceImpl<QuestionnaireMapper, Questionnaire> implements IQuestionnaireService {
    @Resource
    private IQuestionnaireTemplateService iQuestionnaireTemplateService;
    @Resource
    private ISysUserService iSysUserService;

    @Override
    public QuestionnaireResp getQuestionnaire(QuestionnaireQueryParam param) {
        Assert.notNull(param.getTemplateType(), "模板类型不能为空！");
        //验证各个参数
        QuestionnaireTypeEnum typeEnum = QuestionnaireTypeEnum.fromData(param.getTemplateType());
        switch (typeEnum) {

            case ACTIVITIES:
                Assert.notNull(param.getUserId(), "被考核人Id不能为空");
                break;

            default:
                log.info("默认值正确");
        }
        //获取模版数据
        QuestionnaireTemplate questionnaireTemplate = iQuestionnaireTemplateService.getByType(param.getTemplateType());
        //获取对应的问卷
        Questionnaire questionnaire = getQuestionnaireByUserId(questionnaireTemplate.getId(), param.getUserId(), SecurityUtils.getUserId());

        if (Objects.nonNull(questionnaire)) {
            return convertQuestionnaireModel(param, questionnaireTemplate, questionnaire);
        }

        questionnaire = Questionnaire.builder()
                .creteUserId(SecurityUtils.getUserId())
                .createTime(LocalDateTime.now())
                .updateTime(LocalDateTime.now())
                .updateUserId(SecurityUtils.getUserId())
                .templateId(questionnaireTemplate.getId())
                .userId(param.getUserId())
                .value(questionnaireTemplate.getValue())
                .build();
        saveOrUpdate(questionnaire);

        return convertQuestionnaireModel(param, questionnaireTemplate, questionnaire);
    }

    private QuestionnaireResp convertQuestionnaireModel(QuestionnaireQueryParam param, QuestionnaireTemplate questionnaireTemplate, Questionnaire questionnaire) {
        return QuestionnaireResp.builder()
                .questionnaireId(questionnaire.getId().toString())
                .createUserId(SecurityUtils.getUserId())
                .createUserName(SecurityUtils.getUsername())
                .value(questionnaire.getValue())
                .userId(param.getUserId())
                .userName(Optional.ofNullable(param.getUserId())
                        .map(iSysUserService::selectUserById)
                        .map(SysUser::getNickName).orElse(StringUtils.EMPTY)
                )
                .templateName(questionnaireTemplate.getName())
                .build();
    }


    @Override
    public Questionnaire getQuestionnaireByUserId(Long templateId, Long userId, Long createUserId) {
        Assert.isTrue(ObjectUtils.allNotNull(templateId, createUserId), "模板和创建人不能为空！");
        return lambdaQuery()
                .eq(Questionnaire::getCreteUserId, createUserId)
                .eq(Objects.nonNull(userId), Questionnaire::getUserId, userId)
                .eq(Questionnaire::getTemplateId, templateId)
                .one();
    }

    @Override
    public void submitQuestionnaire(QuestionnaireSubmitParam param) {
        Assert.notNull(param.getQuestionnaireId(), "问卷Id不能为空！");
        Questionnaire questionnaire = getById(param.getQuestionnaireId());
        Assert.notNull(questionnaire, "问卷不存在！");
        questionnaire.setValue(param.getValue());
        questionnaire.setUpdateTime(LocalDateTime.now());
        questionnaire.setUpdateUserId(SecurityUtils.getUserId());

        saveOrUpdate(questionnaire);
    }
}
