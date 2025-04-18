package com.grading.system.service.impl;

import java.util.List;
import com.grading.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.grading.system.mapper.GradingTemplateMapper;
import com.grading.system.domain.GradingTemplate;
import com.grading.system.service.IGradingTemplateService;

/**
 * 考核模板Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-04-18
 */
@Service
public class GradingTemplateServiceImpl implements IGradingTemplateService 
{
    @Autowired
    private GradingTemplateMapper gradingTemplateMapper;

    /**
     * 查询考核模板
     * 
     * @param id 考核模板主键
     * @return 考核模板
     */
    @Override
    public GradingTemplate selectGradingTemplateById(Long id)
    {
        return gradingTemplateMapper.selectGradingTemplateById(id);
    }

    /**
     * 查询考核模板列表
     * 
     * @param gradingTemplate 考核模板
     * @return 考核模板
     */
    @Override
    public List<GradingTemplate> selectGradingTemplateList(GradingTemplate gradingTemplate)
    {
        return gradingTemplateMapper.selectGradingTemplateList(gradingTemplate);
    }

    /**
     * 新增考核模板
     * 
     * @param gradingTemplate 考核模板
     * @return 结果
     */
    @Override
    public int insertGradingTemplate(GradingTemplate gradingTemplate)
    {
        gradingTemplate.setCreateTime(DateUtils.getNowDate());
        return gradingTemplateMapper.insertGradingTemplate(gradingTemplate);
    }

    /**
     * 修改考核模板
     * 
     * @param gradingTemplate 考核模板
     * @return 结果
     */
    @Override
    public int updateGradingTemplate(GradingTemplate gradingTemplate)
    {
        gradingTemplate.setUpdateTime(DateUtils.getNowDate());
        return gradingTemplateMapper.updateGradingTemplate(gradingTemplate);
    }

    /**
     * 批量删除考核模板
     * 
     * @param ids 需要删除的考核模板主键
     * @return 结果
     */
    @Override
    public int deleteGradingTemplateByIds(Long[] ids)
    {
        return gradingTemplateMapper.deleteGradingTemplateByIds(ids);
    }

    /**
     * 删除考核模板信息
     * 
     * @param id 考核模板主键
     * @return 结果
     */
    @Override
    public int deleteGradingTemplateById(Long id)
    {
        return gradingTemplateMapper.deleteGradingTemplateById(id);
    }
}
