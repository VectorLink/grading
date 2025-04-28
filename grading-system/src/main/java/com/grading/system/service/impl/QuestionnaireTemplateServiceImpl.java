package com.grading.system.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.grading.system.domain.QuestionnaireTemplate;
import com.grading.system.mapper.QuestionnaireTemplateMapper;
import com.grading.system.service.IQuestionnaireTemplateService;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

@Service
public class QuestionnaireTemplateServiceImpl extends ServiceImpl<QuestionnaireTemplateMapper, QuestionnaireTemplate> implements IQuestionnaireTemplateService {
    @Override
    public QuestionnaireTemplate getByType(Integer questionnaireType) {
        Assert.notNull(questionnaireType, "类型不能为空！");
        return lambdaQuery().eq(QuestionnaireTemplate::getType, questionnaireType)
                .one();
    }
}
