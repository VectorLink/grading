<template>
  <div class="evaluation-table">
    <h2 class="title">儿童<mark>委员会</mark>评价反馈表</h2>
    <h3>教师姓名</h3>
    <el-table :data="tableData" border style="width: 100%" header-cell-class-name="header-cell">
      <el-table-column prop="label" label="评价内容" width="300"></el-table-column>
      <el-table-column prop="method" label="评价方式" width="400"></el-table-column>
      <el-table-column label="记录栏"></el-table-column>
    </el-table>
  </div>
</template>

<script>
export default {
  name: "ChildFeedback",
  data() {
    return {
      tableData: [
        {
          label: "老师让我最开心的时刻",
          method: "绘画＋口头描述＋关键词记录"
        },
        {
          label: "我最喜欢的一次活动",
          method: "利用贴纸投票等形式统计幼儿结果"
        },
        {
          label: "如果小朋友抢了你的玩具，老师会怎么做？",
          method: "录音等形式记录幼儿原话"
        },
        {
          label: "老师会认真听我说话吗？（笑脸/哭脸）她会怎么回答我？",
          method: "表情统计＋口头描述＋关键词记录"
        },
        {
          label: "如果今天我来做老师，我会…",
          method: "绘画、角色扮演等"
        }
      ]
    };
  }
};
</script>

<style scoped>
.evaluation-table {
  padding: 20px;
  font-family: 'Microsoft YaHei', sans-serif;
}

.title {
  text-align: center;
  font-size: 24px;
  font-weight: bold;
  margin-bottom: 20px;
}

mark {
  background-color: transparent;
  color: black;
  font-weight: bold;
  text-decoration: underline;
}

.header-cell {
  font-weight: bold;
  text-align: center;
}
</style>
