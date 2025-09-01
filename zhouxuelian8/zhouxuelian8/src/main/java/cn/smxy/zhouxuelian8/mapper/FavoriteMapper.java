package cn.smxy.zhouxuelian8.mapper;

import cn.smxy.zhouxuelian8.entity.Favorite;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface FavoriteMapper {
  //  List<Favorite> getByConditions(@Param("author") String author, @Param("title") String title);
    public void delById(Integer id);
    public void add(Favorite favorite);
    List<Favorite> findById(Integer id);
    public void update(Favorite favorite);
    public List<Favorite> findById1(Integer id);

}