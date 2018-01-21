package com.springmvc.service;

import com.springmvc.entity.BookAndUser;

import java.util.List;

/**
 * Created by Administrator on 2018/1/17 0017.
 */
public interface IBorrow_booksService {
    //添加记录接口
    public boolean addRecord(BookAndUser bookAndUser);
    //添加记录接口
    public List findRecordList();
    //根据ID查询用户并且更新
    public BookAndUser findRecordById(int id);
    //更新
    public boolean updateRecord(BookAndUser bookAndUser);
    //更具姓名查询
    public List findRecordByName(String name);

}
