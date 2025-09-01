@echo off
echo 启动计算机信息资源共享平台后端服务...
echo.

cd zhouxuelian8\zhouxuelian8

echo 检查Java环境...
java -version
if %errorlevel% neq 0 (
    echo 错误: 未找到Java环境，请先安装JDK 20+
    pause
    exit /b 1
)

echo 检查Maven环境...
mvn -version
if %errorlevel% neq 0 (
    echo 错误: 未找到Maven环境，请先安装Maven 3.6+
    pause
    exit /b 1
)

echo 启动Spring Boot应用...
mvn spring-boot:run

pause 