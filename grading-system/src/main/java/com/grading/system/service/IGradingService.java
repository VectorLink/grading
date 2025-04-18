package com.grading.system.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.grading.system.domain.Grading;
import com.grading.system.model.param.GradingUserParam;
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
    UserGradingResp getUserGrading(GradingUserParam param);
}
