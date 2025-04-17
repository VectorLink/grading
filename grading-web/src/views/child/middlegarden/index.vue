<template>
  <div class="app">
    <h2 class="title">中班幼儿评教表</h2>
    <p class="method">方式：涂色评分、简单选择</p>

    <!-- 表格区域 -->
    <el-table :data="tableData" border style="width: 100%" class="rating-table">
      <el-table-column prop="content" label="评价内容" width="220" />
      <el-table-column prop="method" label="评价方式" />
      <el-table-column label="记录栏" width="100">
        <template slot-scope="scope">
          <el-button icon="el-icon-plus" type="text" />
        </template>
      </el-table-column>
    </el-table>

    <!-- 评分标准 -->
    <h3>评分标准：</h3>
    <ol>
      <li>我喜欢的老师（
        一颗星星 <strong>0 分</strong>，两颗星星 <strong>1 分</strong>，三颗星星 <strong>2 分</strong>）
      </li>
      <li>老师最有趣的时候（
        无趣 <strong>1 分</strong>，偶尔有趣 <strong>2 分</strong>，什么时候都有趣 <strong>3 分</strong>）
      </li>
      <li>老师的帮助：我伤心的时候，老师会…
        （没有反应 <strong>1 分</strong>，短暂安慰 <strong>2 分</strong>，主动安慰 <strong>3 分</strong>）
      </li>
      <li>我想对老师说（无话可说 <strong>1 分</strong>，其他 <strong>2 分</strong>）</li>
    </ol>
  </div>
</template>

<script>
export default {
  name: 'MiddleGarden',
  data() {
    return {
      tableData: [
        {
          content: '我喜欢的老师',
          method: '涂星星评价（1–3 颗星星）'
        },
        {
          content: '老师最有趣的时候',
          method: '老师带我们玩____'
        },
        {
          content: '老师的帮助：我伤心的时候，老师会…',
          method: '选择：抱抱我 / 擦眼泪 / ____'
        },
        {
          content: '我想对老师说',
          method: '幼儿口述，教师录音+记录'
        }
      ]
    }
  }
}
</script>

<style scoped>
.app {
  padding: 20px;
  font-family: "Microsoft YaHei", sans-serif;
}
.title {
  text-align: center;
  font-size: 22px;
  font-weight: bold;
  margin-bottom: 10px;
}
.method {
  text-align: center;
  font-size: 14px;
  margin-bottom: 20px;
}
.rating-table {
  margin-bottom: 30px;
}
h3 {
  font-size: 16px;
  margin-top: 20px;
}
ol {
  padding-left: 20px;
}
ol li {
  line-height: 1.8;
  font-size: 14px;
}
</style>
