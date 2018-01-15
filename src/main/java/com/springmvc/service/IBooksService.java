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
}
