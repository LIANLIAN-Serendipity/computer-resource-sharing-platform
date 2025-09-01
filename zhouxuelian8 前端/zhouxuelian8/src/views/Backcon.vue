<template>
    <div>
        <el-container style="height: 900px;border: 1px solid #eee;">
          <el-header style="display: flex; justify-content: space-between; background-color: lavender; padding: 10px 20px; align-items: center;">
            <h2 style="color: #ffa500; margin: 0;">
              <i class="fas fa-university"></i>
              计算机信息资源共享平台后台管理
            </h2>
            <div style="float: right; margin-top: 10px;color:#ffa500">
                您好&nbsp;<i class="el-icon-user"></i>{{ username }}&nbsp;，欢迎登录  &nbsp; &nbsp; &nbsp; &nbsp;
                <el-button type="primary" round @click="backhome" style="margin-left: 10px;margin: 3px;font-size: 12px"><i class="el-icon-refresh-left"></i> &nbsp; 回到主页</el-button> &nbsp;
              <el-button type="danger" round @click="logout" style="margin-left: 10px;margin: 3px;font-size: 12px"><i class="el-icon-unlock"></i> &nbsp;退出登录</el-button>
            </div>
          </el-header>
            <el-container>
              <el-aside width="250px" style="background-color: lavender;">
                    <el-menu :default-active="'2'" class="el-menu-vertical-demo" @open="handleOpen" @close="handleClose" background-color="#ffc0cb" text-color="#fa500" active-text-color="#ffd04b">
                        <el-submenu index="1">
                            <template slot="title">
                                <i class="el-icon-notebook-2"></i>
                                <span>文章管理</span>
                            </template>
                            <router-link to="/articleManager">
                                <el-menu-item index="1-1">
                                    <i class="el-icon-document"></i>
                                    <span>文章管理</span>
                                </el-menu-item>
                            </router-link>
                        </el-submenu>
                      <el-submenu index="2">
                        <template slot="title">
                          <i class="el-icon-user"></i>
                          <span>用户管理</span>
                        </template>
                        <router-link to="/userManager" >
                            <el-menu-item index="2-1" >
                                <i class="el-icon-user"></i>
                                <span>用户管理</span>
                            </el-menu-item>
                        </router-link>
                      </el-submenu>
                      <el-submenu index="3">
                        <template slot="title">
                          <i class="el-icon-collection-tag"></i>
                          <span>收藏管理</span>
                        </template>
                        <router-link to="/favoriteManager" >
                          <el-menu-item index="2-1" >
                            <i class="el-icon-star-on"></i>
                            <span>收藏管理</span>
                          </el-menu-item>
                        </router-link>
                      </el-submenu>
                    </el-menu>
                </el-aside>
                <el-main>
                    <router-view>

                    </router-view>
                </el-main>
            </el-container>
        </el-container>
    </div>
</template>

<script>
export default {
    name: "Backcon",
    data() {
        return {
            username:'',
            activeIndex: '1',
            activeIndex2: '1'
        }
    },
    methods:{
        logout(){
            localStorage.removeItem('token');
            localStorage.removeItem('id');
            localStorage.removeItem('name');
            this.$router.push('/');
        },
        backhome(){
            this.$router.push('/');
        },
    handleOpen(key, keyPath) {
        console.log(key, keyPath);
    },
    handleClose(key, keyPath) {
        console.log(key, keyPath);
    }
    },
    created() {
        this.username=window.localStorage.getItem('name');
    },
    //组件内守卫
    beforeRouteEnter(to,from,next){
        let token=localStorage.getItem('token');
        if(!token)
            next('/login');
        else next();
    }
}
</script>

<style scoped>
/* 去除链接默认下划线 */
a {
  text-decoration: none;
}

/* 标题样式 */
h2 {
  text-align: center;
  font-size: 24px;
  color: #ffa500;
  text-shadow: 2px 2px 2px rgba(0, 0, 0, 0.2);
}

/* 侧边栏菜单样式 */
.el-menu-vertical-demo {
  border: none;
  background-color: lightblue;
  text-color: #ffa500;
}

.el-menu-vertical-demo.el-menu-item {
  height: 40px;
  line-height: 40px;
  padding-left: 20px;
  cursor: pointer;
}

.el-menu-vertical-demo.el-menu-item:hover {
  background-color: #ffffe0;
  transform: scale(1.05);
  /* 轻微缩放效果 */
  transition: all 0.3s ease;
}

.el-menu-vertical-demo.el-submenu__title {
  height: 40px;
  line-height: 40px;
  padding-left: 20px;
  cursor: pointer;
}

.el-menu-vertical-demo.el-submenu__title:hover {
  background-color: #ffffe0;
  transform: scale(1.05);
  transition: all 0.3s ease;
}

/* 主要内容区域样式 */
.el-main {
  background: linear-gradient(to bottom right, #ffffe0, #ffe4e1);
  border-radius: 20px;
}

.el-main:before {
  content: "";
  display: block;
  width: 100px;
  height: 100px;
  border-radius: 50%;
  background-color: rgba(255, 255, 255, 0.5);
  position: absolute;
  top: -30px;
  left: -30px;
  z-index: -1;
}

.el-main {
  animation: fadeIn 1s ease;
}

@keyframes fadeIn {
  from {
    opacity: 0;
  }

  to {
    opacity: 1;
  }
}

/* 头部样式细化 */
.el-header {
  background-color: #ffc0cb;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
}

.el-submenu {
  color: #ffa500;
  font-size: 18px;
}

.el-button {
  background-color: lightpink;
  color: white;
}

</style>

