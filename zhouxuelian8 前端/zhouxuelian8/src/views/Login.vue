<template>
  <div class="backgroundDiv">
    <div class="loginDiv">
      <!-- 登录表单 -->
      <el-form ref="frmLogin" :model="admin" label-width="80px" style="width: 80%">
        <h3 style="text-align: center;">计算机资源信息共享平台登录</h3>
        <el-form-item label="用户名:">
          <el-input v-model="admin.name"></el-input>
        </el-form-item>
        <el-form-item label="密码:">
          <el-input type="password" v-model="admin.pwd"></el-input>
        </el-form-item>
        <el-row type="flex" justify="center" align="middle">
          <el-col :span="12">
            <el-button type="primary" @click="login" style="width: 100%">登录</el-button>
          </el-col>
        </el-row>
        <el-row type="flex" justify="center" align="middle">
          <el-col :span="12">
            <el-button type="success" @click="showRegisterForm" style="width: 100%; margin-top: 10px">新用户注册</el-button>
          </el-col>
        </el-row>
      </el-form>
    </div>
    <!-- 注册窗口 -->
    <el-dialog
        title="新用户注册"
        :visible.sync="dialogVisible"
        width="30%"
    >
      <el-form :model="user" :rules="rules" ref="ruleForm" label-width="100px" class="demo-ruleForm">
        <el-form-item label="用户名" prop="name">
          <el-input v-model="user.name" @blur="checkUsernameExists"></el-input>
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

        <el-form-item>
          <el-button type="primary" round @click="submitForm('ruleForm')">确定</el-button>
          <el-button round @click="dialogVisible=false">取消</el-button>
        </el-form-item>
      </el-form>
    </el-dialog>
  </div>
</template>

<script>
export default {
  name: "Login",
  data(){
    return{
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
      },
      admin: {},
      user:{},
      dialogVisible: false,
      is_admin: false,
    }
  },
  methods:{
    login(){
      this.$axios({
        method:'post',
        url:'http://localhost:8089/zhouxuelian8/user/login',
        data:this.admin
      }).then(res=>{
        if(res.data.code==2000){
          this.$message({
            message:'登陆成功',
            type:'success'
          });
          localStorage.setItem('token',res.data.token)
          localStorage.setItem('id',res.data.id)
          localStorage.setItem('name',res.data.name)
          localStorage.setItem('role',res.data.is_admin ? 'admin' : 'user');
          this.$router.push('/Backcon')
        }else {
          this.$message({
            message: '登陆失败',
            type: 'warning'
          });
        }
      }).catch(err=>console.log(err));
    },
    showRegisterForm() {
      this.user={};
      this.dialogVisible=true;// 显示注册窗口
    },
    submitForm(formName) {
      this.$refs[formName].validate((valid) => {
        if (valid) {
          this.add();
        } else {
          console.log('error submit!!');
          return false;
        }
      });
    },
    add() {
      this.$axios({
        method: 'post',
        url: 'http://localhost:8089/zhouxuelian8/user/addUser',
        data: this.user
      }).then(res => {
        if (res.data.code === 2000) {
          this.$message({
            type: 'success',
            message: '注册成功'
          });
          this.dialogVisible = false; // 关闭注册窗口
          this.user = {}; // 清空表单
        } else {
          this.$message({
            type: 'warning',
            message: '注册失败: ' + res.data.msg
          });
        }
      }).catch(err => {
        console.log(err);
        this.$message({
          type: 'error',
          message: '注册过程中发生错误'
        });
      });
    },
    checkUsernameExists() {
      this.$axios({
        method: 'post',
        url: 'http://localhost:8089/zhouxuelian8/user/checkUsernameExists', // 确保 URL 正确
        data: { name: this.user.name }
      }).then(res => {
        console.log('Username check response:', res.data);
        if (res.data.code === 400) {
          this.$message.error(res.data.msg);
        } else if (res.data.code === 2000) {
          this.submitForm('ruleForm');
        }
      }).catch(err => {
        console.log(err);
        this.$message.error('检查用户名过程中发生错误');
      });
    },
  }
}
</script>

<style scoped>
.backgroundDiv {
  width: 100%;
  height: 100vh;
  background-image: url("../assets/login.jpeg");
  background-size: cover;
  display: flex;
  justify-content: center;
  align-items: center;
}
.loginDiv {
  width: 500px;
  height: 350px;
  background-color: white;
  border-radius: 15px;
  box-shadow: 0 25px 35px rgba(0,0,0,0.8);
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
}
.register-dialog {
  width: 100px;
  padding: 40px;
}
.register-form {
  display: flex;
  flex-direction: column;
  align-items: center;
}
/deep/ .el-form-item__label {
  text-align: left;
}
</style>