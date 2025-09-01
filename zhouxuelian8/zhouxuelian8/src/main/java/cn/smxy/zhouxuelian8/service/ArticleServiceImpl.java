package cn.smxy.zhouxuelian8.service;
import cn.smxy.zhouxuelian8.entity.Article;
import cn.smxy.zhouxuelian8.mapper.ArticleMapper;
import cn.smxy.zhouxuelian8.mapper.UserMapper;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.util.List;
@Service
@Transactional
public class ArticleServiceImpl implements ArticleService {
    private final ArticleMapper articleMapper;
    private final UserMapper userMapper;
    @Autowired
    public ArticleServiceImpl(ArticleMapper articleMapper, UserMapper userMapper) {
        this.articleMapper = articleMapper;
        this.userMapper = userMapper;
    }
    @Override
    public List<Article> findAll() {
        return articleMapper.findAll();
    }
    @Override
    public void addArticle(Article article) {
        articleMapper.addArticle(article);
    }
    @Override
    public void delById(Integer id) {
        articleMapper.delById(id);
    }
    @Override
    public Article findById(Integer id) {
        return articleMapper.findById(id);
    }
    @Override
    public void updateArticle(Article article) {
        articleMapper.updateArticle(article);
    }
    @Override
    public Page<Article> getPageByConditions(Integer currentPage, Integer pageSize, Article article) {
        PageHelper.startPage(currentPage, pageSize);
        List<Article> articleList = articleMapper.getByConditions(article);
        return (Page<Article>) articleList;
    }
}