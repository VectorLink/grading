package com.grading.system.model.param;

import java.io.Serializable;
import java.util.List;
import com.grading.system.model.bo.GradingScore;
import lombok.Data;

/**
 * 用户考核
 */
@Data
public class GradingUserParam implements Serializable {
    /**
     * 考核表Id
     */
    private Long gradingId;

    private List<GradingScore> scores;
}
