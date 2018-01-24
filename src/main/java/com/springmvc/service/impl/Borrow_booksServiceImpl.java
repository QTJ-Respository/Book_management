package com.springmvc.service.impl;

import com.springmvc.dao.IBorrow_booksDao;
import com.springmvc.entity.BookAndUser;
import com.springmvc.service.IBorrow_booksService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Administrator on 2018/1/17 0017.
 */
@Service("borrow_booksService")
@Transactional(propagation = Propagation.REQUIRED)
public class Borrow_booksServiceImpl implements IBorrow_booksService {

    //注入dao层接口
    @Resource(name = "borrow_booksDao")
    private IBorrow_booksDao borrow_booksDao;
    //添加数据服务接口
    @Override
    public boolean addRecord(BookAndUser bookAndUser) {
        return borrow_booksDao.addRecord(bookAndUser);
    }

    @Override
    public List findRecordList() {
        String hql = "select b.bu_no,b.book.book_name,b.user.user_name,b.borrow_time,b.still_time,b.isreturn " +
                     "from BookAndUser b where isReturn=0";
        return borrow_booksDao.findRecordList(hql);
    }

    @Override
    public BookAndUser findRecordById(int id) {
        return borrow_booksDao.findRecordById(id);
    }

    @Override
    public boolean updateRecord(BookAndUser bookAndUser) {
        return borrow_booksDao.updateRecord(bookAndUser);
    }

    @Override
    public List findRecordByName(String name) {
        String hql = "";
        hql += "select b.bu_no,b.book.book_name,b.user.user_name,b.borrow_time,b.still_time,b.isreturn " +
                     "from BookAndUser b where 1=1 and b.isreturn = 0 ";
        if(name!=""){
            hql += "and b.user.user_name like '%"+name+"%'";
        }
        return borrow_booksDao.findRecordByName(hql);
    }

    @Override
    public boolean deleteRecordById(int id) {
        String hql = "delete book_user where user_user_no = "+id+"";
        return borrow_booksDao.deleteRecordById(hql);
    }

    @Override
    public List findRecordByBookName(String name) {
        String hql = "select b.bu_no,b.book.book_name,b.user.user_name,b.borrow_time,b.still_time,b.isreturn " +
                "from BookAndUser b where b.book.book_name = '"+name+"' ";
        return borrow_booksDao.findRecordByBookName(hql);
    }


    public void setBorrow_booksDao(IBorrow_booksDao borrow_booksDao) {
        this.borrow_booksDao = borrow_booksDao;
    }
}
