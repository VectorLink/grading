package com.grading.system.mapper;

import java.util.List;
import com.grading.system.domain.GradingTemplateMeta;

/**
 * 模板元数据Mapper接口
 * 
 * @author ruoyi
 * @date 2025-04-18
 */
public interface GradingTemplateMetaMapper 
{
    /**
     * 查询模板元数据
     * 
     * @param id 模板元数据主键
     * @return 模板元数据
     */
    public GradingTemplateMeta selectGradingTemplateMetaById(Long id);

    /**
     * 查询模板元数据列表
     * 
     * @param gradingTemplateMeta 模板元数据
     * @return 模板元数据集合
     */
    public List<GradingTemplateMeta> selectGradingTemplateMetaList(GradingTemplateMeta gradingTemplateMeta);

    /**
     * 新增模板元数据
     * 
     * @param gradingTemplateMeta 模板元数据
     * @return 结果
     */
    public int insertGradingTemplateMeta(GradingTemplateMeta gradingTemplateMeta);

    /**
     * 修改模板元数据
     * 
     * @param gradingTemplateMeta 模板元数据
     * @return 结果
     */
    public int updateGradingTemplateMeta(GradingTemplateMeta gradingTemplateMeta);

    /**
     * 删除模板元数据
     * 
     * @param id 模板元数据主键
     * @return 结果
     */
    public int deleteGradingTemplateMetaById(Long id);

    /**
     * 批量删除模板元数据
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteGradingTemplateMetaByIds(Long[] ids);
}
