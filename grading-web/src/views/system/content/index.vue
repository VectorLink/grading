<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="元数据Id" prop="templateMetaId">
        <el-input
          v-model="queryParams.templateMetaId"
          placeholder="请输入元数据Id"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="系统模板参数 0-否 1-系统" prop="systemValue">
        <el-input
          v-model="queryParams.systemValue"
          placeholder="请输入系统模板参数 0-否 1-系统"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="行号" prop="rowId">
        <el-input
          v-model="queryParams.rowId"
          placeholder="请输入行号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="列合并" prop="mergeColumn">
        <el-input
          v-model="queryParams.mergeColumn"
          placeholder="请输入列合并"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="行合并" prop="rowColumn">
        <el-input
          v-model="queryParams.rowColumn"
          placeholder="请输入行合并"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['system:content:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['system:content:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['system:content:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['system:content:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="contentList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="主键" align="center" prop="id" />
      <el-table-column label="元数据Id" align="center" prop="templateMetaId" />
      <el-table-column label="系统模板参数 0-否 1-系统" align="center" prop="systemValue" />
      <el-table-column label="内容" align="center" prop="value" />
      <el-table-column label="行号" align="center" prop="rowId" />
      <el-table-column label="列合并" align="center" prop="mergeColumn" />
      <el-table-column label="行合并" align="center" prop="rowColumn" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['system:content:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['system:content:remove']"
          >删除</el-button>
        </template>
      </el-table-column>
    </el-table>
    
    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改考核内容值对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="元数据Id" prop="templateMetaId">
          <el-input v-model="form.templateMetaId" placeholder="请输入元数据Id" />
        </el-form-item>
        <el-form-item label="系统模板参数 0-否 1-系统" prop="systemValue">
          <el-input v-model="form.systemValue" placeholder="请输入系统模板参数 0-否 1-系统" />
        </el-form-item>
        <el-form-item label="内容" prop="value">
          <el-input v-model="form.value" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="行号" prop="rowId">
          <el-input v-model="form.rowId" placeholder="请输入行号" />
        </el-form-item>
        <el-form-item label="列合并" prop="mergeColumn">
          <el-input v-model="form.mergeColumn" placeholder="请输入列合并" />
        </el-form-item>
        <el-form-item label="行合并" prop="rowColumn">
          <el-input v-model="form.rowColumn" placeholder="请输入行合并" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listContent, getContent, delContent, addContent, updateContent } from "@/api/system/content";

export default {
  name: "Content",
  data() {
    return {
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 考核内容值表格数据
      contentList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        templateMetaId: null,
        systemValue: null,
        value: null,
        rowId: null,
        mergeColumn: null,
        rowColumn: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        templateMetaId: [
          { required: true, message: "元数据Id不能为空", trigger: "blur" }
        ],
        systemValue: [
          { required: true, message: "系统模板参数 0-否 1-系统不能为空", trigger: "blur" }
        ],
        rowId: [
          { required: true, message: "行号不能为空", trigger: "blur" }
        ],
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询考核内容值列表 */
    getList() {
      this.loading = true;
      listContent(this.queryParams).then(response => {
        this.contentList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        id: null,
        templateMetaId: null,
        systemValue: null,
        value: null,
        rowId: null,
        mergeColumn: null,
        rowColumn: null
      };
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.id)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加考核内容值";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getContent(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改考核内容值";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateContent(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addContent(this.form).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const ids = row.id || this.ids;
      this.$modal.confirm('是否确认删除考核内容值编号为"' + ids + '"的数据项？').then(function() {
        return delContent(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('system/content/export', {
        ...this.queryParams
      }, `content_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
