<template>
  <div class="evaluation-form">
    <h2 class="title">大足区龙岗幼儿园各类活动家长评价检核表</h2>
    <div class="info">
      <p>评价教师：龙媛媛</p>
      <p>评价时间：2024年6月</p>
    </div>
    <el-table :data="tableData" border style="width: 100%" :span-method="objectSpanMethod">
      <el-table-column prop="category" label="一级指标" width="100" fixed></el-table-column>
      <el-table-column prop="subCategory" label="二级指标" width="120"></el-table-column>
      <el-table-column label="检核点">
        <template slot-scope="scope">
          <div v-for="(point, index) in scope.row.points" :key="index">{{ point }}</div>
        </template>
      </el-table-column>
      <el-table-column prop="score" label="检核结果" width="100"></el-table-column>
      <el-table-column prop="total" label="总分" width="80"></el-table-column>
    </el-table>
    <div class="footer">共计得分：<strong>97分</strong></div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      tableData: [
        // 家长会
        { category: "家长会", subCategory: "前期准备\n20分", points: ["非常好，几乎是孩子动手做的，很好的展示了孩子的能力。15—20分", "一般，孩子参与的不多，几乎都是老师做的。10—15分", "不好，还是平平常一样。10分以下"], score: "20分", total: "94分" },
        { category: "家长会", subCategory: "流程安排\n30分", points: ["非常好，衔接紧凑，家长参与感好。20—30分", "一般，家长参与感不够。10—20分", "不好，家长没看清流程，家长参与度不高。10分以下"], score: "28分", total: "94分" },
        { category: "家长会", subCategory: "内容分享\n50分", points: ["这两大模块老师都分享得很好，能感受到老师的专业和用心。40—50分", "一个模块老师准备充分，老师很有引导，能很好带动家长的幼儿园生活。40—50分", "集中育活动很好，感受到活动的有趣，孩子能从这样的游戏中可得知识。40—50分", "两大模块的内容都还需改进，老师的能力还有待提升。20分以下"], score: "46分", total: "94分" },

        // 家访
        { category: "家访", subCategory: "言行举止\n20分", points: ["非常好，言行举止得体。15—20分", "一般，说话较随意。10—15分", "不好，穿着不得体，言行随意。10分以下"], score: "20分", total: "92分" },
        { category: "家访", subCategory: "家访内容\n40分", points: ["全面、具体，很好地了解到孩子在幼儿园的情况。30—40分", "了解到孩子在某些方面的情况，不够全面。20—30分", "不了解情况，交流较少。20分以下"], score: "36分", total: "92分" },
        { category: "家访", subCategory: "育儿建议\n40分", points: ["老师给予专业、科学的育儿建议，操作性强。30—40分", "给了一些建议，但针对性、操作性不强。20—30分", "老师只是为了完成任务。20分以下"], score: "36分", total: "92分" },

        // 家长开放日
        { category: "家长开放日", subCategory: "前期准备\n20分", points: ["非常充分，氛围浓厚（几乎都要孩子参与的），衔接流畅。15—20分", "一般，孩子没有参与氛围布置，老师配合有待加强。10—15分", "不好，没有氛围的营造，老师对流程不够清晰。10分以下"], score: "20分", total: "94分" },
        { category: "家长开放日", subCategory: "流程安排\n30分", points: ["非常好，充分的展现了孩子的半日活动，家长参与感强。20—30分", "一般，展现了孩子的半日活动，家长参与感不强。10—20分", "不好，没有很好的展现孩子的半日活动，家长没有参与感。10分以下"], score: "28分", total: "94分" },
        { category: "家长开放日", subCategory: "内容分享\n50分", points: ["家长会模块内容丰富，理论联系实际，也给予家长很好的建议。40—50分", "单个活动细节结合，老师中有目标、眼里有孩子，期末互动效果好。40—50分", "两大模块的内容都还需改进，老师的能力还有待提升。20分以下"], score: "46分", total: "94分" },

        // 亲子活动
        { category: "亲子活动", subCategory: "活动准备\n20分", points: ["非常好，每位老师都熟悉每一个环节，能接续紧。15—20分", "还行，老师之间配合还需更紧密一些。10—15分", "不好，整个活动比较混乱。10分以下"], score: "20分", total: "95分" },
        { category: "亲子活动", subCategory: "流程安排\n20分", points: ["非常好，动静结合，家长参与感强。15—20分", "一般，家长和幼儿的互动性不高。10—15分", "不好，强度太大，到后面大家的体力都跟不上了。10分以下"], score: "19分", total: "95分" },
        { category: "亲子活动", subCategory: "活动组织\n60分", points: ["很好，衔接紧凑有序，家长、孩子的积极性都高涨。40—60分", "一般，家长、孩子参与的积极性不高。20—40分", "不好，老师的组织能力还有待提高。20分以下"], score: "56分", total: "95分" }
      ]
    };
  },
  methods: {
    objectSpanMethod({ row, column, rowIndex, columnIndex }) {
      if (columnIndex === 0 || columnIndex === 4) {
        const field = columnIndex === 0 ? 'category' : 'category';
        const value = row['category'];

        const spanRows = this.tableData.filter(item => item.category === value).length;
        const firstIndex = this.tableData.findIndex(item => item.category === value);

        if (rowIndex === firstIndex) {
          return { rowspan: spanRows, colspan: 1 };
        } else {
          return { rowspan: 0, colspan: 0 };
        }
      }
    }
  }
};
</script>

<style scoped>
.evaluation-form {
  padding: 20px;
  font-family: "Microsoft YaHei", sans-serif;
  line-height: 1.8;
}
.title {
  text-align: center;
  font-size: 22px;
  margin-bottom: 10px;
  font-weight: bold;
}
.info {
  display: flex;
  justify-content: space-between;
  margin-bottom: 20px;
  font-size: 14px;
}
.footer {
  margin-top: 20px;
  text-align: right;
  font-size: 16px;
  font-weight: bold;
}
</style>
