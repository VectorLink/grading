<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="考核人Id" prop="userId">
        <el-input
          v-model="queryParams.userId"
          placeholder="请输入考核人Id"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="考核表名称" prop="gradingName">
        <el-input
          v-model="queryParams.gradingName"
          placeholder="请输入考核表名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="考核月份" prop="gradingMonth">
        <el-input
          v-model="queryParams.gradingMonth"
          placeholder="请输入考核月份"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="考核开始时间" prop="gradingStartTime">
        <el-date-picker clearable
          v-model="queryParams.gradingStartTime"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="请选择考核开始时间">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="考核结束时间" prop="gradingEndTime">
        <el-date-picker clearable
          v-model="queryParams.gradingEndTime"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="请选择考核结束时间">
        </el-date-picker>
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
          v-hasPermi="['system:grading:add']"
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
          v-hasPermi="['system:grading:edit']"
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
          v-hasPermi="['system:grading:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['system:grading:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="gradingList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="主键" align="center" prop="id" />
      <el-table-column label="考核人Id" align="center" prop="userId" />
      <el-table-column label="考核表名称" align="center" prop="gradingName" />
      <el-table-column label="考核月份" align="center" prop="gradingMonth" />
      <el-table-column label="考核开始时间" align="center" prop="gradingStartTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.gradingStartTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="考核结束时间" align="center" prop="gradingEndTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.gradingEndTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="考核状态 0-已结束 1-考核中" align="center" prop="status" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['system:grading:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['system:grading:remove']"
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

    <!-- 添加或修改考核对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="考核人Id" prop="userId">
          <el-input v-model="form.userId" placeholder="请输入考核人Id" />
        </el-form-item>
        <el-form-item label="考核表名称" prop="gradingName">
          <el-input v-model="form.gradingName" placeholder="请输入考核表名称" />
        </el-form-item>
        <el-form-item label="考核月份" prop="gradingMonth">
          <el-input v-model="form.gradingMonth" placeholder="请输入考核月份" />
        </el-form-item>
        <el-form-item label="考核开始时间" prop="gradingStartTime">
          <el-date-picker clearable
            v-model="form.gradingStartTime"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择考核开始时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="考核结束时间" prop="gradingEndTime">
          <el-date-picker clearable
            v-model="form.gradingEndTime"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择考核结束时间">
          </el-date-picker>
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
import { listGrading, getGrading, delGrading, addGrading, updateGrading } from "@/api/system/grading";

export default {
  name: "Grading",
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
      // 考核表格数据
      gradingList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        userId: null,
        gradingName: null,
        gradingMonth: null,
        gradingStartTime: null,
        gradingEndTime: null,
        status: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        userId: [
          { required: true, message: "考核人Id不能为空", trigger: "blur" }
        ],
        gradingName: [
          { required: true, message: "考核表名称不能为空", trigger: "blur" }
        ],
        gradingMonth: [
          { required: true, message: "考核月份不能为空", trigger: "blur" }
        ],
        status: [
          { required: true, message: "考核状态 0-已结束 1-考核中不能为空", trigger: "change" }
        ]
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询考核列表 */
    getList() {
      this.loading = true;
      listGrading(this.queryParams).then(response => {
        this.gradingList = response.rows;
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
        userId: null,
        gradingName: null,
        gradingMonth: null,
        gradingStartTime: null,
        gradingEndTime: null,
        status: null
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
      this.title = "添加考核";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getGrading(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改考核";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateGrading(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addGrading(this.form).then(response => {
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
      this.$modal.confirm('是否确认删除考核编号为"' + ids + '"的数据项？').then(function() {
        return delGrading(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('system/grading/export', {
        ...this.queryParams
      }, `grading_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
