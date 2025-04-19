package com.grading.system.domain;

import com.grading.common.annotation.Excel;
import lombok.Data;

/**
 * 考核模板对象 grading_template
 * 
 * @author ruoyi
 * @date 2025-04-18
 */
@Data
public class GradingTemplate {
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

}
