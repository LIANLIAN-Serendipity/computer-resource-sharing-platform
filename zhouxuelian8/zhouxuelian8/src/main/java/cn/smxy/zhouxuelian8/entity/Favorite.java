package cn.smxy.zhouxuelian8.entity;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

public class Favorite {
    private Integer id;
    private Integer userId;
    private Integer articleId;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    private Date createAt;
    private Article article;
    private User user;

    public Favorite() {
    }

    public Favorite(Integer id, Integer userId, Integer articleId, Date createAt, Article article, User user) {
        this.id = id;
        this.userId = userId;
        this.articleId = articleId;
        this.createAt = createAt;
        this.article = article;
        this.user = user;
    }

    public Favorite(Integer userId, Integer articleId, Date createAt, Article article, User user) {
        this.userId = userId;
        this.articleId = articleId;
        this.createAt = createAt;
        this.article = article;
        this.user = user;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getArticleId() {
        return articleId;
    }

    public void setArticleId(Integer articleId) {
        this.articleId = articleId;
    }

    public Date getCreateAt() {
        return createAt;
    }

    public void setCreateAt(Date createAt) {
        this.createAt = createAt;
    }

    public Article getArticle() {
        return article;
    }

    public void setArticle(Article article) {
        this.article = article;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Override
    public String toString() {
        return "Favorite{" +
                "id=" + id +
                ", userId=" + userId +
                ", articleId=" + articleId +
                ", createAt=" + createAt +
                ", article=" + article +
                ", user=" + user +
                '}';
    }
}
