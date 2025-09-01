#!/bin/bash

echo "启动计算机信息资源共享平台前端服务..."
echo

cd "zhouxuelian8 前端/zhouxuelian8"

echo "检查Node.js环境..."
if ! command -v node &> /dev/null; then
    echo "错误: 未找到Node.js环境，请先安装Node.js 16+"
    exit 1
fi

node -v

echo "检查npm环境..."
if ! command -v npm &> /dev/null; then
    echo "错误: 未找到npm环境，请先安装npm"
    exit 1
fi

npm -v

echo "安装依赖包..."
npm install

echo "启动开发服务器..."
npm run serve 