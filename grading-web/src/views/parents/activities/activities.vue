<template>
  <div class="evaluation-form">
    <h2 class="title">大足区龙岗幼儿园各类活动家长评价检核表</h2>

    <div class="info">
      <p>评价教师：{{ $route.query.nickName }}</p>
      <p>评价时间：2024年6月</p>
    </div>

    <el-table
      v-loading="loading"
      :data="tableData"
      border
      style="width: 100%"
      :span-method="objectSpanMethod"
    >
      <el-table-column
        v-for="col in tableColumns"
        :key="col.code"
        :prop="col.code"
        :label="col.label"
        :width="getColumnWidth(col.code)"
        :fixed="col.code === 'category'"
      >
        <template slot-scope="scope">
          <!-- 检核点列 -->
          <div v-if="col.code === 'points'">
            <div v-for="(point, index) in scope.row.points" :key="index" class="point-item">
              {{ point }}
            </div>
          </div>

          <!-- 检核结果列 -->
          <div v-else-if="col.code === 'score'">
            <el-input
              v-model="scope.row.score"
              size="mini"
              type="number"
              placeholder="请输入分数"
              @input="updateTotal(scope.row)"
            />
          </div>

          <!-- 总分列 -->
          <div v-else-if="col.code === 'total'">
            {{ scope.row.total || '0' }}
          </div>

          <!-- 其他列默认渲染 -->
          <div v-else>
            {{ scope.row[col.code] }}
          </div>
        </template>
      </el-table-column>
    </el-table>


    <div class="footer">
      <el-button type="primary" @click="submit" size="small" :loading="submitting">提交</el-button>
    </div>
  </div>
</template>

<script>
import { getQuestionnaire, submitQuestionnaire } from '@/api/teacher/grading'

export default {
  data() {
    return {
      tableData: [],
      tableColumns: [],
      loading: true,
      submitting: false,
      questionnaireId: '',
      questionnaireQueryParam: {
        userId: this.$route.query.userId,
        templateType: 0
      }
    };
  },
  methods: {
    // 根据列类型返回适当的列宽
    getColumnWidth(code) {
      const widthMap = {
        'category': '100px',
        'subCategory': '150px',
        'score': '180px',
        'total': '80px'
      };
      return widthMap[code] || '';
    },

    objectSpanMethod({ row, column, rowIndex, columnIndex }) {
      if (!this.tableColumns || this.tableColumns.length === 0) {
        return {};
      }

      // 仅对"一级指标"列进行合并
      if (this.tableColumns[columnIndex].code === 'category') {
        const value = row.category;

        // 如果为空值，不进行合并
        if (!value) return {};

        // 找出相同category的连续行数
        let count = 0;
        for (let i = rowIndex; i < this.tableData.length; i++) {
          if (this.tableData[i].category === value) {
            count++;
          } else {
            break;
          }
        }

        // 找出相同category的起始位置
        let startIndex = rowIndex;
        for (let i = rowIndex - 1; i >= 0; i--) {
          if (this.tableData[i].category === value) {
            startIndex = i;
          } else {
            break;
          }
        }

        // 如果是该分类的第一行，则合并
        if (rowIndex === startIndex) {
          return {
            rowspan: count,
            colspan: 1
          };
        } else {
          return {
            rowspan: 0,
            colspan: 0
          };
        }
      }

      // 对于 total 列，合并同一级指标的总分
      if (this.tableColumns[columnIndex].code === 'total') {
        const value = row.category;

        // 如果为空值，不进行合并
        if (!value) return {};

        // 找出相同category的连续行数
        let count = 0;
        for (let i = rowIndex; i < this.tableData.length; i++) {
          if (this.tableData[i].category === value) {
            count++;
          } else {
            break;
          }
        }

        // 找出相同category的起始位置
        let startIndex = rowIndex;
        for (let i = rowIndex - 1; i >= 0; i--) {
          if (this.tableData[i].category === value) {
            startIndex = i;
          } else {
            break;
          }
        }

        // 如果是该分类的第一行，则合并
        if (rowIndex === startIndex) {
          return {
            rowspan: count,
            colspan: 1
          };
        } else {
          return {
            rowspan: 0,
            colspan: 0
          };
        }
      }
    },

    updateTotal(row) {
      // 确保 score 是数字
      const scoreNum = parseFloat(row.score) || 0;
      row.total = scoreNum.toString();

      // 获取当前一级指标
      const category = row.category;

      // 计算同一一级指标下所有行的总分
      const categoryRows = this.tableData.filter(item => item.category === category);
      const totalScore = categoryRows.reduce((sum, item) => {
        return sum + (parseFloat(item.score) || 0);
      }, 0);

      // 更新所有属于该一级指标的行的 total 值
      categoryRows.forEach(item => {
        item.total = totalScore.toString();
      });
    },

    async fetchData() {
      this.loading = true;
      try {
        const resp = await getQuestionnaire(this.questionnaireQueryParam);

        // 打印原始数据，用于调试
        console.log('API返回数据:', resp.data);

        // 检查数据有效性
        if (!resp.data || !resp.data.value) {
          this.$message.error('获取数据失败：返回数据格式错误');
          return;
        }

        this.questionnaireId = resp.data.questionnaireId;

        // 解析嵌套的JSON字符串
        try {
          let valueStr = resp.data.value;
          let valueObj = JSON.parse(valueStr);

          console.log('解析后的valueObj:', valueObj);

          // 检查解析结果是否有效
          if (!valueObj.title || !Array.isArray(valueObj.title) ||
            !valueObj.value || !Array.isArray(valueObj.value)) {
            this.$message.error('数据格式错误：数据结构不符合预期');
            return;
          }

          // 设置表头
          this.tableColumns = valueObj.title;

          // 设置表格数据
          this.tableData = valueObj.value;

          console.log('设置的表头:', this.tableColumns);
          console.log('设置的表格数据:', this.tableData);

        } catch (e) {
          console.error('解析数据失败:', e);
          this.$message.error('解析数据失败，请联系管理员');
        }
      } catch (error) {
        console.error('获取数据失败:', error);
        this.$message.error('获取数据失败，请重试');
      } finally {
        this.loading = false;
      }
    },

    async submit() {
      if (this.tableData.length === 0 || this.tableColumns.length === 0) {
        this.$message.warning('没有有效数据可提交');
        return;
      }

      try {
        this.submitting = true;
        // 检查是否所有项都已评分
        const unratedItems = this.tableData.filter(item => !item.score || item.score.trim() === '');

        if (unratedItems.length > 0) {
          this.$confirm('有部分评分未填写，是否继续提交?', '提示', {
            confirmButtonText: '确定',
            cancelButtonText: '取消',
            type: 'warning'
          }).then(() => {
            this.doSubmit();
          }).catch(() => {
            this.submitting = false;
          });
        } else {
          await this.doSubmit();
        }
      } catch (error) {
        console.error('提交操作失败:', error);
        this.$message.error('提交失败，请重试');
        this.submitting = false;
      }
    },

    async doSubmit() {
      // 构建提交数据
      const valueObj = {
        title: this.tableColumns,
        value: this.tableData
      };

      const payload = {
        questionnaireId: this.questionnaireId,
        value: JSON.stringify(valueObj)
      };

      console.log('提交的数据:', payload);

      try {
        await submitQuestionnaire(payload);
        this.$message.success('提交成功！');
      } catch (error) {
        console.error('提交请求失败:', error);
        this.$message.error('提交失败，请重试');
      } finally {
        this.submitting = false;
      }
    }
  },
  created() {
    this.fetchData();
  }
};
</script>

<style scoped>
.evaluation-form {
  padding: 20px;
  font-family: "Microsoft YaHei", sans-serif;
  line-height: 1.8;
}

.title {
  text-align: center;
  font-size: 22px;
  margin-bottom: 20px;
  font-weight: bold;
}

.info {
  display: flex;
  justify-content: space-between;
  margin-bottom: 20px;
  font-size: 14px;
}

.footer {
  margin-top: 20px;
  text-align: center;
}

.point-item {
  padding: 5px 0;
  border-bottom: 1px dashed #eee;
  line-height: 1.5;
  font-size: 13px;
}

.point-item:last-child {
  border-bottom: none;
}

/* 修复表格内容溢出问题 */
.el-table {
  width: 100% !important;
  table-layout: fixed;
}

.el-table .cell {
  word-break: break-word;
  line-height: 1.5;
}
</style>
