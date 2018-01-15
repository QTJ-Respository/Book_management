package com.springmvc.service;

import com.springmvc.entity.Users;

import java.util.List;

/**
 * Created by Administrator on 2017/12/20 0020.
 */
public interface IUserService {
    //添加Users
    public boolean addUsers(Users user);
    //查询所有用户
    public List findUsersList();
}
