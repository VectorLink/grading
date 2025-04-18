import request from '@/utils/request'

// 查询评价内容列表
export function listRel(query) {
  return request({
    url: '/system/rel/list',
    method: 'get',
    params: query
  })
}

// 查询评价内容详细
export function getRel(id) {
  return request({
    url: '/system/rel/' + id,
    method: 'get'
  })
}

// 新增评价内容
export function addRel(data) {
  return request({
    url: '/system/rel',
    method: 'post',
    data: data
  })
}

// 修改评价内容
export function updateRel(data) {
  return request({
    url: '/system/rel',
    method: 'put',
    data: data
  })
}

// 删除评价内容
export function delRel(id) {
  return request({
    url: '/system/rel/' + id,
    method: 'delete'
  })
}
