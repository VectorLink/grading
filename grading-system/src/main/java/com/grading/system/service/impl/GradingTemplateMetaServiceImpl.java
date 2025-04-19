package com.grading.system.service.impl;

import java.util.List;
import javax.annotation.Resource;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.grading.system.domain.GradingTemplate;
import com.grading.system.domain.GradingTemplateMeta;
import com.grading.system.mapper.GradingTemplateMetaMapper;
import com.grading.system.service.IGradingTemplateMetaService;
import com.grading.system.service.IGradingTemplateService;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

/**
 * 模板元数据Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-04-18
 */
@Service
public class GradingTemplateMetaServiceImpl extends ServiceImpl<GradingTemplateMetaMapper,GradingTemplateMeta> implements IGradingTemplateMetaService {
    @Resource
    private IGradingTemplateService iGradingTemplateService;

    @Override
    public List<GradingTemplateMeta> listGradingTypeTitle(Integer gradingType) {
        Assert.notNull(gradingType,"考核类型不能为空");

        GradingTemplate type = iGradingTemplateService.getByType(gradingType);
        Assert.notNull(type,"考核类型不存在，请先添加考核类型模板");

        return lambdaQuery().eq(GradingTemplateMeta::getTemplateId,type.getId())
                .orderByAsc(GradingTemplateMeta::getSort)
                .list();
    }
}
