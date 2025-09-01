package cn.smxy.zhouxuelian8.entity;

public class MethodCallCount {
    private Integer id;
    private String methodName;
    private Integer callCount;

    public MethodCallCount() {
    }

    public MethodCallCount(Integer id, String methodName, Integer callCount) {
        this.id = id;
        this.methodName = methodName;
        this.callCount = callCount;
    }

    public MethodCallCount(String methodName, Integer callCount) {
        this.methodName = methodName;
        this.callCount = callCount;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getMethodName() {
        return methodName;
    }

    public void setMethodName(String methodName) {
        this.methodName = methodName;
    }

    public Integer getCallCount() {
        return callCount;
    }

    public void setCallCount(Integer callCount) {
        this.callCount = callCount;
    }

    @Override
    public String toString() {
        return "MethodCallCount{" +
                "id=" + id +
                ", methodName='" + methodName + '\'' +
                ", callCount=" + callCount +
                '}';
    }
}
