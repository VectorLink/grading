package com.grading.system.model.param;

import java.io.Serializable;
import java.time.YearMonth;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.grading.common.constant.Constants;
import lombok.Data;

@Data
public class GradingUserParam implements Serializable {
    /**
     * 年份-月份
     */
    @JsonFormat(pattern = Constants.GRADING_MONTH_PATTERN)
    private YearMonth yearMonth;
    /**
     * 用户名
     */
    private Long userId;
    /**
     * 考核类型
     */
    private Integer type;
}
