package cn.smxy.zhouxuelian8.entity;

import java.time.LocalDateTime;

public class LogRecord {
    private Integer id;
    private String operateName;
    private String operateMethodName;
    private LocalDateTime operateTime;
    private Integer executionTime;

    public LogRecord() {
    }

    public LogRecord(Integer id, String operateName, LocalDateTime operateTime, String operateMethodName, Integer executionTime) {
        this.id = id;
        this.operateName = operateName;
        this.operateTime = operateTime;
        this.operateMethodName = operateMethodName;
        this.executionTime = executionTime;
    }

    public LogRecord(String operateName, String operateMethodName, LocalDateTime operateTime, Integer executionTime) {
        this.operateName = operateName;
        this.operateMethodName = operateMethodName;
        this.operateTime = operateTime;
        this.executionTime = executionTime;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getOperateCourseName() {
        return operateName;
    }

    public void setOperateCourseName(String operateCourseName) {
        this.operateName = operateCourseName;
    }

    public String getOperateMethodName() {
        return operateMethodName;
    }

    public void setOperateMethodName(String operateMethodName) {
        this.operateMethodName = operateMethodName;
    }

    public LocalDateTime getOperateTime() {
        return operateTime;
    }

    public void setOperateTime(LocalDateTime operateTime) {
        this.operateTime = operateTime;
    }

    public Integer getExecutionTime() {
        return executionTime;
    }

    public void setExecutionTime(Integer executionTime) {
        this.executionTime = executionTime;
    }

    @Override
    public String toString() {
        return "LogRecord{" +
                "id=" + id +
                ", operateCourseName='" + operateName + '\'' +
                ", operateMethodName='" + operateMethodName + '\'' +
                ", operateTime=" + operateTime +
                ", executionTime=" + executionTime +
                '}';
    }
}