package com.grading.system.model.resp;

import java.io.Serializable;
import java.util.List;
import com.grading.system.model.bo.GradingContentMeta;
import com.grading.system.model.bo.GradingTitleMeta;
import lombok.Data;

/**
 * 用户考核信息
 */
@Data
public class UserGradingResp implements Serializable {
    /**
     * 用户ID
     */
    private Long userId;
    /**
     * 考核名称
     */
    private String gradingName;
    /**
     * 考核月份
     */
    private String gradingMonth;
    /**
     * 标题
     */
    private List<GradingTitleMeta> titles;
    /**
     * 内容
     */
    private List<GradingContentMeta> contents;
}
