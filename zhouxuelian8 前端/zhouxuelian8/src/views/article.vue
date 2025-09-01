<template>
  <div class="article-container container">
    <!-- 文章信息 -->
    <el-card class="article" id="articleBox">
      <h1 class="article-title">
        {{ article.title }}
      </h1>
      <div class="article-desc">
        <div class="article-item">
          <div class="meta">
            <div class="author">
              <span class="text textItem">
                <i class="el-icon-user-solid"></i> 作者：{{ article.author }}
              </span> &nbsp;&nbsp;&nbsp;
              <span class="text textItem">
                <i class="el-icon-time"></i> {{ article.publishDate }}
              </span>
            </div>
            <div v-html="article.content"></div>
          </div>
        </div>
      </div>
      <br><br>
      <!-- 版权 -->
      <div class="copyright">
        <div class="copyrightItem">
          <svg-icon icon-class="xkxy"></svg-icon>
          <span class="text name":style="{ color: userId? 'black' : 'gray' }">许可协议:</span>
          <span class="text">
            本平台所有文章除特别声明外，均采用
            <a class="text" href="https://creativecommons.org/licenses/by-nc-sa/4.0/">CC  BY-NC-SA 4.0</a>
            许可协议。转载请注明文章出处。
          </span>
        </div>
        <svg-icon class="yuan" icon-class="yuan"></svg-icon>
      </div>
      <el-button
          type="success"
          @click="handleFavoriteClick"
          :icon="isFavorite? 'el-icon-star-on' : 'el-icon-star-off'"
      >
        {{ isFavorite? '已收藏' : '收藏' }}
      </el-button>
    </el-card>
  </div>
</template>

<script>
import axios from 'axios';
import moment from'moment';
export default {
  data() {
    return {
      article: {
        title: '',
        author: '',
        publishDate: '',
        content: ''
      },
      userId: null,
      isFavorite: false,
      favoriteId: null
    };
  },
  methods: {
    findArticleById() {
      const articleId = this.$route.params.id;
      axios.get(`http://localhost:8089/zhouxuelian8/user/article/findArticleById/${articleId}`)
          .then(res => {
            this.article = res.data.dataobject;
          })
          .catch(err => {
            console.log(err);
          });
    },
    getCurrentUserId() {
      const id = localStorage.getItem('id');
      if (id) {
        this.userId = id;
      }
      return this.userId;
    },
    getArticleId() {
      return this.$route.params.id;
    },
    checkFavoriteStatus() {
      const userId = this.getCurrentUserId();
      const articleId = this.$route.params.id;
      if (userId) {
        axios.get(`http://localhost:8089/zhouxuelian8/favorite/findById1/${userId}`)
            .then(res => {
              const favorites = res.data.dataobject;
              const isFaved = favorites.some(fav => fav.articleId === Number(articleId));
              if (isFaved) {
                this.isFavorite = true;
                const targetFav = favorites.find(fav => fav.articleId === Number(articleId));
                this.favoriteId = targetFav.id;
              }
            })
            .catch(err => {
              console.log(err);
            });
      }
    },
    handleFavoriteClick() {
      const userId = this.getCurrentUserId();
      const articleId = this.$route.params.id;
      if (!userId) {
        this.$router.push('/Login');
        return;
      }
      this.toggleFavorite();
    },
    toggleFavorite() {
      const userId = this.getCurrentUserId();
      const articleId = this.$route.params.id;
      if (this.isFavorite && this.favoriteId) {
        axios.get(`http://localhost:8089/zhouxuelian8/favorite/delById/${this.favoriteId}`)
            .then(res => {
              if (res.data.code === 2000) {
                this.isFavorite = false;
                this.favoriteId = null;
                this.$message.success(res.data.msg);
                this.$router.push('/ALLArticle');
              } else {
                this.$message.error('取消收藏失败');
              }
            })
            .catch(err => {
              console.error('Error toggling favorite:', err);
              this.$message.error('取消收藏操作失败，请检查网络或联系管理员');
            });
      } else {
        axios.post('http://localhost:8089/zhouxuelian8/favorite/add', {
          userId: userId,
          articleId: articleId,
          createAt: moment(new Date()).format('YYYY-MM-DD HH:mm:ss')
        })
            .then(res => {
              if (res.data.code === 2000) {
                this.isFavorite = true;
                this.$message.success(res.data.msg);
                this.$router.push('/ALLArticle');
              } else {
                this.$message.error('收藏失败');
              }
            })
            .catch(err => {
              console.error('Error toggling favorite:', err);
              this.$message.error('收藏操作失败，请检查网络或联系管理员');
            });
      }
    }
  },
  created() {
    this.findArticleById();
    this.checkFavoriteStatus();
  }
};
</script>

<style scoped>
.container {
  background: linear-gradient(to bottom right, #ffffe0, #ffe4e1);
}

.articleBox {
  background: linear-gradient(to bottom right, #ffffe0, #ffe4e1);
}

.article-actions {
  margin: 20px 0;
}

.comments {
  margin-top: 20px;
}

textarea {
  width: 100%;
  height: 100px;
  margin-bottom: 10px;
}
</style>