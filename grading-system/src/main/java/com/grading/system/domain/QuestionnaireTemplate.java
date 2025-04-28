package com.grading.system.domain;

import java.io.Serializable;
import java.time.LocalDateTime;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.grading.common.annotation.Excel;
import com.grading.common.core.domain.BaseEntity;
import lombok.Data;

/**
 * 问卷模版对象 questionnaire_template
 * 
 * @author ruoyi
 * @date 2025-04-27
 */
@Data
public class QuestionnaireTemplate implements Serializable
{
    private static final long serialVersionUID = 1L;

    /** 主键 */
    @TableId(type = IdType.AUTO)
    private Long id;
    /** 模版ID */
    private Integer type;
    /** 模板名称 */
    private String name;

    /** 模板值，json对象 */
    private String value;
    /** 模版状态 0-停用 1-启用 */
    private Integer status;

    /**
     * 创建时间
     */
    private LocalDateTime createTime;
    /**
     * 更新时间
     */
    private LocalDateTime updateTime;
}
