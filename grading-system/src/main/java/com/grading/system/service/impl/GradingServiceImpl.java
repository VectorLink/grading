package com.grading.system.service.impl;

import javax.annotation.Resource;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.grading.common.core.domain.entity.SysUser;
import com.grading.system.domain.Grading;
import com.grading.system.mapper.GradingMapper;
import com.grading.system.model.param.GradingUserParam;
import com.grading.system.model.resp.UserGradingResp;
import com.grading.system.service.IGradingService;
import com.grading.system.service.ISysUserService;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

/**
 * 考核Service业务层处理
 *
 * @author ruoyi
 * @date 2025-04-18
 */
@Service
public class GradingServiceImpl extends ServiceImpl<GradingMapper, Grading> implements IGradingService {
    @Resource
    private ISysUserService iSysUserService;

    @Override
    public UserGradingResp getUserGrading(GradingUserParam param) {
        Assert.notNull(param.getUserId(), "用户ID不能为空！");
        SysUser sysUser = iSysUserService.selectUserById(param.getUserId());
        Assert.notNull(sysUser, "用户不存在");
        return null;
    }
}
