package com.grading.framework.web.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import com.grading.common.constant.CacheConstants;
import com.grading.common.constant.Constants;
import com.grading.common.constant.UserConstants;
import com.grading.common.core.domain.entity.SysUser;
import com.grading.common.core.domain.model.RegisterBody;
import com.grading.common.core.redis.RedisCache;
import com.grading.common.exception.user.CaptchaException;
import com.grading.common.exception.user.CaptchaExpireException;
import com.grading.common.utils.MessageUtils;
import com.grading.common.utils.SecurityUtils;
import com.grading.common.utils.StringUtils;
import com.grading.framework.manager.AsyncManager;
import com.grading.framework.manager.factory.AsyncFactory;
import com.grading.system.service.ISysConfigService;
import com.grading.system.service.ISysUserService;

/**
 * 注册校验方法
 *
 * @author ruoyi
 */
@Component
public class SysRegisterService
{
    @Autowired
    private ISysUserService userService;

    @Autowired
    private ISysConfigService configService;

    @Autowired
    private RedisCache redisCache;

    /**
     * 注册
     */
    public String register(RegisterBody registerBody)
    {
        String msg = "", phoneNumber = registerBody.getPhoneNumber(), password = registerBody.getPassword();
        SysUser sysUser = new SysUser();
        sysUser.setPhonenumber(phoneNumber);

        // 验证码开关
        boolean captchaEnabled = configService.selectCaptchaEnabled();
        if (captchaEnabled)
        {
            validateCaptcha(phoneNumber, registerBody.getCode(), registerBody.getUuid());
        }

        if (StringUtils.isEmpty(phoneNumber))
        {
            msg = "手机号码不能为空";
        }
        else if (StringUtils.isEmpty(password))
        {
            msg = "用户密码不能为空";
        }
        else if (phoneNumber.length() != UserConstants.PHONE_NUMBER_LENGTH)
        {
            msg = "账户长度必须等于11个字符之间";
        }
        else if (password.length() < UserConstants.PASSWORD_MIN_LENGTH
                || password.length() > UserConstants.PASSWORD_MAX_LENGTH)
        {
            msg = "密码长度必须在5到20个字符之间";
        }
        else if (!userService.checkPhoneUnique(sysUser))
        {
            msg = "保存用户'" + sysUser.getPhonenumber() + "'失败，注册账号已存在";
        }
        else
        {
            sysUser.setNickName(phoneNumber);
            sysUser.setPassword(SecurityUtils.encryptPassword(password));
            boolean regFlag = userService.registerUser(sysUser);
            if (!regFlag)
            {
                msg = "注册失败,请联系系统管理人员";
            }
            else
            {
                AsyncManager.me().execute(AsyncFactory.recordLogininfor(phoneNumber, Constants.REGISTER, MessageUtils.message("user.register.success")));
            }
        }
        return msg;
    }

    /**
     * 校验验证码
     *
     * @param username 用户名
     * @param code 验证码
     * @param uuid 唯一标识
     * @return 结果
     */
    public void validateCaptcha(String username, String code, String uuid)
    {
        String verifyKey = CacheConstants.CAPTCHA_CODE_KEY + StringUtils.nvl(uuid, "");
        String captcha = redisCache.getCacheObject(verifyKey);
        redisCache.deleteObject(verifyKey);
        if (captcha == null)
        {
            throw new CaptchaExpireException();
        }
        if (!code.equalsIgnoreCase(captcha))
        {
            throw new CaptchaException();
        }
    }
}
