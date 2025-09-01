<template>
  <div>
    <!-- 头部 -->
    <el-header style="background-color: lavender; overflow: hidden;">
      <el-col :span="5">
        <h1 style="margin: 13px;font-size: 25px;color:lightpink">文章列表</h1>
      </el-col>
      <el-col :span="3">
        <ul>
          <li><router-link to="/"><el-button type="text"><i class="el-icon-s-home"></i>&nbsp; 首页</el-button></router-link></li>
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
        <div style="width: 100%; margin-left: 40px;margin-right: 10px">
          <div class="articleBox" v-if="articleList.length > 0">
            <el-card class="articleItem box-shadow-top" v-for="(item, index) in articleList" :key="item.id">
              <div class="articleInfo">
                <div class="articleInfo-item">
                  <div>
                    <router-link :to="{name:'article', params: {id:item.id}}">
                      <h2 class="xiahuaxian">{{ item.title }}</h2>
                    </router-link>
                    <p>
                      {{ item.simpleabstract }}
                    </p>
                  </div>
                  <router-link :to="{name:'article', params: {id:item.id}}" >
                    <div class="articleImgBox" style="">
                      <el-image
                          style="width:250px; height: 150px"
                          :src="item.imagePath"
                      ></el-image>
                    </div>
                  </router-link>
                </div>
              </div>
              <div class="bottumItem">
                <div class="articleUser">
                  作者：<span>{{ item.author }}</span>
                </div>
              </div>
            </el-card>
          </div>
        </div>
      </el-col>
      <!--右侧 -->
      <el-col :span="5" style="margin-left: 70px;width:400px">
        <el-card class="box-card">
          <div id="Carousel" class="carousel-container">
            <el-carousel class="carousel">
              <el-carousel-item v-for="item in img" :key="item.src">
                <img :src="item.src" alt="">
              </el-carousel-item>
            </el-carousel>
          </div>
        </el-card>
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
  name: "AllArticle",
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
      yearMonthPickerVisible: false, // 新增，控制年份月份选择弹窗的显示隐藏
      selectedYear: moment().year(), // 新增，初始化为当前年份，可根据需要调整
      selectedMonth: moment().month() + 1 // 新增，初始化为当前月份（moment 中月份是从 0 开始计数，所以要 +1）
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
        this.articleList = res.data.dataobject;
      }).catch(err => console.log(err));
    },
    back() {
      this.$router.push('/Backcon').catch(() => {});
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
  //background: lightyellow;
  margin-bottom: 20px;
}

ul {
  list-style: none;
  display: flex;
}

li {
  margin-right: 15px;
}

.articleBox {
  font-size: 1rem;
  width: 100%;
  background: linear-gradient(to bottom right, #ffffe0, #ffe4e1);

  .articleItem {
    position: relative;
    padding: 10px 5px 10px 15px;
    margin-bottom: 20px;


    .articleInfo {
      h3 {
        cursor: pointer;
        position: relative;
        display: inline-block;
      }

      p {
        margin-top: 10px;
        overflow: hidden;
        text-overflow: ellipsis;
        display: -webkit-box;
        -webkit-box-orient: vertical;
        -webkit-line-clamp: 3;
      }
    }

  }

  .bottumItem {
    align-items: center;
    display: flex;
    margin-top: 20px;
    flex-wrap: wrap;

    .articleUser {
      line-height: 50px;
    }
  }

}
.articleImgBox {
  width: 250px;
  height: 150px;
  overflow: hidden;
  border: 1px solid ;
  border-radius: 5px;
  margin-left: auto;
  &:hover .articleImg {
    transform: scale(1.1);
  }
  .articleImg {
    width: 100%;
    height: 100%;
    transition: all 0.5s;
  }
}
.articleInfo-item {
  display: flex;
  height: 100px;
  justify-content: space-between;
  .top {
    background-image: -webkit-linear-gradient(0deg, #3ca5f6 0, #a86af9 100%);
    padding-left: 5px;
    padding-right: 5px;
    display: inline-block;
    border-top-right-radius: 5px;
    border-bottom-left-radius: 5px;
    font-size: 0.9rem;
    margin-right: 5px;
    color: #fff;
  }

  h3 {
    cursor: pointer;
    position: relative;
    display: inline-block;
  }

  p {
    margin-top: 10px;
    overflow: hidden;
    text-overflow: ellipsis;
    display: -webkit-box;
    -webkit-box-orient: vertical;
    -webkit-line-clamp: 3;
  }
}
::v-deep .el-calendar-table .el-calendar-day {
  box-sizing: border-box;
  font-size: 14px;
  padding: 0px;
  height: 20px;
}
.carousel-container {
  width: 100%;
  max-width: 1000px; /* 或者你希望的最大宽度 */
  margin: 40px auto 0; /* 上边距20px，左右自动（居中） */
}

.carousel {
  width: 100%;
}

.Carousel img {
  width: 100%;
  height: 100%;
}
</style>