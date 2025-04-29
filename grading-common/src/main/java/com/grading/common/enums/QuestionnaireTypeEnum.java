package com.grading.common.enums;

import java.util.Arrays;
import org.springframework.util.Assert;
import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
@Getter
public enum QuestionnaireTypeEnum {
    ACTIVITIES(0,"各类活动家长评价检核表"),
    CHILD_ACTIVITIES(1,"亲子活动家长满意度问卷"),
    SMALLER_CONFERENCE(2,"小班家长开放日家长满意度问卷调查"),
    BIGGER_CONFERENCE(3,"大班家长会家长满意度问卷调查"),
    HOME_VISIT(4,"教师家访家长满意度问卷调查")
    ;

    private final Integer code;

    private final String name;




    public static QuestionnaireTypeEnum fromData(Integer data){
        Assert.notNull(data,"非法的参数类型");

        return Arrays.stream(QuestionnaireTypeEnum.values()).filter(l->l.getCode().equals(data))
                .findAny().orElseThrow(()->new IllegalArgumentException("非法的枚举类型！"));
    }
}
