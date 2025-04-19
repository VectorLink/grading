package com.grading.system.service;

import java.util.List;
import com.baomidou.mybatisplus.extension.service.IService;
import com.grading.system.domain.GradingTemplateMeta;

/**
 * 模板元数据Service接口
 * 
 * @author ruoyi
 * @date 2025-04-18
 */
public interface IGradingTemplateMetaService extends IService<GradingTemplateMeta> {

    /**
     * 根据考核类型获取对应的模版信息
     * @param gradingType
     * @return
     */
    List<GradingTemplateMeta> listGradingTypeTitle(Integer gradingType);
}
