import request from '@/utils/request'

// 查询考核内容值列表
export function listContent(query) {
  return request({
    url: '/system/content/list',
    method: 'get',
    params: query
  })
}

// 查询考核内容值详细
export function getContent(id) {
  return request({
    url: '/system/content/' + id,
    method: 'get'
  })
}

// 新增考核内容值
export function addContent(data) {
  return request({
    url: '/system/content',
    method: 'post',
    data: data
  })
}

// 修改考核内容值
export function updateContent(data) {
  return request({
    url: '/system/content',
    method: 'put',
    data: data
  })
}

// 删除考核内容值
export function delContent(id) {
  return request({
    url: '/system/content/' + id,
    method: 'delete'
  })
}
