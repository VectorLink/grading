<template>
  <div class="happy-eval">
    <h2 style="text-align: center">大足区龙岗幼儿园{{templateName}}</h2>
    <el-row justify="center" style="text-align: center;">
      <el-col :span="12">评价教师：{{ teacherName }}</el-col>
      <el-col :span="12">总分：{{ formData.totalScore || 0 }}</el-col>
    </el-row>
    <section v-for="(section, index) in sections" :key="section.code" class="score-section">
      <h3>{{ index + 1 }}、{{ section.title }}（{{ section.total }}分）</h3>
      <el-table :data="section.items" border>
        <el-table-column label="指标" prop="name" />
        <el-table-column label="评分标准（满分）" prop="standard" />
        <el-table-column label="得分" width="200">
          <template slot-scope="scope">
            <el-input-number
              v-model="formData[scope.row.code]"
              :min="0"
              :max="getMaxScore(scope.row)"
              size="small"
              @change="calculateTotal"
            />
          </template>
        </el-table-column>
      </el-table>
    </section>

    <div class="form-actions">
      <el-button type="primary" @click="submitFeedback">提交评分</el-button>
      <el-button @click="resetForm">重置</el-button>
    </div>
  </div>
</template>

<script>
import {getQuestionnaire,submitQuestionnaire} from '@/api/teacher/grading'
export default {
  name: 'ExpertClass',
  data() {
    return {
      teacherName:"",
      // 存储所有评分项的当前值
      formData: {
        EMO_TEACHER: "",
        EMO_CHILD: "",
        EMO_INTERACT: "",
        EMO_ENV: "",
        ENG_COGNITIVE: "",
        ENG_BEHAVIOR: "",
        ENG_SOCIAL: "",
        ENG_OUTPUT: "",
        CON_LIFE: "",
        CON_AGE: "",
        CON_INTEGRATE: "",
        TEA_SCAFFOLD: "",
        TEA_FEEDBACK: "",
        TEA_ADAPT: "",
        TEA_FAMILY: "",
        INN_TECH: "",
        INN_EVAL: "",
        OVR_FLOW: "",
        OVR_SPECIAL: "",
        totalScore: ""
      },
      sections: [
        {
          title: '情感氛围营造',
          total: 20,
          code: 'SEC_EMOTION',
          items: [
            { code: 'EMO_TEACHER', name: '教师情绪感染力', standard: '情绪饱满、语言童趣（如使用拟声词等）持续激发幼儿兴趣（5分）', maxScore: 5 },
            { code: 'EMO_CHILD', name: '幼儿积极情绪表达', standard: '80%幼儿带微笑/肢体放松、积极回应教师（5分）', maxScore: 5 },
            { code: 'EMO_INTERACT', name: '互动氛围安全性', standard: '无紧张回避行为，教师安抚情绪（5分）', maxScore: 5 },
            { code: 'EMO_ENV', name: '环境适应性', standard: '灯光布置/主题贴合/沉浸感（5分）', maxScore: 5 }
          ]
        },
        {
          title: '深度参与质量',
          total: 25,
          code: 'SEC_ENGAGE',
          items: [
            { code: 'ENG_COGNITIVE', name: '认知参与度', standard: '80%幼儿能复述核心知识点、提问关联度达70%以上（8分）', maxScore: 8 },
            { code: 'ENG_BEHAVIOR', name: '行为投入度', standard: '人均主动操作3次以上、无长时间游离（8分）', maxScore: 8 },
            { code: 'ENG_SOCIAL', name: '社交技能展现', standard: '出现3次以上合作行为（7分）', maxScore: 7 },
            { code: 'ENG_OUTPUT', name: '成果产出率', standard: '90%完成作品、60%有创意元素（2分）', maxScore: 2 }
          ]
        },
        {
          title: '内容适宜性设计',
          total: 15,
          code: 'SEC_CONTENT',
          items: [
            { code: 'CON_LIFE', name: '生活联结度', standard: '70%内容与幼儿经验相关（5分）', maxScore: 5 },
            { code: 'CON_AGE', name: '年龄适配性', standard: '小班感知体验、大班引入抽象概念（5分）', maxScore: 5 },
            { code: 'CON_INTEGRATE', name: '学科整合性', standard: '融合至少2个领域（5分）', maxScore: 5 }
          ]
        },
        {
          title: '教师引导策略',
          total: 20,
          code: 'SEC_TEACHER',
          items: [
            { code: 'TEA_SCAFFOLD', name: '脚手架搭建', standard: '分层提问（6分）', maxScore: 6 },
            { code: 'TEA_FEEDBACK', name: '反馈有效性', standard: '80%幼儿回答给予具体肯定（6分）', maxScore: 6 },
            { code: 'TEA_ADAPT', name: '应变调控能力', standard: '3次以上应对意外/替代材料（5分）', maxScore: 5 },
            { code: 'TEA_FAMILY', name: '家园共育渗透', standard: '活动中融入家庭任务（3分）', maxScore: 3 }
          ]
        },
        {
          title: '创新实践价值',
          total: 15,
          code: 'SEC_INNOVATION',
          items: [
            { code: 'INN_TECH', name: '技术融合创新', standard: '使用信息技术辅助活动（8分）', maxScore: 8 },
            { code: 'INN_EVAL', name: '评价方式突破', standard: '成长档案、家长APP评分（7分）', maxScore: 7 }
          ]
        },
        {
          title: '整体印象',
          total: 5,
          code: 'SEC_OVERALL',
          items: [
            { code: 'OVR_FLOW', name: '流畅性与完整性', standard: '环节过渡自然，时间控制合理（3分）', maxScore: 3 },
            { code: 'OVR_SPECIAL', name: '特色亮点呈现', standard: '如非遗文化融入、教师个性风格（2分）', maxScore: 2 }
          ]
        }
      ],
      questionnaireQueryParam:{
        templateType: 9,
        userId: ''
      },
      questionnaireId: '',
      templateName:''
    }
  },
  created() {
    this.teacherName = this.$route.query.nickName || '未指定';
    this.questionnaireQueryParam.userId = this.$route.query.userId || '';
    this.fetchData()
  },
  computed:{
    hasEmptyRecords() {
      return Object.values(this.formData).some(value => {
        if (typeof value === 'string') {
          return value.trim() === '';
        }
        return value === null || value === undefined;
      });
    }
  },
  methods: {
    async fetchData() {
      try {
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
            this.formData = {...this.formData, ...valueObj};
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
    async submitFeedback() {
      // 验证是否有空的记录
      if (this.hasEmptyRecords) {
        this.$message.warning('请完成所有评价项的记录');
        return;
      }

      try {
        // 构建请求载荷
        const payload = {
          questionnaireId: this.questionnaireId,
          value: JSON.stringify(this.formData)
        };

        // 调用API提交数据
        const response = await submitQuestionnaire(payload);

        if (response && response.code === 200) {
          this.$message.success('评价提交成功');
        } else {
          this.$message.error((response && response.msg) || '提交失败，请稍后重试');
        }
      } catch (error) {
        console.error('提交评价数据失败:', error);
        this.$message.error('提交失败，请稍后重试');
      }
    },
    getMaxScore(item) {
      return item.maxScore;
    },
    calculateTotal() {
      let total = 0;
      Object.keys(this.formData).forEach(key => {
        if (key === 'totalScore') return; // 跳过总分字段本身
        const value = this.formData[key];
        const num = Number(value);
        if (!isNaN(num)) {
          total += num;
        }
      });
      this.formData.totalScore = total.toString(); // 如需数字类型也可不转字符串
    }
    ,
    resetForm() {
      // 重置所有评分为0
      Object.keys(this.formData).forEach(key => {
        this.formData[key] = 0;
      });

      // 重置表单基本信息
      this.formData.totalScore = '0';
      this.$message.info('评分已重置');
    }
  }
}
</script>

<style scoped>
.happy-eval {
  padding: 20px;
}

.score-section {
  margin-bottom: 50px;
}
.form-actions {
  display: flex;
  justify-content: center;
  gap: 20px;
  margin-top: 20px;
}
</style>
