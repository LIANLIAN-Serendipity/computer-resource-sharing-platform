package cn.smxy.zhouxuelian8.Test;


import cn.smxy.zhouxuelian8.entity.Article;
import cn.smxy.zhouxuelian8.service.ArticleService;
import com.github.pagehelper.Page;
import org.apache.ibatis.annotations.Param;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@SpringBootTest
public class ServiceTest {
    @Autowired
    private ArticleService articleService;

    @Test
    public void test1(){
        Page<Article> page =articleService.getPageByConditions(1,2,
                new Article(null,"大模型",null,"大模型",null,null,null,null,null));
        List<Article> pageList = page.getResult();
        long total = page.getTotal();
        System.out.println("total:"+total);
        for(Article article : pageList){
            System.out.println(article.toString());
        }

    }
}
