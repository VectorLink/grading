package com.grading.system.domain;

import java.io.Serializable;
import java.time.LocalDateTime;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.grading.common.annotation.Excel;
import com.grading.common.core.domain.BaseEntity;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 问卷信息对象 questionnaire
 * 
 * @author ruoyi
 * @date 2025-04-27
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Questionnaire implements Serializable {
    private static final long serialVersionUID = 1L;
    /** 主键 */
    @TableId(type = IdType.AUTO)
    private Long id;
    /** 模板Id */
    private Long templateId;
    /** 评价人 */
    private Long userId;
    /** 数据 */
    private String value;
    /** 创建人Id */
    private Long creteUserId;
    /** 更新人Id */
    private Long updateUserId;
    /**
     * 创建时间
     */
    private LocalDateTime createTime;
    /**
     * 更新时间
     */
    private LocalDateTime updateTime;
}
