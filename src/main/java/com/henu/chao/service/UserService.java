package com.henu.chao.service;

import com.henu.chao.bean.User;
import org.apache.ibatis.annotations.Param;

import java.util.Map;

/**
 * Created by Chao on 2018/6/20.
 */

public interface UserService {
    public Map<String , Object> queryByPage(int pageIndex, int pageSize, String key, String value);

    public void removeById(String id);

    public void add(User user);

    public void modify(User user);
}
