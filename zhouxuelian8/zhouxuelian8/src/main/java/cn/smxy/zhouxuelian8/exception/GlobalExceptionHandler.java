package cn.smxy.zhouxuelian8.exception;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import java.util.HashMap;
import java.util.Map;

@RestControllerAdvice
public class GlobalExceptionHandler {

    @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
    @ExceptionHandler(value = ArithmeticException.class)
    public Map<String, Object> handlerArith(ArithmeticException e) {
        Map<String, Object> map = new HashMap<>();
        map.put("code", 5000);
        map.put("msg", "发生数学类异常：" + e.getMessage());
        map.put("dataobject", null);
        return map;
    }

    @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
    @ExceptionHandler(value = Exception.class)
    public Map<String, Object> handlerExption(Exception e) {
        Map<String, Object> map = new HashMap<>();
        map.put("code", 5000);
        map.put("msg", "发生其他异常：" + e.getMessage());
        map.put("dataobject", null);
        return map;
    }
}
