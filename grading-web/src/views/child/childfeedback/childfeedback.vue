<template>
  <div class="evaluation-table">
    <el-card class="form-card">
      <div slot="header" class="card-header">
        <h2 class="title">儿童委员会评价反馈表</h2>
        <h3 class="subtitle">教师姓名: {{ teacherName }}</h3>
      </div>

      <div class="action-bar">
        <el-button
          type="primary"
          icon="el-icon-document"
          @click="showScoreStandard">
          查看评分标准
        </el-button>
        <el-button
          type="success"
          icon="el-icon-check"
          @click="submitFeedback"
          :loading="loading"
          :disabled="hasEmptyRecords">
          提交评价
        </el-button>
      </div>

      <el-table
        v-loading="tableLoading"
        :data="tableData"
        border
        style="width: 100%"
        header-cell-class-name="header-cell">
        <el-table-column prop="label" label="评价内容" width="300" />
        <el-table-column prop="method" label="评价方式" width="400" />
        <el-table-column label="记录栏">
          <template slot-scope="scope">
            <el-input
              type="textarea"
              :rows="3"
              :placeholder="getPlaceholder(scope.row)"
              v-model="scope.row.record"
              :disabled="!editable"
              @input="updateFeedbackData(scope.row)"
            />
          </template>
        </el-table-column>
      </el-table>

      <div class="feedback-summary" v-if="submitted">
        <el-alert
          title="提交成功"
          type="success"
          :closable="false"
          show-icon>
          <p>评价已成功提交，感谢您的反馈！</p>
        </el-alert>
      </div>
    </el-card>

    <!-- 评分标准对话框 -->
    <el-dialog
      title="儿童委员会评分标准"
      :visible.sync="dialogVisible"
      width="80%">

      <div class="score-standard-content">
        <section class="standard-section">
          <h3>一、目标</h3>
          <p>通过集体讨论、绘画、游戏等方式，收集幼儿对教师的真实感受。</p>
        </section>

        <section class="standard-section">
          <h3>二、对象</h3>
          <p>儿童委员会成员。</p>
        </section>

        <el-table :data="evaluationDimensions" border style="width: 100%; margin: 15px 0">
          <el-table-column prop="dimension" label="评价维度" width="150" />
          <el-table-column prop="guidance" label="问题引导" />
          <el-table-column prop="recordMethod" label="记录方式" />
          <el-table-column prop="significance" label="意义" />
        </el-table>

        <section class="standard-section scoring">
          <h3>三、评分标准</h3>
          <p>小班：情感支持*30% + 教师公平性*20% + 教师对幼儿的需求回应*20% + 教学趣味性*20% + 幼儿的建议*10% = 100%</p>
          <p>中班/大班类似，仅权重略有不同。</p>
        </section>

        <section class="standard-section suggestion">
          <h3>四、实施建议</h3>
          <ol>
            <li>由非班级教师主持，避免幼儿不敢表达；</li>
            <li>结果以"儿童观察报告"形式反馈，避免直接打分，强调质性分析。</li>
          </ol>
        </section>
      </div>

      <span slot="footer" class="dialog-footer">
        <el-button @click="dialogVisible = false">关 闭</el-button>
      </span>
    </el-dialog>
  </div>
</template>

<script>
import { getQuestionnaire, submitQuestionnaire } from '@/api/teacher/grading'

export default {
  name: "ChildFeedback",

  data() {
    return {
      dialogVisible: false,
      teacherName: '',
      loading: false,
      tableLoading: false,
      editable: true,
      submitted: false,

      // 评价维度数据
      evaluationDimensions: [
        {
          dimension: '情感支持',
          guidance: '"画出老师让我最开心的时刻"',
          recordMethod: '绘画＋口头描述＋关键词记录',
          significance: '了解教师对幼儿的情感关怀'
        },
        {
          dimension: '教学趣味性',
          guidance: '投票：我最喜欢的一次活动（故事/游戏/手工/音乐等）',
          recordMethod: '利用贴纸投票等形式统计幼儿结果',
          significance: '反映教师教学方式的吸引力'
        },
        {
          dimension: '教师公平性',
          guidance: '提某种情境："如果小朋友抢了你的玩具，老师会怎么做？"',
          recordMethod: '录音等形式记录幼儿原话',
          significance: '考察教师对待幼儿是否公平'
        },
        {
          dimension: '教师对幼儿的需求回应',
          guidance: '"举牌子游戏"，老师会认真听我说话吗？（笑脸/哭脸）她会怎么回答我？',
          recordMethod: '表情统计＋口头描述＋关键词记录',
          significance: '评估教师的倾听与回应能力'
        },
        {
          dimension: '幼儿的建议',
          guidance: '"如果今天我来做老师，我会..."',
          recordMethod: '绘画、角色扮演等',
          significance: '激发幼儿的自主表达，记录幼儿最真实的想法，促进教师反思'
        }
      ],

      // 表格数据
      tableData: [
        {
          id: 1,
          label: "老师让我最开心的时刻",
          method: "绘画＋口头描述＋关键词记录",
          record: "",
          field: "happyTime"
        },
        {
          id: 2,
          label: "我最喜欢的一次活动",
          method: "利用贴纸投票等形式统计幼儿结果",
          record: "",
          field: "favoriteActivity"
        },
        {
          id: 3,
          label: "如果小朋友抢了你的玩具，老师会怎么做？",
          method: "录音等形式记录幼儿原话",
          record: "",
          field: "howDo"
        },
        {
          id: 4,
          label: "老师会认真听我说话吗？（笑脸/哭脸）她会怎么回答我？",
          method: "表情统计＋口头描述＋关键词记录",
          record: "",
          field: "listen"
        },
        {
          id: 5,
          label: "如果今天我来做老师，我会…",
          method: "绘画、角色扮演等",
          record: "",
          field: "iWillDo"
        }
      ],

      // 反馈数据对象
      feedbackData: {
        happyTime: "",
        favoriteActivity: "",
        howDo: "",
        listen: "",
        iWillDo: ""
      },

      // API参数
      questionnaireQueryParam: {
        templateType: 5,
        userId: ''
      },
      questionnaireId: '',
      templateName: '',
    };
  },

  computed: {
    /**
     * 检查是否存在未填写的记录
     * @returns {boolean} 是否有空记录
     */
    hasEmptyRecords() {
      return this.tableData.some(item => !item.record || !item.record.trim());
    }
  },

  created() {
    // 从路由参数获取教师姓名和用户ID
    this.teacherName = this.$route.query.nickName || '未指定';
    this.questionnaireQueryParam.userId = this.$route.query.userId || '';

    // 获取已有评价数据
    this.fetchFeedbackData();
  },

  methods: {
    /**
     * 显示评分标准对话框
     */
    showScoreStandard() {
      this.dialogVisible = true;
    },

    /**
     * 获取输入框的占位符文本
     * @param {Object} row 当前行数据
     * @returns {string} 占位符文本
     */
    getPlaceholder(row) {
      return `请在此处记录"${row.label}"的评价内容`;
    },

    /**
     * 实时更新反馈数据对象
     * @param {Object} row 当前行数据
     */
    updateFeedbackData(row) {
      if (row.field && this.feedbackData.hasOwnProperty(row.field)) {
        this.feedbackData[row.field] = row.record;
      }
    },

    /**
     * 从后端获取评价数据
     */
    async fetchFeedbackData() {
      try {
        this.tableLoading = true;
        const resp = await getQuestionnaire(this.questionnaireQueryParam);

        if (!resp || !resp.data) {
          this.$message.error('获取数据失败：返回数据格式错误');
          return;
        }

        this.questionnaireId = resp.data.questionnaireId;
        this.templateName = resp.data.templateName;

        // 解析并填充表单数据
        if (resp.data.value) {
          try {
            const valueObj = JSON.parse(resp.data.value);
            this.feedbackData = { ...this.feedbackData, ...valueObj };

            // 更新表格数据
            this.tableData.forEach(item => {
              if (item.field && valueObj[item.field] !== undefined) {
                item.record = valueObj[item.field];
              }
            });
          } catch (e) {
            console.error('解析数据失败:', e);
            this.$message.error('解析问卷数据失败，请联系管理员');
          }
        }
      } catch (error) {
        console.error('获取问卷数据失败:', error);
        this.$message.error('获取问卷数据失败，请稍后重试');
      } finally {
        this.tableLoading = false;
      }
    },

    /**
     * 提交评价数据
     */
    async submitFeedback() {
      // 验证是否有空的记录
      if (this.hasEmptyRecords) {
        this.$message.warning('请完成所有评价项的记录');
        return;
      }

      try {
        this.loading = true;

        // 构建请求载荷
        const payload = {
          questionnaireId: this.questionnaireId,
          value: JSON.stringify(this.feedbackData)
        };

        // 调用API提交数据
        const response = await submitQuestionnaire(payload);

        if (response.code === 200) {
          this.$message.success('评价提交成功');
          this.submitted = true;
          this.editable = false; // 提交后禁止编辑
        } else {
          this.$message.error(response.msg || '提交失败，请稍后重试');
        }
      } catch (error) {
        console.error('提交评价数据失败:', error);
        this.$message.error('提交失败，请稍后重试');
      } finally {
        this.loading = false;
      }
    }
  }
};
</script>

<style scoped>
.evaluation-table {
  padding: 20px;
  font-family: 'Microsoft YaHei', sans-serif;
}

.form-card {
  margin-bottom: 20px;
  box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.1);
}

.card-header {
  display: flex;
  flex-direction: column;
  align-items: center;
  margin-bottom: 10px;
}

.title {
  font-size: 24px;
  font-weight: bold;
  margin: 0;
  color: #303133;
}

.subtitle {
  margin: 8px 0 0;
  font-size: 18px;
  color: #606266;
  font-weight: normal;
}

.action-bar {
  display: flex;
  justify-content: space-between;
  margin-bottom: 20px;
}

.header-cell {
  font-weight: bold;
  text-align: center;
  background-color: #f5f7fa;
}

.score-standard-content {
  line-height: 1.6;
}

.standard-section {
  margin-bottom: 15px;
}

.standard-section h3 {
  margin-top: 0;
  font-size: 18px;
  color: #303133;
}

.scoring, .suggestion {
  margin-top: 20px;
  padding: 15px;
  background-color: #f8f8f8;
  border-radius: 4px;
  border-left: 4px solid #409EFF;
}

.feedback-summary {
  margin-top: 20px;
}

/* 深度选择器，修改Element UI组件内部样式 */
/deep/ .el-textarea__inner {
  min-height: 80px;
  resize: vertical;
}

/deep/ .el-table th {
  background-color: #f5f7fa;
}

/deep/ .el-alert {
  margin: 15px 0;
}
</style>
