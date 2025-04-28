package com.grading.system.model.param;

import java.io.Serializable;
import lombok.Data;

@Data
public class QuestionnaireQueryParam implements Serializable {
    /**
     * 考核人Id
     */
    private Long userId;
    /**
     * 模版类型
     */
    private Integer templateType;
}
