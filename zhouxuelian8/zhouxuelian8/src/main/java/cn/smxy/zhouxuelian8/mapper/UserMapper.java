package cn.smxy.zhouxuelian8.mapper;

import cn.smxy.zhouxuelian8.entity.User;

import java.util.List;

public interface UserMapper {
    public List<User> findAll();
    public void delById(Integer id);
    public void add(User user);
    public User findById(Integer id);
    public void update(User userInfo);
    public User findOne(User user);
    public  List<User> getByConditions(User condition);
    int checkUsernameExists( String name);
}
