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
        String hql = "from Users u where u.user_state = 1";
        return userDao.findUsersList(hql);
    }

    @Override
    public Users findUserByName(String name,String utel) {
        String hql = "from Users";
        List<Users> userList = userDao.findUsersList(hql);
        for (Users user:userList) {
            if(user.getUser_name().equals(name) && user.getUser_tel().equals(utel)){
                return user;
            }
        }
        return null;
    }

    @Override
    public Users findUserById(int id) {
        return userDao.findUserById(id);
    }

    @Override
    public boolean updateUser(Users user) {
        return userDao.updateUser(user);
    }

    @Override
    public List findAllUserByBlackList() {
        String hql = "from Users u where u.user_state = 0";
        return userDao.findUsersList(hql);
    }

    @Override
    public boolean deleteUser(Users user) {
        return userDao.deleteUser(user);
    }

    public void setUserDao(IUsersDao userDao) {
        this.userDao = userDao;
    }
}
