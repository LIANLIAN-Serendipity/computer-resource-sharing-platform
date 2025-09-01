package cn.smxy.zhouxuelian8.aop;

import cn.smxy.zhouxuelian8.entity.LogRecord;
import cn.smxy.zhouxuelian8.entity.MethodCallCount;
import cn.smxy.zhouxuelian8.mapper.LogRecordMapper;
import cn.smxy.zhouxuelian8.mapper.MethodCallCountMapper;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;

@Component
@Aspect
public class LogRecordAspect {
    @Autowired
    private LogRecordMapper logRecordMapper;
    @Autowired
    private MethodCallCountMapper methodCallCountMapper;

    @After("execution(* cn.smxy.zhouxuelian8.service.ArticleService.*(..))")
    public void recordLog(JoinPoint joinPoint) throws Throwable {
        long startTime = System.currentTimeMillis();  // 记录方法开始执行时间
        String title = joinPoint.getTarget().getClass().getName();
        String methodName = joinPoint.getSignature().getName();
        LocalDateTime operateTime = LocalDateTime.now();

        MethodCallCount methodCallCount = methodCallCountMapper.findByMethodName(methodName);
        // 这里不需要再次调用目标方法，因为 @After 通知是在目标方法执行完毕后执行
        long endTime = System.currentTimeMillis();  // 记录方法结束执行时间
        long executionTime = endTime - startTime;  // 计算方法执行耗时

        try {
            // 记录方法执行耗时到日志表逻辑
            LogRecord logRecord = new LogRecord(title, methodName, operateTime, (int) executionTime);
            logRecordMapper.add(logRecord);
        } catch (Exception e) {
            // 记录日志插入数据库出现的异常信息
            e.printStackTrace();
        }

        try {
            // 统计方法调用次数并保存到方法操作记录表逻辑
            if (methodCallCount == null) {
                // 如果不存在该方法的记录，则插入新记录，初始调用次数为1
                methodCallCount = new MethodCallCount(methodName, 1);
                methodCallCountMapper.insert(methodCallCount);
            } else {
                // 如果记录存在，则更新调用次数（加1）
                methodCallCount.setCallCount(methodCallCount.getCallCount() + 1);
                methodCallCountMapper.updateCallCount(methodCallCount);
            }
        } catch (Exception e) {
            // 记录方法调用次数统计相关数据库操作出现的异常信息
            e.printStackTrace();
        }
    }
}