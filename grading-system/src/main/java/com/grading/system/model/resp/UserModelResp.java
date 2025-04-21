package com.grading.system.model.resp;

import java.io.Serializable;
import lombok.Data;

@Data
public class UserModelResp implements Serializable {
    /**
     * 用户Id
     */
    private Long userId;
    /**
     * 登录名称
     */
    private String userName;
    /**
     * 用户名称
     */
    private String nickName;

    /**
     * 用户邮箱
     */
    private String email;

    /**
     * 手机号码
     */
    private String phoneNumber;

    /**
     * 用户性别
     */

    private String sex;

    /**
     * 帐号状态（0正常 1停用）
     */

    private String status;
    /**
     * 角色
     */
    private String roles;

}
