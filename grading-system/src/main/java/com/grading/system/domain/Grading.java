package com.grading.system.domain;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.Date;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.grading.common.annotation.Excel;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 考核对象 grading
 *
 * @author ruoyi
 * @date 2025-04-18
 */
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Grading implements Serializable {
    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
    @TableId(type = IdType.AUTO)
    private Long id;

    /**
     * 考核人Id
     */
    @Excel(name = "考核人Id")
    private Long userId;

    /**
     * 考核表名称
     */
    @Excel(name = "考核表名称")
    private String gradingName;

    /**
     * 考核月份
     */
    @Excel(name = "考核月份")
    private String gradingMonth;

    /**
     * 考核开始时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "考核开始时间", width = 30, dateFormat = "yyyy-MM-dd")
    private LocalDateTime gradingStartTime;

    /**
     * 考核结束时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "考核结束时间", width = 30, dateFormat = "yyyy-MM-dd")
    private LocalDateTime gradingEndTime;

    /**
     * 考核状态 0-已结束 1-考核中
     */
    @Excel(name = "考核状态 0-已结束 1-考核中")
    private Integer status;
    /**
     * 考核类型
     * @see
     */
    private Integer gradingType;
    /**
     * 创建时间
     */
    private LocalDateTime createTime;
    /**
     * 更新时间
     */
    private LocalDateTime updateTime;
    /**
     * 创建人Id
     */
    private Long createUserId;
    /**
     * 更新人Id
     */
    private Long updateUserId;
}
