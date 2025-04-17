<template>
  <div class="happy-eval">
    <h2>大足区龙岗幼儿园幸福赛课评分表</h2>
    <el-form :inline="true" class="form-header">
      <el-form-item label="评委签名："><el-input v-model="form.evaluator" /></el-form-item>
      <el-form-item label="日期："><el-date-picker v-model="form.date" type="date" placeholder="选择日期" /></el-form-item>
      <el-form-item label="总分："><el-input v-model="form.totalScore" /></el-form-item>
      <el-form-item label="活动名称："><el-input v-model="form.activity" /></el-form-item>
      <el-form-item label="执教教师："><el-input v-model="form.teacher" /></el-form-item>
      <el-form-item label="班级："><el-input v-model="form.className" /></el-form-item>
    </el-form>

    <section v-for="(section, index) in sections" :key="index" class="score-section">
      <h3>{{ index + 1 }}、{{ section.title }}（{{ section.total }}分）</h3>
      <el-table :data="section.items" border>
        <el-table-column label="指标" prop="name" />
        <el-table-column label="评分标准（满分）" prop="standard" />
        <el-table-column label="得分" width="100">
          <template slot-scope="scope">
            <el-input-number v-model="scope.row.score" :min="0" :max="section.total" size="small" />
          </template>
        </el-table-column>
      </el-table>
    </section>

    <el-button type="primary" @click="submitForm">提交评分</el-button>
  </div>
</template>

<script>
export default {
  name: 'ExpertClass',
  data() {
    return {
      form: {
        evaluator: '',
        date: '',
        totalScore: '',
        activity: '',
        teacher: '',
        className: ''
      },
      sections: [
        {
          title: '情感氛围营造',
          total: 20,
          items: [
            { name: '教师情绪感染力', standard: '情绪饱满、语言童趣（如使用拟声词等）持续激发幼儿兴趣（5分）', score: 0 },
            { name: '幼儿积极情绪表达', standard: '80%幼儿带微笑/肢体放松、积极回应教师（5分）', score: 0 },
            { name: '互动氛围安全性', standard: '无紧张回避行为，教师安抚情绪（5分）', score: 0 },
            { name: '环境适应性', standard: '灯光布置/主题贴合/沉浸感（5分）', score: 0 }
          ]
        },
        {
          title: '深度参与质量',
          total: 25,
          items: [
            { name: '认知参与度', standard: '80%幼儿能复述核心知识点、提问关联度达70%以上（8分）', score: 0 },
            { name: '行为投入度', standard: '人均主动操作3次以上、无长时间游离（8分）', score: 0 },
            { name: '社交技能展现', standard: '出现3次以上合作行为（7分）', score: 0 },
            { name: '成果产出率', standard: '90%完成作品、60%有创意元素（2分）', score: 0 }
          ]
        },
        {
          title: '内容适宜性设计',
          total: 15,
          items: [
            { name: '生活联结度', standard: '70%内容与幼儿经验相关（5分）', score: 0 },
            { name: '年龄适配性', standard: '小班感知体验、大班引入抽象概念（5分）', score: 0 },
            { name: '学科整合性', standard: '融合至少2个领域（5分）', score: 0 }
          ]
        },
        {
          title: '教师引导策略',
          total: 20,
          items: [
            { name: '脚手架搭建', standard: '分层提问（6分）', score: 0 },
            { name: '反馈有效性', standard: '80%幼儿回答给予具体肯定（6分）', score: 0 },
            { name: '应变调控能力', standard: '3次以上应对意外/替代材料（5分）', score: 0 },
            { name: '家园共育渗透', standard: '活动中融入家庭任务（3分）', score: 0 }
          ]
        },
        {
          title: '创新实践价值',
          total: 15,
          items: [
            { name: '技术融合创新', standard: '使用信息技术辅助活动（8分）', score: 0 },
            { name: '评价方式突破', standard: '成长档案、家长APP评分（7分）', score: 0 }
          ]
        },
        {
          title: '整体印象',
          total: 5,
          items: [
            { name: '流畅性与完整性', standard: '环节过渡自然，时间控制合理（3分）', score: 0 },
            { name: '特色亮点呈现', standard: '如非遗文化融入、教师个性风格（2分）', score: 0 }
          ]
        }
      ]
    }
  },
  methods: {
    submitForm() {
      const total = this.sections.reduce((sum, section) => {
        return sum + section.items.reduce((s, i) => s + Number(i.score), 0)
      }, 0)
      this.form.totalScore = total
      this.$message.success(`评分已提交，总分：${total}`)
    }
  }
}
</script>

<style scoped>
.happy-eval {
  padding: 20px;
}
.form-header {
  margin-bottom: 20px;
}
.score-section {
  margin-bottom: 30px;
}
</style>
