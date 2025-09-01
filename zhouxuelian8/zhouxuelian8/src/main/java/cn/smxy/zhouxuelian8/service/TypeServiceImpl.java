package cn.smxy.zhouxuelian8.service;

import cn.smxy.zhouxuelian8.entity.Type;
import cn.smxy.zhouxuelian8.mapper.TypeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TypeServiceImpl implements TypeService {
    @Autowired
    private TypeMapper typeMapper;

    @Override
    public List<Type> findAll() {
        return typeMapper.findAll();
    }
}
