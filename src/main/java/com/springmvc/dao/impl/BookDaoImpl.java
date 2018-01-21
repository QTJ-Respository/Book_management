package com.springmvc.dao.impl;

import com.springmvc.dao.BaseDao;
import com.springmvc.dao.IBookDao;
import com.springmvc.entity.Books;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by Administrator on 2017/12/10 0010.
 */
@Repository("bookDao")
public class BookDaoImpl extends BaseDao implements IBookDao {
    //实现添加books接口
    @Override
    public boolean addBook(Books books) {
        try {
            getSession().save(books);
            return true;
        }catch (Exception e){
            e.printStackTrace();
        }
        return false;
    }

    //实现查询所有书籍
    @Override
    public List showAllBooks(String hql) {
        return getSession().createQuery(hql).list();
    }

    @Override
    public List showBooksByPage(String sql) {
        return getSession().createSQLQuery(sql).list();
    }

    @Override
    public List firstPage(String hql) {
        return getSession().createSQLQuery(hql).list();
    }
    @Override
    public List lastPage(String hql) {
        return getSession().createSQLQuery(hql).list();
    }

    @Override
    public Books getBookById(int id) {
       Books book = getSession().get(Books.class,id);
        return book;
    }

}
