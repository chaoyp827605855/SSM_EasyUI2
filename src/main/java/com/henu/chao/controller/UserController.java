package com.henu.chao.controller;

import com.henu.chao.bean.User;
import com.henu.chao.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by Chao on 2018/6/20.
 */
@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService us;

    @RequestMapping("/queryByPage")
    @ResponseBody
    public Map<String , Object> queryByPage(int page , int rows , String key , String value){
        return us.queryByPage(page , rows , key , value);
    }

    @RequestMapping("/removeById")
    @ResponseBody
    public void removeById(String id){
       us.removeById(id);
    }

    @RequestMapping("/modify")
    @ResponseBody
    public void modify(User user){
        System.out.println("I am in GitHub In the modify directly");
        us.modify(user);
    }

    @RequestMapping("/add")
    @ResponseBody
    public void add(User user){
        us.add(user);
    }

}
