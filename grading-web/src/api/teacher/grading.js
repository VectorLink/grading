import request from '@/utils/request'

//获取考核表信息
export function getUserGrading(data) {
  return request({
    method: 'post',
    data: data,
    url: '/teacher/getUserGrading'
  })
}

//考核用户

export function grading(data) {
  return request({
    url: '/teacher/grading',
    data: data,
    method: 'post'
  })
}
