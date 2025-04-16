<template>
  <div class="app-container home">
    <h2>重庆市大足区龙岗幼儿园（简介）</h2>
    <p>
      重庆市大足区龙岗幼儿园（为方便描述，有时简称幼儿园）龙岗幼儿园创建于1957年，建园初期名为大足县机关托儿所，先后更名为“大足县机关幼儿园”“大足县龙岗镇第二幼儿园”“大足县龙岗幼儿园”，从2011年起正式命名为“大足区龙岗幼儿园”。2021年11月，组建为“集团化办学紧密型教育集团”。目前，龙岗幼儿园一园三址，分别是位于龙岗街道的学坝园区和文峰园区、位于棠香街道的圣玺府园区，三个园区总建筑面积约8000平方米，办园规模为27个班。现有幼儿近800名、教职工106人，其中在编教职工32人。2024年10月组建为“名园+”联盟型教育集团，集团还有分布在各乡镇的高新区幼儿园、三驱镇中心幼儿园、金山镇中心幼儿园、玉龙镇中心幼儿园等四所成员园，一园七园的紧密集团化运作、均衡化配置、个性化发展管理模式，开创了适应时代发展的幼儿园集团化管理新模式。
      幼儿园以办一所人民满意的办园集团化、理念科学化、队伍精良化、保教品质化“四化”精品幼儿园为目标，秉承“心中有阳光
      脚下有力量”的园训，践行“播撒幸福的种子”的教育理念，形成“每颗种子蓬勃向上、每位园丁幸福自豪、每个角落洋溢欢笑”的园风，“立信心、守初心、增慧心、塑匠心、护童心”的教风，着力打造以大足区本土文化为主的“我是大足娃”园本课程，实现在每一个龙幼人身上都镌刻红色基因、大足元素、龙幼印记，为“打造成渝双城经济圈中部教育中心”做出新的更卓越的贡献。幼儿园先后先后荣获了“重庆市巾帼文明示范岗”“重庆市家长学校示范校”“重庆市家庭教育先进单位”“重庆市家庭教育创新实践基地”“重庆市幼儿教育先进集体”“重庆市学前优秀教研组”“重庆市安全知识网络竞赛学校组织奖、优秀校长奖、优秀管理员奖”“巴蜀文化旅游走廊——大足石刻华服volg大赛优秀奖”“区级文明单位”“五好基层关工委”“大足区生活垃圾分类示范学校”“大足区儿童青少年近视防控示范学校”“大足区绿色学校”“大足区先进职工之家”“技装工作优秀集体”“最美幼儿园”“五好退教协”等市级、区级荣誉。
    </p>
    <el-divider/>
    <el-row :gutter="20">
      <el-col :sm="24" :lg="12" style="padding-left: 20px">
        <h2>历史变革</h2>
        <p>
          重庆市大足区龙岗幼儿园于1957年建园，历经近百年的发展变迁，具体历史变革见图
        </p>
        <el-image
          :src="historyImg"
          :fit="cover"></el-image>
      </el-col>
      <el-col :sm="24" :lg="12" style="padding-left: 20px">
        <h2>组织机构</h2>
        <p>
          重庆市大足区龙岗幼儿园的组织机构见图
        </p>
        <el-image
          :src="organImg"
          :fit="cover"></el-image>
      </el-col>
    </el-row>
  </div>
</template>

<script>
export default {
  name: "Index",
  data() {
    return {
      // 版本号
      historyImg: require("@/assets/images/history.png"),
      organImg: require("@/assets/images/organ.png")
    };
  },
  methods: {
    goTarget(href) {
      window.open(href, "_blank");
    }
  }
};
</script>

<style scoped lang="scss">
.home {
  blockquote {
    padding: 10px 20px;
    margin: 0 0 20px;
    font-size: 17.5px;
    border-left: 5px solid #eee;
  }
  hr {
    margin-top: 20px;
    margin-bottom: 20px;
    border: 0;
    border-top: 1px solid #eee;
  }
  .col-item {
    margin-bottom: 20px;
  }

  ul {
    padding: 0;
    margin: 0;
  }

  font-family: "open sans", "Helvetica Neue", Helvetica, Arial, sans-serif;
  font-size: 13px;
  color: #676a6c;
  overflow-x: hidden;

  ul {
    list-style-type: none;
  }

  h4 {
    margin-top: 0px;
  }

  h2 {
    margin-top: 10px;
    font-size: 26px;
    font-weight: bold;
    text-align: center;
  }

  p {
    margin-top: 10px;
    text-indent: 2em;

    b {
      font-weight: 700;
    }
  }

}
</style>

