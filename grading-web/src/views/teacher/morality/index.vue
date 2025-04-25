// HTML Template
<template>
  <div>
    <UserRoleTable :roles="userRoles" :operation-type=0 @grading="handleUserGrading"></UserRoleTable>
  </div>
</template>

<script>
import UserRoleTable from "@/components/UserRoleTable";

export default {
  name: 'Morality',
  components: {UserRoleTable},
  data() {
    return {
      userRoles: ["childteacher", "teacher"],
      gradingType: 4
    };
  }, methods: {
    handleUserGrading(row) {
      // 跳转到评价组件或者打开评价对话框
      this.$router.push({
        name: 'gradingTable',
        query: {
          userId: row.userId,
          nickName: row.nickName,
          gradingType: this.gradingType // 使用父组件data中的gradingType
        }
      })
    }
  }
};
</script>

<style scoped>

</style>
