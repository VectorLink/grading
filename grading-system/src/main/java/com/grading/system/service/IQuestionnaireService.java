package com.grading.system.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.grading.system.domain.Questionnaire;
import com.grading.system.model.param.QuestionnaireQueryParam;
import com.grading.system.model.param.QuestionnaireSubmitParam;
import com.grading.system.model.resp.QuestionnaireResp;

public interface IQuestionnaireService extends IService<Questionnaire> {
    /**
     * 根据请求类型获取对应的问卷信息
     * @param param 参数
     * @return
     */
    QuestionnaireResp getQuestionnaire(QuestionnaireQueryParam param);


    /**
     * 获取问卷
     * @param templateId
     * @param userId
     * @param createUserId
     * @return
     */
    Questionnaire getQuestionnaireByUserId(Long templateId,Long userId,Long createUserId);

    /**
     * 提交问卷
     * @param param
     */
    void submitQuestionnaire(QuestionnaireSubmitParam param);
}
