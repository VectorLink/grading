<template>
  <div>
    <UserRoleTable :roles="userRoles"></UserRoleTable>
  </div>
</template>

<script>
import UserRoleTable from "@/components/UserRoleTable";
export default {
  name: 'ChildcareTeacher',
  components: {UserRoleTable},
  data() {
    return {
      // First page of the table
      userRoles:["childteacher"],
      tableData: [
        {
          project: '师德师风（30分）',
          criteria: '1.爱岗敬业，正确引导；舒心、热心对待幼儿，不歧视，不讽刺挖苦幼儿，不体罚幼儿变相体罚幼儿，不歧视一次扣20分。\n2.微笑仪表整洁，举止文明，上班一律穿平底鞋，不穿拖鞋，头发不披散，不戴饰物和指甲，区域一律穿工作服，不留长指甲，不涂指甲油。\n3.工作态度积极，上进，有团队精神和奉献精神；注意个人言谈举止，和教师、保育员同事和睦相处，以诚相待；幼儿和师生合作，包容幼儿，助力、积极主动有耐心，幼儿问题提有效自己解幼儿问教育的认真扣3分，容易生气发，以非法方式表达诉求，串联煽动同事等违法错误的行为，视情况扣分，拒罚不要的指导每月考核表。\n四照顾幼儿园保教工作同志。\n4.认真履行岗位职责，服从工作安排、调配，不做与工作无关的事。上班时间开小差、聊天、玩手机一次扣2分。\n5.服服从管理安排，参与保健成长相结构、进修评课，收受家长馈赠物、接受家长单请吃请玩或接受家长邀请站20分钟带着的经签往留实扣交扣20分；进私密商务带访问非规章规定，并进取相关责任。\n6.有意见提取对直接向上级友或上报，谎妄言谈、谣言周专等反序倦懒风校事件，转明度览一次扣30分，违法严重带带，取消当月续聘考核，并进取相关责任。\n7.充成不服从幼儿园管理者合理工作安排1次扣2分；私带、请辞幼儿园管理者—次扣5分。',
          principal: '',
          department: '',
          group: '',
          teacher: '',
          parent: '',
          self: '',
          score: ''
        },
        {
          project: '安全工作（20分）',
          criteria: '创保安全、合理、舒适的环境；细心看护每一个幼儿，及时发现幼儿身体、情绪上的异常，及时采取有效的措施；进修到讲，做好各种安全防护预活动和保洁工作；进程安全责报要求。',
          principal: '',
          department: '',
          group: '',
          teacher: '',
          parent: '',
          self: '',
          score: ''
        }, {
          project: '保教工作（15分）',
          criteria: '积极配合老师做好班级常规工作；熟悉幼写班级环关系项；不出遗漏；协助常规理班级有秩序的安排进辅助，合理理保，定期进行，观察班级班长，集体班极思维活动时，积极协助老师准备材料，带理幼儿。',
          principal: '',
          department: '',
          group: '',
          teacher: '',
          parent: '',
          self: '',
          score: ''
        },
        {
          project: '家长工作（10分）',
          criteria: '给加进展日常约家长工作，对家长易常和蔼，有耐心，遗事主动与家长沟通，不与家长争吵。',
          principal: '',
          department: '',
          group: '',
          teacher: '',
          parent: '',
          self: '',
          score: ''
        },
        {
          project: '清洁卫生保健（15分）',
          criteria: '适度本着细致观察到位，手细致，描当落实。班清幼面环保；卫生用具按要求存放，级到安全，无露面；幼儿活动的物品，衣物要及时接摔掉；不值课后离开活动场着园真空打无尘、可于特殊的幼儿，悄于特殊的班级，并结合教班达般教幼儿师幼儿护理好工作，随时保持清洁卫生，桌椅，卫生间施撤密洗洁，无龌龊现象，无卫生死角；长桌椅，门窗，墙角，曲角，墙高，壁楼共物落里面细致地掸刷干净，无灰尘，无蛛网；无黑污皮垢，无暗角， 长及通顺安排厨房要工作，及时准部足来，行政组班入我食住营养站。手泽工厂等收拾分离地衣被，幼儿餐椅，毛巾等各长校次，各时一次扣3分；\n3.孩子伤害病意真（半）的工作，做好记录，发现有疑似传染病情况的幼儿室应将其送到保建行隔离，并立即刻正隔离院班科诊察医院，如采及时汤洗，一次扣5分；对因角班级保持的幼儿环境消毒记录，如记记录欠记不全每次扣2分；发现传染病如等土壤，手喂班，孙根，速报总情况，率削一次扣5分；班级上班，隔离区域的消毒不能定时定质会及时有效使行审批，结环通告月参与。\n4.经班级跟环搬送环分，采集即可实弯展过，地面，墙面不乱举，组高，视特处理一例扣2分；\n5.经级日产清洗，无卫生死角，若借现1次扣2分；\n6.睡点反铺，公共法致纳物有日评社，床特整洁，若副一次扣每在人2分；\n7.班级各类表彰表按时加等级落实1分。',
          principal: '',
          department: '',
          group: '',
          teacher: '',
          parent: '',
          self: '',
          score: ''
        },
        {
          project: '出勤管理（10分）',
          criteria: '按时上下班，不迟到，不早退，迟到，早退一次扣2分，迟到30分钟立即按旷工处不扣计算，扣5分，当月年旷班级绩出其同的停薪假病（建议幼儿园规定会表）一次扣6分，事假一次扣10分，学习培训无故缺席一次扣5分。',
          principal: '',
          department: '',
          group: '',
          teacher: '',
          parent: '',
          self: '',
          score: ''
        },
        {
          project: '加分',
          criteria: '法定假日，班年优质超级班组贡上班后，视情况加相加分',
          principal: '',
          department: '',
          group: '',
          teacher: '',
          parent: '',
          self: '',
          score: ''
        },
        {
          project: '总分',
          criteria: '',
          principal: '',
          department: '',
          group: '',
          teacher: '',
          parent: '',
          self: '',
          score: ''
        }
      ]
    }
  },
  methods: {
    objectSpanMethod({row, column, rowIndex, columnIndex}) {
      // Apply custom span for cells if needed
      return;
    }
  }
}
</script>

<style scoped>
.evaluation-container {
  width: 100%;
  max-width: 1200px;
  margin: 0 auto;
  padding: 20px;
  font-family: "SimSun", "宋体", serif;
}

.table-title {
  text-align: center;
  font-size: 18px;
  font-weight: bold;
  margin-bottom: 20px;
}

.evaluation-table {
  width: 100%;
  border-collapse: collapse;
}

.margin-top {
  margin-top: 30px;
}

.page-number {
  text-align: right;
  margin-top: 10px;
  margin-bottom: 30px;
  font-size: 12px;
  color: #888;
}

.notes-section {
  margin-top: 20px;
  font-size: 12px;
  line-height: 1.6;
}

.note-text {
  text-indent: 2em;
}

/* Override Element UI default styles */
/deep/ .el-table th {
  background-color: #f5f7fa;
  font-weight: bold;
  text-align: center;
  padding: 5px 0;
  font-size: 14px;
}

/deep/ .el-table td {
  padding: 8px 5px;
  font-size: 12px;
  line-height: 1.5;
}

/deep/ .el-table .cell {
  word-break: break-all;
  line-height: 1.5;
}

/deep/ .el-table--border,
/deep/ .el-table--group {
  border: 1px solid #dcdfe6;
}

/deep/ .el-table__body-wrapper {
  overflow-x: auto;
}
</style>
