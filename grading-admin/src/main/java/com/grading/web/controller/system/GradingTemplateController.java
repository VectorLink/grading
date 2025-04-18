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
import com.grading.system.domain.GradingTemplate;
import com.grading.system.service.IGradingTemplateService;
import com.grading.common.utils.poi.ExcelUtil;
import com.grading.common.core.page.TableDataInfo;

/**
 * 考核模板Controller
 * 
 * @author ruoyi
 * @date 2025-04-18
 */
@RestController
@RequestMapping("/system/template")
public class GradingTemplateController extends BaseController
{
    @Autowired
    private IGradingTemplateService gradingTemplateService;

    /**
     * 查询考核模板列表
     */
    @PreAuthorize("@ss.hasPermi('system:template:list')")
    @GetMapping("/list")
    public TableDataInfo list(GradingTemplate gradingTemplate)
    {
        startPage();
        List<GradingTemplate> list = gradingTemplateService.selectGradingTemplateList(gradingTemplate);
        return getDataTable(list);
    }

    /**
     * 导出考核模板列表
     */
    @PreAuthorize("@ss.hasPermi('system:template:export')")
    @Log(title = "考核模板", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, GradingTemplate gradingTemplate)
    {
        List<GradingTemplate> list = gradingTemplateService.selectGradingTemplateList(gradingTemplate);
        ExcelUtil<GradingTemplate> util = new ExcelUtil<GradingTemplate>(GradingTemplate.class);
        util.exportExcel(response, list, "考核模板数据");
    }

    /**
     * 获取考核模板详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:template:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(gradingTemplateService.selectGradingTemplateById(id));
    }

    /**
     * 新增考核模板
     */
    @PreAuthorize("@ss.hasPermi('system:template:add')")
    @Log(title = "考核模板", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody GradingTemplate gradingTemplate)
    {
        return toAjax(gradingTemplateService.insertGradingTemplate(gradingTemplate));
    }

    /**
     * 修改考核模板
     */
    @PreAuthorize("@ss.hasPermi('system:template:edit')")
    @Log(title = "考核模板", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody GradingTemplate gradingTemplate)
    {
        return toAjax(gradingTemplateService.updateGradingTemplate(gradingTemplate));
    }

    /**
     * 删除考核模板
     */
    @PreAuthorize("@ss.hasPermi('system:template:remove')")
    @Log(title = "考核模板", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(gradingTemplateService.deleteGradingTemplateByIds(ids));
    }
}
