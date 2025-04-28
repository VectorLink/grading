package com.grading.system.model.param;

import java.io.Serializable;
import lombok.Data;

@Data
public class QuestionnaireSubmitParam implements Serializable {
    /**
     * 问卷Id
     */
    private String questionnaireId;
    /**
     * 问卷内容
     */
    private String value;
}
