<template>
  <div>
    <UserRoleTable :roles="userRoles" @grading="handleUserGrading"></UserRoleTable>
  </div>
</template>

<script>

import { grading, getUserGrading} from '@/api/teacher/grading'

// 导入列表查询组件

import UserRoleTable from "@/components/UserRoleTable";

export default {
  name: 'MergedTable',
  components: {UserRoleTable},
  data() {
    return {
      userRoles:["teacher"],
      gradingType:0,
      rawTitles: [],
      sortedTitles: [],
      rawContents: [],
      tableData: [],
      mergeRowMap: {},     // { titleCode: { rowIndex: rowspan, ... } }
      mergeColumnCodes: [] // [titleCode, ...]
    }
  },
  methods: {
    async fetchData() {
      try {
        const response = await axios.post('/api/score/template/preview', {
          templateId: 'your-template-id' // 替换成实际参数
        })

        const {titles, contents} = response.data.data

        this.rawTitles = titles
        this.rawContents = contents

        // 按 sort 排序表头
        this.sortedTitles = [...titles].sort((a, b) => a.sort - b.sort)

        // 设置 mergeRow 和 mergeColumn 标记
        this.mergeColumnCodes = this.rawTitles.filter(t => t.mergeColumn).map(t => t.titleCode)
        const mergeRowCodes = this.rawTitles.filter(t => t.mergeRow).map(t => t.titleCode)

        // 整理表格数据（按 rowId 分组）
        const grouped = {}
        contents.forEach(item => {
          if (!grouped[item.rowId]) grouped[item.rowId] = {}
          grouped[item.rowId][item.titleCode] = item.value
        })

        this.tableData = Object.values(grouped)

        // 构建 mergeRowMap
        this.mergeRowMap = {}
        mergeRowCodes.forEach(code => {
          const map = {}
          let prev = null
          let span = 1

          this.tableData.forEach((row, i) => {
            const val = row[code]
            if (val === prev) {
              map[i - span] = (map[i - span] || 1) + 1
              map[i] = 0
              span++
            } else {
              map[i] = 1
              prev = val
              span = 1
            }
          })

          this.mergeRowMap[code] = map
        })

      } catch (err) {
        this.$message.error('加载失败')
        console.error(err)
      }
    },

    mergeMethod({row, column, rowIndex, columnIndex}) {
      const colCode = this.sortedTitles[columnIndex].titleCode

      // mergeRow
      if (this.mergeRowMap[colCode]) {
        const rowspan = this.mergeRowMap[colCode][rowIndex]
        if (rowspan > 0) return {rowspan, colspan: 1}
        else return {rowspan: 0, colspan: 0}
      }

      // mergeColumn
      if (this.mergeColumnCodes.includes(colCode)) {
        const currentVal = row[colCode]
        let colspan = 1

        // 向右合并
        for (let i = columnIndex + 1; i < this.sortedTitles.length; i++) {
          const nextCode = this.sortedTitles[i].titleCode
          if (
            this.mergeColumnCodes.includes(nextCode) &&
            row[nextCode] === currentVal
          ) {
            colspan++
          } else {
            break
          }
        }

        // 如果不是合并起点，则隐藏
        for (let i = columnIndex - 1; i >= 0; i--) {
          const prevCode = this.sortedTitles[i].titleCode
          if (
            this.mergeColumnCodes.includes(prevCode) &&
            row[prevCode] === currentVal
          ) {
            return {rowspan: 1, colspan: 0}
          } else {
            break
          }
        }

        return {rowspan: 1, colspan}
      }

      return {rowspan: 1, colspan: 1}
    },
    handleUserGrading(row) {
      // 跳转到评价组件或者打开评价对话框
      this.$router.push({
        name: 'gradingTable',
        query: {
          userId: row.userId,
          nickName:row.nickName,
          gradingType: this.gradingType // 使用父组件data中的gradingType
        }
      })
    }
  }
}
</script>
