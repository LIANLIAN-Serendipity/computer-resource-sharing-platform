package cn.smxy.zhouxuelian8.service;

import cn.smxy.zhouxuelian8.entity.User;
import com.github.pagehelper.Page;
import java.util.List;


public interface UserService {
    public List<User> findAll();
    public void delById(Integer id);
    public void add(User user);
    public User findById(Integer id);
    public void update(User userInfo);
     User login(User user);
    public Page<User> getPageByConditions(Integer currentPage, Integer pageSize, User user);
    boolean checkUsernameExists(String name);
}
