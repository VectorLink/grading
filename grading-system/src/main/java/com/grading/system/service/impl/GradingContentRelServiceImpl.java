package com.grading.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.grading.system.mapper.GradingContentRelMapper;
import com.grading.system.domain.GradingContentRel;
import com.grading.system.service.IGradingContentRelService;

/**
 * 评价内容Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-04-18
 */
@Service
public class GradingContentRelServiceImpl implements IGradingContentRelService 
{
    @Autowired
    private GradingContentRelMapper gradingContentRelMapper;

    /**
     * 查询评价内容
     * 
     * @param id 评价内容主键
     * @return 评价内容
     */
    @Override
    public GradingContentRel selectGradingContentRelById(Long id)
    {
        return gradingContentRelMapper.selectGradingContentRelById(id);
    }

    /**
     * 查询评价内容列表
     * 
     * @param gradingContentRel 评价内容
     * @return 评价内容
     */
    @Override
    public List<GradingContentRel> selectGradingContentRelList(GradingContentRel gradingContentRel)
    {
        return gradingContentRelMapper.selectGradingContentRelList(gradingContentRel);
    }

    /**
     * 新增评价内容
     * 
     * @param gradingContentRel 评价内容
     * @return 结果
     */
    @Override
    public int insertGradingContentRel(GradingContentRel gradingContentRel)
    {
        return gradingContentRelMapper.insertGradingContentRel(gradingContentRel);
    }

    /**
     * 修改评价内容
     * 
     * @param gradingContentRel 评价内容
     * @return 结果
     */
    @Override
    public int updateGradingContentRel(GradingContentRel gradingContentRel)
    {
        return gradingContentRelMapper.updateGradingContentRel(gradingContentRel);
    }

    /**
     * 批量删除评价内容
     * 
     * @param ids 需要删除的评价内容主键
     * @return 结果
     */
    @Override
    public int deleteGradingContentRelByIds(Long[] ids)
    {
        return gradingContentRelMapper.deleteGradingContentRelByIds(ids);
    }

    /**
     * 删除评价内容信息
     * 
     * @param id 评价内容主键
     * @return 结果
     */
    @Override
    public int deleteGradingContentRelById(Long id)
    {
        return gradingContentRelMapper.deleteGradingContentRelById(id);
    }
}
