package com.springmvc.dao;

import com.springmvc.entity.Administrator;

import java.util.List;

/**
 * Created by Administrator on 2017/11/10 0010.
 */
public interface IAdminsDao {
    //添加管理元
    public boolean addAdmins(Administrator admins);
    //查询管理员
    public List findAdminsList(String hql);
}
