<template>
  <div class="grading-container">
    <h1 class="page-title">重庆市大足区龙岗幼儿园{{ this.gradingName }}</h1>

    <div class="header-area">
      <div class="examiner-info">
        <span class="label">考核人：</span>
        <span class="value">{{ this.nickName }}</span>
      </div>
      <div class="examiner-info">
        <span class="label">考核状态：</span>
        <span class="value">{{ this.gradingStatusName }}</span>
      </div>
      <div class="month-selector">
        <span class="label">考核月份：</span>
        <el-date-picker
          v-model="queryUserQueryParam.yearMonth"
          type="month"
          value-format="yyyyMM"
          placeholder="选择月份"
          class="date-picker"
          @change="fetchData">
        </el-date-picker>
      </div>
      <div class="examiner-info">
        <el-button type="danger" :disabled="gradingStatus !== 1" @click="openGradingDialog">考核</el-button>
      </div>
    </div>

    <div class="table-wrapper">
      <el-table
        v-if="tableData.length"
        :data="tableData"
        border
        :span-method="mergeMethod"
        :header-cell-style="headerCellStyle"
        :cell-style="cellStyle"
        class="grading-table">
        <el-table-column
          v-for="(title, index) in sortedTitles"
          :key="index"
          :label="title.name"
          :prop="title.code"
          align="center"/>
      </el-table>

      <div v-else class="no-data">
        <i class="el-icon-document"></i>
        <p>暂无考核数据</p>
      </div>
    </div>

    <!-- 考核对话框 -->
    <el-dialog
      title="考核评分"
      :visible.sync="gradingDialogVisible"
      width="700px"
      :close-on-click-modal="false">
      <div class="grading-dialog-content">
        <el-table
          :data="gradingScores"
          border
          :span-method="gradingTableSpanMethod"
          class="grading-scores-table">
          <el-table-column prop="gradingName" label="评价项" align="center"></el-table-column>
          <el-table-column prop="userName" label="评价人" align="center"></el-table-column>
          <el-table-column prop="title" label="评价内容" align="center"></el-table-column>
          <el-table-column label="分值" align="center" width="120">
            <template slot-scope="scope">
              <el-input-number
                v-model="scope.row.score"
                :min="0"
                :max="100"
                size="small"
                controls-position="right">
              </el-input-number>
            </template>
          </el-table-column>
        </el-table>
      </div>
      <span slot="footer" class="dialog-footer">
        <el-button @click="gradingDialogVisible = false">取 消</el-button>
        <el-button type="primary" @click="submitGrading">提 交</el-button>
      </span>
    </el-dialog>
  </div>
</template>

<script>
import {grading, getUserGrading} from '@/api/teacher/grading'

export default {
  name: 'GradingTable',
  data() {
    const now = new Date()
    const year = now.getFullYear()
    const month = (now.getMonth() + 1).toString().padStart(2, '0')
    const defaultMonth = `${year}${month}`
    return {
      queryUserQueryParam: {
        yearMonth: defaultMonth,
        userId: null,
        type: null
      },
      rawTitles: [],
      sortedTitles: [],
      rawContents: [],
      tableData: [],
      mergeRowMap: {},
      mergeColumnCodes: [],
      nickName: "",
      gradingName: "",
      gradingStatus: null,
      gradingStatusName: '',
      scores: [],
      gradingDialogVisible: false,
      gradingScores: [],
      gradingRowMergeMap: {},
      gradingId: null
    }
  },
  methods: {
    async fetchData() {
      try {
        this.$loading({
          lock: true,
          text: '加载考核数据中...',
          spinner: 'el-icon-loading',
          background: 'rgba(255, 255, 255, 0.7)'
        })

        getUserGrading(this.queryUserQueryParam).then(
          response => {
            const {titles, contents} = response.data
            this.rawTitles = titles
            this.rawContents = contents
            this.gradingName = response.data.gradingName
            this.gradingStatus = response.data.gradingStatus
            this.gradingStatusName = response.data.gradingStatusName
            this.scores = response.data.scores
            this.gradingId = response.data.gradingId
            // 按 sort 排序表头
            this.sortedTitles = [...titles].sort((a, b) => a.sort - b.sort)

            // 设置 mergeRow 和 mergeColumn 标记
            this.mergeColumnCodes = this.rawTitles.filter(t => t.mergeColumn).map(t => t.titleCode)
            const mergeRowCodes = this.rawTitles.filter(t => t.mergeRow).map(t => t.titleCode)

            // 整理表格数据（按 rowId 分组）
            const grouped = {}
            contents.forEach(item => {
              if (!grouped[item.rowId]) {
                grouped[item.rowId] = {}
              }
              grouped[item.rowId][item.titleCode] = item.content
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

            this.$loading().close()
          }
        ).catch(() => {
          this.$loading().close()
          this.$message.error('加载考核数据失败')
        })
      } catch (err) {
        this.$loading().close()
        this.$message.error('系统错误，请稍后重试')
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

    // 表头单元格样式
    headerCellStyle() {
      return {
        backgroundColor: '#f5f7fa',
        color: '#303133',
        fontWeight: 'bold',
        fontSize: '14px',
        padding: '12px 0'
      }
    },

    // 内容单元格样式
    cellStyle() {
      return {
        fontSize: '14px',
        padding: '8px 4px'
      }
    },

    // 打开考核对话框
    openGradingDialog() {
      this.gradingScores = JSON.parse(JSON.stringify(this.scores || []))

      // 处理考核表格合并单元格
      this.processGradingTableMerge()

      this.gradingDialogVisible = true
    },

    // 处理考核表格合并单元格
    processGradingTableMerge() {
      const titleMap = {}
      const userMap = {}

      // 初始化合并信息
      this.gradingRowMergeMap = {
        gradingName: {},
        userName: {}
      }

      // 构建合并信息
      this.gradingScores.forEach((item, index) => {
        // 处理 title 列合并
        if (!titleMap[item.gradingName]) {
          titleMap[item.gradingName] = { startIndex: index, count: 1 }
        } else {
          titleMap[item.gradingName].count++
        }

        // 处理 userName 列合并
        const userKey = `${item.gradingName}_${item.userName}`
        if (!userMap[userKey]) {
          userMap[userKey] = { startIndex: index, count: 1 }
        } else {
          userMap[userKey].count++
        }
      })

      // 设置 title 列的合并信息
      Object.values(titleMap).forEach(info => {
        if (info.count > 1) {
          this.gradingRowMergeMap.gradingName[info.startIndex] = info.count
          for (let i = 1; i < info.count; i++) {
            this.gradingRowMergeMap.gradingName[info.startIndex + i] = 0
          }
        } else {
          this.gradingRowMergeMap.gradingName[info.startIndex] = 1
        }
      })

      // 设置 userName 列的合并信息
      Object.values(userMap).forEach(info => {
        if (info.count > 1) {
          this.gradingRowMergeMap.userName[info.startIndex] = info.count
          for (let i = 1; i < info.count; i++) {
            this.gradingRowMergeMap.userName[info.startIndex + i] = 0
          }
        } else {
          this.gradingRowMergeMap.userName[info.startIndex] = 1
        }
      })
    },

    // 考核表格合并单元格方法
    gradingTableSpanMethod({ row, column, rowIndex, columnIndex }) {
      if (columnIndex === 0) { // 评价项列
        const rowspan = this.gradingRowMergeMap.gradingName[rowIndex]
        if (rowspan !== undefined) {
          return {
            rowspan: rowspan,
            colspan: rowspan === 0 ? 0 : 1
          }
        }
        return { rowspan: 1, colspan: 1 }
      } else if (columnIndex === 1) { // 评价人列
        const rowspan = this.gradingRowMergeMap.userName[rowIndex]
        if (rowspan !== undefined) {
          return {
            rowspan: rowspan,
            colspan: rowspan === 0 ? 0 : 1
          }
        }
        return { rowspan: 1, colspan: 1 }
      }
      return { rowspan: 1, colspan: 1 }
    },

    // 提交考核
    submitGrading() {
      const submitData = {
        gradingId: this.gradingId,
        scores: this.gradingScores.map(item => ({
          contentDetailId: item.contentId,
          score: item.score
        }))
      }

      this.$confirm('确认提交考核评分？', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        this.$loading({
          lock: true,
          text: '提交考核数据中...',
          spinner: 'el-icon-loading',
          background: 'rgba(255, 255, 255, 0.7)'
        })

        grading(submitData).then(response => {
          this.$loading().close()
          this.$message.success('考核评分提交成功')
          this.gradingDialogVisible = false
          this.fetchData() // 重新加载数据
        }).catch(() => {
          this.$loading().close()
          this.$message.error('考核评分提交失败')
        })
      }).catch(() => {
        // 取消提交
      })
    }
  },

  created() {
    this.queryUserQueryParam.userId = this.$route.query.userId
    this.queryUserQueryParam.type = this.$route.query.gradingType
    this.nickName = this.$route.query.nickName
    this.fetchData()
  }
}
</script>

<style scoped>
.grading-container {
  padding: 20px;
  background-color: #fff;
  box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.1);
  border-radius: 4px;
}

.page-title {
  text-align: center;
  color: #303133;
  font-size: 22px;
  margin-bottom: 30px;
  font-weight: bold;
}

.header-area {
  display: flex;
  justify-content: space-between;
  margin-bottom: 20px;
  padding: 0 10px;
}

.examiner-info, .month-selector {
  display: flex;
  align-items: center;
}

.label {
  font-weight: 500;
  color: #606266;
  margin-right: 5px;
}

.value {
  color: #303133;
  font-weight: bold;
}

.date-picker {
  width: 180px;
}

.table-wrapper {
  margin-top: 20px;
}

.grading-table {
  width: 100%;
  border-radius: 4px;
  overflow: hidden;
}

.no-data {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  padding: 40px 0;
  color: #909399;
}

.no-data i {
  font-size: 48px;
  margin-bottom: 10px;
}

/* 评分对话框样式 */
.grading-dialog-content {
  max-height: 500px;
  overflow-y: auto;
}

.grading-scores-table {
  width: 100%;
}
</style>
