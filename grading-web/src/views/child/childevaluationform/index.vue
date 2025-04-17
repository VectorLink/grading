<template>
  <div class="evaluation-table">
    <h2>大足区龙岗幼儿园儿童委员会评价表</h2>
    <p><strong>一、目标：</strong> 通过集体讨论、绘画、游戏等方式，收集幼儿对教师的真实感受。</p>
    <p><strong>二、对象：</strong> 儿童委员会成员。</p>

    <el-table :data="tableData" border style="width: 100%">
      <el-table-column prop="维度" label="评价维度" width="150"/>
      <el-table-column prop="引导" label="问题引导"/>
      <el-table-column prop="记录方式" label="记录方式"/>
      <el-table-column prop="意义" label="意义"/>
    </el-table>

    <div class="scoring">
      <h3>三、评分标准</h3>
      <p>小班：情感支持*30% + 教师公平性*20% + 教师对幼儿的需求回应*20% + 教学趣味性*20% + 幼儿的建议*10% = 100%</p>
      <p>中班/大班类似，仅权重略有不同。</p>
    </div>

    <div class="suggestion">
      <h3>四、实施建议</h3>
      <ol>
        <li>由非班级教师主持，避免幼儿不敢表达；</li>
        <li>结果以“儿童观察报告”形式反馈，避免直接打分，强调质性分析。</li>
      </ol>
    </div>
  </div>
</template>

<script>
export default {
  name: 'ChildEvaluationForm',
  data() {
    return {
      tableData: [
        {
          维度: '情感支持',
          引导: '“画出老师让我最开心的时刻”',
          记录方式: '绘画＋口头描述＋关键词记录',
          意义: '了解教师对幼儿的情感关怀'
        },
        {
          维度: '教学趣味性',
          引导: '投票：我最喜欢的一次活动（故事/游戏/手工/音乐等）',
          记录方式: '利用贴纸投票等形式统计幼儿结果',
          意义: '反映教师教学方式的吸引力'
        },
        {
          维度: '教师公平性',
          引导: '提某种情境：“如果小朋友抢了你的玩具，老师会怎么做？”',
          记录方式: '录音等形式记录幼儿原话',
          意义: '考察教师对待幼儿是否公平'
        },
        {
          维度: '教师对幼儿的需求回应',
          引导: '“举牌子游戏”，老师会认真听我说话吗？（笑脸/哭脸）她会怎么回答我？',
          记录方式: '表情统计＋口头描述＋关键词记录',
          意义: '评估教师的倾听与回应能力'
        },
        {
          维度: '幼儿的建议',
          引导: '“如果今天我来做老师，我会...”',
          记录方式: '绘画、角色扮演等',
          意义: '激发幼儿的自主表达，记录幼儿最真实的想法，促进教师反思'
        }
      ]
    }
  }
}
</script>

<style scoped>
.evaluation-table {
  padding: 20px;
  font-family: 'Microsoft YaHei', sans-serif;
}

.scoring, .suggestion {
  margin-top: 20px;
}
</style>
