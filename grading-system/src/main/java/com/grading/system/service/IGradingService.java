package com.grading.system.service;

import java.util.List;
import com.baomidou.mybatisplus.extension.service.IService;
import com.grading.system.domain.Grading;
import com.grading.system.model.bo.GradingUserScore;
import com.grading.system.model.param.GradingUserParam;
import com.grading.system.model.param.GradingUserQueryParam;
import com.grading.system.model.resp.UserGradingResp;
/**
 * 考核Service接口
 * 
 * @author ruoyi
 * @date 2025-04-18
 */
public interface IGradingService extends IService<Grading>
{
    /**
     * 根据用户查询对应的考核表信息
     * @param param 查询参数
     * @return
     */
    UserGradingResp getUserGrading(GradingUserQueryParam param);

    /**
     * 给考核单评分
     * @param param
     * @return
     */
    void grading(GradingUserParam param);

    /**
     * 根据考核单获取对应的打分详情信息
     * @param gradingId 考核单
     * @return
     */
    List<GradingUserScore> listUserGradingScores(Long gradingId);
}
