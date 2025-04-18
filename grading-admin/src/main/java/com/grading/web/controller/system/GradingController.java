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
import com.grading.system.domain.Grading;
import com.grading.system.service.IGradingService;
import com.grading.common.utils.poi.ExcelUtil;
import com.grading.common.core.page.TableDataInfo;

/**
 * 考核Controller
 * 
 * @author ruoyi
 * @date 2025-04-18
 */
@RestController
@RequestMapping("/system/grading")
public class GradingController extends BaseController
{
    @Autowired
    private IGradingService gradingService;

    /**
     * 查询考核列表
     */
    @PreAuthorize("@ss.hasPermi('system:grading:list')")
    @GetMapping("/list")
    public TableDataInfo list(Grading grading)
    {
        startPage();
        List<Grading> list = gradingService.selectGradingList(grading);
        return getDataTable(list);
    }

    /**
     * 导出考核列表
     */
    @PreAuthorize("@ss.hasPermi('system:grading:export')")
    @Log(title = "考核", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Grading grading)
    {
        List<Grading> list = gradingService.selectGradingList(grading);
        ExcelUtil<Grading> util = new ExcelUtil<Grading>(Grading.class);
        util.exportExcel(response, list, "考核数据");
    }

    /**
     * 获取考核详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:grading:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(gradingService.getById(id));
    }

    /**
     * 新增考核
     */
    @PreAuthorize("@ss.hasPermi('system:grading:add')")
    @Log(title = "考核", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Grading grading)
    {
        return toAjax(gradingService.insertGrading(grading));
    }

    /**
     * 修改考核
     */
    @PreAuthorize("@ss.hasPermi('system:grading:edit')")
    @Log(title = "考核", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Grading grading)
    {
        return toAjax(gradingService.updateGrading(grading));
    }

    /**
     * 删除考核
     */
    @PreAuthorize("@ss.hasPermi('system:grading:remove')")
    @Log(title = "考核", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(gradingService.deleteGradingByIds(ids));
    }


}
