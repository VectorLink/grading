package com.grading.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.grading.common.annotation.Excel;
import com.grading.common.core.domain.BaseEntity;

/**
 * 考核模板对象 grading_template
 * 
 * @author ruoyi
 * @date 2025-04-18
 */
public class GradingTemplate extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键 */
    private Long id;

    /** 模版类型 */
    @Excel(name = "模版类型")
    private Integer type;

    /** 模板名称 */
    @Excel(name = "模板名称")
    private String typeName;

    /** 创建人 */
    @Excel(name = "创建人")
    private Long createUser;

    /** 更新人 */
    @Excel(name = "更新人")
    private Long updateUser;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }

    public void setType(Integer type) 
    {
        this.type = type;
    }

    public Integer getType() 
    {
        return type;
    }

    public void setTypeName(String typeName) 
    {
        this.typeName = typeName;
    }

    public String getTypeName() 
    {
        return typeName;
    }

    public void setCreateUser(Long createUser) 
    {
        this.createUser = createUser;
    }

    public Long getCreateUser() 
    {
        return createUser;
    }

    public void setUpdateUser(Long updateUser) 
    {
        this.updateUser = updateUser;
    }

    public Long getUpdateUser() 
    {
        return updateUser;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("type", getType())
            .append("typeName", getTypeName())
            .append("createTime", getCreateTime())
            .append("updateTime", getUpdateTime())
            .append("createUser", getCreateUser())
            .append("updateUser", getUpdateUser())
            .toString();
    }
}
