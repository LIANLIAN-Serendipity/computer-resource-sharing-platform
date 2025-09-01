#!/bin/bash

echo "启动计算机信息资源共享平台后端服务..."
echo

cd zhouxuelian8/zhouxuelian8

echo "检查Java环境..."
if ! command -v java &> /dev/null; then
    echo "错误: 未找到Java环境，请先安装JDK 20+"
    exit 1
fi

java -version

echo "检查Maven环境..."
if ! command -v mvn &> /dev/null; then
    echo "错误: 未找到Maven环境，请先安装Maven 3.6+"
    exit 1
fi

mvn -version

echo "启动Spring Boot应用..."
mvn spring-boot:run 