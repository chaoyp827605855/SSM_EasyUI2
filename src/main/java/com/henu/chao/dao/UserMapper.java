package com.henu.chao.dao;

import com.henu.chao.bean.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by Chao on 2018/6/20.
 */
public interface UserMapper {

    public List<User> selectByPage(@Param("begin") int begin, @Param("end") int end, @Param("key") String key, @Param("value") String value);

    public int count(@Param("key") String key, @Param("value") String value);

    public void deleteById(@Param("id") String id);

    public void insert(User user);

    public void update(User user);
}
