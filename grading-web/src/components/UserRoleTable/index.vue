<template>
  <div class="user-table-container">
    <!-- 搜索表单 -->
    <div class="search-form">
      <el-form :model="queryParams" ref="queryForm" :inline="true">
        <el-form-item label="用户名" prop="userName">
          <el-input
            v-model="queryParams.userName"
            placeholder="请输入用户名"
            clearable
            @keyup.enter.native="handleQuery"
          />
        </el-form-item>
        <el-form-item label="手机号码" prop="telephone">
          <el-input
            v-model="queryParams.telephone"
            placeholder="请输入手机号码"
            clearable
            @keyup.enter.native="handleQuery"
          />
        </el-form-item>
        <el-form-item>
          <el-button type="primary" icon="el-icon-search" @click="handleQuery">搜索</el-button>
          <el-button icon="el-icon-refresh" @click="resetQuery">重置</el-button>
        </el-form-item>
      </el-form>
    </div>
    <!-- 用户数据表格 -->
    <el-table
      v-loading="loading"
      :data="userList"
      border
      stripe
      style="width: 100%"
    >
      <el-table-column
        type="index"
        width="50"
        label="序号"
        align="center"
      />
      <el-table-column
        prop="userId"
        label="用户ID"
        align="center"
        width="100"
      />
      <el-table-column
        prop="userName"
        label="登录名称"
        align="center"
        :show-overflow-tooltip="true"
      />
      <el-table-column
        prop="nickName"
        label="用户名称"
        align="center"
        :show-overflow-tooltip="true"
      />
      <el-table-column
        prop="email"
        label="用户邮箱"
        align="center"
        :show-overflow-tooltip="true"
      />
      <el-table-column
        prop="phoneNumber"
        label="手机号码"
        align="center"
        width="120"
      />
      <el-table-column
        prop="sex"
        label="用户性别"
        align="center"
        width="100"
      >
        <template slot-scope="scope">
          <span v-if="scope.row.sex === '0'">男</span>
          <span v-else-if="scope.row.sex === '1'">女</span>
          <span v-else>未知</span>
        </template>
      </el-table-column>
      <el-table-column
        prop="status"
        label="状态"
        align="center"
        width="100"
      >
        <template slot-scope="scope">
          <el-tag :type="scope.row.status === '0' ? 'success' : 'danger'">
            {{ scope.row.status === '0' ? '正常' : '停用' }}
          </el-tag>
        </template>
      </el-table-column>
      <el-table-column
        prop="roles"
        label="角色"
        align="center"
        :show-overflow-tooltip="true"
      />
      <el-table-column
        label="操作"
        align="center"
        width="180"
      >
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="grading(scope.row)"
          >查看考核表
          </el-button>
        </template>
      </el-table-column>
    </el-table>

    <!-- 分页组件 -->
    <pagination v-show="total > 0" :total="total" :page.sync="queryParams.pageNum" :limit.sync="queryParams.pageSize"
                @pagination="loadUserList"/>
  </div>
</template>

<script>
import {listUserByRoles} from '@/api/system/user' // 假设这是您的API调用方法

export default {
  name: 'UserRoleTable',
  props: {
    // 从外部传入的角色列表
    roles: {
      type: Array,
      default: () => []
    }
  },
  data() {
    return {
      // 查询参数
      queryParams: {
        userName: '',
        telephone: '',
        // 不再在组件内部维护roles，而是使用props传入
        pageNum: 1,
        pageSize: 10
      },
      // 用户列表数据
      userList: [],
      // 总记录数
      total: 0,
      // 加载状态
      loading: false
    }
  },
  watch: {
    // 监听角色变化，重新加载数据
    roles: {
      handler() {
        this.loadUserList();
      },
      immediate: true
    }
  },
  created() {
    // 初始化时加载用户数据
    this.loadUserList()
  },
  methods: {
    // 加载用户列表数据
    loadUserList() {
      this.loading = true
      // 构建查询参数，将外部传入的roles合并进去
      const params = {
        ...this.queryParams,
        roles: this.roles // 使用props传入的角色
      }

      // 调用API获取用户列表
      listUserByRoles(params)
        .then(response => {
          // 这里假设后端返回的数据格式为 { total: number, rows: array }
          this.userList = response.rows
          this.total = response.total
        })
        .catch(error => {
          console.error('获取用户列表失败:', error)
          this.$message.error('获取用户列表失败')
        })
        .finally(() => {
          this.loading = false
        })
    },
    // 搜索按钮点击事件
    handleQuery() {
      this.queryParams.pageNum = 1
      this.loadUserList()
    },
    // 重置搜索表单
    resetQuery() {
      this.$refs.queryForm.resetFields()
      this.handleQuery()
    },
    // 编辑用户
    grading(row) {
      this.$emit('grading', {
        userId: row.userId,
        gradingType: this.gradingType,
        nickName: row.nickName
      })
    }
  }
}
</script>

<style scoped>
.user-table-container {
  padding: 20px;
}

.search-form {
  margin-bottom: 20px;
}

.table-operations {
  margin-bottom: 20px;
}

.pagination-container {
  margin-top: 20px;
  text-align: right;
}
</style>
