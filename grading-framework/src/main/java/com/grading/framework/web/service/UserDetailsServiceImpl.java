package com.grading.framework.web.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import com.grading.common.core.domain.entity.SysUser;
import com.grading.common.core.domain.model.LoginUser;
import com.grading.common.enums.UserStatus;
import com.grading.common.exception.ServiceException;
import com.grading.common.utils.MessageUtils;
import com.grading.common.utils.StringUtils;
import com.grading.system.service.ISysUserService;

/**
 * 用户验证处理
 *
 * @author ruoyi
 */
@Service
public class UserDetailsServiceImpl implements UserDetailsService
{
    private static final Logger log = LoggerFactory.getLogger(UserDetailsServiceImpl.class);

    @Autowired
    private ISysUserService userService;

    @Autowired
    private SysPasswordService passwordService;

    @Autowired
    private SysPermissionService permissionService;

    @Override
    public UserDetails loadUserByUsername(String phoneNumber) throws UsernameNotFoundException
    {
        SysUser user = userService.selectUserByPhoneNumber(phoneNumber);
        if (StringUtils.isNull(user))
        {
            log.info("登录手机号：{} 不存在.", phoneNumber);
            throw new ServiceException(MessageUtils.message("user.not.exists"));
        }
        else if (UserStatus.DELETED.getCode().equals(user.getDelFlag()))
        {
            log.info("登录手机号：{} 已被删除.", phoneNumber);
            throw new ServiceException(MessageUtils.message("user.password.delete"));
        }
        else if (UserStatus.DISABLE.getCode().equals(user.getStatus()))
        {
            log.info("登录手机号：{} 已被停用.", phoneNumber);
            throw new ServiceException(MessageUtils.message("user.blocked"));
        }

        passwordService.validate(user);

        return createLoginUser(user);
    }

    public UserDetails createLoginUser(SysUser user)
    {
        return new LoginUser(user.getUserId(), user.getDeptId(), user, permissionService.getMenuPermission(user));
    }
}
