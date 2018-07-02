package com.henu.chao.service.impl;

import com.henu.chao.bean.User;
import com.henu.chao.dao.UserMapper;
import com.henu.chao.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Chao on 2018/6/20.
 */

@Service
@Transactional
public class UserServiceImpl implements UserService{

    @Autowired
    private UserMapper um;
    @Override
    @Transactional(readOnly = true,propagation = Propagation.SUPPORTS)
    public Map<String, Object> queryByPage(int pageIndex, int pageSize , String key , String value) {
        Map<String, Object> map = new HashMap<>();
        List<User> users = um.selectByPage((pageIndex - 1) * pageSize , pageSize , key , value);
        int count = um.count(key , value);
        map.put("rows",users);
        map.put("total",count);
        return map;
    }

    @Override
    public void removeById(String id) {
        um.deleteById(id);
    }

    @Override
    public void add(User user) {
        um.insert(user);
    }

    @Override
    public void modify(User user) {
        um.update(user);
    }
}
