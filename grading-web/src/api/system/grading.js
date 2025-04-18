import request from '@/utils/request'

// 查询考核列表
export function listGrading(query) {
  return request({
    url: '/system/grading/list',
    method: 'get',
    params: query
  })
}

// 查询考核详细
export function getGrading(id) {
  return request({
    url: '/system/grading/' + id,
    method: 'get'
  })
}

// 新增考核
export function addGrading(data) {
  return request({
    url: '/system/grading',
    method: 'post',
    data: data
  })
}

// 修改考核
export function updateGrading(data) {
  return request({
    url: '/system/grading',
    method: 'put',
    data: data
  })
}

// 删除考核
export function delGrading(id) {
  return request({
    url: '/system/grading/' + id,
    method: 'delete'
  })
}
