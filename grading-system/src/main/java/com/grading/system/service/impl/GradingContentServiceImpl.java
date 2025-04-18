package com.grading.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.grading.system.mapper.GradingContentMapper;
import com.grading.system.domain.GradingContent;
import com.grading.system.service.IGradingContentService;

/**
 * 考核内容值Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-04-18
 */
@Service
public class GradingContentServiceImpl implements IGradingContentService 
{
    @Autowired
    private GradingContentMapper gradingContentMapper;

    /**
     * 查询考核内容值
     * 
     * @param id 考核内容值主键
     * @return 考核内容值
     */
    @Override
    public GradingContent selectGradingContentById(Long id)
    {
        return gradingContentMapper.selectGradingContentById(id);
    }

    /**
     * 查询考核内容值列表
     * 
     * @param gradingContent 考核内容值
     * @return 考核内容值
     */
    @Override
    public List<GradingContent> selectGradingContentList(GradingContent gradingContent)
    {
        return gradingContentMapper.selectGradingContentList(gradingContent);
    }

    /**
     * 新增考核内容值
     * 
     * @param gradingContent 考核内容值
     * @return 结果
     */
    @Override
    public int insertGradingContent(GradingContent gradingContent)
    {
        return gradingContentMapper.insertGradingContent(gradingContent);
    }

    /**
     * 修改考核内容值
     * 
     * @param gradingContent 考核内容值
     * @return 结果
     */
    @Override
    public int updateGradingContent(GradingContent gradingContent)
    {
        return gradingContentMapper.updateGradingContent(gradingContent);
    }

    /**
     * 批量删除考核内容值
     * 
     * @param ids 需要删除的考核内容值主键
     * @return 结果
     */
    @Override
    public int deleteGradingContentByIds(Long[] ids)
    {
        return gradingContentMapper.deleteGradingContentByIds(ids);
    }

    /**
     * 删除考核内容值信息
     * 
     * @param id 考核内容值主键
     * @return 结果
     */
    @Override
    public int deleteGradingContentById(Long id)
    {
        return gradingContentMapper.deleteGradingContentById(id);
    }
}
