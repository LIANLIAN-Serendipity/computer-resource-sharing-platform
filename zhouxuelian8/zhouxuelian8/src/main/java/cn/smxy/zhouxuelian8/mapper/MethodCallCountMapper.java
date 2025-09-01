package cn.smxy.zhouxuelian8.mapper;

import cn.smxy.zhouxuelian8.entity.MethodCallCount;

public interface MethodCallCountMapper {
    MethodCallCount findByMethodName(String methodName);
    void updateCallCount(MethodCallCount methodCallCount);
    void insert(MethodCallCount methodCallCount);

}
