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
import com.grading.system.domain.GradingTemplateMeta;
import com.grading.system.service.IGradingTemplateMetaService;
import com.grading.common.utils.poi.ExcelUtil;
import com.grading.common.core.page.TableDataInfo;

/**
 * 模板元数据Controller
 * 
 * @author ruoyi
 * @date 2025-04-18
 */
@RestController
@RequestMapping("/system/meta")
public class GradingTemplateMetaController extends BaseController
{
    @Autowired
    private IGradingTemplateMetaService gradingTemplateMetaService;

    /**
     * 查询模板元数据列表
     */
    @PreAuthorize("@ss.hasPermi('system:meta:list')")
    @GetMapping("/list")
    public TableDataInfo list(GradingTemplateMeta gradingTemplateMeta)
    {
        startPage();
        List<GradingTemplateMeta> list = gradingTemplateMetaService.selectGradingTemplateMetaList(gradingTemplateMeta);
        return getDataTable(list);
    }

    /**
     * 导出模板元数据列表
     */
    @PreAuthorize("@ss.hasPermi('system:meta:export')")
    @Log(title = "模板元数据", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, GradingTemplateMeta gradingTemplateMeta)
    {
        List<GradingTemplateMeta> list = gradingTemplateMetaService.selectGradingTemplateMetaList(gradingTemplateMeta);
        ExcelUtil<GradingTemplateMeta> util = new ExcelUtil<GradingTemplateMeta>(GradingTemplateMeta.class);
        util.exportExcel(response, list, "模板元数据数据");
    }

    /**
     * 获取模板元数据详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:meta:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(gradingTemplateMetaService.selectGradingTemplateMetaById(id));
    }

    /**
     * 新增模板元数据
     */
    @PreAuthorize("@ss.hasPermi('system:meta:add')")
    @Log(title = "模板元数据", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody GradingTemplateMeta gradingTemplateMeta)
    {
        return toAjax(gradingTemplateMetaService.insertGradingTemplateMeta(gradingTemplateMeta));
    }

    /**
     * 修改模板元数据
     */
    @PreAuthorize("@ss.hasPermi('system:meta:edit')")
    @Log(title = "模板元数据", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody GradingTemplateMeta gradingTemplateMeta)
    {
        return toAjax(gradingTemplateMetaService.updateGradingTemplateMeta(gradingTemplateMeta));
    }

    /**
     * 删除模板元数据
     */
    @PreAuthorize("@ss.hasPermi('system:meta:remove')")
    @Log(title = "模板元数据", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(gradingTemplateMetaService.deleteGradingTemplateMetaByIds(ids));
    }
}
