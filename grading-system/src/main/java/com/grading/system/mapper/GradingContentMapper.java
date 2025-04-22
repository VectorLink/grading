package com.grading.system.mapper;

import java.util.List;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.grading.system.domain.GradingContent;
import com.grading.system.domain.GradingTemplateMeta;
import com.grading.system.model.bo.GradingContentMeta;
import org.apache.ibatis.annotations.Param;

/**
 * 考核内容值Mapper接口
 * 
 * @author ruoyi
 * @date 2025-04-18
 */
public interface GradingContentMapper extends BaseMapper<GradingContent> {
    /**
     * 根据考核表获取获取考核内容
     * @param gradingId
     * @return
     */
    List<GradingContentMeta> listGradingContentByGradingId(@Param("gradingId") Long gradingId,@Param("titleMetaCodes") List<String> titleMetaCodes);

    /**
     * 根据考核表ID获取对应的考核项目
     * @param gradingId 考核表ID
     * @return
     */
    List<Long> listGradingProject(@Param("gradingId") Long gradingId,@Param("metaCodes") List<String> metaCodes);
}
