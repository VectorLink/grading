<template>
  <div class="home-visit-container" v-loading="loading">
    <el-card class="visit-card">
      <div class="visit-header">
        <h1 class="main-title">问计于您听心声 发展龙幼幸福行</h1>
        <div class="teacher-info">评价教师：{{ teacherName }}</div>
        <h2 class="sub-title">—— 重庆市大足区龙岗幼儿园 {{ templateName }}</h2>
      </div>

      <div class="visit-intro">
        <p>亲爱的家长朋友：</p>
        <p class="intro-text">
          您好！为了和家长交流孩子的在园情况，了解孩子在家里的情况，给家长更多的科学合理的育儿建议。同时增进家园沟通，促进家园共育，我们开展了入园家访活动。
          现就本次家访的以下几个方面请家长们进行评价，期许您能从自己的真实感受出发进行填写，您的每一个公平公正的评价将对我们班级的每一位老师、对幼儿园的发展有很好的促进作用。谢谢！
        </p>
      </div>

      <el-form
        ref="surveyForm"
        :model="surveyForm"
        :rules="rules"
        label-position="top"
        class="visit-form"
        status-icon
      >
        <el-form-item
          label="一、您家孩子就读于哪个园区哪个班级？"
          class="question"
          prop="classroom"
        >
          <el-input
            v-model="surveyForm.classroom"
            placeholder="请填写园区和班级名称"
            clearable
          ></el-input>
        </el-form-item>

        <el-form-item
          label="二、您觉得本次家访老师的言行举止得体吗？"
          class="question"
          prop="behaveAppropriately"
        >
          <el-radio-group v-model="surveyForm.behaveAppropriately">
            <el-radio label="A">A、非常好，言行举止得体。</el-radio>
            <el-radio label="B">B、一般，说话较随意。</el-radio>
            <el-radio label="C">C、不好，穿着不得体，说话随意。</el-radio>
          </el-radio-group>
        </el-form-item>

        <el-form-item
          label="三、您觉得本次家访聊的内容是否全面、具体？"
          class="question"
          prop="contentComprehensive"
        >
          <el-radio-group v-model="surveyForm.contentComprehensive">
            <el-radio label="A">A、全面、具体，很好地了解到孩子在幼儿园的情况。</el-radio>
            <el-radio label="B">B、了解到孩子在某些方面的情况，不够全面。</el-radio>
            <el-radio label="C">C、老师只是为了完成任务。</el-radio>
          </el-radio-group>
        </el-form-item>

        <el-form-item
          label="四、您觉得本次家访是否给了您很好的育儿建议？"
          class="question"
          prop="advice"
        >
          <el-radio-group v-model="surveyForm.advice">
            <el-radio label="A">A、老师给了专业、科学的育儿建议，操作性强。</el-radio>
            <el-radio label="B">B、给了一些建议，但针对性、操作性不强。</el-radio>
            <el-radio label="C">C、没有给家长建议。</el-radio>
          </el-radio-group>
        </el-form-item>

        <el-form-item class="form-actions">
          <el-button
            type="primary"
            @click="submitForm"
            :loading="submitting"
            :disabled="loading"
          >提交问卷</el-button>
        </el-form-item>
      </el-form>
    </el-card>
  </div>
</template>

<script>
import {getQuestionnaire, submitQuestionnaire} from "@/api/teacher/grading";

export default {
  name: 'HomeVisit',
  data() {
    return {
      loading: false,
      submitting: false,
      surveyForm: {
        classroom: '',
        behaveAppropriately: '',
        contentComprehensive: '',
        advice: ''
      },
      rules: {
        classroom: [{required: true, message: '请填写园区和班级', trigger: 'blur'}],
        behaveAppropriately: [{required: true, message: '请选择言行举止是否得体', trigger: 'change'}],
        contentComprehensive: [{required: true, message: '请选择家访内容是否全面、具体', trigger: 'change'}],
        advice: [{required: true, message: '请选择家访是否给了您很好的育儿建议', trigger: 'change'}]
      },
      teacherName: '',
      questionnaireId: '',
      templateName: '',
      questionnaireQueryParam: {
        templateType: 4,
        userId: ''
      }
    }
  },
  created() {
    this.fetchData();
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
            this.surveyForm = {...this.surveyForm, ...valueObj};
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
      this.$refs.surveyForm.validate(async valid => {
        if (!valid) return;
        this.submitting = true;

        try {
          const payload = {
            questionnaireId: this.questionnaireId,
            value: JSON.stringify(this.surveyForm)
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
  }
}
</script>

<style scoped>
.home-visit-container {
  max-width: 800px;
  margin: 20px auto;
  padding: 0 15px;
}

.visit-card {
  border-radius: 6px;
  box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.1);
  padding: 5px;
}

.visit-header {
  text-align: center;
  margin-bottom: 24px;
  padding-top: 5px;
}

.main-title {
  font-size: 22px;
  font-weight: bold;
  color: #303133;
  margin-bottom: 12px;
}

.teacher-info {
  font-size: 16px;
  color: #606266;
  margin: 10px 0;
}

.sub-title {
  font-size: 18px;
  color: #606266;
  margin-top: 10px;
  font-weight: 500;
}

.visit-intro {
  background-color: #f5f7fa;
  border-left: 4px solid #409EFF;
  padding: 15px 20px;
  margin-bottom: 24px;
  border-radius: 4px;
}

.intro-text {
  text-indent: 2em;
  line-height: 1.8;
  margin-top: 10px;
  font-size: 15px;
  color: #303133;
}

.visit-form {
  margin-top: 20px;
}

.question {
  margin-bottom: 25px;
}

.question >>> .el-form-item__label {
  font-weight: bold;
  font-size: 16px;
  line-height: 1.5;
  color: #303133;
  padding-bottom: 8px;
}

.el-radio-group {
  display: flex;
  flex-direction: column;
  gap: 10px;
}

.el-radio {
  margin-left: 0;
  margin-bottom: 8px;
  padding: 5px 0;
  line-height: 1.6;
}

.form-actions {
  text-align: center;
  margin-top: 30px;
}

.form-actions .el-button {
  min-width: 120px;
  font-size: 16px;
}

@media (max-width: 768px) {
  .home-visit-container {
    padding: 0 10px;
  }

  .main-title {
    font-size: 20px;
  }

  .sub-title {
    font-size: 16px;
  }

  .intro-text {
    font-size: 14px;
  }
}
</style>
