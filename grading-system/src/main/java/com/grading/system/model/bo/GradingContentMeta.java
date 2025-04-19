package com.grading.system.model.bo;

import java.io.Serializable;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class GradingContentMeta implements Serializable {
    /**
     * 编码
     */
    private String titleCode;
    /**
     * 系统配置
     */
    private Boolean systemValue;
    /**
     * 行号
     */
    private Integer rowId;
    /**
     * 合并列
     */
    private Boolean mergeColumn;
    /**
     * 合并行
     */
    private Boolean mergeRow;
    /**
     * 内容
     */
    private String content;
}
