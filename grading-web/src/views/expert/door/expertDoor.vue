<template>
  <div class="container">
    <el-card shadow="hover" class="mb-4">
      <h2 class="title">{{ templateName || '大足区龙岗幼儿园幸福推门听课评分表' }}</h2>
      <el-form :inline="true" label-width="80px" class="form">
        <el-form-item label="日期">
          <el-date-picker v-model="form.date" placeholder="选择日期"/>
        </el-form-item>
        <el-form-item label="班级">
          <el-input v-model="form.className"/>
        </el-form-item>
        <el-form-item label="执教教师">
          <el-input v-model="form.teacher" :disabled="teacherName !== ''"/>
        </el-form-item>
        <el-form-item label="听课人">
          <el-input v-model="form.observer"/>
        </el-form-item>
      </el-form>
    </el-card>

    <el-card v-for="(section, index) in sections" :key="index" class="mb-4">
      <div slot="header">
        <span>{{ section.title }}</span>
      </div>
      <el-table :data="section.items" border style="width: 100%">
        <el-table-column prop="label" label="指标" width="160"/>
        <el-table-column prop="standard" label="评分标准"/>
        <el-table-column label="得分" width="120">
          <template v-slot="scope">
            <el-input-number
              v-model="scope.row.score"
              :min="0"
              :max="scope.row.max"
              :step="0.5"
              controls-position="right"
              size="small"
            />
          </template>
        </el-table-column>
      </el-table>
    </el-card>

    <el-card class="mb-4">
      <el-form label-width="100px">
        <el-form-item label="亮点记录">
          <el-input type="textarea" rows="3" v-model="form.highlights"/>
        </el-form-item>
        <el-form-item label="改进建议">
          <el-input type="textarea" rows="3" v-model="form.suggestions"/>
        </el-form-item>
        <el-form-item label="总分">
          <el-input :value="totalScore" disabled/>
        </el-form-item>
      </el-form>
    </el-card>

    <div class="submit-container">
      <el-button type="primary" :disabled="hasEmptyFields" @click="submitFeedback" round>提交评分表</el-button>
    </div>

    <el-card>
      <h4>使用说明：</h4>
      <ul class="instructions">
        <li>评分方式：根据观察，按指标逐项打分（可细化至 0.5 分），总分反映活动质量。</li>
        <li>幸福教育特色：重在关注幼儿情绪体验、积极情感激发、教师情感联结等维度。</li>
        <li>结果运用：结合亮点与改进建议，后续可开展教师研讨，优化教学策略。</li>
      </ul>
    </el-card>
  </div>
</template>

<script>
import { getQuestionnaire, submitQuestionnaire } from '@/api/teacher/grading'

export default {
  name: 'ExpertDoor',
  data() {
    return {
      templateName: "",
      teacherName: "",
      questionnaireId: '',
      questionnaireQueryParam: {
        templateType: 7, // 假设这个表单的模板类型ID为7
        userId: ''
      },
      form: {
        date: '',
        className: '',
        teacher: '',
        observer: '',
        highlights: '',
        suggestions: ''
      },
      sections: [
        {
          title: '一、教学目标与内容（20分）',
          items: [
            {label: '目标明确性', standard: '符合幼儿年龄特点与实际需要，体现素养教育核心心理素养', score: 0, max: 5},
            {label: '内容适宜性', standard: '内容贴近幼儿生活，融合游戏与探索活动，避免小学化倾向', score: 0, max: 5},
            {label: '幸福渗透', standard: '活动中融入关爱、分享、感恩等积极情绪引导', score: 0, max: 5},
            {label: '分层设计', standard: '关注个体差异，提供不同难度任务，满足整体发展需求', score: 0, max: 5}
          ]
        },
        {
          title: '二、教学过程与方法（30分）',
          items: [
            {label: '互动质量', standard: '师幼对话平等，教师多采用鼓励性语言，幼儿敢于表达', score: 0, max: 6},
            {label: '参与氛围', standard: '幼儿情绪愉悦，主动探索，参与率达 80%以上', score: 0, max: 6},
            {label: '情境创设', standard: '利用故事、音乐、角色演等营造轻松愉快氛围', score: 0, max: 6},
            {label: '教学方法', standard: '采用游戏化教学、小组合作、探究等多元方式', score: 0, max: 6},
            {label: '幸福瞬间', standard: '活动中出现幼儿自发鼓掌、欢笑等积极行为', score: 0, max: 6}
          ]
        },
        {
          title: '三、教师素养与教态（20分）',
          items: [
            {label: '语言感染力', standard: '语言生动形象，富有童趣与情感', score: 0, max: 5},
            {label: '情绪传递', standard: '教师面带微笑，语气亲切自然，营造安全感', score: 0, max: 5},
            {label: '应变能力', standard: '关注幼儿情绪变化，灵活调整策略', score: 0, max: 5},
            {label: '幸福引领', standard: '通过自身热情感染幼儿，成为"幸福榜样"', score: 0, max: 5}
          ]
        },
        {
          title: '四、幼儿发展与效果（25分）',
          items: [
            {label: '能力提升', standard: '表达、动手、社交等方面有明显进步', score: 0, max: 8},
            {label: '幸福体验', standard: '幼儿表现出满足感，主动表达"今天真开心"', score: 0, max: 8},
            {label: '习惯培养', standard: '渗透礼仪、卫生、合作等良好习惯教育', score: 0, max: 4},
            {label: '创新表现', standard: '幼儿有独特想法或创造性行为', score: 0, max: 5}
          ]
        },
        {
          title: '五、环境与支持（5分）',
          items: [
            {label: '物理环境', standard: '安全、美观、布局合理，色彩温馨', score: 0, max: 3},
            {label: '心理支持', standard: '教师关注需求，提供个性化指导', score: 0, max: 2}
          ]
        }
      ]
    };
  },
  computed: {
    totalScore() {
      return this.sections
        .flatMap(section => section.items)
        .reduce((sum, item) => sum + (item.score || 0), 0)
        .toFixed(1);
    },
    hasEmptyFields() {
      // 检查必填字段是否为空
      return !this.form.date ||
        !this.form.className ||
        !this.form.teacher ||
        !this.form.observer;
    }
  },
  methods: {
    // 获取问卷数据
    async fetchFeedbackData() {
      try {
        const resp = await getQuestionnaire(this.questionnaireQueryParam);
        if (!resp || !resp.data) {
          this.$message.error('获取数据失败：返回数据格式错误');
          return;
        }

        this.questionnaireId = resp.data.questionnaireId;
        if (resp.data.templateName) {
          this.templateName = resp.data.templateName;
        }

        // 解析并填充表单数据
        if (resp.data.value) {
          try {
            const valueObj = JSON.parse(resp.data.value);

            // 填充基本表单数据
            if (valueObj.form) {
              this.form = {...this.form, ...valueObj.form};
            }

            // 填充评分项数据
            if (valueObj.sections) {
              // 确保只更新现有项的分数
              valueObj.sections.forEach((section, sectionIndex) => {
                if (this.sections[sectionIndex] && section.items) {
                  section.items.forEach((item, itemIndex) => {
                    if (this.sections[sectionIndex].items[itemIndex]) {
                      this.sections[sectionIndex].items[itemIndex].score = item.score || 0;
                    }
                  });
                }
              });
            }
          } catch (e) {
            console.error('解析数据失败:', e);
            this.$message.error('解析问卷数据失败，请联系管理员');
          }
        }
      } catch (error) {
        console.error('获取问卷数据失败:', error);
        this.$message.error('获取问卷数据失败，请稍后重试');
      }
    },

    // 提交问卷数据
    async submitFeedback() {
      if (this.hasEmptyFields) {
        this.$message.warning('请完成所有基本信息的填写');
        return;
      }

      try {
        // 构建提交的数据结构
        const formData = {
          form: this.form,
          sections: this.sections.map(section => ({
            title: section.title,
            items: section.items.map(item => ({
              label: item.label,
              score: item.score
            }))
          })),
          totalScore: this.totalScore
        };

        // 构建请求载荷
        const payload = {
          questionnaireId: this.questionnaireId,
          value: JSON.stringify(formData)
        };

        // 调用API提交数据
        const response = await submitQuestionnaire(payload);

        if (response && response.code === 200) {
          this.$message.success('评分表提交成功');
        } else {
          this.$message.error((response && response.msg) || '提交失败，请稍后重试');
        }
      } catch (error) {
        console.error('提交评分表数据失败:', error);
        this.$message.error('提交失败，请稍后重试');
      }
    }
  },
  created() {
    // 从路由参数获取教师名称和用户ID
    this.teacherName = this.$route.query.nickName || '';
    this.questionnaireQueryParam.userId = this.$route.query.userId || '';

    // 如果有教师名称，自动填入表单
    if (this.teacherName) {
      this.form.teacher = this.teacherName;
    }

    // 获取问卷数据
    this.fetchFeedbackData();
  }
};
</script>

<style scoped>
.container {
  width: 100%;
  padding: 20px;
  box-sizing: border-box;
}

.title {
  text-align: center;
  font-size: 20px;
  font-weight: bold;
  margin-bottom: 10px;
  color: #303133;
}

.mb-4 {
  margin-bottom: 20px;
}

.form {
  display: flex;
  flex-wrap: wrap;
  justify-content: space-between;
}

.el-form-item {
  margin-right: 0;
  margin-bottom: 10px;
  width: calc(50% - 10px);
}

.submit-container {
  display: flex;
  justify-content: center;
  margin-bottom: 20px;
}

.submit-container .el-button {
  width: 180px;
}

.instructions {
  padding-left: 20px;
  line-height: 1.8;
  margin: 0;
}

.instructions li {
  margin-bottom: 10px;
  color: #606266;
}

@media screen and (max-width: 768px) {
  .container {
    padding: 10px;
  }

  .el-form-item {
    width: 100%;
  }

  .el-table {
    width: 100%;
    font-size: 14px;
  }

  .el-card {
    margin-bottom: 15px;
  }

  .submit-container .el-button {
    width: 100%;
  }
}
</style>
