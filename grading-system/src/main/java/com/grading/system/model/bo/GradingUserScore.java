package com.grading.system.model.bo;

import java.io.Serializable;
import java.math.BigDecimal;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class GradingUserScore implements Serializable {
    /**
     * 评价项
     */
    private String gradingName;
    /**
     * 评价人
     */
    private String userName;
    /**
     * 评价内容
     */
    private String title;
    /**
     * 评分Id
     */
    private Long contentId;
    /**
     * 分值
     */
    private BigDecimal score;
}
