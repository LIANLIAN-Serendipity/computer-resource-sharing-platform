package cn.smxy.zhouxuelian8.service;

import cn.smxy.zhouxuelian8.entity.Favorite;
import com.github.pagehelper.Page;

import java.util.List;

public interface FavoriteService {
  //  public Page<Favorite> getPageByConditions(Integer currentPage, Integer pageSize, String author, String title);
    public void delById(Integer id);
    List<Favorite> findById(Integer id);
    public void add(Favorite favorite);
    public void update(Favorite favorite);
    public List<Favorite> findById1(Integer id);
}
