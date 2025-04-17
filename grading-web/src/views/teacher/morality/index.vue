// HTML Template
<template>
  <div class="evaluation-container">
    <h2 class="main-title">重庆市大足区龙岗幼儿园学年度师德师风考核评价表</h2>

    <el-card class="evaluation-form">
      <el-form :model="formData" label-position="top">
        <el-form-item label="被考核人：">
          <el-input v-model="formData.teacherName"></el-input>
        </el-form-item>

        <el-table :data="evaluationItems" border style="width: 100%">
          <el-table-column label="考核项目及(权重)分值" width="150">
            <template slot-scope="scope">
              <div>
                <strong>{{ scope.row.title }}</strong>
                <div>（{{ scope.row.points }}分）</div>
              </div>
            </template>
          </el-table-column>

          <el-table-column label="考核内容" width="580">
            <template slot-scope="scope">
              <div class="content-cell">{{ scope.row.content }}</div>
            </template>
          </el-table-column>

          <el-table-column label="园长评价" width="80">
            <template slot-scope="scope">
              <el-input v-model="scope.row.principalScore" type="number" min="0" :max="scope.row.points"></el-input>
            </template>
          </el-table-column>

          <el-table-column label="部门评价" width="80">
            <template slot-scope="scope">
              <el-input v-model="scope.row.departmentScore" type="number" min="0" :max="scope.row.points"></el-input>
            </template>
          </el-table-column>

          <el-table-column label="班组互评" width="80">
            <template slot-scope="scope">
              <el-input v-model="scope.row.classScore" type="number" min="0" :max="scope.row.points"></el-input>
            </template>
          </el-table-column>

          <el-table-column label="职工互评" width="80">
            <template slot-scope="scope">
              <el-input v-model="scope.row.staffScore" type="number" min="0" :max="scope.row.points"></el-input>
            </template>
          </el-table-column>

          <el-table-column label="家长评价" width="80">
            <template slot-scope="scope">
              <el-input v-model="scope.row.parentScore" type="number" min="0" :max="scope.row.points"></el-input>
            </template>
          </el-table-column>

          <el-table-column label="自评" width="80">
            <template slot-scope="scope">
              <el-input v-model="scope.row.selfScore" type="number" min="0" :max="scope.row.points"></el-input>
            </template>
          </el-table-column>

          <el-table-column label="加分" width="80">
            <template slot-scope="scope">
              <el-input v-model="scope.row.bonusScore" type="number" min="0"></el-input>
            </template>
          </el-table-column>
        </el-table>

        <el-row :gutter="20" class="total-row">
          <el-col :span="8">
            <el-form-item label="合计得分：">
              <el-input v-model="totalScore" disabled></el-input>
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="评定等次：">
              <el-input v-model="formData.evaluationLevel"></el-input>
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="被考核人签字：">
              <el-input v-model="formData.signature"></el-input>
            </el-form-item>
          </el-col>
        </el-row>
      </el-form>
    </el-card>
  </div>
</template>

<script>
export default {
  name: 'Morality',
  data() {
    return {
      formData: {
        teacherName: '',
        evaluationLevel: '',
        signature: ''
      },
      evaluationItems: [
        {
          title: '依法治教',
          points: 10,
          content: '拥护党的基本路线，全面贯彻国家教育方针，自觉遵守《教师法》等法律法规，在教育教学中同党和国家的方针政策一致，不得有违背党和国家方针、政策的言行。',
          principalScore: '',
          departmentScore: '',
          classScore: '',
          staffScore: '',
          parentScore: '',
          selfScore: '',
          bonusScore: ''
        },
        {
          title: '爱岗敬业',
          points: 15,
          content: '热爱教育、热爱幼儿园、尽职尽责，教书育人，注重培养幼儿良好的思想品德。认真备课、上课，认真批改作业，不敷衍塞责，不传播有害幼儿身心健康的思想。',
          principalScore: '',
          departmentScore: '',
          classScore: '',
          staffScore: '',
          parentScore: '',
          selfScore: '',
          bonusScore: ''
        },
        {
          title: '热爱学生',
          points: 15,
          content: '关心爱护全体幼儿，尊重幼儿的人格，平等、公平对待幼儿，对幼儿严格要求，耐心教导，不讽刺、不挖苦、不歧视，不体罚或变相体罚幼儿，保护幼儿的合法权益，促进幼儿全面、健康发展。',
          principalScore: '',
          departmentScore: '',
          classScore: '',
          staffScore: '',
          parentScore: '',
          selfScore: '',
          bonusScore: ''
        },
        {
          title: '严谨治学',
          points: 15,
          content: '树立优良学风，刻苦钻研业务，不断学习新知识，探索教育规律，改进教育教学方法，提高教育、教学和教研水平。',
          principalScore: '',
          departmentScore: '',
          classScore: '',
          staffScore: '',
          parentScore: '',
          selfScore: '',
          bonusScore: ''
        },
        {
          title: '团结协作',
          points: 10,
          content: '谦虚谨慎，专业同事，互相学习、互相帮助，维护其他老师在幼儿心目中的威信，关心集体，维护学校荣誉，共创文明校园。',
          principalScore: '',
          departmentScore: '',
          classScore: '',
          staffScore: '',
          parentScore: '',
          selfScore: '',
          bonusScore: ''
        },
        {
          title: '尊重家长',
          points: 10,
          content: '主动与幼儿家长联系，认真听取家长意见和建议，取得家长的支持与配合。积极宣传科学的教育思想和方法，不训斥、指责幼儿家长。',
          principalScore: '',
          departmentScore: '',
          classScore: '',
          staffScore: '',
          parentScore: '',
          selfScore: '',
          bonusScore: ''
        },
        {
          title: '廉洁从教',
          points: 10,
          content: '坚守高尚情操，发扬奉献精神，自觉抵制社会不良风气影响，不利用职责之便谋取私利。',
          principalScore: '',
          departmentScore: '',
          classScore: '',
          staffScore: '',
          parentScore: '',
          selfScore: '',
          bonusScore: ''
        },
        {
          title: '为人师表',
          points: 15,
          content: '模范遵守社会公德，衣着整洁得体，语言规范健康，举止文明礼貌。作风正派，注重身教，严于律己，以身作则。',
          principalScore: '',
          departmentScore: '',
          classScore: '',
          staffScore: '',
          parentScore: '',
          selfScore: '',
          bonusScore: ''
        },
        {
          title: '加分',
          points: null,
          content: '加分计入考核评价总分，但考核评价满分不超过 100 分。获县级教育部门专类先进奖加 5 分，获市级及以上奖加 8 分。',
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
        // Sum up all score columns for each row
        const scores = [
          parseFloat(item.principalScore) || 0,
          parseFloat(item.departmentScore) || 0,
          parseFloat(item.classScore) || 0,
          parseFloat(item.staffScore) || 0,
          parseFloat(item.parentScore) || 0,
          parseFloat(item.selfScore) || 0,
          parseFloat(item.bonusScore) || 0
        ];

        // Add the sum of scores for this item to the total
        total += scores.reduce((sum, score) => sum + score, 0);
      });

      // Ensure total doesn't exceed 100
      return Math.min(total, 100);
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

.content-cell {
  text-align: left;
  line-height: 1.5;
  white-space: normal;
  word-break: break-all;
}

.total-row {
  margin-top: 20px;
}

.el-table .el-input {
  width: 60px;
}
</style>
