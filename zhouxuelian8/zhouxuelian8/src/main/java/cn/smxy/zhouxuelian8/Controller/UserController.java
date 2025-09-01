package cn.smxy.zhouxuelian8.Controller;
import cn.smxy.zhouxuelian8.entity.User;
import cn.smxy.zhouxuelian8.service.ArticleService;
import cn.smxy.zhouxuelian8.service.UserService;
import cn.smxy.zhouxuelian8.util.JWTUtil;
import com.auth0.jwt.interfaces.DecodedJWT;
import com.github.pagehelper.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@CrossOrigin
public class UserController {

    @Autowired
    private UserService userService;
    @Autowired
    private ArticleService articleService;

    @PostMapping("/user/login")
    public Map<String, Object> login(@RequestBody User user) {
        Map<String, Object> map = new HashMap<>();
        User u = userService.login(user);
        if (u != null) {
            map.put("code", 2000);
            map.put("msg", "登录成功");
            map.put("token", JWTUtil.createToken(u));
            map.put("id", u.getId());
            map.put("name", u.getName());
            map.put("is_admin", "admin".equals(u.getRole()));
        } else {
            map.put("code", 4040);
            map.put("msg", "用户名或密码错误");
            map.put("token", null);
            map.put("id", null);
            map.put("name", null);
        }
        return map;
    }

    @GetMapping("/user/findAll")
    public Map<String, Object> findAll() {
        List<User> user = userService.findAll();
        Map<String, Object> map = new HashMap<>();
        if (user != null && user.size() > 0) {
            map.put("code", 2000);
            map.put("msg", "查询成功");
            map.put("dataobject", user);
        } else {
            map.put("code", 4040);
            map.put("msg", "没有查询到学生");
            map.put("dataobject", null);
        }
        return map;
    }
    @GetMapping("/user/findUserById/{id}")
    public Map<String, Object> findUserById(@PathVariable Integer id) {
        User userInfo = userService.findById(id);
        Map<String, Object> map = new HashMap<>();
        map.put("code", 2000);
        map.put("msg", "查询成功");
        map.put("dataobject", userInfo);
        return map;
    }

    @PostMapping("/user/updateUser")
    public Map<String, Object> updateUser(@RequestBody User userInfo, @RequestHeader("token") String token) {
        DecodedJWT decodedJWT = JWTUtil.verifyToken(token);
        String role = decodedJWT.getClaim("role").asString();

    if (!"admin".equals(role) && !userInfo.getRole().equals(decodedJWT.getClaim("role").asString())) {
        // 如果不是管理员，且尝试修改角色信息，拒绝更新
        return Collections.singletonMap("msg", "没有权限修改角色");
    }

    userService.update(userInfo);
    Map<String, Object> map = new HashMap<>();
    map.put("code", 2000);
    map.put("msg", "修改信息成功");
    return map;
}
@GetMapping("/user/getPageByConditions/{currentPage}/{pageSize}")
public Map<String, Object> getPageByConditions(
        @PathVariable Integer currentPage,
        @PathVariable Integer pageSize,
        User condition,
        @RequestHeader("token") String token) {

    if (currentPage == null) currentPage = 1;
    if (pageSize == null) pageSize = 10;

    Page<User> page;
    List<User> pageList;
    long total;
    String role = JWTUtil.verifyToken(token).getClaim("role").asString();

    if ("admin".equals(role)) {
        page = userService.getPageByConditions(currentPage, pageSize, condition);
        pageList = page.getResult();
        total = page.getTotal();
    } else {
        // 普通用户只能查询到自己发表的文章
        condition.setName(JWTUtil.findUsernameByToken(token));
        page = userService.getPageByConditions(currentPage, pageSize, condition);
        pageList = page.getResult();
        total = page.getTotal();
    }

    Map<String, Object> m = new HashMap<>();
    m.put("pageList", pageList);
    m.put("total", total);

    Map<String, Object> map = new HashMap<>();
    map.put("code", 2000);
    map.put("msg", "分页条件信息成功");
    map.put("dataobject", m);
    return map;
}
    @GetMapping("/user/delById/{id}")
    public Map<String, Object> delById(@PathVariable Integer id) {
        Map<String, Object> map = new HashMap<>();
        userService.delById(id);
        map.put("code", 2000);
        map.put("msg", "删除成功");
        map.put("dataobject", null);
        return map;
    }
    @PostMapping("/user/addUser")
    public Map<String, Object> addUser(@RequestBody User user) {
        // 检查用户名是否存在
        boolean exists = userService.checkUsernameExists(user.getName());
        if (exists) {
            Map<String, Object> map = new HashMap<>();
            map.put("code", 400);
            map.put("msg", "用户名已存在");
            map.put("dataobject", null);
            return map;
        }
        userService.add(user);
        Map<String, Object> map = new HashMap<>();
        map.put("code", 2000);
        map.put("msg", "添加成功");
        map.put("dataobject", null);
        return map;
    }
    @PostMapping("/user/checkUsernameExists")
    public Map<String, Object> checkUsernameExists(@RequestBody User user) {
        Map<String, Object> map = new HashMap<>();
        boolean exists = userService.checkUsernameExists(user.getName());
        if (exists) {
            map.put("code", 400);
            map.put("msg", "用户名已存在");
        } else {
            map.put("code", 2000);
            map.put("msg", "用户名可用");
        }
        return map;
    }
}
