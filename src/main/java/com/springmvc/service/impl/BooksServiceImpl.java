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

    @Override
    public Books findBookByName(String name) {
        String hql = "from Books";
        List<Books> bookList = booksDao.showAllBooks(hql);
        for (Books book:bookList) {
            if(book.getBook_name().equals(name)){
                return book;
            }
        }
        return null;
    }

    @Override
    public List firstPage() {
        int pageSize = 5;
        int startIndex = 0;
        String hql = "select * from tb_books limit "+startIndex+","+pageSize+"";
        return booksDao.firstPage(hql);
    }
    @Override
    public List lastPage(int size) {
        int pageSize = 5;
        int startIndex = size;
        String hql = "select * from tb_books limit "+startIndex+","+pageSize+"";
        String hql2 = "select * from tb_books order by book_no desc limit 5 ;";
        return booksDao.firstPage(hql2);
    }

    @Override
    public Books getBookById(int id) {
        return booksDao.getBookById(id);
    }

    @Override
    public boolean updateBook(Books books) {
        return booksDao.updateBook(books);
    }

    public void setBooksDao(IBookDao booksDao) {
        this.booksDao = booksDao;
    }
}
