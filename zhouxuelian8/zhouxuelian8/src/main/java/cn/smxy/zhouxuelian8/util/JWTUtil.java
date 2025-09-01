package cn.smxy.zhouxuelian8.util;
import com.auth0.jwt.JWT;
import com.auth0.jwt.JWTCreator;
import com.auth0.jwt.JWTVerifier;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.interfaces.DecodedJWT;
import java.util.Calendar;
import java.util.HashSet;
import java.util.Set;
import cn.smxy.zhouxuelian8.entity.User;

public class JWTUtil {
    public static final String secretKey = "wqer!@3sd23$";

    public static String createToken(User user) {
        Calendar calendar = Calendar.getInstance();
        calendar.add(Calendar.SECOND, 60 * 60 * 24 * 7);
        JWTCreator.Builder builder = JWT.create()
                .withExpiresAt(calendar.getTime());

        Set<String> keys = new HashSet<>();
        keys.add("id");
        keys.add("name");
        keys.add("role");
        for(String key : keys) {
            // 使用正确的getter方法
            String value = user.getId().toString(); // 假设id是Integer类型
            if ("name".equals(key)) {
                value = user.getName();
            } else if ("role".equals(key)) {
                value = user.getRole();
            }
            builder.withClaim(key, value);
        }
        // 直接返回生成的token
        return builder.sign(Algorithm.HMAC256(secretKey));
    }

    public static DecodedJWT verifyToken(String token) {
        JWTVerifier jwtVerifier = JWT.require(Algorithm.HMAC256(secretKey)).build();
        return jwtVerifier.verify(token);
    }

    public static String findUsernameByToken(String token) {
        DecodedJWT jwt = verifyToken(token);
        return jwt.getClaim("name").asString();
    }

}