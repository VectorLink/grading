package com.grading.system.domain;

import java.io.Serializable;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.grading.common.annotation.Excel;
import com.grading.common.core.domain.BaseEntity;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 评价内容对象 grading_content_rel
 * 
 * @author ruoyi
 * @date 2025-04-18
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class GradingContentRel implements Serializable {
    private static final long serialVersionUID = 1L;

    /** 主键 */
    private Long id;

    /** 评价表Id */
    @Excel(name = "评价表Id")
    private Long gradingId;

    /** 评价内容Id */
    @Excel(name = "评价内容Id")
    private Long contentId;
}
