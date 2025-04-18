package com.grading.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.grading.common.annotation.Excel;
import com.grading.common.core.domain.BaseEntity;

/**
 * 评价内容对象 grading_content_rel
 * 
 * @author ruoyi
 * @date 2025-04-18
 */
public class GradingContentRel extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键 */
    private Long id;

    /** 评价表Id */
    @Excel(name = "评价表Id")
    private Long gradingId;

    /** 评价内容Id */
    @Excel(name = "评价内容Id")
    private Long contentId;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }

    public void setGradingId(Long gradingId) 
    {
        this.gradingId = gradingId;
    }

    public Long getGradingId() 
    {
        return gradingId;
    }

    public void setContentId(Long contentId) 
    {
        this.contentId = contentId;
    }

    public Long getContentId() 
    {
        return contentId;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("gradingId", getGradingId())
            .append("contentId", getContentId())
            .toString();
    }
}
