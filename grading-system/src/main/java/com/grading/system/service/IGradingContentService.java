package com.grading.system.service;

import java.util.List;
import com.grading.system.domain.GradingContent;

/**
 * 考核内容值Service接口
 * 
 * @author ruoyi
 * @date 2025-04-18
 */
public interface IGradingContentService 
{
    /**
     * 查询考核内容值
     * 
     * @param id 考核内容值主键
     * @return 考核内容值
     */
    public GradingContent selectGradingContentById(Long id);

    /**
     * 查询考核内容值列表
     * 
     * @param gradingContent 考核内容值
     * @return 考核内容值集合
     */
    public List<GradingContent> selectGradingContentList(GradingContent gradingContent);

    /**
     * 新增考核内容值
     * 
     * @param gradingContent 考核内容值
     * @return 结果
     */
    public int insertGradingContent(GradingContent gradingContent);

    /**
     * 修改考核内容值
     * 
     * @param gradingContent 考核内容值
     * @return 结果
     */
    public int updateGradingContent(GradingContent gradingContent);

    /**
     * 批量删除考核内容值
     * 
     * @param ids 需要删除的考核内容值主键集合
     * @return 结果
     */
    public int deleteGradingContentByIds(Long[] ids);

    /**
     * 删除考核内容值信息
     * 
     * @param id 考核内容值主键
     * @return 结果
     */
    public int deleteGradingContentById(Long id);
}
