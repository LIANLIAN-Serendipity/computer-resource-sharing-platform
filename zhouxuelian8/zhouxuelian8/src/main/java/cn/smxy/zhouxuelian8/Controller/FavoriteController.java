package cn.smxy.zhouxuelian8.Controller;
import cn.smxy.zhouxuelian8.entity.Favorite;
import cn.smxy.zhouxuelian8.service.FavoriteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@CrossOrigin
public class FavoriteController {
    @Autowired
    private FavoriteService favoriteService;

    @GetMapping("/favorite/delById/{id}")
    public Map<String,Object> delById(@PathVariable Integer id){
        favoriteService.delById(id);
        Map<String,Object> map = new HashMap<>();
        map.put("code",2000);
        map.put("msg","取消收藏成功");
        map.put("dataobject",null);
        return map;
    }
    @GetMapping("/favorite/findById/{id}")
    public Map<String,Object> findById(@PathVariable Integer id){
        List<Favorite> favoriteList = favoriteService.findById(id);
        Map<String,Object> map = new HashMap<>();
        map.put("code",2000);
        map.put("msg","查询收藏详情成功");
        map.put("dataobject",favoriteList);
        return map;
    }
    @GetMapping("/favorite/findById1/{userId}")
    public Map<String,Object> findById1(@PathVariable Integer userId){  //id=3
        List<Favorite> favorites = favoriteService.findById1(userId);
        Map<String,Object> map=new HashMap<>();
        map.put("code",2000);
        map.put("msg","查询收藏详情成功");
        map.put("dataobject",favorites);
        return map;
    }
    @PostMapping("/favorite/add")
    public Map<String, Object> add(@RequestBody Favorite favorite) {
        favoriteService.add(favorite);
        Map<String, Object> map = new HashMap<>();
        map.put("code", 2000);
        map.put("msg", "收藏成功");
        map.put("dataobject", null);
        System.out.println(favorite);
        return map;
    }
    @PostMapping("/favorite/update")
    public Map<String,Object> update(@RequestBody Favorite favorite){
        favoriteService.update(favorite);
        Map<String,Object> map = new HashMap<>();
        map.put("code",2000);
        map.put("msg","修改成功");
        map.put("dataobject",null);
        return map;
    }

}
