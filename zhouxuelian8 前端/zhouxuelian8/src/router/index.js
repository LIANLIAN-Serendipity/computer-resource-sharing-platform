import Vue from 'vue'
import VueRouter from 'vue-router'
import Home from "@/views/Home.vue";
import Backcon from "@/views/Backcon.vue";
import Login from "@/views/Login.vue";
import articleManager from "@/views/articleManager.vue";
import addArticle from "@/views/addArticle.vue";
import userManager from "@/views/userManager.vue";
import article from "@/views/article.vue";
import editArticle from "@/views/editArticle.vue";
import AllArticle from "@/views/AllArticle.vue";
import favoriteManager from "@/views/favoriteManager.vue";


Vue.use(VueRouter)

const routes = [
  {
    path:'/',
    name:'Home',
    component:Home,
  },
  {
    path:'/Backcon',
    name:'Backcon',
    component:Backcon,
    children:[
      {
        path:'/articleManager',
        name:'articleManager',
        component:articleManager
      },
      {
        path:'/addArticle',
        name:'addArticle',
        component:addArticle
      },
      {
        path:'/userManager',
        name:'userManager',
        component:userManager
      },{
        path: '/editArticle',
        name: 'editArticle',
        component: editArticle
      },{
        path: '/favoriteManager',
        name: '/favoriteManager',
        component: favoriteManager,
      }
    ]
  },
  {
    path:'/Login',
    name:'Login',
    component:Login
  },
  {
    path:'/article/:id',
    name:'article',
    component:article
  },{
  path: '/AllArticle',
    name: '/AllArticle',
    component: AllArticle
  },{
  path: '/userManager',
    name: '/userManager',
    component: userManager
  }
]

const router = new VueRouter({
  routes
})

export default router
