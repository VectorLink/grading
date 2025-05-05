<template>
  <div class="container">
    <el-card shadow="hover" class="mb-4">
      <h2 class="title">大足区龙岗幼儿园{{ templateName || '幸福推门听课评分表' }}</h2>
      <el-row  justify="center" style="text-align: center;">
        <el-col :span="12">评价教师：{{ teacherName }}</el-col>
        <el-col :span="12">总分：{{form.totalScore||0}}</el-col>
      </el-row>

    </el-card>

    <el-card v-for="(section, index) in sections" :key="index" class="mb-4">
      <div slot="header" class="section-header">
        <span>{{ section.title }}</span>
      </div>
      <el-table
        :data="section.items"
        border
        stripe
        highlight-current-row
        style="width: 100%">
        <el-table-column prop="label" label="指标" width="160" />
        <el-table-column prop="standard" label="评分标准" show-overflow-tooltip />
        <el-table-column label="得分" width="120" align="center">
          <template v-slot="scope">
            <el-input-number
              v-model="scope.row.score"
              :min="0"
              :max="scope.row.max"
              :step="0.5"
              controls-position="right"
              size="small"
              @input="calculateTotal"
            />
          </template>
        </el-table-column>
      </el-table>
    </el-card>

    <el-card class="mb-4">
      <el-form label-width="100px" :model="form" ref="evaluationForm">
        <el-form-item label="亮点记录">
          <el-input type="textarea" rows="3" v-model="form.highlights" placeholder="请记录教学亮点..." />
        </el-form-item>
        <el-form-item label="改进建议">
          <el-input type="textarea" rows="3" v-model="form.suggestions" placeholder="请提供改进建议..." />
        </el-form-item>
        <el-form-item label="总分">
          <el-input :value="form.totalScore" disabled>
            <template slot="append">满分100</template>
          </el-input>
        </el-form-item>
      </el-form>
    </el-card>

    <div class="submit-container">
      <el-button type="primary" :loading="submitting" @click="submitFeedback" round>
        {{ submitting ? '提交中...' : '提交评分表' }}
      </el-button>
    </div>

    <el-card>
      <h4 class="instruction-title">使用说明：</h4>
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
      submitting: false,
      questionnaireQueryParam: {
        templateType: 10,
        userId: ''
      },
      form: {
        observer: '',
        highlights: '',
        suggestions: '',
        goalClarity: "",
        contentSuitability: "",
        happinessIntegration: "",
        layeredDesign: "",
        interactionQuality: "",
        participationAtmosphere: "",
        situationCreation: "",
        teachingMethods: "",
        happinessMoments: "",
        languageInfluence: "",
        emotionTransmission: "",
        adaptationAbility: "",
        happinessLeadership: "",
        abilityImprovement: "",
        happinessExperience: "",
        habitCultivation: "",
        innovativePerformance: "",
        physicalEnvironment: "",
        psychologicalSupport: "",
        totalScore: 0
      },
      sections: [
        {
          title: '一、教学目标与内容（20分）',
          items: [
            {code: 'goalClarity', label: '目标明确性', standard: '符合幼儿年龄特点与实际需要，体现素养教育核心心理素养', score: 0, max: 5},
            {code: 'contentSuitability', label: '内容适宜性', standard: '内容贴近幼儿生活，融合游戏与探索活动，避免小学化倾向', score: 0, max: 5},
            {code: 'happinessIntegration', label: '幸福渗透', standard: '活动中融入关爱、分享、感恩等积极情绪引导', score: 0, max: 5},
            {code: 'layeredDesign', label: '分层设计', standard: '关注个体差异，提供不同难度任务，满足整体发展需求', score: 0, max: 5}
          ]
        },
        {
          title: '二、教学过程与方法（30分）',
          items: [
            {code: 'interactionQuality', label: '互动质量', standard: '师幼对话平等，教师多采用鼓励性语言，幼儿敢于表达', score: 0, max: 6},
            {code: 'participationAtmosphere', label: '参与氛围', standard: '幼儿情绪愉悦，主动探索，参与率达 80%以上', score: 0, max: 6},
            {code: 'situationCreation', label: '情境创设', standard: '利用故事、音乐、角色演等营造轻松愉快氛围', score: 0, max: 6},
            {code: 'teachingMethods', label: '教学方法', standard: '采用游戏化教学、小组合作、探究等多元方式', score: 0, max: 6},
            {code: 'happinessMoments', label: '幸福瞬间', standard: '活动中出现幼儿自发鼓掌、欢笑等积极行为', score: 0, max: 6}
          ]
        },
        {
          title: '三、教师素养与教态（20分）',
          items: [
            {code: 'languageInfluence', label: '语言感染力', standard: '语言生动形象，富有童趣与情感', score: 0, max: 5},
            {code: 'emotionTransmission', label: '情绪传递', standard: '教师面带微笑，语气亲切自然，营造安全感', score: 0, max: 5},
            {code: 'adaptationAbility', label: '应变能力', standard: '关注幼儿情绪变化，灵活调整策略', score: 0, max: 5},
            {code: 'happinessLeadership', label: '幸福引领', standard: '通过自身热情感染幼儿，成为"幸福榜样"', score: 0, max: 5}
          ]
        },
        {
          title: '四、幼儿发展与效果（25分）',
          items: [
            {code: 'abilityImprovement', label: '能力提升', standard: '表达、动手、社交等方面有明显进步', score: 0, max: 8},
            {code: 'happinessExperience', label: '幸福体验', standard: '幼儿表现出满足感，主动表达"今天真开心"', score: 0, max: 8},
            {code: 'habitCultivation', label: '习惯培养', standard: '渗透礼仪、卫生、合作等良好习惯教育', score: 0, max: 4},
            {code: 'innovativePerformance', label: '创新表现', standard: '幼儿有独特想法或创造性行为', score: 0, max: 5}
          ]
        },
        {
          title: '五、环境与支持（5分）',
          items: [
            {code: 'physicalEnvironment', label: '物理环境', standard: '安全、美观、布局合理，色彩温馨', score: 0, max: 3},
            {code: 'psychologicalSupport', label: '心理支持', standard: '教师关注需求，提供个性化指导', score: 0, max: 2}
          ]
        }
      ]
    };
  },
  methods: {
    // 获取评分表数据
    async fetchFeedbackData() {
      try {
        this.$loading({ lock: true, text: '加载数据中...' });
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
            if (valueObj) {
              this.form = { ...this.form, ...valueObj};
              // 通过code字段匹配数据进行填充
              this.sections.forEach(section => {
                section.items.forEach(item => {
                  const scoreValue = valueObj[item.code];
                  if (scoreValue !== undefined) {
                    item.score = scoreValue;
                    this.form[item.code] = scoreValue; // 👈 同步放入form
                  }
                });
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
      } finally {
        this.$loading().close();
      }
    },

    // 提交评分表数据
    async submitFeedback() {
      this.submitting = true;
      try {
        // 构建请求载荷
        const payload = {
          questionnaireId: this.questionnaireId,
          value: JSON.stringify(this.form)
        };

        // 调用API提交数据
        const response = await submitQuestionnaire(payload);

        if (response && response.code === 200) {
          this.$message({
            message: '评分表提交成功',
            type: 'success',
            duration: 2000
          });
        } else {
          this.$message.error((response && response.msg) || '提交失败，请稍后重试');
        }
      } catch (error) {
        console.error('提交评分表数据失败:', error);
        this.$message.error('提交失败，请稍后重试');
      } finally {
        this.submitting = false;
      }
    },
    calculateTotal() {
      let total = 0;
      this.sections.forEach(section => {
        section.items.forEach(item => {
          const num = Number(item.score);
          if (!isNaN(num)) {
            total += num;
            this.form[item.code] = num;
          }
        });
      });
      this.form.totalScore = total; // 可以保留为数字类型
    }
  },
  created() {
    // 从路由参数获取教师名称和用户ID
    this.teacherName = this.$route.query.nickName || '';
    this.questionnaireQueryParam.userId = this.$route.query.userId || '';
    this.fetchFeedbackData();
  }
};
</script>

<style scoped>
.container {
  width: 100%;
  margin: 0 auto;
  padding: 20px;
  box-sizing: border-box;
}

.title {
  text-align: center;
  font-size: 22px;
  font-weight: bold;
  margin-bottom: 15px;
  color: #303133;
}

.teacher-info {
  text-align: center;
  font-size: 16px;
  color: #606266;
  margin-bottom: 5px;
}

.mb-4 {
  margin-bottom: 20px;
}

.section-header {
  font-weight: bold;
  color: #409EFF;
}

.el-form-item {
  margin-bottom: 15px;
}

.submit-container {
  display: flex;
  justify-content: center;
  margin: 30px 0;
}

.submit-container .el-button {
  min-width: 180px;
  font-size: 16px;
}

.instruction-title {
  font-weight: bold;
  margin-bottom: 10px;
  color: #303133;
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

/* 响应式设计 */
@media screen and (max-width: 768px) {
  .container {
    padding: 10px;
  }

  .title {
    font-size: 18px;
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
