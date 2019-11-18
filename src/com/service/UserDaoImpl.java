package com.service;

import com.pojo.User;
import com.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserDaoImpl implements UserDao {

    @Autowired
    UserMapper mapper;
    @Override
    public User Login(User user){
        return mapper.Login(user);
    }

    @Override
    public List<User> selectUser(User user) { return mapper.selectUser(user); }

    @Override
    public User selectById(Integer id) { return mapper.selectById(id); }

    @Override
    public List<User> selectByName(User user) { return mapper.selectByName(user); }

    @Override
    public void insertUser(User user) { mapper.insertUser(user); }

    @Override
    public void deleteUser(Integer id) { mapper.deleteUser(id); }

    @Override
    public void updateUser(User user) { mapper.updateUser(user); }

    @Override
    public void pwdUpdate(User user) { mapper.pwdUpdate(user);}

    @Override
    public int CheckUserName(String username) { return mapper.CheckUserName(username); }

    @Override
    public List<User> searchByWhere(User user) { return mapper.searchByWhere(user); }

}



