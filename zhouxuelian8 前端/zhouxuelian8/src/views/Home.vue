<template>
  <div>
    <!-- 头部 -->
    <el-header style="background-color: lavender; overflow: hidden;">
      <el-col :span="5">
        <h1 style="margin: 13px;font-size: 25px;color:lightpink">计算机信息资源共享平台首页</h1>
      </el-col>
      <el-col :span="3">
        <ul>
          <li><el-button type="text"><i class="el-icon-s-home"></i>&nbsp; 首页</el-button></li>
          <li><router-link to="/AllArticle"><el-button type="text"><i class="el-icon-document"></i>&nbsp; 所有文章</el-button></router-link></li>
          <li><router-link to="/userManager"><el-button type="text"><i class="el-icon-link"></i>&nbsp; 个人中心</el-button></router-link></li>
        </ul>
      </el-col>
      <div style="float: right; margin-top: 10px;color:#ffd04b;margin-right:15px">
        <el-button type="success" plain @click="back"><i class="el-icon-data-analysis"></i>&nbsp; 管理博客</el-button>
      </div>
    </el-header>
    <br>
    <!-- 主体区域 -->
    <el-row class="beijing">
      <el-col :span="18">
        <el-card class="box-card" style="margin-left: 50px;height: 1250px">
          <div id="Carousel" class="carousel-container">
            <el-carousel class="carousel">
              <el-carousel-item v-for="item in img" :key="item.src">
                <img :src="item.src" alt="">
              </el-carousel-item>
            </el-carousel>
          </div>
          <div class="articleBox" v-if="articleList.length > 0">
            <div class="articlePair" v-for="(item, index) in articleList" :key="item.id" v-if="index % 2 === 0">
              <el-card class="articleItem box-shadow-top" v-for="(innerItem, innerIndex) in [item, articleList[index + 1]]" :key="innerItem.id">
                <div class="articleInfo">
                  <div class="articleInfo-item">
                    <div class="title-block">
                      <router-link :to="{name:'article', params: {id:innerItem.id}}">
                        <h2 class="xiahuaxian">{{ innerItem.title }}</h2>
                      </router-link>
                    </div>
                    <div class="image-block">
                      <router-link :to="{name:'article', params: {id:innerItem.id}}">
                        <el-image
                            style="width:100%; height: auto;"
                            :src="innerItem.imagePath"
                        ></el-image>
                      </router-link>
                    </div>
                    <div class="author-block">
                      作者：<span>{{ innerItem.author }}</span>
                    </div>
                  </div>
                </div>
              </el-card>
            </div>
          </div>
        </el-card>
      </el-col>
      <!--右侧 -->
      <el-col :span="5" style="margin-left: 30px;width:400px">
        <el-card class="box-card">
          <div slot="header" class="clearfix"><span>友情链接</span></div>
          <div><el-link type="primary" href="https://www.ywsj.cf/">运维世界</el-link></div>
          <div><el-link type="primary" href="https://luckycola.com.cn/public/dist/#/">Luck Cola</el-link></div>
          <div><el-link type="primary" href="https://blog.51cto.com/">51CTO博客</el-link></div>
          <div><el-link type="primary" href="https://www.csdn.net/">CSDN</el-link></div>
          <div><el-link type="primary" href="https://shiyit.com/">拾壹博客</el-link></div>
        </el-card>
        <!--日历组件-->
        <el-card class="box-card">
          <div slot="header" class="clearfix">
            <svg-icon icon-class="calendar"></svg-icon>
            <span>日历</span>
          </div>
          <el-calendar v-model="currentDate" @select="handleDateSelect">
            <template #dateCell="scope">
              <p :class="{'is-today': isToday(scope.date), 'disabled':!scope.isSelected}">{{ scope.date.getDate() }}</p>
            </template>
          </el-calendar>

          <el-button type="text" @click="showYearMonthPicker">选择月份和年份{{ selectedDate }}</el-button>

          <el-dialog
              title="选择年份和月份"
              :visible.sync="yearMonthPickerVisible"
              @close="handleYearMonthPickerClose"
          >
            <el-date-picker
                v-model="selectedDate"
                type="month"
                format="yyyy-MM"
                placeholder="选择月份"
            ></el-date-picker>
            <span slot="footer" class="dialog-footer">
              <el-button @click="handleYearMonthConfirm">确定</el-button>
              <el-button @click="yearMonthPickerVisible = false">取消</el-button>
            </span>
          </el-dialog>
        </el-card>
        <el-card class="box-card">
          <div slot="header" class="clearfix">
            <span>广告</span>
            <el-button style="float: right; padding: 3px 0" type="text"><a href="https://ww2.mathworks.cn/?s_tid=gn_logo>">详情</a> </el-button>
          </div>
          <img src="../assets/ad.png" style="width: 320px;height: 400px;">
        </el-card>
      </el-col>
    </el-row>
  </div>
</template>

<script>
import axios from 'axios';
import moment from 'moment';
export default {
  name: "Home",
  data() {
    return {
      img:[
        {src:require('../assets/ad.jpg')},
        {src:require('../assets/login.jpeg')},
        {src:require('../assets/Loginbg.webp')},
      ],
      currentDate: moment(),
      articleList: [],
      datePickerDialogVisible: false,
      selectedDate: '',
      yearMonthPickerVisible: false,
      selectedYear: moment().year(),
      selectedMonth: moment().month() + 1
    };
  },
  methods: {
    isToday(date) {
      const today = moment();
      return moment(date).isSame(today, 'day');
    },
    handleDateSelect(date) {
      this.selectedDate = moment(date).format('YYYY-MM-DD');
    },
    showYearMonthPicker() {
      this.yearMonthPickerVisible = true;
    },
    handleYearMonthPickerClose() {
      this.yearMonthPickerVisible = false;
    },
    handleYearMonthConfirm() {
      if (this.selectedDate) {
        this.currentDate = moment(this.selectedDate, 'YYYY-MM');
        this.yearMonthPickerVisible = false;
      }
    },
    findAll() {
      this.$axios({
        method: 'get',
        url: 'http://localhost:8089/zhouxuelian8/article/findAll'
      }).then(res => {
        console.log(res.data.dataobject);
        if (Array.isArray(res.data.dataobject)) {
          // 截取前八条数据
          this.articleList = res.data.dataobject.slice(0, 8);
        } else {
          console.error('返回数据格式不正确，期望数组');
        }
      }).catch(err => console.log(err));
    },
    back() {
      this.$router.push('/Backcon').catch(() => {
      });
    }
  },
  created() {
    this.findAll();
  }
}
</script>

<style scoped>
.beijing{
  background: linear-gradient(to bottom right,aliceblue ,white );
}
.box-card{
  background: linear-gradient(to bottom right, #ffffe0, #ffe4e1);
  margin-bottom: 20px;
}
ul {
  list-style: none;
  display: flex;
}
li {
  margin-right: 15px;
}
::v-deep .el-calendar-table .el-calendar-day {
  box-sizing: border-box;
  font-size: 14px;
  padding: 0px;
  height: 20px;
}

.carousel-container {
  width: 100%;
  max-width: 1500px; /* 调整为你想要的最大宽度 */
  margin: 10px auto 0; /* 上边距40px，左右自动（居中） */
}

.carousel {
  width: 100%;
}

.Carousel img {
  width: 100%; /* 图片宽度100%，根据容器宽度调整 */
  height: 600px; /* 设置图片高度为600px */
}
.articleBox {
  display: flex;
  flex-wrap: wrap; /* 允许换行 */
  justify-content: space-between; /* 在行之间均匀分布空间 */
  padding: 10px; /* 内边距 */
}

.articlePair {
  display: flex;
  width: calc(50% - 10px); /* 每对文章占据50%的宽度减去间距 */
  margin-bottom: 20px; /* 底部外边距 */
}

.articleItem {
  flex: 1; /* 每个文章项占据可用空间 */
  margin-right: 20px; /* 右边距 */
  box-shadow: 0 2px 12px rgba(0, 0, 0, 0.1);
}

/* 确保最后一个文章项没有右边距 */
.articleItem:last-child {
  margin-right: 0;
}

.articleInfo-item {
  display: flex;
  flex-direction: column; /* 垂直排列 */
  justify-content: space-between;
  align-items: center;
}
</style>