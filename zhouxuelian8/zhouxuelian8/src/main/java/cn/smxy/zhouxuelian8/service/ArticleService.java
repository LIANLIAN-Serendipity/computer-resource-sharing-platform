package cn.smxy.zhouxuelian8.service;

import cn.smxy.zhouxuelian8.entity.Article;
import com.github.pagehelper.Page;

import java.util.List;

public interface ArticleService {
    public List<Article> findAll();
    public void addArticle(Article article);
    public void delById(Integer id);
    public Article findById(Integer id);
    public void updateArticle(Article article);
    public Page<Article> getPageByConditions(Integer currentPage, Integer pageSize, Article article);
}
