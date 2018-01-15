package com.springmvc.service.impl;

import com.springmvc.dao.IBookDao;
import com.springmvc.entity.Books;
import com.springmvc.service.IBooksService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Administrator on 2017/12/10 0010.
 */
@Service("booksService")
@Transactional(propagation = Propagation.REQUIRED)
public class BooksServiceImpl implements IBooksService {

    //注入BooksDao层接口
    @Resource(name="bookDao")
    private IBookDao booksDao;
    @Override
    public boolean addBooks(Books books) {
        return booksDao.addBook(books);
    }

    @Override
    public List showAllBooks() {
        String hql = "from Books";
        return booksDao.showAllBooks(hql);
    }
    //实现分页查询接口
    @Override
    public List showBooksByPage(int page) {
        int pageSize = 5;
        int startIndex = (page-1)*pageSize;
        String hql = "select * from tb_books limit "+startIndex+","+pageSize+"";
        return booksDao.showBooksByPage(hql);
    }

    public void setBooksDao(IBookDao booksDao) {
        this.booksDao = booksDao;
    }
}
