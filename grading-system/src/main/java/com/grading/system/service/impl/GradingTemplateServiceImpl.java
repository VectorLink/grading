package com.grading.system.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.grading.system.domain.GradingTemplate;
import com.grading.system.mapper.GradingTemplateMapper;
import com.grading.system.service.IGradingTemplateService;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

/**
 * 考核模板Service业务层处理
 *
 * @author ruoyi
 * @date 2025-04-18
 */
@Service
public class GradingTemplateServiceImpl extends ServiceImpl<GradingTemplateMapper, GradingTemplate> implements IGradingTemplateService {

    @Override
    public GradingTemplate getByType(Integer type) {
        Assert.notNull(type, "类型不能为空！");
        return lambdaQuery().eq(GradingTemplate::getType, type).one();
    }
}
