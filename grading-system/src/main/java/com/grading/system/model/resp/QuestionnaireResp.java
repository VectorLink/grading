package com.grading.system.model.resp;

import java.io.Serializable;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class QuestionnaireResp implements Serializable {
    /**
     * 问卷Id
     */
    private String questionnaireId;
    /**
     * 活动名称
     */
    private String templateName;
    /**
     * 被考核人Id
     */
    private Long userId;
    /**
     * 被考核人名称
     */
    private String userName;
    /**
     * 创建人
     */
    private Long createUserId;
    /**
     * 创建人名称
     */
    private String createUserName;
    /**
     * 值
     */
    private String value;
}
