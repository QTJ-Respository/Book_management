package com.springmvc.service;

import com.springmvc.entity.Books;

import java.util.List;

/**
 * Created by Administrator on 2017/12/10 0010.
 */
public interface IBooksService {
    //添加书籍的服务
    public boolean addBooks(Books books);
    //查询书籍的服务接口
    public List showAllBooks();
    //分页查询
    public List showBooksByPage(int page);
    //根据姓名查询用户
    public Books findBookByName(String name);
    //书籍首页查询
    public List firstPage();
    //书籍尾页查询
    public List lastPage(int size);
    //更具ID查寻书籍
    public Books getBookById(int id);
    //修改书籍
    public boolean updateBook(Books books);
}
