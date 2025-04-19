package com.grading.web.controller.system;

import javax.annotation.Resource;
import com.grading.common.core.controller.BaseController;
import com.grading.common.core.domain.AjaxResult;
import com.grading.system.model.param.GradingUserParam;
import com.grading.system.service.IGradingService;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import io.swagger.annotations.ApiOperation;

/**
 * 考核Controller
 *
 * @author ruoyi
 * @date 2025-04-18
 */
@RestController
@RequestMapping("/system/grading")
public class GradingController extends BaseController {
    @Resource
    private IGradingService gradingService;

    @ApiOperation("获取用户考核表")
    @PostMapping("/getUserGrading")
    public AjaxResult getUserGrading(@RequestBody GradingUserParam param) {
        return AjaxResult.success(gradingService.getUserGrading(param));
    }
}
