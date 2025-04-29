<template>
  <div class="container">
    <el-card shadow="hover" class="mb-4">
      <h2 class="title">重庆市大足区龙岗幼儿园2024小班家长开放日家长满意度问卷调查</h2>
      <p class="intro">
        亲爱的家长朋友：您好！为了让您走进幼儿园，走近孩子，看着小班的孩子在幼儿园都在做些什么，孩子是怎样适应幼儿园生活的...我们诚邀您填写本问卷，感谢您的支持！
      </p>
    </el-card>

    <el-card class="mb-4">
      <el-form label-position="top">
        <!-- 1. 您孩子就读于哪个园区哪个班级？ -->
        <el-form-item label="一、您孩子就读于哪个园区哪个班级？（____园____班）">
          <el-input v-model="form.classInfo" placeholder="请填写园区和班级" />
        </el-form-item>

        <!-- 2. 对流程安排满意度 -->
        <el-form-item label="二、您觉得本次家长开放日的流程安排合理吗？">
          <el-radio-group v-model="form.flowSatisfaction">
            <el-radio label="A">A. 非常好</el-radio>
            <el-radio label="B">B. 还行</el-radio>
            <el-radio label="C">C. 需要改进</el-radio>
          </el-radio-group>
        </el-form-item>

        <!-- 3. 教师准备充分性 -->
        <el-form-item label="三、您觉得班级老师为本次家长开放日准备充分吗？">
          <el-radio-group v-model="form.teacherPreparation">
            <el-radio label="A">A. 非常好，三位老师分工合作，环节衔接流畅</el-radio>
            <el-radio label="B">B. 一般，老师分工不够清晰，环节不够紧凑</el-radio>
            <el-radio label="C">C. 不好，不清楚接下来该做什么</el-radio>
          </el-radio-group>
        </el-form-item>

        <!-- 4. 家长会与半日活动组织效果 -->
        <el-form-item label="四、班级两位老师分别负责家长会、半日活动的组织，您觉得效果怎样？">
          <el-radio-group v-model="form.activityEffect">
            <el-radio label="A">A. 两个版块都分享得很好，能看到老师的专业和用心</el-radio>
            <el-radio label="B">B. 家长会环节准备充分，能感受到孩子的成长</el-radio>
            <el-radio label="C">C. 半日活动组织有序，展示了孩子能力提升</el-radio>
            <el-radio label="D">D. 两个版块都需改进，老师能力还有待提升</el-radio>
          </el-radio-group>
        </el-form-item>

        <!-- 提交按钮 -->
        <el-form-item>
          <el-button type="primary" @click="submitForm">提交问卷</el-button>
        </el-form-item>
      </el-form>
    </el-card>
  </div>
</template>

<script>
import {getQuestionnaire,submitQuestionnaire} from  '@/api/teacher/grading'
export default {
  data() {
    return {
      form: {
        classInfo: '',
        flowSatisfaction: '',
        teacherPreparation: '',
        activityEffect: ''
      }
    };
  },
  methods: {
    submitForm() {
      console.log('提交问卷：', this.form);
      this.$message.success('问卷提交成功，感谢您的参与！');
      // 此处可接接口保存问卷数据
    }
  }
};
</script>

<style scoped>
.container {
  padding: 30px;
  max-width: 800px;
  margin: 0 auto;
}
.title {
  font-size: 20px;
  font-weight: bold;
  text-align: center;
}
.intro {
  font-size: 14px;
  line-height: 1.8;
  margin-top: 10px;
}
.mb-4 {
  margin-bottom: 20px;
}
</style>
