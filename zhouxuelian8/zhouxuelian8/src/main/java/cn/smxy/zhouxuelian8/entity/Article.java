package cn.smxy.zhouxuelian8.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
//import lombok.Data;


import java.util.Date;
//@Data

public class Article {
    private Integer id;
    private String title;
    private Integer typeId;
    private String author;
    private String simpleabstract;
    private String content;
    @JsonFormat(pattern = "yyyy-MM-dd",timezone = "GTM+8")
    private Date publishDate;
    private String imagePath;
    private Integer userId;
    private Type type;

    public Article() {
    }

    public Article(Integer id, String title, Integer typeId, String author, String simpleabstract, String content, Date publishDate, String imagePath, Integer userId) {
        this.id = id;
        this.title = title;
        this.typeId = typeId;
        this.author = author;
        this.simpleabstract = simpleabstract;
        this.content = content;
        this.publishDate = publishDate;
        this.imagePath = imagePath;
        this.userId = userId;
    }

    public Article(String title, Integer typeId, String author, String simpleabstract, String content, Date publishDate, String imagePath, Integer userId) {
        this.title = title;
        this.typeId = typeId;
        this.author = author;
        this.simpleabstract = simpleabstract;
        this.content = content;
        this.publishDate = publishDate;
        this.imagePath = imagePath;
        this.userId = userId;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Integer getTypeId() {
        return typeId;
    }

    public void setTypeId(Integer typeId) {
        this.typeId = typeId;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getSimpleabstract() {
        return simpleabstract;
    }

    public void setSimpleabstract(String simpleabstract) {
        this.simpleabstract = simpleabstract;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getPublishDate() {
        return publishDate;
    }

    public void setPublishDate(Date publishDate) {
        this.publishDate = publishDate;
    }

    public String getImagePath() {
        return imagePath;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Type getType() {
        return type;
    }

    public void setType(Type type) {
        this.type = type;
    }

    @Override
    public String toString() {
        return "Article{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", typeId=" + typeId +
                ", author='" + author + '\'' +
                ", simpleabstract='" + simpleabstract + '\'' +
                ", content='" + content + '\'' +
                ", publishDate=" + publishDate +
                ", imagePath='" + imagePath + '\'' +
                ", userId=" + userId +
                ", type=" + type +
                '}';
    }
}
