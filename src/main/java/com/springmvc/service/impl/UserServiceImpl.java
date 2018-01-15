package com.springmvc.service.impl;

import com.springmvc.dao.IUsersDao;
import com.springmvc.entity.Users;
import com.springmvc.service.IUserService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Administrator on 2017/12/20 0020.
 */
@Service("userService")
@Transactional(propagation = Propagation.REQUIRED)
public class UserServiceImpl implements IUserService {
    //注入Dao层接口
    @Resource(name = "userDao")
    private IUsersDao userDao;

    @Override
    public boolean addUsers(Users user) {
        return userDao.addUsers(user);
    }

    @Override
    public List findUsersList() {
        String hql = "from Users";
        return userDao.findUsersList(hql);
    }

    public void setUserDao(IUsersDao userDao) {
        this.userDao = userDao;
    }
}
