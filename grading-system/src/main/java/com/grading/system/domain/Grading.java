package com.grading.system.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.grading.common.annotation.Excel;
import com.grading.common.core.domain.BaseEntity;

/**
 * 考核对象 grading
 * 
 * @author ruoyi
 * @date 2025-04-18
 */
public class Grading extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键 */
    private Long id;

    /** 考核人Id */
    @Excel(name = "考核人Id")
    private Long userId;

    /** 考核表名称 */
    @Excel(name = "考核表名称")
    private String gradingName;

    /** 考核月份 */
    @Excel(name = "考核月份")
    private Integer gradingMonth;

    /** 考核开始时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "考核开始时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date gradingStartTime;

    /** 考核结束时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "考核结束时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date gradingEndTime;

    /** 考核状态 0-已结束 1-考核中 */
    @Excel(name = "考核状态 0-已结束 1-考核中")
    private Integer status;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }

    public void setUserId(Long userId) 
    {
        this.userId = userId;
    }

    public Long getUserId() 
    {
        return userId;
    }

    public void setGradingName(String gradingName) 
    {
        this.gradingName = gradingName;
    }

    public String getGradingName() 
    {
        return gradingName;
    }

    public void setGradingMonth(Integer gradingMonth) 
    {
        this.gradingMonth = gradingMonth;
    }

    public Integer getGradingMonth() 
    {
        return gradingMonth;
    }

    public void setGradingStartTime(Date gradingStartTime) 
    {
        this.gradingStartTime = gradingStartTime;
    }

    public Date getGradingStartTime() 
    {
        return gradingStartTime;
    }

    public void setGradingEndTime(Date gradingEndTime) 
    {
        this.gradingEndTime = gradingEndTime;
    }

    public Date getGradingEndTime() 
    {
        return gradingEndTime;
    }

    public void setStatus(Integer status) 
    {
        this.status = status;
    }

    public Integer getStatus() 
    {
        return status;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("userId", getUserId())
            .append("gradingName", getGradingName())
            .append("gradingMonth", getGradingMonth())
            .append("gradingStartTime", getGradingStartTime())
            .append("gradingEndTime", getGradingEndTime())
            .append("status", getStatus())
            .toString();
    }
}
