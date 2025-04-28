package com.grading.common.enums;

import java.util.Arrays;
import org.springframework.util.Assert;
import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
@Getter
public enum QuestionnaireTypeEnum {
    ACTIVITIES(0,"各类活动家长评价检核表")

    ;

    private final Integer code;

    private final String name;




    public static QuestionnaireTypeEnum fromData(Integer data){
        Assert.notNull(data,"非法的参数类型");

        return Arrays.stream(QuestionnaireTypeEnum.values()).filter(l->l.getCode().equals(data))
                .findAny().orElseThrow(()->new IllegalArgumentException("非法的枚举类型！"));
    }
}
