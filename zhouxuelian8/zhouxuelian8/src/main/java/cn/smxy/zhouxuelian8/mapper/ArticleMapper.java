package cn.smxy.zhouxuelian8.mapper;

import cn.smxy.zhouxuelian8.entity.Article;

import java.util.List;

public interface ArticleMapper {
    public List<Article> findAll();
    public void addArticle(Article article);
    public void delById(Integer id);
    public Article findById(Integer id);
    public void updateArticle(Article article);
    public  List<Article> getByConditions(Article condition);

}
