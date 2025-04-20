package com.grading.system.service;

import java.util.List;
import java.util.Set;
import com.baomidou.mybatisplus.extension.service.IService;
import com.grading.system.domain.GradingContent;
import com.grading.system.domain.GradingTemplateMeta;
import com.grading.system.model.bo.GradingContentMeta;

/**
 * 考核内容值Service接口
 * 
 * @author ruoyi
 * @date 2025-04-18
 */
public interface IGradingContentService extends IService<GradingContent> {
    /**
     * 根据考核表Id获取考核内容信息
     * @param gradingId 考核表Id
     * @param titleMetaCodes 表格权限码
     * @return
     */
    List<GradingContentMeta> listGradingContentByGradingId(Long gradingId, List<String> titleMetaCodes);

    /**
     * 插入模版系统级参数
     * @param gradingId
     * @param gradingTemplateMetas
     */
    List<GradingContent> createContent(Long gradingId, List<GradingTemplateMeta> gradingTemplateMetas);

    /**
     * 计算内容的评价分
     * @param contentIds
     */
    void calculateAverageScore(List<Long> contentIds);
}
