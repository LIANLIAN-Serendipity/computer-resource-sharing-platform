<template>
  <div>
    <el-form :model="article" :rules="rules" ref="articleForm" label-width="100px" class="demo-ruleForm">
      <el-form-item label="文章标题" prop="title">
        <el-input v-model="article.title"></el-input>
      </el-form-item>
      <el-form-item label="文章作者" prop="author">
        <el-input v-model="article.author"></el-input>
      </el-form-item>
      <el-form-item label="文章摘要" prop="simpleabstract">
        <el-input v-model="article.simpleabstract"></el-input>
      </el-form-item>
      <el-form-item label="文章内容" prop="content">
        <div id="div1">
        </div>
      </el-form-item>
      <el-form-item label="文章类别" prop="typeId">
        <el-select v-model="article.typeId" placeholder="请选择文章类别">
          <el-option
              v-for="Type in TypeList"
              :key="Type.id"
              :label="Type.typeName"
              :value="Type.id">
          </el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="修改日期" prop="publishDate">
        <el-input v-model="article.publishDate" type="date" placeholder="选择日期"></el-input>
      </el-form-item>

      <el-form-item label="文章图片" prop="imagePath">
        <el-upload
            class="avatar-uploader"
            action="http://localhost:8089/zhouxuelian8/uploadFile"
            :show-file-list="false"
            :on-success="afterFileUpload"
            :before-upload="beforeAvatarUpload">
          <img v-if="article.imagePath" :src="article.imagePath" class="avatar">
          <i v-else class="el-icon-plus avatar-uploader-icon"></i>
        </el-upload>
      </el-form-item>

      <el-form-item>
        <el-button type="primary" round @click="addOrUpdate('articleForm')">确 定</el-button>
        <el-button  round @click="fanhui">取 消</el-button>
      </el-form-item>
    </el-form>
  </div>
</template>

<script>

import E from  'wangeditor'

export default {
  name: "editArticle",
  data() {
    return {
      articleList: [],
      TypeList:[],
      dialogVisible: false,
      articleId: this.$route.params.id,
      article: {},
      rules: {
        title: [
          {required: true, message: '请输入文章标题', trigger: 'blur'}
        ],
        author: [
          {required: true, message: '请输入文章作者', trigger: 'blur'}
        ],
        simpleabstract: [
          {required: true, message: '请输入文章摘要', trigger: 'blur'}
        ],
        content: [
          {required: true, message: '请输入文章内容', trigger: 'blur'}
        ],
        typeId: [
          {required: true, message: '请选择文章类别', trigger: 'blur'}
        ],
        publishDate: [
          {required: true, message: '请选择编辑日期', trigger: 'blur'}
        ],
      },
      editor: null
    }
  },
  mounted() {
    this.createRichTextEditor();
    if(this.articleId){
      this.findArticleById();
    }
    this.findAllTypeList();
  },
  methods: {
    findArticleById(){
      this.$axios({
        method: 'get',
        url: `http://localhost:8089/zhouxuelian8/user/article/findArticleById/${this.articleId}`,
      }).then(res => {
        console.log(res.data);
        this.article = res.data.dataobject;
        if(this.editor){
          this.editor.txt.html(this.article.content);
        }
      }).catch(err => {
        console.log(err);
      });
    },
    createRichTextEditor() {
      this.editor = new E('#div1');
      this.editor.config.uploadImgServer = 'http://localhost:8089/zhouxuelian8/richText/uploadFile?type=img';
      this.editor.config.uploadFileName = 'file';
      this.editor.config.uploadVideoServer = 'http://localhost:8089/zhouxuelian8/richText/uploadFile?type=video';
      this.editor.config.uploadVideoName = 'file';
      this.editor.create()
    },
    findAllTypeList() {
      this.$axios({
        method: 'get',
        url: 'http://localhost:8089/zhouxuelian8/type/findAll'
      }).then(res => {
        this.TypeList = res.data.dataobject;
      }).catch(err => console.log(err));
    },
    // 修改文章
    addOrUpdate(formName) {
      this.article.content=this.editor.txt.html();
      this.$refs[formName].validate((valid) => {
        if (valid) {
          //添加或修改
          if (this.article.id) {
            //修改
            this.update();
            console.log("update")
          } else {
            console.log('error submit!!');
            return false;
          }
        }
      })
    },
    update() {
      this.$axios({
        method: 'post',
        url: 'http://localhost:8089/zhouxuelian8/admin/article/updateArticle',
        data: this.article
      }).then(res => {
        this.$message({
          type: 'success',
          message: '修改成功'
        });
        this.dialogVisible = false;
        this.$router.push({ path: '/articleManager' });
        this.findArticleById();
      }).catch(err => console.log(err));
    },
    fanhui(){
      this.$router.push({name:'articleManager'})
    },
    // 文件上传前
    beforeAvatarUpload(file) {
      const isImage = file.type === 'image/jpeg' || file.type === 'image/png' || file.type === 'image/webp';
      const isLt10M = file.size / 1024 / 1024 < 10;

      if (!isImage) {
        this.$message.error('上传图片只能是JPG、png、webp 格式!');
      }
      if (!isLt10M) {
        this.$message.error('上传图片大小不能超过 10MB!');
      }
      return isImage && isLt10M;
    },
    //  文件上传之后
    afterFileUpload(response, file) {
      console.log(response);
      this.article.imagePath = response.dataobject;
    },
  }
}
</script>

<style scoped>
.avatar-uploader el-upload {
  border: 1px dashed #d9d9d9;
  border-radius: 6px;
  cursor: pointer;
  position: relative;
  overflow: hidden;
}

.avatar-uploader el-upload:hover {
  border-color: #409EFF;
}

.avatar-uploader-icon {
  font-size: 28px;
  color: #8c939d;
  width: 178px;
  height: 178px;
  line-height: 178px;
  text-align: center;
}

.avatar {
  width: 178px;
  height: 178px;
  display: block;
}
</style>