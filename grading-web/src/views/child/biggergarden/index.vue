<template>
  <div class="app-container">
    <h2 class="title">大班幼儿评教表</h2>
    <p class="method">方式：图画、简单符号、选择</p>

    <!-- 表格区域 -->
    <el-table :data="tableData" border style="width: 100%" class="rating-table">
      <el-table-column prop="content" label="评价内容" width="200" />
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
      <li>老师像什么动物（幼儿不喜欢 1 分，幼儿喜欢 2 分）</li>
      <li>我最喜欢的活动（没有 1 分，1-2 个活动 2 分，2 个以上活动 3 分）</li>
      <li>我希望老师…（更温柔一点 1 分，没有变化 2 分，更严格一点 3 分）</li>
      <li>老师，我想对你说（无话可说 1 分，其他 2 分）</li>
    </ol>

    <!-- 实施建议 -->
    <h3>实施建议：</h3>
    <ol>
      <li>小班以非语言表达为主（贴纸、表情、动作模仿为主）；</li>
      <li>大班可以尝试符号记录，尊重幼儿的个体差异；</li>
      <li>结果可视化呈现（如爱心墙、星星榜），让幼儿感受到自己的意见被重视。</li>
    </ol>
  </div>
</template>

<script>
export default {
  name: "biggerGarden",data() {
    return {
      tableData: [
        {
          content: '老师像什么动物',
          method: '绘画或选择（兔子、狮子等）'
        },
        {
          content: '我最喜欢的活动',
          method: '绘画+关键词符号（科学活动、音乐活动等）'
        },
        {
          content: '我希望老师…',
          method: '绘画、符号呈现'
        },
        {
          content: '老师，我想对你说',
          method: '绘画+简单符号记录想对老师说的一些话'
        }
      ]
    }
  }
}
</script>

<style scoped>
.app-container {
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
