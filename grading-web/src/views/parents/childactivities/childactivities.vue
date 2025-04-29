<template>
  <div class="survey-container">
    <div class="survey-header">
      <h1 class="main-title">问计于您听心声 发展龙幼幸福行</h1>
      <h2 class="sub-title">——重庆市大足区龙岗幼儿园{{ templateName }}</h2>
      <div class="info">
        <p class="teacher-info">评价教师：{{ teacherName }}</p>
      </div>
    </div>

    <div class="survey-intro">
      <p class="intro-greeting">亲爱的家长朋友：</p>
      <p class="intro-text">
        您好！为了增进家长与孩子之间的亲密关系，增强家长与幼儿园的联系，携手做好家园共育，我们开展了本次亲子活动。现就本次亲子活动的以下方面请家长们进行评价，期许您能从自己的真实感受出发进行填写，您的每一个公平公正的评价将对我们班级的每一位老师、对幼儿园的发展有很好的促进作用。谢谢！
      </p>
    </div>

    <el-form
      ref="surveyForm"
      :model="surveyForm"
      :rules="rules"
      label-position="top"
      class="survey-form"
      v-loading="loading"
    >
      <!-- 问题1 -->
      <div class="question-item">
        <div class="question-number">1</div>
        <div class="question-content">
          <div class="question-title">您家孩子就读于哪个园区哪个班级？</div>
          <el-form-item prop="classroom">
            <el-input
              v-model="surveyForm.classroom"
              class="input-field"
              placeholder="请填写班级信息，如：龙岗幼儿园大班1班"
            ></el-input>
          </el-form-item>
        </div>
      </div>

      <!-- 问题2 -->
      <div class="question-item">
        <div class="question-number">2</div>
        <div class="question-content">
          <div class="question-title">您觉得本次亲子活动老师准备充分吗？</div>
          <el-form-item prop="teacherPreparation">
            <el-radio-group v-model="surveyForm.teacherPreparation">
              <el-radio label="A" class="radio-option">非常好，每位老师都熟悉每一个环节，衔接紧凑。</el-radio>
              <el-radio label="B" class="radio-option">还行，老师之间的配合还需要提高。</el-radio>
              <el-radio label="C" class="radio-option">不好，整个活动比较混乱。</el-radio>
            </el-radio-group>
          </el-form-item>
        </div>
      </div>

      <!-- 问题3 -->
      <div class="question-item">
        <div class="question-number">3</div>
        <div class="question-content">
          <div class="question-title">您觉得本次活动的环节、内容设置合理吗？</div>
          <el-form-item prop="activityContent">
            <el-radio-group v-model="surveyForm.activityContent">
              <el-radio label="A" class="radio-option">非常好，动静结合，家长参与感强。</el-radio>
              <el-radio label="B" class="radio-option">一般，家长和幼儿的互动性不高。</el-radio>
              <el-radio label="C" class="radio-option">不好，强度太大，到后面大家的体力都跟不上了。</el-radio>
            </el-radio-group>
          </el-form-item>
        </div>
      </div>

      <!-- 问题4 -->
      <div class="question-item">
        <div class="question-number">4</div>
        <div class="question-content">
          <div class="question-title">您觉得班级老师对活动的组织能力怎样？</div>
          <el-form-item prop="teacherOrganization">
            <el-radio-group v-model="surveyForm.teacherOrganization">
              <el-radio label="A" class="radio-option">很好，衔接紧凑有序，家长、孩子的积极性都很高。</el-radio>
              <el-radio label="B" class="radio-option">一般，家长、孩子参与的积极性不高。</el-radio>
              <el-radio label="C" class="radio-option">不好，老师的组织能力还有待提高。</el-radio>
            </el-radio-group>
          </el-form-item>
        </div>
      </div>
      <div class="form-footer">
        <el-form-item class="submit-container">
          <el-button
            type="primary"
            @click="submitForm('surveyForm')"
            class="submit-btn"
            :loading="submitting"
          >
            提交问卷
          </el-button>
          <el-button @click="resetForm('surveyForm')" class="reset-btn">重置</el-button>
        </el-form-item>
      </div>
    </el-form>

    <!-- 提交成功对话框 -->
    <el-dialog
      title="提交成功"
      :visible.sync="dialogVisible"
      width="300px"
      center
      :show-close="false"
    >
      <div class="success-content">
        <i class="el-icon-success success-icon"></i>
        <p>问卷提交成功，感谢您的参与！</p>
      </div>
      <span slot="footer" class="dialog-footer">
        <el-button type="primary" @click="closeDialog">确 定</el-button>
      </span>
    </el-dialog>
  </div>
</template>

<script>
import {getQuestionnaire, submitQuestionnaire} from '@/api/teacher/grading'

export default {
  name: 'ChildActivitiesSurvey',
  data() {
    return {
      loading: false,
      submitting: false,
      dialogVisible: false,
      teacherName: '',
      surveyForm: {
        classroom: '',
        teacherPreparation: '',
        activityContent: '',
        teacherOrganization: ''
      },
      rules: {
        classroom: [
          {required: true, message: '请填写班级信息', trigger: 'blur'}
        ],
        teacherPreparation: [
          {required: true, message: '请选择评价选项', trigger: 'change'}
        ],
        activityContent: [
          {required: true, message: '请选择评价选项', trigger: 'change'}
        ],
        teacherOrganization: [
          {required: true, message: '请选择评价选项', trigger: 'change'}
        ]
      },
      questionnaireQueryParam: {
        templateType: 1,
        userId: ''
      },
      questionnaireId: '',
      templateName:'',
    }
  },
  methods: {
    async fetchData() {
      this.loading = true;
      try {
        // 从URL获取参数
        this.questionnaireQueryParam.userId = this.$route.query.userId || '';
        this.teacherName = this.$route.query.nickName || '';

        const resp = await getQuestionnaire(this.questionnaireQueryParam);

        // 检查数据有效性
        if (!resp || !resp.data) {
          this.$message.error('获取数据失败：返回数据格式错误');
          return;
        }

        this.questionnaireId = resp.data.questionnaireId;
        this.templateName=resp.data.templateName;
        // 解析嵌套的JSON字符串
        if (resp.data.value) {
          try {
            let valueObj = JSON.parse(resp.data.value);
            // 设置表单数据
            this.surveyForm = {
              ...this.surveyForm,
              ...valueObj
            };
          } catch (e) {
            console.error('解析数据失败:', e);
            this.$message.error('解析数据失败，请联系管理员');
          }
        }
      } catch (error) {
        console.error('获取数据失败:', error);
        this.$message.error('获取数据失败，请重试');
      } finally {
        this.loading = false;
      }
    },
    submitForm(formName) {
      this.$refs[formName].validate(async (valid) => {
        if (!valid) {
          this.$message.warning('请完成所有必填项');
          return false;
        }

        this.submitting = true;
        try {
          const payload = {
            questionnaireId: this.questionnaireId,
            value: JSON.stringify(this.surveyForm)
          };

          await submitQuestionnaire(payload);
          this.dialogVisible = true;
        } catch (error) {
          console.error('提交请求失败:', error);
          this.$message.error('提交失败，请重试');
        } finally {
          this.submitting = false;
        }
      });
    },
    resetForm(formName) {
      this.$refs[formName].resetFields();
    },
    closeDialog() {
      this.dialogVisible = false;
      // 可以选择重置表单或跳转到其他页面
      this.resetForm('surveyForm');
    }
  },
  created() {
    this.fetchData();
  }
}
</script>

<style scoped>
.survey-container {
  max-width: 800px;
  margin: 0 auto;
  padding: 20px;
  font-family: "Microsoft YaHei", "微软雅黑", sans-serif;
  line-height: 1.8;
  text-align: left;
  color: #333;
  background-color: #fff;
  border-radius: 8px;
  box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.1);
}

.survey-header {
  text-align: center;
  margin-bottom: 30px;
  padding-bottom: 20px;
  border-bottom: 1px solid #eaeaea;
}

.main-title {
  font-size: 24px;
  font-weight: bold;
  margin-bottom: 10px;
  letter-spacing: 2px;
  color: #3a8ee6;
}

.sub-title {
  font-size: 18px;
  font-weight: normal;
  margin-bottom: 20px;
  color: #606266;
}

.info {
  margin-top: 15px;
}

.teacher-info {
  font-size: 16px;
  color: #409EFF;
  font-weight: bold;
}

.survey-intro {
  margin-bottom: 30px;
  background-color: #f5f7fa;
  padding: 15px;
  border-radius: 6px;
}

.intro-greeting {
  margin-bottom: 5px;
  font-weight: bold;
}

.intro-text {
  text-indent: 2em;
  margin-top: 0;
  line-height: 1.8;
}

.question-item {
  margin-bottom: 25px;
  border-bottom: 1px solid #f0f0f0;
  padding-bottom: 15px;
  display: flex;
  align-items: flex-start;
}

.question-number {
  width: 30px;
  height: 30px;
  background-color: #409EFF;
  color: white;
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  margin-right: 15px;
  font-weight: bold;
  flex-shrink: 0;
}

.question-content {
  flex-grow: 1;
}

.question-title {
  font-weight: bold;
  margin-bottom: 15px;
  font-size: 16px;
  color: #303133;
}

.radio-option {
  display: block;
  margin-left: 0;
  margin-bottom: 10px;
  line-height: 1.6;
}

.input-field {
  width: 100%;
}

.textarea-field {
  width: 100%;
}

.form-footer {
  margin-top: 40px;
}

.submit-container {
  text-align: center;
}

.submit-btn {
  width: 120px;
  margin-right: 15px;
}

.reset-btn {
  width: 120px;
}

.success-content {
  text-align: center;
  padding: 20px 0;
}

.success-icon {
  font-size: 48px;
  color: #67C23A;
  margin-bottom: 15px;
}
</style>
