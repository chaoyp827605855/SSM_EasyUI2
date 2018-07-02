package com.henu.chao.bean;

import org.springframework.stereotype.Component;

import java.io.Serializable;

/**
 * Created by Chao on 2018/6/20.
 */
@Component
public class User implements Serializable{
    private String id;
    private String username;
    private String password;

    public String getId() {
        return id;
    }
    public void setId(String id) {
        this.id = id;
    }
    public String getUsername() {
        return username;
    }
    public void setUsername(String username) {
        this.username = username;
    }
    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public String toString() {
        return "User{" +
                "id='" + id + '\'' +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                '}';
    }
}
