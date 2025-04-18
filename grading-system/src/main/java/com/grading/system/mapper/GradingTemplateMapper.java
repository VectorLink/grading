package com.grading.system.mapper;

import java.util.List;
import com.grading.system.domain.GradingTemplate;

/**
 * 考核模板Mapper接口
 * 
 * @author ruoyi
 * @date 2025-04-18
 */
public interface GradingTemplateMapper 
{
    /**
     * 查询考核模板
     * 
     * @param id 考核模板主键
     * @return 考核模板
     */
    public GradingTemplate selectGradingTemplateById(Long id);

    /**
     * 查询考核模板列表
     * 
     * @param gradingTemplate 考核模板
     * @return 考核模板集合
     */
    public List<GradingTemplate> selectGradingTemplateList(GradingTemplate gradingTemplate);

    /**
     * 新增考核模板
     * 
     * @param gradingTemplate 考核模板
     * @return 结果
     */
    public int insertGradingTemplate(GradingTemplate gradingTemplate);

    /**
     * 修改考核模板
     * 
     * @param gradingTemplate 考核模板
     * @return 结果
     */
    public int updateGradingTemplate(GradingTemplate gradingTemplate);

    /**
     * 删除考核模板
     * 
     * @param id 考核模板主键
     * @return 结果
     */
    public int deleteGradingTemplateById(Long id);

    /**
     * 批量删除考核模板
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteGradingTemplateByIds(Long[] ids);
}
