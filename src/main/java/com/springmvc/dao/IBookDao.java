package com.springmvc.dao;

import com.springmvc.entity.Books;

import java.util.List;

/**
 * Created by Administrator on 2017/12/10 0010.
 */
public interface IBookDao {

    //添加书籍的接口
    public boolean addBook(Books books);
    //查询所有书籍
    public List showAllBooks(String hql);
    //分页查询
    public List showBooksByPage(String sql);
    //修改书籍
    //删除书籍
    //首页查询
    public List firstPage(String hql);
    //尾页查询
    public List lastPage(String hql);
    //更具ID查寻书籍
    public Books getBookById(int id);
    //修改书籍
    public boolean updateBook(Books books);
}
