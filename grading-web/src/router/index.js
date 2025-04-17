import Vue from 'vue'
import Router from 'vue-router'

Vue.use(Router)

/* Layout */
import Layout from '@/layout'

/**
 * Note: 路由配置项
 *
 * hidden: true                     // 当设置 true 的时候该路由不会再侧边栏出现 如401，login等页面，或者如一些编辑页面/edit/1
 * alwaysShow: true                 // 当你一个路由下面的 children 声明的路由大于1个时，自动会变成嵌套的模式--如组件页面
 *                                  // 只有一个时，会将那个子路由当做根路由显示在侧边栏--如引导页面
 *                                  // 若你想不管路由下面的 children 声明的个数都显示你的根路由
 *                                  // 你可以设置 alwaysShow: true，这样它就会忽略之前定义的规则，一直显示根路由
 * redirect: noRedirect             // 当设置 noRedirect 的时候该路由在面包屑导航中不可被点击
 * name:'router-name'               // 设定路由的名字，一定要填写不然使用<keep-alive>时会出现各种问题
 * query: '{"id": 1, "name": "ry"}' // 访问路由的默认传递参数
 * roles: ['admin', 'common']       // 访问路由的角色权限
 * permissions: ['a:a:a', 'b:b:b']  // 访问路由的菜单权限
 * meta : {
    noCache: true                   // 如果设置为true，则不会被 <keep-alive> 缓存(默认 false)
    title: 'title'                  // 设置该路由在侧边栏和面包屑中展示的名字
    icon: 'svg-name'                // 设置该路由的图标，对应路径src/assets/icons/svg
    breadcrumb: false               // 如果设置为false，则不会在breadcrumb面包屑中显示
    activeMenu: '/system/user'      // 当路由设置了该属性，则会高亮相对应的侧边栏。
  }
 */

// 公共路由
export const constantRoutes = [
  {
    path: '/redirect',
    component: Layout,
    hidden: true,
    children: [
      {
        path: '/redirect/:path(.*)',
        component: () => import('@/views/redirect')
      }
    ]
  },
  {
    path: '/login',
    component: () => import('@/views/login'),
    hidden: true
  },
  {
    path: '/register',
    component: () => import('@/views/register'),
    hidden: true
  },
  {
    path: '/404',
    component: () => import('@/views/error/404'),
    hidden: true
  },
  {
    path: '/401',
    component: () => import('@/views/error/401'),
    hidden: true
  },
  {
    path: '',
    component: Layout,
    redirect: 'index',
    children: [
      {
        path: 'index',
        component: () => import('@/views/index'),
        name: 'Index',
        meta: { title: '首页', icon: 'dashboard', affix: true }
      }
    ]
  },
  {
    path: '/user',
    component: Layout,
    hidden: true,
    redirect: 'noredirect',
    children: [
      {
        path: 'profile',
        component: () => import('@/views/system/user/profile/index'),
        name: 'Profile',
        meta: { title: '个人中心', icon: 'user' }
      }
    ]
  },
  {
    path: '/child',
    component: Layout,
    hidden: true,
    redirect: 'noredirect',
    children: [
      {
        path: 'biggerGarden',
        component:()=> import('@/views/child/biggergarden/index'),
        name: 'BiggerGarden',
        meta: {title: '大班幼儿评教表',icon: 'user'}
      },
      {
        path: 'middleGarden',
        component:()=> import('@/views/child/middlegarden/index'),
        name: 'MiddleGarden',
        meta: {title: '中班班幼儿评教表',icon: 'user'}
      },
      {
        path: 'smallGarden',
        component:()=> import('@/views/child/smallgarden/index'),
        name: 'SmallGarden',
        meta: {title: '小班幼儿评教表',icon: 'user'}
      },
      {
        path: 'childFeedback',
        component:()=> import('@/views/child/childfeedback/index'),
        name: 'ChildFeedback',
        meta: {title: '儿童委员会评价反馈表',icon: 'user'}
      },
      {
        path: 'childEvaluationForm',
        component:()=> import('@/views/child/childevaluationform/index'),
        name: 'ChildEvaluationForm',
        meta: {title: '大足区龙岗幼儿园儿童委员会评价表',icon: 'user'}
      }
    ]
  },{
    path: '/expert',
    component: Layout,
    hidden: true,
    redirect: "noredirect",
    children: [
      {
        path: 'expertDoor',
        component:()=> import('@/views/export/door/index'),
        name: 'ExpertDoor',
        meta: {title: '大足区龙岗幼儿园幸福推门听课评分表',icon: 'user'}
      },
      {
        path: 'expertClass',
        component:()=> import('@/views/export/class/index'),
        name: 'ExpertClass',
        meta: {title: '大足区龙岗幼儿园幸福赛课评分表',icon: 'user'}
      }
    ]
  },
  {
    path: '/parents',
    component: Layout,
    hidden: true,
    redirect: "noredirect",
    children: [
      {
        path: 'activities',
        component:()=> import('@/views/parents/activities/index'),
        name: 'Activities',
        meta: {title: '大足区龙岗幼儿园各类活动家长评价检核表',icon: 'user'}
      },
      {
        path: 'childActivities',
        component:()=> import('@/views/parents/childactivities/index'),
        name: 'ChildActivities',
        meta: {title: '重庆市大足区龙岗幼儿园亲子活动家长满意度问卷调查',icon: 'user'}
      },
      {
        path: 'smallerConference',
        component:()=> import('@/views/parents/smallerconference/index'),
        name: 'SmallerConference',
        meta: {title: '重庆市大足区龙岗幼儿园2024小班家长开放日家长满意度问卷调查',icon: 'user'}
      },
      {
        path: 'biggerConference',
        component:()=> import('@/views/parents/biggerconference/index'),
        name: 'BiggerConference',
        meta: {title: '重庆市大足区龙岗幼儿园2024秋季大班家长会家长满意度问卷调查',icon: 'user'}
      },
      {
        path: 'homeVisit',
        component:()=> import('@/views/parents/homevisit/index'),
        name: 'HomeVisit',
        meta: {title: '重庆市大足区龙岗幼儿园教师家访家长满意度问卷调查',icon: 'user'}
      },
    ]
  },{
    path: '/teacher',
    component: Layout,
    redirect: "noredirect",
    hidden: true,
    children: [
      {
        path: 'teacher',
        component:()=> import('@/views/teacher/teacher/index'),
        name: 'Teacher',
        meta: {title: '重庆市大足区龙岗幼儿园教师月绩效考核细则',icon: 'user'}
      },
      {
        path: 'childcareTeacher',
        component:()=> import('@/views/teacher/childcareteacher/index'),
        name: 'ChildcareTeacher',
        meta: {title: '重庆市大足区龙岗幼儿园保育教师月绩效考核细则',icon: 'user'}
      },
      {
        path: 'canteenStaff',
        component:()=> import('@/views/teacher/canteenstaff/index'),
        name: 'CanteenStaff',
        meta: {title: '重庆市大足区龙岗幼儿园食堂人员月绩效考核细则',icon: 'user'}
      },
      {
        path: 'securityGuard',
        component:()=> import('@/views/teacher/securityguard/index'),
        name: 'SecurityGuard',
        meta: {title: '重庆市大足区龙岗幼儿园保安人员工作考核评细',icon: 'user'}
      },
      {
        path: 'morality',
        component:()=> import('@/views/teacher/morality/index'),
        name: 'Morality',
        meta: {title: '重庆市大足区龙岗幼儿园学年度师德师风考核评价表',icon: 'user'}
      }
    ]
  }
]

// 动态路由，基于用户权限动态去加载
export const dynamicRoutes = [
  {
    path: '/system/user-auth',
    component: Layout,
    hidden: true,
    permissions: ['system:user:edit'],
    children: [
      {
        path: 'role/:userId(\\d+)',
        component: () => import('@/views/system/user/authRole'),
        name: 'AuthRole',
        meta: { title: '分配角色', activeMenu: '/system/user' }
      }
    ]
  },
  {
    path: '/system/role-auth',
    component: Layout,
    hidden: true,
    permissions: ['system:role:edit'],
    children: [
      {
        path: 'user/:roleId(\\d+)',
        component: () => import('@/views/system/role/authUser'),
        name: 'AuthUser',
        meta: { title: '分配用户', activeMenu: '/system/role' }
      }
    ]
  },
  {
    path: '/system/dict-data',
    component: Layout,
    hidden: true,
    permissions: ['system:dict:list'],
    children: [
      {
        path: 'index/:dictId(\\d+)',
        component: () => import('@/views/system/dict/data'),
        name: 'Data',
        meta: { title: '字典数据', activeMenu: '/system/dict' }
      }
    ]
  },
  {
    path: '/monitor/job-log',
    component: Layout,
    hidden: true,
    permissions: ['monitor:job:list'],
    children: [
      {
        path: 'index/:jobId(\\d+)',
        component: () => import('@/views/monitor/job/log'),
        name: 'JobLog',
        meta: { title: '调度日志', activeMenu: '/monitor/job' }
      }
    ]
  },
  {
    path: '/tool/gen-edit',
    component: Layout,
    hidden: true,
    permissions: ['tool:gen:edit'],
    children: [
      {
        path: 'index/:tableId(\\d+)',
        component: () => import('@/views/tool/gen/editTable'),
        name: 'GenEdit',
        meta: { title: '修改生成配置', activeMenu: '/tool/gen' }
      }
    ]
  }
]

// 防止连续点击多次路由报错
let routerPush = Router.prototype.push;
let routerReplace = Router.prototype.replace;
// push
Router.prototype.push = function push(location) {
  return routerPush.call(this, location).catch(err => err)
}
// replace
Router.prototype.replace = function push(location) {
  return routerReplace.call(this, location).catch(err => err)
}

export default new Router({
  mode: 'history', // 去掉url中的#
  scrollBehavior: () => ({ y: 0 }),
  routes: constantRoutes
})
