package com.grading.common.enums;


import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import org.apache.commons.lang3.StringUtils;
import org.springframework.util.Assert;
import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * 角色权限定义
 */
@Getter
@AllArgsConstructor
public enum RoleTypeEnum {
    ADMIN("管理员", "admin", Collections.emptyList()),
    PRINCIPAL("园长", "principal",Collections.emptyList()),
    DEPARTMENT("部长", "department",Collections.emptyList()),
    TEACHER("教师", "teacher", Arrays.asList(GradingTypeEnum.TEACHER_MONTH,GradingTypeEnum.MORALITY_STYLE_SEMESTER)),
    CHILD_TEACHER("保教教师", "childteacher",Arrays.asList(GradingTypeEnum.CHILDCARE_TEACHER_MONTH,GradingTypeEnum.MORALITY_STYLE_SEMESTER)),
    SECURITY("保安", "security",Arrays.asList(GradingTypeEnum.SECURITY_GUARD_MONTH)),
    CANTEEN("食堂人员", "canteen",Arrays.asList(GradingTypeEnum.CANTEEN_STAFF_MONTH)),
    PARENTS("家长", "parents",Collections.emptyList()),
    EXPERT("专家", "expert",Collections.emptyList()),
    CLASSER("班组长","classer",Arrays.asList(GradingTypeEnum.TEACHER_MONTH,GradingTypeEnum.MORALITY_STYLE_SEMESTER));
    /**
     * 显示名
     */
    private final String displayName;
    /**
     * 权限码
     */
    private final String permissionCode;
    /**
     * 考核类型
     */
    private final List<GradingTypeEnum> gradingType;

    /**
     * 根据权限码获取对应的角色信息
     * @param permissionCode 权限码
     * @return
     */
    public static RoleTypeEnum fromPermissionCode(String permissionCode){
        Assert.hasText(permissionCode,"非法的枚举类型");
       return Arrays.stream(RoleTypeEnum.values()).filter(l-> StringUtils.equals(l.getPermissionCode(),permissionCode))
                .findAny().orElseThrow(()->new IllegalArgumentException("非法的枚举类型"));
    }
}
