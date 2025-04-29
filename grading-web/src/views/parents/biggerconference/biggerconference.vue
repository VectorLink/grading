<template>
  <div class="questionnaire-container">
    <el-card class="questionnaire-card" v-loading="loading">
      <div class="header">
        <h1 class="main-title">问计于您听心声 发展龙幼幸福行</h1>
        <div class="teacher-info">评价教师：{{ teacherName }}</div>
        <h2 class="sub-title">—— 重庆市大足区龙岗幼儿园 {{ templateName }}</h2>
      </div>

      <div class="introduction">
        <p>亲爱的家长朋友：</p>
        <p>您好！您的孩子目前已就读大班，他们即将升入小学。本次家长会我们邀请小学老师进行分享，老师们也介绍了孩子的入学准备与在园表现。请您就以下内容如实填写您的意见与建议。感谢您的宝贵反馈！</p>
      </div>

      <el-form
        ref="formRef"
        :model="form"
        :rules="rules"
        label-position="top"
        status-icon
      >
        <el-form-item
          label="一、您孩子就读于哪个园区哪个班级？"
          prop="classInfo"
        >
          <el-input
            v-model="form.classInfo"
            placeholder="请输入园区与班级名称"
            clearable
          />
        </el-form-item>

        <el-form-item
          label="二、您觉得本次家长会的流程安排合理吗？"
          prop="flowSatisfaction"
        >
          <el-radio-group v-model="form.flowSatisfaction">
            <el-radio label="A">A. 非常好</el-radio>
            <el-radio label="B">B. 还行</el-radio>
            <el-radio label="C">C. 需要改进</el-radio>
          </el-radio-group>
        </el-form-item>

        <el-form-item
          label="三、您觉得老师为本次家长会进行的氛围营造合适吗？"
          prop="atmosphere"
        >
          <el-radio-group v-model="form.atmosphere">
            <el-radio label="A">A. 非常好，展示了孩子的能力</el-radio>
            <el-radio label="B">B. 一般，孩子参与不多</el-radio>
            <el-radio label="C">C. 不好，与平时无异</el-radio>
          </el-radio-group>
        </el-form-item>

        <el-form-item
          label="四、两位老师分别就活动开展与集中教育活动进行了分享，您觉得效果怎样？"
          prop="activityEffect"
        >
          <el-radio-group v-model="form.activityEffect">
            <el-radio label="A">A. 两位老师分享得很好，体现孩子在园生活</el-radio>
            <el-radio label="B">B. 老师分享有趣，照顾到每一个孩子</el-radio>
            <el-radio label="C">C. 教育活动有趣，孩子能从中成长</el-radio>
            <el-radio label="D">D. 内容需改进，老师还有提升空间</el-radio>
          </el-radio-group>
        </el-form-item>

        <div class="form-actions">
          <el-button
            type="primary"
            :loading="submitting"
            @click="submitForm"
            :disabled="loading"
          >
            提交问卷
          </el-button>
        </div>
      </el-form>
    </el-card>
  </div>
</template>

<script>
import {getQuestionnaire, submitQuestionnaire} from "@/api/teacher/grading";

export default {
  data() {
    return {
      form: {
        classInfo: '',
        flowSatisfaction: '',
        atmosphere: '',
        activityEffect: ''
      },
      submitting: false,
      loading: false,
      questionnaireQueryParam: {
        templateType: 3,
        userId: ''
      },
      teacherName: '',
      questionnaireId: '',
      templateName: '',
      rules: {
        classInfo: [{required: true, message: '请填写园区和班级', trigger: 'blur'}],
        flowSatisfaction: [{required: true, message: '请选择流程满意度', trigger: 'change'}],
        atmosphere: [{required: true, message: '请选择氛围评价', trigger: 'change'}],
        activityEffect: [{required: true, message: '请选择活动组织效果', trigger: 'change'}]
      }
    };
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

        if (!resp?.data) {
          this.$message.error('获取数据失败：数据格式错误');
          return;
        }

        this.questionnaireId = resp.data.questionnaireId;
        this.templateName = resp.data.templateName;

        if (resp.data.value) {
          try {
            const valueObj = JSON.parse(resp.data.value);
            this.form = {...this.form, ...valueObj};
          } catch (parseError) {
            console.error('解析保存数据失败:', parseError);
          }
        }
      } catch (err) {
        console.error('获取失败:', err);
        this.$message.error('获取失败，请稍后重试');
      } finally {
        this.loading = false;
      }
    },
    submitForm() {
      this.$refs.formRef.validate(async (valid) => {
        if (!valid) return;

        this.submitting = true;
        try {
          await submitQuestionnaire({
            questionnaireId: this.questionnaireId,
            value: JSON.stringify(this.form)
          });
          this.$message.success('提交成功，感谢您的参与！');
        } catch (err) {
          console.error('提交失败:', err);
          this.$message.error('提交失败，请稍后再试');
        } finally {
          this.submitting = false;
        }
      });
    }
  }
};
</script>

<style scoped>
.questionnaire-container {
  max-width: 800px;
  margin: 20px auto;
  padding: 0 15px;
}

.questionnaire-card {
  border-radius: 4px;
  box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.1);
}

.header {
  text-align: center;
  margin-bottom: 20px;
}

.main-title {
  font-size: 22px;
  font-weight: bold;
  color: #303133;
  margin-bottom: 8px;
}

.teacher-info {
  font-size: 16px;
  color: #606266;
  margin: 10px 0;
}

.sub-title {
  font-size: 18px;
  color: #606266;
  font-weight: 500;
  margin-top: 8px;
}

.introduction {
  background-color: #f5f7fa;
  border-left: 4px solid #409EFF;
  padding: 15px 20px;
  margin-bottom: 25px;
  border-radius: 4px;
  color: #333;
  line-height: 1.6;
}

.introduction p {
  margin: 8px 0;
}

.el-form-item {
  margin-bottom: 25px;
}

.el-form-item >>> .el-form-item__label {
  font-weight: bold;
  font-size: 15px;
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
  margin-right: 0;
  margin-bottom: 5px;
  padding: 5px 0;
}

.form-actions {
  text-align: center;
  margin-top: 30px;
}

.form-actions .el-button {
  min-width: 120px;
}

@media (max-width: 768px) {
  .questionnaire-container {
    padding: 0 10px;
  }

  .main-title {
    font-size: 20px;
  }

  .sub-title {
    font-size: 16px;
  }
}
</style>
