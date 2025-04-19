package com.grading.system.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.grading.system.domain.GradingTemplate;

/**
 * 考核模板Service接口
 * 
 * @author ruoyi
 * @date 2025-04-18
 */
public interface IGradingTemplateService extends IService<GradingTemplate>
{
    /**
     * 根据类型获取对应的模板详情信息
     * @param type 类型
     * @return
     */
    GradingTemplate getByType(Integer type);
}
