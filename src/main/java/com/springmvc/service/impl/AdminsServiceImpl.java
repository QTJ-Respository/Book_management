package com.springmvc.service.impl;

import com.springmvc.dao.IAdminsDao;
import com.springmvc.entity.Administrator;
import com.springmvc.service.IAdminsService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Administrator on 2017/11/10 0010.
 */
@Service("adminsService")
@Transactional(propagation = Propagation.REQUIRED)
public class AdminsServiceImpl implements IAdminsService {
    //注入AdminsDao接口
    @Resource(name = "adminsDao")
    private IAdminsDao adminsDao;

    //添加管理员
    @Override
    public boolean addAdmins(Administrator admins) {
        return adminsDao.addAdmins(admins);
    }

    //查询所有管理员
    @Override
    public List findAdminsList() {
        String hql="from Administrator";
        return adminsDao.findAdminsList(hql);
    }

    public void setAdminsDao(IAdminsDao adminsDao) {
        this.adminsDao = adminsDao;
    }
}
