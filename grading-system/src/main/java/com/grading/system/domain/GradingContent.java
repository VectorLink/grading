package com.grading.system.domain;

import java.io.Serializable;
import com.grading.common.annotation.Excel;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 考核内容值对象 grading_content
 * 
 * @author ruoyi
 * @date 2025-04-18
 */
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class GradingContent implements Serializable {
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
    private String content;

    /** 行号 */
    @Excel(name = "行号")
    private Integer rowId;

    /** 列合并 */
    @Excel(name = "列合并")
    private Integer mergeColumn;

    /** 行合并 */
    @Excel(name = "行合并")
    private Integer mergeRow;

}
