package com.service;

import com.pojo.User;

import java.util.List;

public interface UserDao {
    public User Login (User user);
    public List<User> selectUser(User user);
    public User selectById(Integer id);
    public List<User> selectByName(User user);
    public void insertUser(User user);
    public void deleteUser(Integer id);
    public void updateUser(User user);
    public void pwdUpdate(User user);
    public int CheckUserName(String name);
}

