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
import com.grading.system.domain.GradingContent;
import com.grading.system.service.IGradingContentService;
import com.grading.common.utils.poi.ExcelUtil;
import com.grading.common.core.page.TableDataInfo;

/**
 * 考核内容值Controller
 * 
 * @author ruoyi
 * @date 2025-04-18
 */
@RestController
@RequestMapping("/system/content")
public class GradingContentController extends BaseController
{
    @Autowired
    private IGradingContentService gradingContentService;

    /**
     * 查询考核内容值列表
     */
    @PreAuthorize("@ss.hasPermi('system:content:list')")
    @GetMapping("/list")
    public TableDataInfo list(GradingContent gradingContent)
    {
        startPage();
        List<GradingContent> list = gradingContentService.selectGradingContentList(gradingContent);
        return getDataTable(list);
    }

    /**
     * 导出考核内容值列表
     */
    @PreAuthorize("@ss.hasPermi('system:content:export')")
    @Log(title = "考核内容值", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, GradingContent gradingContent)
    {
        List<GradingContent> list = gradingContentService.selectGradingContentList(gradingContent);
        ExcelUtil<GradingContent> util = new ExcelUtil<GradingContent>(GradingContent.class);
        util.exportExcel(response, list, "考核内容值数据");
    }

    /**
     * 获取考核内容值详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:content:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(gradingContentService.selectGradingContentById(id));
    }

    /**
     * 新增考核内容值
     */
    @PreAuthorize("@ss.hasPermi('system:content:add')")
    @Log(title = "考核内容值", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody GradingContent gradingContent)
    {
        return toAjax(gradingContentService.insertGradingContent(gradingContent));
    }

    /**
     * 修改考核内容值
     */
    @PreAuthorize("@ss.hasPermi('system:content:edit')")
    @Log(title = "考核内容值", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody GradingContent gradingContent)
    {
        return toAjax(gradingContentService.updateGradingContent(gradingContent));
    }

    /**
     * 删除考核内容值
     */
    @PreAuthorize("@ss.hasPermi('system:content:remove')")
    @Log(title = "考核内容值", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(gradingContentService.deleteGradingContentByIds(ids));
    }
}
