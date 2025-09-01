# 贡献指南

感谢您对计算机信息资源共享平台项目的关注！我们欢迎所有形式的贡献，包括但不限于：

- 🐛 Bug报告
- 💡 功能建议
- 📝 文档改进
- 🔧 代码贡献
- 🌟 项目推广

## 如何贡献

### 1. 报告Bug或建议功能

如果您发现了Bug或有功能建议，请：

1. 在GitHub Issues中搜索是否已有相关问题
2. 如果没有，请创建新的Issue
3. 使用清晰的标题描述问题
4. 提供详细的描述和复现步骤
5. 如果是Bug，请提供错误日志和截图

### 2. 贡献代码

#### 环境准备
1. Fork项目到您的GitHub账户
2. 克隆您的Fork到本地
3. 安装开发环境依赖

#### 开发流程
1. 创建功能分支：`git checkout -b feature/新功能名称`
2. 编写代码，遵循项目代码规范
3. 添加必要的测试
4. 提交代码：`git commit -m "feat: 添加新功能描述"`
5. 推送到您的Fork：`git push origin feature/新功能名称`
6. 创建Pull Request

#### 代码规范

**Java代码规范**
- 类名使用大驼峰命名法：`ArticleController`
- 方法名使用小驼峰命名法：`findArticleById`
- 常量使用全大写加下划线：`MAX_FILE_SIZE`
- 包名使用小写：`cn.smxy.zhouxuelian8`

**Vue代码规范**
- 组件名使用大驼峰命名法：`ArticleManager`
- 方法名使用小驼峰命名法：`handleDelete`
- 文件名使用小写加连字符：`article-manager.vue`
- 变量名使用小驼峰命名法：`articleList`

**注释规范**
```java
/**
 * 根据ID查询文章
 * @param id 文章ID
 * @return 文章对象
 */
public Article findById(Integer id) {
    // 实现逻辑
}
```

#### 提交信息规范
使用[Conventional Commits](https://www.conventionalcommits.org/)规范：

- `feat:` 新功能
- `fix:` Bug修复
- `docs:` 文档更新
- `style:` 代码格式调整
- `refactor:` 代码重构
- `test:` 测试相关
- `chore:` 构建过程或辅助工具的变动

### 3. 改进文档

如果您发现文档有错误或可以改进的地方：

1. 直接编辑相应的Markdown文件
2. 提交Pull Request
3. 确保文档格式正确，语法清晰

### 4. 项目推广

如果您觉得这个项目有用：

1. 在GitHub上给项目点星
2. 在技术社区分享项目
3. 推荐给同事和朋友
4. 在博客或社交媒体上介绍项目

## 开发环境设置

### 后端环境
- JDK 20+
- Maven 3.6+
- MySQL 8.0+

### 前端环境
- Node.js 16+
- npm 或 yarn

### 快速开始
```bash
# 克隆项目
git clone https://github.com/LIANLIAN-Serendipity/computer-resource-sharing-platform.git
cd computer-resource-sharing-platform

# 启动后端
./start-backend.sh  # Linux/Mac
# 或
start-backend.bat   # Windows

# 启动前端
./start-frontend.sh  # Linux/Mac
# 或
start-frontend.bat   # Windows
```

## 问题反馈

如果您在贡献过程中遇到问题：

1. 查看项目文档
2. 搜索GitHub Issues
3. 创建新的Issue描述问题
4. 联系项目维护者

## 行为准则

我们致力于为每个人提供友好、安全和欢迎的环境。请：

- 尊重所有贡献者
- 使用包容性语言
- 接受建设性批评
- 关注社区利益
- 展示对其他社区成员的同情

## 许可证

通过贡献代码，您同意您的贡献将在MIT许可证下发布。

## 致谢

感谢所有为这个项目做出贡献的开发者！您的贡献让这个项目变得更好。

---

如果您有任何问题或建议，请随时联系我们！ 