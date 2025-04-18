package com.grading.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.grading.system.mapper.GradingTemplateMetaMapper;
import com.grading.system.domain.GradingTemplateMeta;
import com.grading.system.service.IGradingTemplateMetaService;

/**
 * 模板元数据Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-04-18
 */
@Service
public class GradingTemplateMetaServiceImpl implements IGradingTemplateMetaService 
{
    @Autowired
    private GradingTemplateMetaMapper gradingTemplateMetaMapper;

    /**
     * 查询模板元数据
     * 
     * @param id 模板元数据主键
     * @return 模板元数据
     */
    @Override
    public GradingTemplateMeta selectGradingTemplateMetaById(Long id)
    {
        return gradingTemplateMetaMapper.selectGradingTemplateMetaById(id);
    }

    /**
     * 查询模板元数据列表
     * 
     * @param gradingTemplateMeta 模板元数据
     * @return 模板元数据
     */
    @Override
    public List<GradingTemplateMeta> selectGradingTemplateMetaList(GradingTemplateMeta gradingTemplateMeta)
    {
        return gradingTemplateMetaMapper.selectGradingTemplateMetaList(gradingTemplateMeta);
    }

    /**
     * 新增模板元数据
     * 
     * @param gradingTemplateMeta 模板元数据
     * @return 结果
     */
    @Override
    public int insertGradingTemplateMeta(GradingTemplateMeta gradingTemplateMeta)
    {
        return gradingTemplateMetaMapper.insertGradingTemplateMeta(gradingTemplateMeta);
    }

    /**
     * 修改模板元数据
     * 
     * @param gradingTemplateMeta 模板元数据
     * @return 结果
     */
    @Override
    public int updateGradingTemplateMeta(GradingTemplateMeta gradingTemplateMeta)
    {
        return gradingTemplateMetaMapper.updateGradingTemplateMeta(gradingTemplateMeta);
    }

    /**
     * 批量删除模板元数据
     * 
     * @param ids 需要删除的模板元数据主键
     * @return 结果
     */
    @Override
    public int deleteGradingTemplateMetaByIds(Long[] ids)
    {
        return gradingTemplateMetaMapper.deleteGradingTemplateMetaByIds(ids);
    }

    /**
     * 删除模板元数据信息
     * 
     * @param id 模板元数据主键
     * @return 结果
     */
    @Override
    public int deleteGradingTemplateMetaById(Long id)
    {
        return gradingTemplateMetaMapper.deleteGradingTemplateMetaById(id);
    }
}
