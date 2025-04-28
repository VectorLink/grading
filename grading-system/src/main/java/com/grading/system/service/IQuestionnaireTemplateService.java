package com.grading.system.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.grading.system.domain.QuestionnaireTemplate;

public interface IQuestionnaireTemplateService extends IService<QuestionnaireTemplate> {
    /**
     * 根据类型获取对应的模版数据
     * @param questionnaireType 类型
     * @return
     */
    QuestionnaireTemplate getByType(Integer questionnaireType);
}
