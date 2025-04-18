import request from '@/utils/request'

// 查询模板元数据列表
export function listMeta(query) {
  return request({
    url: '/system/meta/list',
    method: 'get',
    params: query
  })
}

// 查询模板元数据详细
export function getMeta(id) {
  return request({
    url: '/system/meta/' + id,
    method: 'get'
  })
}

// 新增模板元数据
export function addMeta(data) {
  return request({
    url: '/system/meta',
    method: 'post',
    data: data
  })
}

// 修改模板元数据
export function updateMeta(data) {
  return request({
    url: '/system/meta',
    method: 'put',
    data: data
  })
}

// 删除模板元数据
export function delMeta(id) {
  return request({
    url: '/system/meta/' + id,
    method: 'delete'
  })
}
