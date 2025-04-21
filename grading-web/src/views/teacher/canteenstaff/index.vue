<template>
  <div>
    <UserRoleTable :roles="userRoles"></UserRoleTable>
  </div>
</template>

<script>
import UserRoleTable from "@/components/UserRoleTable";
export default {
  name: 'CanteenStaff',
  components: {UserRoleTable},
  data() {
    return {
      userRoles:["canteen"],
      tableData: [
        // 师德师风
        {
          project: '师德师风（20分）',
          content: '仪容仪表',
          criteria: '微笑仪表整洁，举止文明，上班一律穿平底鞋，不穿拖鞋，按规定着工作服，不留长指甲，不涂指甲油。（10分）',
          principal: '',
          department: '',
          group: '',
          teacher: '',
          parent: '',
          self: '',
          score: '',
          rowspan: 2,
          colspan: 1
        },
        {
          project: '师德师风（20分）',
          content: '团队协作',
          criteria: '工作态度积极，上进，有团队精神和奉献精神；注意个人言谈举止，和同事及保育员愉快合作，和睦相处。同事之间不团结，吵架或者还言行为扣2分，以非法方式表达诉求，串联煽动同事等违法错误的行为，视情况扣分。（10分）',
          principal: '',
          department: '',
          group: '',
          teacher: '',
          parent: '',
          self: '',
          score: ''
        },
        // 岗位纪律
        {
          project: '岗位纪律（10分）',
          content: '',
          criteria: '认真履行岗位职责，服从工作安排、调配。上班不按规定穿工作服或不戴工作帽不戴口罩，非工作人员进入食堂操作间不制止，不按时间出饭来的（特殊情况除外），食品未按规定留样，或留样不及时，留样记录填写不完整，回料框存放杂物垃圾品，下班未及时关水电气一次扣2分，私自藏匿食堂食品、成料食物、食材带出食堂、不配合学校指定的门检查、做禁止事禁事违规一次扣5分。（10分）',
          principal: '',
          department: '',
          group: '',
          teacher: '',
          parent: '',
          self: '',
          score: '',
          rowspan: 1,
          colspan: 1
        },
        // 安全工作
        {
          project: '安全工作（20分）',
          content: '安全防范',
          criteria: '把好食材验收关、烹饪关、发现肉类蔬菜变质香异常未及时报告、霉变、过期食品未按规定处理一次扣5分；未规范操作各类器具一次扣2分；（20分）',
          principal: '',
          department: '',
          group: '',
          teacher: '',
          parent: '',
          self: '',
          score: '',
          rowspan: 1,
          colspan: 1
        },
        // 服务质量
        {
          project: '服务质量（10分）',
          content: '饭菜质量',
          criteria: '菜时油、盐超常规的，提醒一次不改进的一次，教职工普遍反映色香味存在问题，饭菜中有异物的扣2分。不服从工作安排(含未按规定加工、烹调等)一次扣5分（10分）',
          principal: '',
          department: '',
          group: '',
          teacher: '',
          parent: '',
          self: '',
          score: '',
          rowspan: 1,
          colspan: 1
        },
        // 清洁卫生
        {
          project: '清洁卫生（30分）',
          content: '个人卫生',
          criteria: '个人着装干净，整洁，工作服及围裙未脏东及时换洗一次扣2分。（5分）',
          principal: '',
          department: '',
          group: '',
          teacher: '',
          parent: '',
          self: '',
          score: '',
          rowspan: 4,
          colspan: 1
        },
        {
          project: '',
          content: '物品管理',
          criteria: '冰箱内生、熟食品混放，未定期除霜。各操作间物品摆放不规范，库房未按规定存放物品或库房不按标识摆放物品一次扣2分。（10分）',
          principal: '',
          department: '',
          group: '',
          teacher: '',
          parent: '',
          self: '',
          score: ''
        },
        {
          project: '',
          content: '环境整洁',
          criteria: '各操作间卫生打扫不彻底，锅灶、案板，洗刷池，地面，下水道口，留样柜，冰柜，蒸饭车，切肉机，切菜机，食堂周围等未清理干净，垃圾桶有污物，一次扣2分。（10分）',
          principal: '',
          department: '',
          group: '',
          teacher: '',
          parent: '',
          self: '',
          score: ''
        },
        {
          project: '',
          content: '消毒工作',
          criteria: '按要求做好各项餐具餐盘消毒工作，及时准确记录。（5分）',
          principal: '',
          department: '',
          group: '',
          teacher: '',
          parent: '',
          self: '',
          score: ''
        },
        // 出勤管理
        {
          project: '出勤管理（10分）',
          content: '出勤情况',
          criteria: '长时上下班，不迟到，不早退，迟到，早退一次扣2分，旷工一天扣除全月奖降奖；当月旷课病假0.2分，事假扣0.5分。学习培训无故缺席一次扣1分，请假0.2分。（10分）',
          principal: '',
          department: '',
          group: '',
          teacher: '',
          parent: '',
          self: '',
          score: '',
          rowspan: 1,
          colspan: 1
        },
        // 奖励
        {
          project: '奖励',
          content: '',
          criteria: '1.大型活动准备集体餐，按实际操作人数：50元/次/人。\n平假日加班，视具情况进行相应补助。\n2.组长岗位津贴：100元/月。',
          principal: '',
          department: '',
          group: '',
          teacher: '',
          parent: '',
          self: '',
          score: '',
          rowspan: 1,
          colspan: 1
        },
        // 总分
        {
          project: '总分',
          content: '',
          criteria: '',
          principal: '',
          department: '',
          group: '',
          teacher: '',
          parent: '',
          self: '',
          score: '',
          rowspan: 1,
          colspan: 1
        }
      ],
      spanArr: []
    }
  },
  methods: {
    objectSpanMethod({ row, column, rowIndex, columnIndex }) {
      if (columnIndex === 0) {
        if (row.rowspan) {
          return {
            rowspan: row.rowspan,
            colspan: 1
          };
        } else {
          return {
            rowspan: 0,
            colspan: 0
          };
        }
      }
    },
    cellStyle({ row, column, rowIndex, columnIndex }) {
      // 为文本内容添加样式
      if (columnIndex === 2) {  // 评分标准列
        return {
          fontSize: '12px',
          lineHeight: '1.5',
          textAlign: 'left',
          padding: '5px'
        };
      }
      return {
        fontSize: '13px',
        textAlign: 'center'
      };
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

.page-number {
  text-align: right;
  margin-top: 10px;
  font-size: 12px;
  color: #888;
}

/* 覆盖一些Element UI默认样式 */
/deep/ .el-table th {
  background-color: #f5f7fa;
  font-weight: bold;
  text-align: center;
  padding: 5px 0;
}

/deep/ .el-table td {
  padding: 5px;
}

/deep/ .el-table--border,
/deep/ .el-table--group {
  border: 1px solid #dcdfe6;
}

/deep/ .el-table__body-wrapper {
  overflow-x: auto;
}
</style>
