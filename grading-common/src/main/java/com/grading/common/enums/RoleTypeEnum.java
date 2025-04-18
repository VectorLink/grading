package com.grading.common.enums;


import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * 角色权限定义
 */
@Getter
@AllArgsConstructor
public enum RoleTypeEnum {
    ADMIN("管理员", "admin"),
    PRINCIPAL("园长", "principal"),
    DEPARTMENT("部长", "department"),
    TEACHER("教师", "teacher"),
    CHILD_TEACHER("保教教师", "childteacher"),
    SECURITY("保安", "security"),
    CANTEEN("食堂人员", "canteen"),
    PARENTS("家长", "parents"),
    EXPERT("专家", "expert"),
    CLASSER("班组长","classer");
    /**
     * 显示名
     */
    private final String displayName;
    /**
     * 权限码
     */
    private final String permissionCode;
}
