package com.springmvc.service;

import com.springmvc.entity.Administrator;

import java.util.List;

/**
 * Created by Administrator on 2017/11/10 0010.
 */
public interface IAdminsService {
    //添加管理员的接口
    public boolean addAdmins(Administrator admins);
    //查询所有管理员的接口
    public List findAdminsList();
    //根据名称模糊查询
    public List findAdminsByName(String name);
    //管理员登录
    public Administrator findAdmins(String name,String pwd);
}
