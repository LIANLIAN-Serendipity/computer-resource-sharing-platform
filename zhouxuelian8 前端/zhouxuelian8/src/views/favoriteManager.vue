<template>
  <div>
    <h1 class="h1">用户收藏详细列表</h1>
    <el-card class="box-card">
      <el-table :data="favorites" style="width: 100%">
        <el-table-column prop="id" label="ID" width="150"></el-table-column>
        <el-table-column prop="user.name" label="用户名" width="150"></el-table-column>
        <el-table-column prop="article.title" label="文章标题" width="500"></el-table-column>
        <el-table-column prop="article.author" label="作者" width="150"></el-table-column>
        <el-table-column prop="createAt" label="收藏时间" width="200"></el-table-column>
        <el-table-column label="操作">
          <template v-slot="scope">
            <el-button size="mini" type="danger" round @click="handleDelete(scope.$index, scope.row)"><i class="el-icon-delete"></i>取消收藏</el-button>
          </template>
        </el-table-column>
      </el-table>

    </el-card>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  name: 'favoriteManager',
  data() {
    return {
      condition:{},
      favorites: [],
      // currentPage: 1,
      // pageSize: 8,
      // total: 10,
      userId:null,
      dialogFormVisible: false,
    };
  },
  methods: {
    handleDelete(index, row) {
      this.$confirm('此操作将取消收藏该文章, 是否继续?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        // 删除用户 row.id
        this.$axios({
          method: 'get',
          url: 'http://localhost:8089/zhouxuelian8/favorite/delById/' + row.id
        }).then(res => {
          this.getFavorite();
          this.$message({
            type: 'success',
            message: res.data.msg
          });
        }).catch(err => console.log(err));

      }).catch(() => {
        this.$message({
          type: 'info',
          message: '已取消'
        });
      });
    },
    getFavorite() {
      if (!this.userId) {
        this.$message.error('用户ID未定义');
        return;
      }
      this.$axios({
        method: 'get',
        url: `http://localhost:8089/zhouxuelian8/favorite/findById1/${this.userId}`
      }).then(response => {
        if (response.data && response.data.dataobject) {
          this.favorites = response.data.dataobject; // 确保数据是一个数组
        } else {
          console.error('Invalid response structure:', response);
          this.$message.error('后端返回数据结构不正确');
          this.favorites = []; // 确保在错误情况下清空地址数组
        }
      }).catch(error => {
        console.error('Error fetching data:', error);
        this.$message.error('获取数据失败，请检查网络或联系管理员');
        this.favorites = []; // 确保在错误情况下清空地址数组
      });
    },
  },
  created() {
    this.userId = window.localStorage.getItem('id');
    console.log('UID:', this.userId);
    if (this.userId) {
      this.getFavorite();
    }
  }
};
</script>

<style scoped>
.box-card {
  margin: 20px;
  padding: 20px;
  background-color: #f9f9f9;
  border-radius: 8px;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

h1 {
  text-align: center;
  font-size: 32px;
  color: #333;
  margin-bottom: 20px;
}

.el-card {
  border: none;
}

.el-table {
  width: 100%;
  border-collapse: collapse;
  border: 1px solid #ebeef5;
}

.el-table th, .el-table td {
  border: 1px solid #ebeef5;
  text-align: center; /* 水平居中 */
  vertical-align: middle; /* 垂直居中 */
}

.el-table th {
  background-color: #f2f2f2;
  color: #333;
  font-weight: bold;
}

.filter-item {
  margin-right: 10px;
  padding: 5px 10px;
  border: 1px solid #dcdfe6;
  border-radius: 4px;
  transition: border-color 0.3s;
}

.filter-item:focus {
  border-color: #409eff;
}

.el-button {
  margin-right: 10px;
  padding: 8px 15px;
  border-radius: 4px;
}

.el-button i {
  margin-right: 5px;
}
</style>