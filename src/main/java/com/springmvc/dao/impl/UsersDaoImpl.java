package com.springmvc.dao.impl;

import com.springmvc.dao.BaseDao;
import com.springmvc.dao.IUsersDao;
import com.springmvc.entity.Users;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by Administrator on 2017/12/20 0020.
 */
@Repository("userDao")
public class UsersDaoImpl extends BaseDao implements IUsersDao {
    @Override
    public boolean addUsers(Users user) {
        try {
            getSession().save(user);
            return true;
        }catch (Exception e){
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public List findUsersList(String hql) {
        return getSession().createQuery(hql).list();
    }
}
