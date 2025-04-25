package com.grading.common.enums;

import java.util.Arrays;
import org.springframework.util.Assert;
import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * 考核类型
 */
@Getter
@AllArgsConstructor
public enum GradingTypeEnum {
    TEACHER_MONTH(0,"教师月绩效考核细则"),
    CHILDCARE_TEACHER_MONTH(1,"保育教师月绩效考核细则"),
    CANTEEN_STAFF_MONTH(2,"食堂人员月绩效考核细则"),
    SECURITY_GUARD_MONTH(3,"保安人员工作月绩效考核评细则"),
    MORALITY_STYLE_SEMESTER(4,"学期师德师风考核评价表"),
    ACTIVITIES_PARENTS_GRADING(5,"各类活动家长评价检核表")
    ;


    private final Integer type;

    private final String name;


    public static  GradingTypeEnum fromType(Integer type){
        Assert.notNull(type,"考核类型不能为空");
        return Arrays.stream(GradingTypeEnum.values()).filter(l->l.getType().equals(type))
                .findAny().orElseThrow(()->new IllegalArgumentException("非法的枚举类型"));
    }
}
