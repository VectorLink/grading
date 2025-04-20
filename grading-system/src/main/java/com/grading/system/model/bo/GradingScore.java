package com.grading.system.model.bo;

import java.io.Serializable;
import java.math.BigDecimal;
import lombok.Data;

/**
 * 考核分信息
 */
@Data
public class GradingScore implements Serializable {
    /**
     * Id
     */
    private String contentId;
    /**
     * 分数
     */
    private BigDecimal score;
}
