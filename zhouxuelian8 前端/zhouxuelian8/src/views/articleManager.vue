<template>
    <div>
        <el-form :inline="true" :model="condition" class="demo-form-inline">
            <el-form-item label="标题">
                <el-input v-model="condition.title" placeholder="请输入标题"></el-input>
            </el-form-item>
            <el-form-item label="作者">
                <el-input v-model="condition.author" placeholder="请输入作者"></el-input>
            </el-form-item>
            <el-form-item>
                <el-button type="primary" @click="getPageByConditions(1)"><i class="el-icon-search"></i>&nbsp; 查询</el-button>
            </el-form-item>
        </el-form>
        <el-table :data="articleList" style="width: 100%">
            <el-table-column prop="id" label="编号" width="100" style="margin-left: 20px"></el-table-column>
            <el-table-column prop="title" label="标题" width="200"></el-table-column>
           <el-table-column prop="type.typeName" label="文章类别" width="150"></el-table-column>
           <el-table-column prop="author" label="作者" width="150"></el-table-column>
            <el-table-column prop="simpleabstract" label=摘要 width="450"></el-table-column>
            <el-table-column prop="publishDate" label=创建时间 width="100"></el-table-column>
          <el-table-column
              prop="imagePath"
              label="图片"
              width="200">
            <template v-slot="scope">
              <img
                  style="width: 100px;height: 100px"
                  :src="scope.row.imagePath"
              ></img>
            </template>
          </el-table-column>

          <el-table-column label="操作">
                <template v-slot="scope">
                  <el-button
                      size="mini"
                      type="primary"
                      @click="showUpdate(scope.$index, scope.row)">修改</el-button>
                  <el-button
                      size="mini"
                      type="danger"
                      @click="handleDelete(scope.$index, scope.row)">删除</el-button>
                </template>
              </el-table-column>
        </el-table>

        <!-- 分页条-->
        <el-pagination
                @size-change="handleSizeChange"
                @current-change="getPageByConditions"
                :current-page="currentPage"
                :page-sizes="[ 3, 4, 5,6]"
                :page-size="pageSize"
                layout="total, sizes, prev, pager, next, jumper"
                :total="total">
        </el-pagination>
      <el-button type="primary" style="margin-top: 20px" round @click="showAdd">添加文章</el-button>
    </div>
</template>


<script>
export default {
    name: "articleManager",
    data(){
        return{
            articleList:[],
            dialogVisible: false,
            article:{},
            condition:{},
            currentPage:1,
            pageSize:3,
            total:10,

        }
    },
    methods:{
        mounted() {
            this.getPageByConditions(1)
        },
        //删除
        handleDelete(index,row){
            this.$confirm('此操作将永久删除该文章, 是否继续?', '提示', {
                confirmButtonText: '确定',
                cancelButtonText: '取消',
                type: 'warning'
            }).then(() => {
                //删除用户 row.id
                this.$axios({
                    method: 'get',
                    url: 'http://localhost:8089/zhouxuelian8/admin/article/delById/' + row.id
                }).then(res => {
                    this.getPageByConditions(1);
                    this.$message({
                        type: 'success',
                        message: res.data.msg
                    });
                }).catch(err => console.log(err));

            }).catch(() => {
                this.$message({
                    type: 'info',
                    message: '已取消删除'
                });
            });
        },
        handleSizeChange(size){
            this.pageSize=size;
            this.getPageByConditions(1);
        },
        //分页查询
      getPageByConditions(current=1){
        this.currentPage=current;
        this.$axios({
          method:'get',
          url:`http://localhost:8089/zhouxuelian8/admin/article/getPageByConditions/${this.currentPage}/${this.pageSize}`,
          params:this.condition,
          headers:{
            'token':localStorage.getItem('token')
          }
        }).then(res=>{
          this.total= res.data.dataobject.total;
          this.articleList=res.data.dataobject.pageList;
          console.log(this.articleList)
        }).catch(err=>console.log(err));
      },
        showUpdate(index,row){
            this.$router.push({name:'editArticle',params: {id:row.id}})
        },
       showAdd(){
        this.$router.push({name:'addArticle'})
      },
    },
  handleSizeChange(newSize) {
    this.pageSize = newSize;
    this.getPageByConditions(this.currentPage);
  },
    //生命周期方法
    created(){
        // this.findAll()
        this.getPageByConditions(1);

    }
}
</script>

<style scoped>
.el-table{
  text-align: center;
}
.table {
  background-color: #f5f5f5;
  margin-bottom: 20px;
  width: 1550px; /* 表格宽度 */
}
</style>