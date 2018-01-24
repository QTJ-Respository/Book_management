package com.springmvc.dao;

import com.springmvc.entity.BookAndUser;

import java.util.List;

/**
 * Created by Administrator on 2018/1/16 0016.
 */
public interface IBorrow_booksDao {
    //添加记录接口
    public boolean addRecord(BookAndUser bookAndUser);
    //查询记录接口
    public List findRecordList(String hql);
    //根据ID查询用户并且更新
    public BookAndUser findRecordById(int id);
    //更新
    public boolean updateRecord(BookAndUser bookAndUser);
    //更具姓名查询
    public List findRecordByName(String hql);
    //根据Id 删除记录
    public boolean deleteRecordById(String hql);
    //更具书名查询
    public List findRecordByBookName(String hql);
}
