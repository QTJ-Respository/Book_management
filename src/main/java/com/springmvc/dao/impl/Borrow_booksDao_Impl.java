package com.springmvc.dao.impl;

import com.springmvc.dao.BaseDao;
import com.springmvc.dao.IBorrow_booksDao;
import com.springmvc.entity.BookAndUser;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by Administrator on 2018/1/17 0017.
 */
@Repository("borrow_booksDao")
public class Borrow_booksDao_Impl extends BaseDao implements IBorrow_booksDao {
    @Override
    public boolean addRecord(BookAndUser bookAndUser) {
        try {
            getSession().save(bookAndUser);
            return true;
        }catch (Exception e){
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public List findRecordList(String hql) {
        return getSession().createQuery(hql).list();
    }

    @Override
    public BookAndUser findRecordById(int id) {
        try {
            BookAndUser bookAndUser = getSession().get(BookAndUser.class,id);
            return bookAndUser;
        }catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public boolean updateRecord(BookAndUser bookAndUser) {
        try {
            getSession().update(bookAndUser);
            return true;
        }catch (Exception e){
            e.printStackTrace();
        }
        return false;
    }

    //根据Id 删除记录


    @Override
    public List findRecordByName(String hql) {
        return getSession().createQuery(hql).list();
    }

    @Override
    public boolean deleteRecordById(String hql) {
        try {
            getSession().createSQLQuery(hql);
            return true;
        }catch (Exception e){
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public List findRecordByBookName(String hql) {
        return getSession().createQuery(hql).list();
    }


}
