package cn.smxy.zhouxuelian8.service;
import cn.smxy.zhouxuelian8.entity.User;
import cn.smxy.zhouxuelian8.mapper.UserMapper;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class UserServiceImpl implements UserService{
    @Autowired
    private UserMapper userMapper;

    @Override
    public User login(User user) {return userMapper.findOne(user);}

    @Override
    public List<User> findAll() {return userMapper.findAll();}

    @Override
    public void delById(Integer id) {userMapper.delById(id);}

    @Override
    public void add(User user) {user.setRole("user");userMapper.add(user);}

    @Override
    public User findById(Integer id) {return userMapper.findById(id);}

    @Override
    public void update(User userInfo) {userMapper.update(userInfo);}

    @Override
    public Page<User> getPageByConditions(Integer currentPage, Integer pageSize, User user) {
        PageHelper.startPage(currentPage, pageSize);
        List<User> studentInfoList = userMapper.getByConditions(user);
        return (Page<User>) studentInfoList;
    }

    @Override
    public boolean checkUsernameExists(String name) {
        return userMapper.checkUsernameExists(name) > 0;
    }

}
