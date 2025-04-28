<template>
  <div class="evaluation-form">
    <UserRoleTable :roles="userRoles" :operation-type=1 @grading="handleUserGrading"></UserRoleTable>
    <router-view></router-view>
  </div>
</template>

<script>
import UserRoleTable from "@/components/UserRoleTable";

export default {
  components: {UserRoleTable},
  data() {
    return {
      userRoles: ["childteacher", "teacher"],
    };
  },
  methods: {
    handleUserGrading(row) {
      console.log("==============")
      // 跳转到评价组件或者打开评价对话框
      this.$router.push({
        name: 'activitiesDetail',
        query: {
          userId: row.userId,
          nickName: row.nickName
        }
      })
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
</style>
