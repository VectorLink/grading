package com.grading.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.grading.common.annotation.Excel;
import com.grading.common.core.domain.BaseEntity;

/**
 * 考核内容值对象 grading_content
 * 
 * @author ruoyi
 * @date 2025-04-18
 */
public class GradingContent extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键 */
    private Long id;

    /** 元数据Id */
    @Excel(name = "元数据Id")
    private Long templateMetaId;

    /** 系统模板参数 0-否 1-系统 */
    @Excel(name = "系统模板参数 0-否 1-系统")
    private Integer systemValue;

    /** 内容 */
    @Excel(name = "内容")
    private String value;

    /** 行号 */
    @Excel(name = "行号")
    private Integer rowId;

    /** 列合并 */
    @Excel(name = "列合并")
    private Integer mergeColumn;

    /** 行合并 */
    @Excel(name = "行合并")
    private Integer rowColumn;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }

    public void setTemplateMetaId(Long templateMetaId) 
    {
        this.templateMetaId = templateMetaId;
    }

    public Long getTemplateMetaId() 
    {
        return templateMetaId;
    }

    public void setSystemValue(Integer systemValue) 
    {
        this.systemValue = systemValue;
    }

    public Integer getSystemValue() 
    {
        return systemValue;
    }

    public void setValue(String value) 
    {
        this.value = value;
    }

    public String getValue() 
    {
        return value;
    }

    public void setRowId(Integer rowId) 
    {
        this.rowId = rowId;
    }

    public Integer getRowId() 
    {
        return rowId;
    }

    public void setMergeColumn(Integer mergeColumn) 
    {
        this.mergeColumn = mergeColumn;
    }

    public Integer getMergeColumn() 
    {
        return mergeColumn;
    }

    public void setRowColumn(Integer rowColumn) 
    {
        this.rowColumn = rowColumn;
    }

    public Integer getRowColumn() 
    {
        return rowColumn;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("templateMetaId", getTemplateMetaId())
            .append("systemValue", getSystemValue())
            .append("value", getValue())
            .append("rowId", getRowId())
            .append("mergeColumn", getMergeColumn())
            .append("rowColumn", getRowColumn())
            .toString();
    }
}
