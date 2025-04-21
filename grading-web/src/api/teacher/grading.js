import request from '@/utils/request'

//获取考核表信息
function getUserGrading(data) {
  return request({
    method: 'post',
    data: data,
    url: '/teacher/grading/getUserGrading'
  })
}

//考核用户

function grading(data) {
  return request({
    url: '/teacher/grading/grading',
    data: data,
    method: 'post'
  })
}
