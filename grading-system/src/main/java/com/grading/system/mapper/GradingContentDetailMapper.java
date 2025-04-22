package com.grading.system.mapper;

import java.util.List;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.grading.system.domain.GradingContentDetail;
import com.grading.system.model.bo.GradingUserScore;
import org.apache.ibatis.annotations.Param;

/**
 * 考核内容值Mapper接口
 * 
 * @author ruoyi
 * @date 2025-04-18
 */
public interface GradingContentDetailMapper extends BaseMapper<GradingContentDetail> {
    List<GradingUserScore> listUserGradingUser(@Param("gradingId") Long gradingId,@Param("userId") Long userId);
}
