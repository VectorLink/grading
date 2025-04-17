<template>
  <div class="survey-container">
    <div class="survey-header">
      <h1 class="main-title">问计于您听心声 发展龙幼幸福行</h1>
      <h2 class="sub-title">——重庆市大足区龙岗幼儿园亲子活动家长满意度问卷调查</h2>
    </div>

    <div class="survey-intro">
      <p class="intro-greeting">亲爱的家长朋友：</p>
      <p class="intro-text">
        您好！为了增进家长与孩子之间的亲密关系，增强家长与幼儿园的联系，携手做好家园共育，我们开展了本次亲子活动。现就本次亲子活动的以下方面请家长们进行评价，期许您能从自己的真实感受出发进行填写，您的每一个公平公正的评价将对我们班级的每一位老师、对幼儿园的发展有很好的促进作用。谢谢！
      </p>
    </div>

    <el-form ref="surveyForm" :model="surveyForm" label-position="top" class="survey-form">
      <!-- 问题1 -->
      <div class="question-item">
        <div class="question-title">一、您家孩子就读于哪个园区哪个班级？（<span class="blank-space"></span>）</div>
        <el-form-item>
          <el-input v-model="surveyForm.classroom" class="input-field"></el-input>
        </el-form-item>
      </div>

      <!-- 问题2 -->
      <div class="question-item">
        <div class="question-title">二、您觉得本次亲子活动老师准备充分吗？（<span class="blank-space"></span>）</div>
        <el-form-item>
          <el-radio-group v-model="surveyForm.teacherPreparation">
            <el-radio label="A" class="radio-option">A、非常好，每位老师都熟悉每一个环节，衔接紧凑。</el-radio>
            <el-radio label="B" class="radio-option">B、还行，老师之间的配合还需要提高。</el-radio>
            <el-radio label="C" class="radio-option">C、不好，整个活动比较混乱。</el-radio>
          </el-radio-group>
        </el-form-item>
      </div>

      <!-- 问题3 -->
      <div class="question-item">
        <div class="question-title">三、您觉得本次活动的环节、内容设置合理吗？（<span class="blank-space"></span>）</div>
        <el-form-item>
          <el-radio-group v-model="surveyForm.activityContent">
            <el-radio label="A" class="radio-option">A、非常好，动静结合，家长参与感强。</el-radio>
            <el-radio label="B" class="radio-option">B、一般，家长和幼儿的互动性不高。</el-radio>
            <el-radio label="C" class="radio-option">C、不好，强度太大，到后面大家的体力都跟不上了。</el-radio>
          </el-radio-group>
        </el-form-item>
      </div>

      <!-- 问题4 -->
      <div class="question-item">
        <div class="question-title">四、您觉得班级老师对活动的组织能力怎样？</div>
        <el-form-item>
          <el-radio-group v-model="surveyForm.teacherOrganization">
            <el-radio label="A" class="radio-option">A、很好，衔接紧凑有序，家长、孩子的积极性都很高。</el-radio>
            <el-radio label="B" class="radio-option">B、一般，家长、孩子参与的积极性不高。</el-radio>
            <el-radio label="C" class="radio-option">C、不好，老师的组织能力还有待提高。</el-radio>
          </el-radio-group>
        </el-form-item>
      </div>

      <el-form-item class="submit-container">
        <el-button type="primary" @click="submitForm" class="submit-btn">提交问卷</el-button>
      </el-form-item>
    </el-form>
  </div>
</template>

<script>
export default {
  name: 'KindergartenSurvey',
  data() {
    return {
      surveyForm: {
        classroom: '',
        teacherPreparation: '',
        activityContent: '',
        teacherOrganization: ''
      }
    }
  },
  methods: {
    submitForm() {
      console.log('提交的问卷数据:', this.surveyForm);
      this.$message({
        message: '感谢您的反馈！',
        type: 'success'
      });
    }
  }
}
</script>

<style scoped>
.survey-container {
  max-width: 800px;
  margin: 0 auto;
  padding: 20px;
  font-family: "SimSun", "宋体", serif;
  line-height: 1.8;
  text-align: left;
}

.survey-header {
  text-align: center;
  margin-bottom: 30px;
}

.main-title {
  font-size: 24px;
  font-weight: bold;
  margin-bottom: 10px;
  letter-spacing: 2px;
}

.sub-title {
  font-size: 18px;
  font-weight: normal;
  margin-bottom: 20px;
}

.survey-intro {
  margin-bottom: 30px;
}

.intro-greeting {
  margin-bottom: 5px;
}

.intro-text {
  text-indent: 2em;
  margin-top: 0;
  line-height: 1.8;
}

.question-item {
  margin-bottom: 20px;
  border-bottom: 1px solid #f0f0f0;
  padding-bottom: 15px;
}

.question-title {
  font-weight: normal;
  margin-bottom: 15px;
  font-size: 16px;
}

.blank-space {
  display: inline-block;
  width: 40px;
  border-bottom: 1px solid #000;
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

.submit-container {
  text-align: center;
  margin-top: 30px;
}

.submit-btn {
  width: 120px;
}
</style>
