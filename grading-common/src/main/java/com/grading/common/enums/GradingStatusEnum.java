package com.grading.common.enums;

import java.util.Arrays;
import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
@Getter
public enum GradingStatusEnum {

    GRADED(0,"考核结束"),
    GRADING(1,"考核中");
    private Integer code;

    private String displayName;

    public static GradingStatusEnum fromData(Integer data){
       return Arrays.stream(GradingStatusEnum.values()).filter(l->l.getCode().equals(data))
                .findFirst().orElseThrow(()->new IllegalArgumentException("非法的枚举类型"));
    }
}
