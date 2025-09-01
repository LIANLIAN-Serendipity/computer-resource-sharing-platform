# API接口文档

## 基础信息
- 基础URL：http://localhost:8089/zhouxuelian8
- 请求格式：JSON
- 响应格式：JSON
- 认证方式：JWT Token

## 通用响应格式
```json
{
  "code": 2000,
  "msg": "操作成功",
  "dataobject": null
}
```

## 状态码说明
- 2000：操作成功
- 4000：请求参数错误
- 4010：未授权
- 4040：资源不存在
- 5000：服务器内部错误

## 接口列表

### 用户认证
#### 用户登录
- **接口**: POST /user/login
- **参数**: 
  ```json
  {
    "name": "用户名",
    "pwd": "密码"
  }
  ```
- **响应**:
  ```json
  {
    "code": 2000,
    "msg": "登录成功",
    "token": "JWT_TOKEN",
    "id": 1,
    "name": "用户名",
    "is_admin": true
  }
  ```

### 文章管理
#### 获取所有文章
- **接口**: GET /article/findAll
- **响应**: 文章列表

#### 根据ID获取文章
- **接口**: GET /user/article/findArticleById/{id}
- **参数**: id (路径参数)
- **响应**: 文章详情

#### 分页条件查询文章
- **接口**: GET /admin/article/getPageByConditions/{currentPage}/{pageSize}
- **参数**: 
  - currentPage: 当前页码
  - pageSize: 每页大小
  - condition: 查询条件
- **认证**: 需要JWT Token
- **响应**: 分页结果

#### 添加文章
- **接口**: POST /admin/addArticle
- **参数**: 文章对象
- **认证**: 需要JWT Token
- **响应**: 操作结果

#### 更新文章
- **接口**: POST /admin/article/updateArticle
- **参数**: 文章对象
- **认证**: 需要JWT Token
- **响应**: 操作结果

#### 删除文章
- **接口**: GET /admin/article/delById/{id}
- **参数**: id (路径参数)
- **认证**: 需要JWT Token
- **响应**: 操作结果

### 收藏管理
#### 获取用户收藏
- **接口**: GET /favorite/findById1/{userId}
- **参数**: userId (路径参数)
- **响应**: 收藏列表

#### 取消收藏
- **接口**: GET /favorite/delById/{id}
- **参数**: id (路径参数)
- **认证**: 需要JWT Token
- **响应**: 操作结果

## 数据模型

### 文章对象 (Article)
```json
{
  "id": 1,
  "title": "文章标题",
  "typeId": 1,
  "author": "作者",
  "simpleabstract": "文章摘要",
  "content": "文章内容",
  "publishDate": "2024-12-19",
  "imagePath": "图片路径",
  "userId": 1,
  "type": {
    "id": 1,
    "typeName": "Java"
  }
}
```

## 认证说明

### JWT Token使用
在需要认证的接口中，在请求头中添加：
```
Authorization: Bearer your_jwt_token_here
```

## 错误处理
所有接口都会返回统一格式的错误响应，包含错误码和错误信息。 