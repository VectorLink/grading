package com.grading.system.service;

import java.util.List;
import com.baomidou.mybatisplus.extension.service.IService;
import com.grading.system.domain.GradingContentDetail;
import com.grading.system.model.bo.GradingUserScore;

/**
 * 考核内容值Service接口
 * 
 * @author ruoyi
 * @date 2025-04-18
 */
public interface IGradingContentDetailService extends IService<GradingContentDetail> {
    /**
     * 根据考核人、考核内容Id获取考核详情信息
     * @param gradingUsrId 考核人Id
     * @param contentIds 考核内容Id
     * @return
     */
    List<GradingContentDetail> listGradingContentDetail(Long gradingUsrId,List<Long> contentIds);

    /**
     * 计算平均分
     * @param contentIds
     * @return
     */
    List<GradingContentDetail> listByContentIds(List<Long> contentIds);

    /**
     * 获取考核表的具体评分信息
     * @param gradingId 考核表
     * @param userId 用户ID
     * @return
     */
    List<GradingUserScore> listUserGradingUser(Long gradingId,Long userId);

}
