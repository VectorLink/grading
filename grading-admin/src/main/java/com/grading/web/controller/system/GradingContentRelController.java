package com.grading.web.controller.system;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.grading.common.annotation.Log;
import com.grading.common.core.controller.BaseController;
import com.grading.common.core.domain.AjaxResult;
import com.grading.common.enums.BusinessType;
import com.grading.system.domain.GradingContentRel;
import com.grading.system.service.IGradingContentRelService;
import com.grading.common.utils.poi.ExcelUtil;
import com.grading.common.core.page.TableDataInfo;

/**
 * 评价内容Controller
 * 
 * @author ruoyi
 * @date 2025-04-18
 */
@RestController
@RequestMapping("/system/rel")
public class GradingContentRelController extends BaseController
{
    @Autowired
    private IGradingContentRelService gradingContentRelService;

    /**
     * 查询评价内容列表
     */
    @PreAuthorize("@ss.hasPermi('system:rel:list')")
    @GetMapping("/list")
    public TableDataInfo list(GradingContentRel gradingContentRel)
    {
        startPage();
        List<GradingContentRel> list = gradingContentRelService.selectGradingContentRelList(gradingContentRel);
        return getDataTable(list);
    }

    /**
     * 导出评价内容列表
     */
    @PreAuthorize("@ss.hasPermi('system:rel:export')")
    @Log(title = "评价内容", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, GradingContentRel gradingContentRel)
    {
        List<GradingContentRel> list = gradingContentRelService.selectGradingContentRelList(gradingContentRel);
        ExcelUtil<GradingContentRel> util = new ExcelUtil<GradingContentRel>(GradingContentRel.class);
        util.exportExcel(response, list, "评价内容数据");
    }

    /**
     * 获取评价内容详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:rel:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(gradingContentRelService.selectGradingContentRelById(id));
    }

    /**
     * 新增评价内容
     */
    @PreAuthorize("@ss.hasPermi('system:rel:add')")
    @Log(title = "评价内容", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody GradingContentRel gradingContentRel)
    {
        return toAjax(gradingContentRelService.insertGradingContentRel(gradingContentRel));
    }

    /**
     * 修改评价内容
     */
    @PreAuthorize("@ss.hasPermi('system:rel:edit')")
    @Log(title = "评价内容", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody GradingContentRel gradingContentRel)
    {
        return toAjax(gradingContentRelService.updateGradingContentRel(gradingContentRel));
    }

    /**
     * 删除评价内容
     */
    @PreAuthorize("@ss.hasPermi('system:rel:remove')")
    @Log(title = "评价内容", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(gradingContentRelService.deleteGradingContentRelByIds(ids));
    }
}
