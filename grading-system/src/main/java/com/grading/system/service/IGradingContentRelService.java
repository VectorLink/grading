package com.grading.system.service;

import java.util.List;
import com.grading.system.domain.GradingContentRel;

/**
 * 评价内容Service接口
 * 
 * @author ruoyi
 * @date 2025-04-18
 */
public interface IGradingContentRelService 
{
    /**
     * 查询评价内容
     * 
     * @param id 评价内容主键
     * @return 评价内容
     */
    public GradingContentRel selectGradingContentRelById(Long id);

    /**
     * 查询评价内容列表
     * 
     * @param gradingContentRel 评价内容
     * @return 评价内容集合
     */
    public List<GradingContentRel> selectGradingContentRelList(GradingContentRel gradingContentRel);

    /**
     * 新增评价内容
     * 
     * @param gradingContentRel 评价内容
     * @return 结果
     */
    public int insertGradingContentRel(GradingContentRel gradingContentRel);

    /**
     * 修改评价内容
     * 
     * @param gradingContentRel 评价内容
     * @return 结果
     */
    public int updateGradingContentRel(GradingContentRel gradingContentRel);

    /**
     * 批量删除评价内容
     * 
     * @param ids 需要删除的评价内容主键集合
     * @return 结果
     */
    public int deleteGradingContentRelByIds(Long[] ids);

    /**
     * 删除评价内容信息
     * 
     * @param id 评价内容主键
     * @return 结果
     */
    public int deleteGradingContentRelById(Long id);
}
