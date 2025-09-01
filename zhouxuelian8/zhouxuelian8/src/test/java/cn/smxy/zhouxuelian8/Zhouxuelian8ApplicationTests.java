package cn.smxy.zhouxuelian8;

import cn.smxy.zhouxuelian8.service.ArticleService;
import lombok.val;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class Zhouxuelian8ApplicationTests {
    @Autowired
    private ArticleService articleService;
    @Test
    void contextLoads() {
        val pageByConditions = articleService.getPageByConditions(1, 1, null);
        System.out.println(pageByConditions);
    }

}
