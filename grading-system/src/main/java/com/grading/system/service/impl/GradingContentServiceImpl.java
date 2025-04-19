package com.grading.system.service.impl;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.stream.Collectors;
import javax.annotation.Resource;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.grading.system.domain.GradingContent;
import com.grading.system.domain.GradingContentRel;
import com.grading.system.domain.GradingTemplateMeta;
import com.grading.system.mapper.GradingContentMapper;
import com.grading.system.model.bo.GradingContentMeta;
import com.grading.system.service.IGradingContentRelService;
import com.grading.system.service.IGradingContentService;
import org.apache.commons.collections4.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

/**
 * 考核内容值Service业务层处理
 *
 * @author ruoyi
 * @date 2025-04-18
 */
@Service
public class GradingContentServiceImpl extends ServiceImpl<GradingContentMapper, GradingContent> implements IGradingContentService {
    @Resource
    private IGradingContentRelService iGradingContentRelService;

    @Override
    public List<GradingContentMeta> listGradingContentByGradingId(Long gradingId, List<String> titleMetaCodes) {
        Assert.notNull(gradingId, "考核表Id不能为空！");
        return baseMapper.listGradingContentByGradingId(gradingId, titleMetaCodes);
    }


    @Override
    public List<GradingContent> createContent(Long gradingId, List<GradingTemplateMeta> gradingTemplateMetas) {
        if (Objects.isNull(gradingId) || CollectionUtils.isEmpty(gradingTemplateMetas)) {
            return Collections.emptyList();
        }
        //获取系统级信息
        List<Long> metaIds = gradingTemplateMetas.stream().map(GradingTemplateMeta::getId).collect(Collectors.toList());

        List<GradingContent> systemContent = lambdaQuery().in(GradingContent::getTemplateMetaId, metaIds)
                .eq(GradingContent::getSystemValue, 1)
                .list();


        Map<Integer, Map<Long, List<GradingContent>>> systemContentMap = systemContent.stream().collect(Collectors.groupingBy(GradingContent::getRowId, Collectors.groupingBy(GradingContent::getTemplateMetaId)));


        List<GradingContent> customerContents = new ArrayList<>();
        for (Map.Entry<Integer, Map<Long, List<GradingContent>>> rowEntryMap : systemContentMap.entrySet()) {
            for (GradingTemplateMeta gradingTemplateMeta : gradingTemplateMetas) {
                //生成用户参数,用户内容都不合并
                if (!rowEntryMap.getValue().containsKey(gradingTemplateMeta.getId())) {
                    customerContents.add(GradingContent.builder()
                            .mergeColumn(0)
                            .mergeRow(0)
                            .systemValue(0)
                            .content(StringUtils.EMPTY)
                            .rowId(rowEntryMap.getKey())
                            .build());

                }
            }
        }

        if (CollectionUtils.isNotEmpty(customerContents)) {
            saveOrUpdateBatch(customerContents);
            systemContent.addAll(customerContents);
        }

        List<GradingContentRel> contentRels = systemContent.stream().map(
                l -> GradingContentRel
                        .builder()
                        .contentId(l.getId())
                        .gradingId(gradingId)
                        .build()
        ).collect(Collectors.toList());
        iGradingContentRelService.saveOrUpdateBatch(contentRels);


        return systemContent;
    }
}
