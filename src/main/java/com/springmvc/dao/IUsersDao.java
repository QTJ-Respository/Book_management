package com.springmvc.dao;

import com.springmvc.entity.Users;

import java.util.List;

/**
 * Created by Administrator on 2017/12/20 0020.
 */
public interface IUsersDao {
    //添加Users
    public boolean addUsers(Users user);
    //查询所有用户
    public List findUsersList(String hql);
    //根据ID查询用户
    public Users findUserById(int id);
    //更新Users
    public boolean updateUser(Users user);
    //删除用户
    public boolean deleteUser(Users user);
}
