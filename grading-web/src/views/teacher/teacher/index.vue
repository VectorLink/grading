<template>
  <div class="evaluation-container">
    <h2 class="main-title">重庆市大足区龙岗幼儿园教师月绩效考核细则</h2>

    <el-card class="evaluation-form">
      <el-table :data="tableData.slice(0, displayLimit)" border style="width: 100%">
        <el-table-column prop="item" label="项目" width="120"></el-table-column>
        <el-table-column prop="content" label="考核内容" width="120"></el-table-column>
        <el-table-column prop="standards" label="考核标准" min-width="480">
          <template slot-scope="scope">
            <div class="standards-cell" v-html="formatStandards(scope.row.standards)"></div>
          </template>
        </el-table-column>

        <el-table-column label="园长评价" width="70">
          <template slot-scope="scope">
            <el-input v-model="scope.row.principalScore" type="number" :min="0" :max="scope.row.points" size="mini"></el-input>
          </template>
        </el-table-column>

        <el-table-column label="部门评价" width="70">
          <template slot-scope="scope">
            <el-input v-model="scope.row.departmentScore" type="number" :min="0" :max="scope.row.points" size="mini"></el-input>
          </template>
        </el-table-column>

        <el-table-column label="班组互评" width="70">
          <template slot-scope="scope">
            <el-input v-model="scope.row.classScore" type="number" :min="0" :max="scope.row.points" size="mini"></el-input>
          </template>
        </el-table-column>

        <el-table-column label="教师互评" width="70">
          <template slot-scope="scope">
            <el-input v-model="scope.row.teacherScore" type="number" :min="0" :max="scope.row.points" size="mini"></el-input>
          </template>
        </el-table-column>

        <el-table-column label="家长评价" width="70">
          <template slot-scope="scope">
            <el-input v-model="scope.row.parentScore" type="number" :min="0" :max="scope.row.points" size="mini"></el-input>
          </template>
        </el-table-column>

        <el-table-column label="自评" width="70">
          <template slot-scope="scope">
            <el-input v-model="scope.row.selfScore" type="number" :min="0" :max="scope.row.points" size="mini"></el-input>
          </template>
        </el-table-column>

        <el-table-column label="加分" width="70">
          <template slot-scope="scope">
            <el-input v-model="scope.row.bonusScore" type="number" :min="0" size="mini"></el-input>
          </template>
        </el-table-column>
      </el-table>

      <div class="pagination-container" v-if="tableData.length > initialDisplayLimit">
        <el-button
          type="primary"
          size="small"
          @click="toggleDisplayLimit"
        >
          {{ displayLimit === initialDisplayLimit ? '显示更多评估项' : '收起评估项' }}
        </el-button>
      </div>

      <div class="explanation-section">
        <el-collapse v-model="activeNames">
          <el-collapse-item title="说明" name="1">
            <ol>
              <li>此考核细则的执行，在基于一个项目的分值不能满足扣分时，在扣满归项的分值后扣除。</li>
              <li>每人一张考核表填写具体扣分项。</li>
              <li>获奖评分依据一律依表填写，文件凭证明材料为准。有关证明材料须盖了预定"生成"或"归纳"的标志审核确认方有效，否则以有关证明材料的溯源及核对为准；</li>
              <li>同一获奖证书在名次比率中获奖，按最高奖项获计分，不要累计分；</li>
              <li>两人及以上参赛(著)（含校、园等材料）等作品获奖，参赛人员按各等次最分平均分计分；</li>
              <li>不代表幼儿园参加的某社会团体、民间组织的比赛，不计分。</li>
            </ol>
          </el-collapse-item>
        </el-collapse>
      </div>

      <div class="total-section">
        <div class="total-row">
          <span>合计</span>
          <span class="total-score">{{ totalScore }}</span>
        </div>
        <div class="grade-row">
          <span>考核得级</span>
          <span>考核得分（<input class="score-input" v-model="finalScore" type="number" min="0" max="100" />）× 10 ÷/5分=（<input class="result-input" v-model="finalResult" />）元</span>
        </div>
      </div>
    </el-card>
  </div>
</template>

<script>
export default {
  name: 'Teacher',
  data() {
    return {
      activeNames: ['1'],
      initialDisplayLimit: 5,
      displayLimit: 5,
      finalScore: '',
      finalResult: '',
      tableData: [
        {
          item: '师德师风和行为规范（30分）',
          content: '自觉遵守《中小学教师职业道德规范》《大足区教育系统贯彻落实从教行为规范》，爱岗敬业，遵纪守法，关爱幼儿，为人师表，自觉维护教师形象，不违反师德师风行为；言谨慎，明礼守德，保质完整；出结同事、乐于助人；尊重家长，积极沟通家长合理的要求。',
          standards: '1.违反不按规定着装、授头散发、不按工作安排按时完成任务，经劝说仍不服从，并故意吵闹，一次扣5分；说话不注意场合，当着家长、幼儿、外人的面不维护己和幼儿园的形象扣3分；\n2.报案迟到，不团结同事，与同事闹事或家长吵架，一次扣5分，打架车祸一次扣20分，并承担医师费及一切经济损失；\n3.有意质疑不正当提、或歧视理、吵闹、造谣伤人，一次扣5分；对待不同意见的事举行击报复（在经济上、政治上进城产重后果）一次扣10分；\n4.虐待幼儿、平等、公平的对待幼儿，积极鼓励教育幼儿，一次扣10分；体罚变相体罚幼儿，一次扣20分，因此造成伤追或经济损失的，按全额给予赔偿，情节严重者扣30分并根据相关部门按规定处理。\n5.班班期间打电话聊天、串岗、扎堆、闲聊不管幼儿，每次扣5分。\n6.思想意识不健康，参与赌博或变相赌博、违规非课、收受家长钱财等，按家长变请等违反中央八项规定赔偿20个提纲事项的经查后满每次扣20分；违规变形酬的加除扣除月绩效考核分，并进免加关在位。\n7.有意阻挠程序依次上报、不得参与集体上访、集体座谈、集众闹事等违反维稳风的事件，否则发现一次扣30分、造成严重影响的，视情追月绩效考核，并进免相关责任。\n8.无故不服从幼儿园管理者合理工作安排，辱骂、诽谤幼儿园管理者1次扣5分。\n9.班级保教人员岗位团结，相关责任方每次扣5分；因与班级保教人员互道不到位，造成工作失误的，1次扣5分。',
          points: 30,
          principalScore: '',
          departmentScore: '',
          classScore: '',
          teacherScore: '',
          parentScore: '',
          selfScore: '',
          bonusScore: ''
        },
        {
          item: '认真撰写各类教育教学（20分）',
          content: '计划、总结、党政记录；按档案管理、查档保证依法科学保教理念，积极配合做好工作。',
          standards: '1.教师组织保教、户外体育活动时，蓄意未准备，活动无组织，未带幼儿教具，未提醒幼儿增减衣服，未关注体弱幼儿一次扣4分。\n2.上交保教工作计划、总结、表册、活动图片等材料不按时提交扣2分、上交材料质量差（抄袭、下载、不符合班级情况），不合格每次扣1分',
          points: 20,
          principalScore: '',
          departmentScore: '',
          classScore: '',
          teacherScore: '',
          parentScore: '',
          selfScore: '',
          bonusScore: ''
        },
        {
          item: '认真探讨划组织活动、沟通家长有效；保教活动中不小学化倾向；按时保质保量完成各类活动，保教在各；认真做好家长工作，互家长上好家长会；积极参加幼儿园的各项活动等，积极推动幼儿园发展。积极参加园内外学习和重要活动，按要求完成学习和要责任条，提升专业水平和完成学习提高。',
          content: '认真探讨划组织活动、活动等',
          standards: '（由保教组长检查评价），无故不交的扣10分。\n3.活动前无活动准备（无计划、教具、不熟悉活动内容等），活动中未使用普通话，组织活动不按计划执行，一次扣3分。\n4.保证幼儿每天饮水量400-600ML，早餐，户外活动后集中组织幼儿饮水，未组织幼儿2次集体饮水，未提醒园时饮水，未组织餐前洗手餐后漱口洗餐具等不安静、不文明，午睡未巡查，未记录，超床未整理检查幼儿着装，一次扣3分。\n5.每月不按时更换家园联系栏、主题墙等次扣5分；家园联系栏、主题墙质量差，不合格每次扣3分。\n6.长椿科学有效的管理会，无小学化，融入优的学习内容及教学模式，无愧绪的绘画，识字，写字等内容，无专业书面家庭作业等现象，否则出现一件行为每次扣10分。\n7.准时参加教研活动，在规定的时间（提前请假除外）未到场每每次扣5分。\n8.服从教研工作安排，在教研活动中私议分享清或成果事，积极上公开课、示范课，主动承担专题讲座、教研活动主持等，事前及时上交相关材料，不迟时完成者每次扣10分，完成教研任务质量差，不合格每场次6分（由进本的参研领导评价）。\n9.服从幼儿园安排，积极参加外出学习，返园后认真汇报、不服从安排者每次扣10分，学习不认真，还报质量差每次扣6分',
          points: 20,
          principalScore: '',
          departmentScore: '',
          classScore: '',
          teacherScore: '',
          parentScore: '',
          selfScore: '',
          bonusScore: ''
        },
        {
          item: '加强幼儿安全教育，积极履从幼儿园安全工作安排，完成安全工作，班保证安全事故记20分',
          content: '加强幼儿安全教育',
          standards: '1.未按时按要求对幼儿进行安全教育，每安全隐患、未完成各部安全记录每次扣2分，发现险患未及时上报扣2分，造成严重后果取消当月绩效绩效扣评知评得评光资格；\n2.未在规定时间内完成安全台账工作，每次扣3分，不按时上交安全资料、上传安全资料图片等每次扣2分；\n3.上交安全资料、安全检查工作记录不符合要求，每次扣1分；\n4.出现烟伤、摔伤、碰伤等事故，如实上报并及时妥善处理，家长满意不扣分，如实上报但未处理或处理不当扣5分；如未上报，家长投诉举报扣10分；\n5.安全工作不服从安排每次扣5分，迟到到、早退、旷工违戒的安全事故每次扣20分、肇事及以上，造成以下，如处理及时，家长满意，未产生负面一切影响扣50分；如责任人管理疏忽生住院及以上重大事故取扣30分；园上连带版生重大事故或医疗费用超过1000元内，园允连扣绩效扣评知评得评光一个月工资50%，事任人审不扣满50%；\n6.未履职尽责生的安全事故，如责任追究，保护措施得当，及时上报并处理，避免事故扩大，不扣分，反之如果因责任措施不到位或未上报成故处理成本加剧等，按实上服安装以上扣分；\n7.入园时有家长未完成接送制度备案，送保和无证接送人凭，还款知家长该起回，每次扣3分；发现孩子遗漏入园门口有家长或无监护人单独在花园游玩或幼儿通道、家长接送车道等行危险区，未劝阻，一次扣5分；未提醒接送车辆舒慢行驶（幼儿）的家长并主动登记有效监护人，若保安未提的幼儿，扣安全3分，出现幼儿接顾或入侵幼儿园园内幼儿扣园长10分；组织校友家长入园平台安全工作不到位，进行检查接送登记，并及现进安全整改；\n9.消防应急保安，保管对应儿园公物，娴熟不通畅，不放置杂物，遮天火源等每次每项扣3分；\n加强常规训练，常规教育：\n1.按要求上好健康课，否则一次扣3分；\n2.呼子机，按要求保管不丢现象按标准扣分，完善幼儿水、毛巾等备备标识，否则一次扣3分；\n3.负责户保养室（午）放工作，娴熟记录，爱惜有爱好传会所需使的几乎之间拨查记录要进行清淤，并设场地区域要进行扫尘工作，如末处理检查幼儿着装，一次扣2分；不因房鲜或多的幼儿生各种健康记录，如无或成记录不全各扣为2分；发现传染物幼工作，有隐瞒、胃痛、缺陷、儿童传热病情晚报的，每一扣或3分，同病情恶化，造成不良影响或其它幼儿通病情的，每次扣5分；\n4.保持园舍整洁，地面平整，墙面干净，绿化，地面无异物，各室、班级无异味，无虫害，厕所卫生整洁，否则一次扣2分；\n5.积极百子开发，玩具生宿命，否则每项1次扣2分；\n6.班级卫生检，不按保持期间上报，保持卫生，否则一次扣责任人2分；\n7.原餐台及食品来送常等肖斜每1分',
          points: 20,
          principalScore: '',
          departmentScore: '',
          classScore: '',
          teacherScore: '',
          parentScore: '',
          selfScore: '',
          bonusScore: ''
        },
        {
          item: '卫生保健和防控卫生保健（10分）',
          content: '按时制定卫生工作计划、控制食物中毒及传染病的防治工作、幼儿晨检及卫生保健工作。',
          standards: '1.按要求上好保健课，否则一次扣3分；\n2.呼子机，按要求使保管好不丢现象按标准扣分，完善幼儿水、毛巾等备标识，否则一次扣3分；\n3.负责户保养室（午）放工作，娴熟记录，爱惜有爱好传会所需使的几乎之间拨查记录要进行清淤，并设场地区域要进行扫尘工作，如末处理检查幼儿着装，一次扣2分；不因房鲜或多的幼儿生各种健康记录，如无或成记录不全各扣为2分；发现传染病幼工作，有隐瞒、胃痛、缺陷、儿童传染病情晚报的，每一扣或3分，同病情恶化，造成不良影响或其它幼儿通病情的，每次扣5分；\n4.保持园舍整洁，地面平整，墙面干净，绿化，地面无异物，各室、班级无异味，无虫害，厕所卫生整洁，否则出现一同扣2分；\n5.积极百子开发，玩具生宿命，否则每项1次扣2分；\n6.班级卫生检，不按保持期间上报，保持卫生，否则一次扣责任人2分；\n7.原餐台及食品来送等肖斜每1分',
          points: 10,
          principalScore: '',
          departmentScore: '',
          classScore: '',
          teacherScore: '',
          parentScore: '',
          selfScore: '',
          bonusScore: ''
        },
        {
          item: '家长工作（10分）',
          content: '1.做好联系家长工作，与家长建立良好的信任关系。2.向家长宣传科学的早期教育理念，积极做好家园共育工作。积极做好定期随访工作，不与家长正面冲突。',
          standards: '1.按要求组织各种家长会，家长开展日，质量并服装矩，家长到会记录，保管家长会议记录，否则每次扣2分；\n2.主动与家长沟通，向家长借力气，凝聚整合，每期每个小班子至少家访1/5，以此类推；及时处理家长提的问题，化解矛盾，幼儿在园受生事故的，积极主动与家长沟通解释工作，妥善处理，不与家长发生冲突，否则每每扣3分；对到家长投诉，经查证属实，每次扣3分；\n3.积极向家长提供科学育儿知识与指导，巧力弹足家长的全程育参，无理挑剔家长不予沟通家长需要的，取闹1次扣5分；\n4.班级通过家长会资源服务发挥家长育儿委员会效能占90%以上，扣3分，每每各个角落活动不到2分；\n5.班级家长宣传阵地常换常新，宣传资料丰富，选入宣传手附素材重视高度，让家长明确每，环境整理体现井，包括备课资料，色块整课时料，未做每一次扣2分；\n6.认真收集保存各种档案资料，户外专栏，按规定装订上册，不得遗落，缺册，否则一次扣2分；\n7.认真组织班级幼儿家庭调查，确语接家长送幼儿，确保每一位家长若识班的收费情况，知道你的送接方法等幼儿园能提供什么服务，加强各月幼每月绩效考核有，因此需要逾多的评价者分合格；\n8.每月家长写投诉，投诉意见不得提两，如通投诉成立未解决不予反馈9工巡，如来巡投诉1个工巡；\n9.接受上级或后勤一至扣10分；镇园，有相上领导文你要扣管，扣6分7公；参加培训工组课研课重要工作迟到以上，每旷工扣10分；镇园，有相上领导文你要扣',
          points: 10,
          principalScore: '',
          departmentScore: '',
          classScore: '',
          teacherScore: '',
          parentScore: '',
          selfScore: '',
          bonusScore: ''
        },
        {
          item: '自觉遵守纪律，坚持遵守规，不迟到，不早退，不旷工，不无故病，全勤。',
          content: '出勤（10分）',
          standards: '1.区到一次扣2分，无故未请假逾到30分钟按旷工处理；早退扣2分，延误工时扣分；\n2.无请假超假一天扣5分，超假5天以上或不标准规定请销假程序办理不相关手续，扣10分；镇园，有相上领导文你，扣6分7天；参加培训工作安排工作迟到以上，每旷工扣10分；镇园，有相上领导文你，扣6分/7天；\n3.区到一次扣2分，按园请假休理。\n4.请病假（提交医院病历卡及就诊证明超过30天按规定享有工龄工资30分钟扣费部门未加员替岗。\n5.教师参加学历进升学习，考试天数行请假手续，但不计病假。',
          points: 10,
          principalScore: '',
          departmentScore: '',
          classScore: '',
          teacherScore: '',
          parentScore: '',
          selfScore: '',
          bonusScore: ''
        },
        {
          item: '说明',
          content: '说明',
          standards: '6.法定假日，寒暑休要按时闭园上班时，准时返岗加班。',
          points: 0,
          principalScore: '',
          departmentScore: '',
          classScore: '',
          teacherScore: '',
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
      this.tableData.forEach(item => {
        // Calculate the average score for each row across all evaluators
        const scores = [
          parseFloat(item.principalScore) || 0,
          parseFloat(item.departmentScore) || 0,
          parseFloat(item.classScore) || 0,
          parseFloat(item.teacherScore) || 0,
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
  },
  methods: {
    formatStandards(text) {
      if (!text) return '';
      return text.replace(/\n/g, '<br>');
    },
    toggleDisplayLimit() {
      if (this.displayLimit === this.initialDisplayLimit) {
        this.displayLimit = this.tableData.length;
      } else {
        this.displayLimit = this.initialDisplayLimit;
      }
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

.pagination-container {
  margin: 20px 0;
  text-align: center;
}

.total-section {
  margin-top: 20px;
  border-top: 1px solid #EBEEF5;
  padding-top: 15px;
}

.total-row, .grade-row {
  display: flex;
  justify-content: space-between;
  padding: 10px 0;
  font-size: 16px;
}

.total-score {
  font-weight: bold;
  color: #409EFF;
  font-size: 18px;
}

.score-input, .result-input {
  width: 60px;
  height: 24px;
  border: 1px solid #DCDFE6;
  border-radius: 4px;
  padding: 0 8px;
  text-align: center;
}
</style>
