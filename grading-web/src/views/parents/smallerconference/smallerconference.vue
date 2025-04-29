<template>
  <div class="container">
    <el-card shadow="hover" class="mb-4">
      <h2 class="title">重庆市大足区龙岗幼儿园{{ templateName }}</h2>
      <p class="intro">
        亲爱的家长朋友：您好！为了让您走进幼儿园，走近孩子，看着小班的孩子在幼儿园都在做些什么，孩子是怎样适应幼儿园生活的...我们诚邀您填写本问卷，感谢您的支持！
      </p>
    </el-card>

    <el-card class="mb-4" v-loading="loading">
      <el-form ref="formRef" :model="form" :rules="rules" label-position="top">
        <el-form-item label="一、您孩子就读于哪个园区哪个班级？（____园____班）" prop="classInfo">
          <el-input v-model="form.classInfo" placeholder="请填写园区和班级" />
        </el-form-item>

        <el-form-item label="二、您觉得本次家长开放日的流程安排合理吗？" prop="flowSatisfaction">
          <el-radio-group v-model="form.flowSatisfaction">
            <el-radio label="A">A. 非常好</el-radio>
            <el-radio label="B">B. 还行</el-radio>
            <el-radio label="C">C. 需要改进</el-radio>
          </el-radio-group>
        </el-form-item>

        <el-form-item label="三、您觉得班级老师为本次家长开放日准备充分吗？" prop="teacherPreparation">
          <el-radio-group v-model="form.teacherPreparation">
            <el-radio label="A">A. 非常好，三位老师分工合作，环节衔接流畅</el-radio>
            <el-radio label="B">B. 一般，老师分工不够清晰，环节不够紧凑</el-radio>
            <el-radio label="C">C. 不好，不清楚接下来该做什么</el-radio>
          </el-radio-group>
        </el-form-item>

        <el-form-item label="四、班级两位老师分别负责家长会、半日活动的组织，您觉得效果怎样？" prop="activityEffect">
          <el-radio-group v-model="form.activityEffect">
            <el-radio label="A">A. 两个版块都分享得很好，能看到老师的专业和用心</el-radio>
            <el-radio label="B">B. 家长会环节准备充分，能感受到孩子的成长</el-radio>
            <el-radio label="C">C. 半日活动组织有序，展示了孩子能力提升</el-radio>
            <el-radio label="D">D. 两个版块都需改进，老师能力还有待提升</el-radio>
          </el-radio-group>
        </el-form-item>

        <el-form-item>
          <el-button type="primary" :loading="submitting" @click="submitForm">提交问卷</el-button>
        </el-form-item>
      </el-form>
    </el-card>
  </div>
</template>

<script>
import { getQuestionnaire, submitQuestionnaire } from '@/api/teacher/grading';

export default {
  data() {
    return {
      loading: false,
      submitting: false,
      form: {
        classInfo: '',
        flowSatisfaction: '',
        teacherPreparation: '',
        activityEffect: ''
      },
      rules: {
        classInfo: [{ required: true, message: '请填写园区和班级', trigger: 'blur' }],
        flowSatisfaction: [{ required: true, message: '请选择满意度', trigger: 'change' }],
        teacherPreparation: [{ required: true, message: '请选择教师准备情况', trigger: 'change' }],
        activityEffect: [{ required: true, message: '请选择活动组织效果', trigger: 'change' }]
      },
      teacherName: '',
      questionnaireId: '',
      templateName: '',
      questionnaireQueryParam: {
        templateType: 2,
        userId: ''
      }
    }
  },
  methods: {
    async fetchData() {
      this.loading = true;
      try {
        this.questionnaireQueryParam.userId = this.$route.query.userId || '';
        this.teacherName = this.$route.query.nickName || '';

        const resp = await getQuestionnaire(this.questionnaireQueryParam);
        if (!resp || !resp.data) {
          this.$message.error('获取数据失败：返回数据格式错误');
          return;
        }

        this.questionnaireId = resp.data.questionnaireId;
        this.templateName = resp.data.templateName;

        if (resp.data.value) {
          try {
            const valueObj = JSON.parse(resp.data.value);
            this.form = { ...this.form, ...valueObj };
          } catch (e) {
            console.error('解析数据失败:', e);
            this.$message.error('解析问卷数据失败，请联系管理员');
          }
        }
      } catch (error) {
        console.error('获取数据失败:', error);
        this.$message.error('问卷获取失败，请重试');
      } finally {
        this.loading = false;
      }
    },

    submitForm() {
      this.$refs.formRef.validate(async valid => {
        if (!valid) return;
        this.submitting = true;

        try {
          const payload = {
            questionnaireId: this.questionnaireId,
            value: JSON.stringify(this.form)
          };
          await submitQuestionnaire(payload);
          this.$message.success('问卷提交成功，感谢您的参与！');
        } catch (error) {
          console.error('提交失败:', error);
          this.$message.error('提交失败，请稍后再试');
        } finally {
          this.submitting = false;
        }
      });
    }
  },
  created() {
    this.fetchData();
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

