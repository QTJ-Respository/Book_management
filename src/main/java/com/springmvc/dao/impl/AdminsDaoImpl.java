package com.springmvc.dao.impl;

import com.springmvc.dao.BaseDao;
import com.springmvc.dao.IAdminsDao;
import com.springmvc.entity.Administrator;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by Administrator on 2017/11/10 0010.
 */
@Repository("adminsDao")
public class AdminsDaoImpl extends BaseDao implements IAdminsDao{
    //添加管理元
    @Override
    public boolean addAdmins(Administrator admins) {
        try {
            getSession().save(admins);
            return true;
        }catch (Exception e){
            e.printStackTrace();
        }
        return false;
    }

    //查询所有管理员
    @Override
    public List findAdminsList(String hql) {
        return getSession().createQuery(hql).list();
    }
}
