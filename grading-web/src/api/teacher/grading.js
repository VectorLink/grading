import request from '@/utils/request'
import {parseStrEmpty} from "@/utils/ruoyi";

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

//获取考核成绩表
export function getGradingScore(gradingId) {
  return request({
    url: '/teacher/getGradingScore/' + parseStrEmpty(gradingId),
    method: 'get'
  })
}

// 获取问卷
export function getQuestionnaire(data) {
  return request({
    url: '/teacher/getQuestionnaire',
    data: data,
    method: 'post'
  })
}

// 提交问卷
export function submitQuestionnaire(data) {
  return request({
    url: '/teacher/submitQuestionnaire',
    data: data,
    method: 'post'
  })
}
