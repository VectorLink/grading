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
     * 内容详情Id
     */
    private String contentDetailId;
    /**
     * 分数
     */
    private BigDecimal score;
}
