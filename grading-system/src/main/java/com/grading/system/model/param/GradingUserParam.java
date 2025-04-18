package com.grading.system.model.param;

import java.io.Serializable;
import lombok.Data;

@Data
public class GradingUserParam implements Serializable {
    /**
     * 月份
     */
    private Integer month;
    /**
     * 用户名
     */
    private Long userId;
    /**
     * 考核类型
     */
    private Integer type;
}
