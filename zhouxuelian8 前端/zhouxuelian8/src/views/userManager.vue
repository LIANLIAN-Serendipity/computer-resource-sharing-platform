<template>
  <div class="container">
    <div class="centered-content">
      <h1 class="h1">用户信息详细列表</h1>
    <el-form :inline="true" :model="condition" class="demo-form-inline">
      <el-form-item label="用户名">
        <el-input v-model="condition.name" placeholder="请输用户名"></el-input>
      </el-form-item>
      <el-form-item label="手机号">
        <el-input v-model="condition.phone" placeholder="请输入手机号"></el-input>
      </el-form-item>
      <el-form-item label="邮箱">
        <el-input v-model="condition.email" placeholder="请输入邮箱"></el-input>
      </el-form-item>
      <el-form-item>
        <el-button type="primary"  round @click="getPageByConditions(1)"><i class="el-icon-search"></i>&nbsp; 查询</el-button>
      </el-form-item>
    </el-form>

    <el-table :data="userList" style="width: 1500px">
      <el-table-column prop="id" label="编号" width="200"></el-table-column>
      <el-table-column prop="name" label="用户名" width="200"></el-table-column>
      <el-table-column prop="pwd" label="密码" width="200"></el-table-column>
      <el-table-column prop="phone" label="手机号" width="200"></el-table-column>
      <el-table-column prop="email" label="邮箱" width="200"></el-table-column>
      <el-table-column prop="role" label="角色" width="200"></el-table-column>
      <el-table-column label="操作">
        <template v-slot="scope">
          <el-button size="mini"  round @click="showUpdate(scope.$index, scope.row)"><i  class="el-icon-edit-outline"></i>&nbsp; 编辑</el-button>
          <el-button size="mini" type="danger" round @click="handleDelete(scope.$index, scope.row)"><i class="el-icon-delete"></i>&nbsp;删&nbsp;除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <!-- 分页条-->
    <el-pagination
        @size-change="handleSizeChange"
        @current-change="getPageByConditions"
        :current-page="currentPage"
        :page-sizes="[2,3, 4, 5,6,7]"
        :page-size="pageSize"
        layout="total, sizes, prev, pager, next, jumper"
        :total="total">
    </el-pagination>

    <el-button type="primary" style="margin-top: 20px;" round @click="showadd"><i class="el-icon-circle-plus-outline"></i> 添加用户</el-button>
    <!--  添加或修改对话框-->
    <el-dialog
        title="修改用户"
        :visible.sync="dialogVisible"
        width="30%"
    >
      <el-form :model="user" :rules="rules" ref="ruleForm" label-width="100px" class="demo-ruleForm">
        <el-form-item label="用户名" prop="name">
          <el-input v-model="user.name"></el-input>
        </el-form-item>

        <el-form-item label="密码" prop="pwd">
          <el-input v-model="user.pwd"></el-input>
        </el-form-item>

        <el-form-item label="手机号" prop="phone">
          <el-input v-model="user.phone"></el-input>
        </el-form-item>

        <el-form-item label="邮箱" prop="email">
          <el-input v-model="user.email"></el-input>
        </el-form-item>

        <el-form-item label="角色" prop="role">
          <el-input v-model="user.role"></el-input>
        </el-form-item>


        <el-button size="mini" type="primary" round @click="submitForm('ruleForm')">确定</el-button>
        <el-button round @click="dialogVisible=false">取消</el-button>
      </el-form>
    </el-dialog>
    </div>
  </div>
</template>


<script>
export default {
  name: "UserManager",
  data(){
    return{
      userList:[],
      dialogVisible: false,
      user:{},
      rules: {
        name: [
          {required: true, message: '请输入用户名', trigger: 'blur'}
        ],
        pwd: [
          {required: true, message: '请输入密码', trigger: 'blur'}
        ],
        phone: [
          {required: true, message: '请输入手机号', trigger: 'blur'}
        ],
        email: [
          {required: true, message: '请输入邮箱', trigger: 'blur'}
        ],
        role:[
          {required: true, message: '请输入role', trigger: 'blur'}
        ]
      },
      condition:{},
      currentPage:1,
      pageSize:3,
      total:10,
    }
  },
  methods:{
    //删除用户
    handleDelete(index,row){
      this.$confirm('此操作将永久删除该用户, 是否继续?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        //删除用户 row.id
        this.$axios({
          method: 'get',
          url: 'http://localhost:8089/zhouxuelian8/user/delById/' + row.id
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

    showadd(){
      this.user = {
        name: '',
        pwd: '',
        phone: '',
        email: '',
        role: 'user'
      };
      this.dialogVisible=true;
    },
    //点击对话框的确定按钮
    submitForm(formName) {
      this.$refs[formName].validate((valid) => {
        if (valid) {
            if(this.user.id){
                //修改用户
                this.update();
            }else{
                //添加用户
                this.add();
            }
        } else {
          console.log('error submit!!');
          return false;
        }
      });
    },
    //修改用户
    update(){
      const token = localStorage.getItem('token');
      this.$axios({
        method:'post',
        url:'http://localhost:8089/zhouxuelian8/user/updateUser',
        data:this.user,
        headers: {
          'token': localStorage.getItem('token')
        }
      }).then(res => {
        this.getPageByConditions(1);
        this.dialogVisible=false;
        this.$message({
          type: 'success',
          message: res.data.msg
        });
      }).catch(err => console.log(err));
    },
    //添加用户
    add(){
      this.$axios({
        method:'post',
        url:'http://localhost:8089/zhouxuelian8/user/addUser',
        data:this.user
      }).then(res=>{
        this.getPageByConditions(1);
        this.dialogVisible=false;
        this.$message({
          type: 'success',
          message: res.data.msg
        })
      }).catch(err =>{console.log(err)});

    },
    //显示修改对话框
    showUpdate(index, row) {
      this.dialogVisible = true;
      this.$axios({
        method: 'get',
        url: `http://localhost:8089/zhouxuelian8/user/findUserById/${row.id}` // 确保 URL 正确
      }).then(res => {
        if (res.data && res.data.dataobject) {
          this.user = res.data.dataobject;
          this.is_admin = res.data.dataobject.role === 'admin'; // 确保这里正确地检查了角色
          // this.originalRole = this.user.role; // 设置原始角色
        } else {
          this.$message.error('获取用户信息失败');
          this.dialogVisible = false;
        }
      }).catch(err => {
        console.error('请求失败:', err);
        this.$message.error('请求用户信息出错');
        this.dialogVisible = false;
      });
    },
    //分页查询
    getPageByConditions(current=1) {
      this.currentPage = current;
      this.$axios({
        method: 'get',
        url: `http://localhost:8089/zhouxuelian8/user/getPageByConditions/${this.currentPage}/${this.pageSize}`,
        params: this.condition,
        headers: {
          'token': localStorage.getItem('token')
        }
      }).then(res => {
        this.total = res.data.dataobject.total;
        this.userList = res.data.dataobject.pageList; // 确保这里没有重复添加数据
      }).catch(err => console.log(err));
    }
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
h1 {
  text-align: center;
  font-size: 48px;
  color: #000;
}
.centered-content {
  display: flex;
  flex-direction: column;
  align-items: center; /* 水平居中 */
  justify-content: center; /* 垂直居中 */

  padding: 20px;
  text-align: center;
}
.table {
  background-color: #f5f5f5;
  margin-bottom: 20px;
  width: 1550px; /* 表格宽度 */
}

.el-table .cell {
  text-align: center;
}
.el-table th {
  text-align: center;
}
</style>