package cn.smxy.zhouxuelian8.service;
import cn.smxy.zhouxuelian8.entity.Favorite;
import cn.smxy.zhouxuelian8.mapper.FavoriteMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.util.List;

@Service
@Transactional
public class FavoriteServiceImpl implements FavoriteService {
    @Autowired
    private FavoriteMapper favoriteMapper;

    @Override
    public void delById(Integer id) {favoriteMapper.delById(id);}

    @Override
    public List<Favorite> findById(Integer id) {return favoriteMapper.findById(id);}

    @Override
    public void add(Favorite favorite) {favoriteMapper.add(favorite);}

    @Override
    public void update(Favorite favorite) {favoriteMapper.update(favorite);}

    @Override
    public List<Favorite> findById1(Integer id) {return favoriteMapper.findById1(id);}
}

