<template>
  <div>
    <UserRoleTable :roles="userRoles" :operation-type=0 @grading="handleUserGrading"></UserRoleTable>
  </div>
</template>

<script>

// 导入列表查询组件
import UserRoleTable from "@/components/UserRoleTable";

export default {
  name: 'TeacherGrading',
  components: {UserRoleTable},
  data() {
    return {
      userRoles: ["teacher"],
      gradingType: 0
    }
  },
  methods: {
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
}
</script>
