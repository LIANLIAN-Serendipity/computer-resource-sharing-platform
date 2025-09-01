package cn.smxy.zhouxuelian8.Controller;

import cn.smxy.zhouxuelian8.entity.Article;
import cn.smxy.zhouxuelian8.service.ArticleService;
import cn.smxy.zhouxuelian8.util.JWTUtil;
import com.github.pagehelper.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@CrossOrigin
public class ArticleController {

    @Autowired
    private ArticleService articleService;

    @GetMapping("/article/findAll")
    public Map<String,Object>findAll(){
        Map<String,Object> map=new HashMap<>();
        List<Article> articleList=articleService.findAll();
        if(articleList !=null && articleList.size()>0){
            map.put("code",2000);
            map.put("msg","查询所有文章列表成功");
            map.put("dataobject",articleList);
        }else{
            map.put("code",4040);
            map.put("msg","没有查询到所有文章列表");
            map.put("dataobject",null);
        }
        return map;
    }

@PostMapping("/admin/addArticle")
public Map<String, Object> addArticle(@RequestBody Article article) {
    Map<String, Object> map = new HashMap<>();
    articleService.addArticle(article);
    map.put("code", 2000);
    map.put("msg", "添加文章成功");
    map.put("dataobject", null);
    return map;
}

    @GetMapping("/user/article/findArticleById/{id}")
    public Map<String, Object> findArticleById(@PathVariable Integer id) {
        Article article = articleService.findById(id);
        Map<String, Object> map = new HashMap<>();
        map.put("code", 2000);
        map.put("msg", "查询成功");
        map.put("dataobject", article);
        return map;
    }

@GetMapping("/admin/article/getPageByConditions/{currentPage}/{pageSize}")
public Map<String, Object> getPageByConditions(@PathVariable Integer currentPage,
                                               @PathVariable Integer pageSize,
                                               Article condition,
                                               @RequestHeader("token") String token) {
    if(currentPage == null) currentPage = 1;
    if(pageSize == null) pageSize = 2;
    Page<Article> page;
    List<Article> pageList;
    long total;
    String role = JWTUtil.verifyToken(token).getClaim("role").asString();

    if ("admin".equals(role)) {
        page = articleService.getPageByConditions(currentPage, pageSize, condition);
        pageList = page.getResult();
        total = page.getTotal();
    } else {
        // 普通用户只能查询到自己发表的文章
        condition.setAuthor(JWTUtil.findUsernameByToken(token));
        page = articleService.getPageByConditions(currentPage, pageSize, condition);
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

    @GetMapping("/admin/article/delById/{id}")
    public Map<String, Object> delById(@PathVariable Integer id) {
        Map<String, Object> map = new HashMap<>();
        articleService.delById(id);
        map.put("code", 2000);
        map.put("msg", "删除成功");
        map.put("dataobject", null);
        return map;
    }
    @PostMapping("/admin/article/updateArticle")
    public Map<String, Object> updateArticle(@RequestBody Article article) {
        Map<String, Object> map = new HashMap<>();
        articleService.updateArticle(article);
        map.put("code", 2000);
        map.put("msg", "修改文章信息成功");
        map.put("dataobject", null);
        return map;
    }

}
