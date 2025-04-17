<template>
  <div class="preschool-evaluation">
    <h2>小班幼儿评教表</h2>

    <p><strong>方式：</strong>指认图片、贴贴纸、模仿动作</p>

    <el-table :data="tableData" border style="width: 100%">
      <el-table-column prop="内容" label="评价内容" width="160"/>
      <el-table-column prop="方式" label="评价方式"/>
      <el-table-column prop="记录" label="记录栏"/>
    </el-table>

    <div class="scoring">
      <h3>评分标准：</h3>
      <ul>
        <li>我喜欢的老师（<strong>2 分</strong>）</li>
        <li>
          老师陪我玩（
          一颗星星/笑脸 1 分，两颗星星/笑脸 2 分，三颗星星/笑脸 3 分）
        </li>
        <li>
          老师会抱抱我（
          没有拥抱 1 分，短暂拥抱 2 分，温柔拥抱/幼儿主动拥抱 3 分）
        </li>
        <li>老师讲的故事好听吗（不好听 1 分，好听 2 分）</li>
      </ul>
    </div>
  </div>
</template>

<script>
export default {
  name: 'SmallGarden',
  data() {
    return {
      tableData: [
        { 内容: '我喜欢的老师', 方式: '指认照片', 记录: '' },
        { 内容: '老师陪我玩', 方式: '贴星星/贴笑脸或哭脸', 记录: '' },
        { 内容: '老师会抱抱我', 方式: '模仿老师安慰时/帮助时的动作', 记录: '' },
        { 内容: '老师讲的故事好听吗', 方式: '好听（笑脸）/不好听（哭脸）', 记录: '' }
      ]
    }
  }
}
</script>

<style scoped>
.preschool-evaluation {
  padding: 20px;
  font-family: 'Microsoft YaHei', sans-serif;
}

.scoring {
  margin-top: 20px;
}

ul {
  padding-left: 1.2em;
}
</style>
