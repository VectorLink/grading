package com.grading.system.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.grading.common.annotation.Excel;
import lombok.Data;

/**
 * 模板元数据对象 grading_template_meta
 * 
 * @author ruoyi
 * @date 2025-04-18
 */
@Data
public class GradingTemplateMeta {
    private static final long serialVersionUID = 1L;

    /** 主键 */
    @TableId(type = IdType.AUTO)
    private Long id;

    /** 模板Id */
    @Excel(name = "模板Id")
    private Long templateId;

    /** 编码 */
    @Excel(name = "编码")
    private String code;

    /** 名称 */
    @Excel(name = "名称")
    private String name;

    /** 是否校验权限 */
    @Excel(name = "是否校验权限")
    private Boolean permValid;

    /** 权限码 */
    @Excel(name = "权限码")
    private String rightCode;

    /** 排序 */
    @Excel(name = "排序")
    private Integer sort;
}
