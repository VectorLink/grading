<template>
  <div class="form-wrapper">
    <h2>问计于您听心声&nbsp;&nbsp;&nbsp;发展<strong>龙幼</strong>幸福行</h2>
    <h3>——重庆市大足区龙岗幼儿园 2024 秋季大班家长会家长满意度问卷调查</h3>

    <div class="intro">
      <p>亲爱的家长朋友：</p>
      <p>
        您好！您的孩子目前已就读大班，他们即将升入小学成为一名小学生。本次家长会我们针对您关心的问题，邀请入小学老师来给我们做了分享。同时老师们也就目前我们负责的一日活动中入学准备，孩子在幼儿园的表现等给家长们做了介绍。现就本次家长会的以下方面请家长们进行评价，填写您眼中自己的真实想法并填写，您的每一个不吝评论的评价将对我们班级的每一位老师，对幼儿园的发展有很好的促进作用。谢谢！
      </p>
    </div>

    <el-form label-position="top" label-width="100%">
      <el-form-item label="一、您孩子就读于哪个园区哪个班级？">
        <el-input placeholder="请输入园区与班级名称"></el-input>
      </el-form-item>

      <el-form-item label="二、您觉得本次家长会的流程安排合理吗？">
        <el-radio-group v-model="form.q2">
          <el-radio label="A">A. 非常好</el-radio>
          <el-radio label="B">B. 还行</el-radio>
          <el-radio label="C">C. 需要改进</el-radio>
        </el-radio-group>
      </el-form-item>

      <el-form-item label="三、您觉得老师为本次家长会进行的氛围营造合适吗？">
        <el-radio-group v-model="form.q3">
          <el-radio label="A">A. 非常好，几乎是孩子动手做的，很好的展示了孩子的能力</el-radio>
          <el-radio label="B">B. 一般，孩子参与的不多，几乎都是老师做的</el-radio>
          <el-radio label="C">C. 不好，还是和平常一样</el-radio>
        </el-radio-group>
      </el-form-item>

      <el-form-item label="四、班级两位老师分别就活动的开展、集中教育活动展示两个方面进行了分享，您觉得效果怎样？">
        <el-radio-group v-model="form.q4">
          <el-radio label="A">A. 这两个版块的老师都分享得很好，能感受到孩子在幼儿园的生活</el-radio>
          <el-radio label="B">B. 孩子在各种活动中的表现映像很好，老师分享很有趣，几乎照顾到了每一个孩子</el-radio>
          <el-radio label="C">C. 集中育活动很好，感受到活动的有趣，孩子能从这样的游戏中得到成长</el-radio>
          <el-radio label="D">D. 两个版块的内容都还需改进，老师的能力还有待提升</el-radio>
        </el-radio-group>
      </el-form-item>
    </el-form>

    <el-button type="primary" @click="submitForm">提交问卷</el-button>
  </div>
</template>

<script>
export default {
  data() {
    return {
      form: {
        q1: '',
        q2: '',
        q3: '',
        q4: ''
      }
    }
  },
  methods: {
    submitForm() {
      console.log('提交内容：', this.form);
      this.$message.success('问卷已提交，谢谢您的参与！');
    }
  }
}
</script>

<style scoped>
.form-wrapper {
  max-width: 800px;
  margin: 0 auto;
  padding: 30px;
  font-size: 16px;
  line-height: 1.8;
}
h2 {
  text-align: center;
  font-weight: normal;
}
h3 {
  text-align: center;
  font-weight: normal;
  margin-bottom: 20px;
}
.intro {
  background: #f9f9f9;
  padding: 15px;
  margin-bottom: 20px;
  border-left: 4px solid #409EFF;
}
</style>
