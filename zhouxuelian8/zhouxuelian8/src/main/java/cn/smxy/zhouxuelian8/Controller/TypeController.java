package cn.smxy.zhouxuelian8.Controller;
import cn.smxy.zhouxuelian8.entity.Type;
import cn.smxy.zhouxuelian8.service.TypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@CrossOrigin
public class TypeController {

    @Autowired
    private TypeService typeService;

    @GetMapping("/type/findAll")
    public Map<String, Object> findAll() {
        Map<String, Object> map = new HashMap<>();
        try {
            List<Type> TypeList = typeService.findAll();
            if (TypeList != null && !TypeList.isEmpty()) {
                map.put("code", 2000);
                map.put("msg", "文章所有类别查询成功");
                map.put("dataobject", TypeList);
            } else {
                map.put("code", 4040);
                map.put("msg", "没有查询到文章类别");
                map.put("dataobject", null);
            }
        } catch (Exception e) {
            map.put("code", 5000);
            map.put("msg", "查询文章所有类别出现异常：" + e.getMessage());
            map.put("dataobject", null);
            e.printStackTrace();
        }
        return map;
    }
}