<template>
  <div class="evaluation-container">
    <h2 class="main-title">重庆市大足区龙岗幼儿园保安人员工作考核评细</h2>

    <el-card class="evaluation-form">
      <el-table :data="evaluationItems" border style="width: 100%">
        <el-table-column prop="content" label="内容" width="110">
          <template slot-scope="scope">
            <div>
              <strong>{{ scope.row.title }}</strong>
              <div v-if="scope.row.points">（{{ scope.row.points }}）</div>
            </div>
          </template>
        </el-table-column>

        <el-table-column prop="standards" label="评分标准" width="580">
          <template slot-scope="scope">
            <div class="standards-cell">{{ scope.row.standards }}</div>
          </template>
        </el-table-column>

        <el-table-column label="园长评价" width="80">
          <template slot-scope="scope">
            <el-input v-model="scope.row.principalScore" type="number" :min="0" :max="scope.row.points"></el-input>
          </template>
        </el-table-column>

        <el-table-column label="部门评价" width="80">
          <template slot-scope="scope">
            <el-input v-model="scope.row.departmentScore" type="number" :min="0" :max="scope.row.points"></el-input>
          </template>
        </el-table-column>

        <el-table-column label="班组评价" width="80">
          <template slot-scope="scope">
            <el-input v-model="scope.row.classScore" type="number" :min="0" :max="scope.row.points"></el-input>
          </template>
        </el-table-column>

        <el-table-column label="教职工互评" width="80">
          <template slot-scope="scope">
            <el-input v-model="scope.row.staffScore" type="number" :min="0" :max="scope.row.points"></el-input>
          </template>
        </el-table-column>

        <el-table-column label="家长评价" width="80">
          <template slot-scope="scope">
            <el-input v-model="scope.row.parentScore" type="number" :min="0" :max="scope.row.points"></el-input>
          </template>
        </el-table-column>

        <el-table-column label="自评" width="80">
          <template slot-scope="scope">
            <el-input v-model="scope.row.selfScore" type="number" :min="0" :max="scope.row.points"></el-input>
          </template>
        </el-table-column>

        <el-table-column label="加分" width="80">
          <template slot-scope="scope">
            <el-input v-model="scope.row.bonusScore" type="number" :min="0"></el-input>
          </template>
        </el-table-column>
      </el-table>

      <div class="explanation-section">
        <div class="explanation-label">说明：</div>
        <el-input
          type="textarea"
          v-model="explanation"
          :rows="4"
          placeholder="请在此处添加说明"
        ></el-input>
      </div>

      <div class="total-score-section">
        <span class="total-label">总分：</span>
        <span class="total-value">{{ totalScore }}</span>
      </div>
    </el-card>
  </div>
</template>

<script>
export default {
  name: 'SecurityGuard',
  data() {
    return {
      explanation: '',
      evaluationItems: [
        {
          title: '服从管理',
          points: 20,
          standards: '服从幼儿园的管理，与教职工、幼儿、家长和谐相处，不得做出损坏幼儿园形象、利益的事情。',
          principalScore: '',
          departmentScore: '',
          classScore: '',
          staffScore: '',
          parentScore: '',
          selfScore: '',
          bonusScore: ''
        },
        {
          title: '遵守规章制度',
          points: 20,
          standards: '遵守幼儿园规定的作息时间及各项规章制度。不迟到、早退、脱岗、离岗；上班期间做到在岗在位在状态，不得饮酒、娱乐、玩手机、吸烟、吃东西，不做与工作无关的事情。\n保安人员每月可换班两次，需上报安稳办主任及执行园长。',
          principalScore: '',
          departmentScore: '',
          classScore: '',
          staffScore: '',
          parentScore: '',
          selfScore: '',
          bonusScore: ''
        },
        {
          title: '仪容仪表',
          points: 20,
          standards: '按规定穿戴整齐当季服装，保持服装干净整洁，并佩戴保安标志和相关保安器械。站姿规范，精神抖擞；与人交谈，有礼有节。',
          principalScore: '',
          departmentScore: '',
          classScore: '',
          staffScore: '',
          parentScore: '',
          selfScore: '',
          bonusScore: ''
        },
        {
          title: '履行职责',
          points: 40,
          standards: '严格履行保安职责，严格执行门卫管理制度。按时巡逻并填写相关表册，定期进行安全检查和处置突发事件。',
          principalScore: '',
          departmentScore: '',
          classScore: '',
          staffScore: '',
          parentScore: '',
          selfScore: '',
          bonusScore: ''
        }
      ]
    };
  },
  computed: {
    totalScore() {
      let total = 0;
      this.evaluationItems.forEach(item => {
        // Calculate the average score for each row across all evaluators
        const scores = [
          parseFloat(item.principalScore) || 0,
          parseFloat(item.departmentScore) || 0,
          parseFloat(item.classScore) || 0,
          parseFloat(item.staffScore) || 0,
          parseFloat(item.parentScore) || 0,
          parseFloat(item.selfScore) || 0
        ];

        const validScores = scores.filter(score => score > 0);
        const averageScore = validScores.length > 0
          ? validScores.reduce((sum, score) => sum + score, 0) / validScores.length
          : 0;

        // Add bonus points if any
        const bonus = parseFloat(item.bonusScore) || 0;

        // Add the score for this item to the total
        total += averageScore + bonus;
      });

      return total.toFixed(2);
    }
  }
};
</script>

<style scoped>
.evaluation-container {
  width: 100%;
  max-width: 1200px;
  margin: 0 auto;
  padding: 20px;
}

.main-title {
  text-align: center;
  font-size: 22px;
  font-weight: bold;
  margin-bottom: 20px;
}

.evaluation-form {
  margin-bottom: 30px;
}

.standards-cell {
  text-align: left;
  line-height: 1.5;
  white-space: pre-line;
  word-break: break-all;
}

.explanation-section {
  margin-top: 20px;
  border-top: 1px solid #EBEEF5;
  padding-top: 15px;
}

.explanation-label {
  font-weight: bold;
  margin-bottom: 10px;
}

.total-score-section {
  margin-top: 20px;
  text-align: right;
  font-size: 16px;
}

.total-label {
  font-weight: bold;
  margin-right: 10px;
}

.total-value {
  color: #409EFF;
  font-size: 18px;
  font-weight: bold;
}

.el-table .el-input {
  width: 60px;
}
</style>
