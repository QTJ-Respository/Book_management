package com.springmvc.entity;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by Administrator on 2017/11/19 0019.
 */
@Entity
@Table(name = "book_user")
public class BookAndUser {

    private int bu_no;
    private Books book ;
    private Users user;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date borrow_time;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date still_time;
    private int isreturn=0;

    public BookAndUser() {

    }

    public BookAndUser(int bu_no, Books book, Users user, Date borrow_time, Date still_time, int isreturn) {
        this.bu_no = bu_no;
        this.book = book;
        this.user = user;
        this.borrow_time = borrow_time;
        this.still_time = still_time;
        this.isreturn = isreturn;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public int getBu_no() {
        return bu_no;
    }

    public void setBu_no(int bu_no) {
        this.bu_no = bu_no;
    }

    @ManyToOne(cascade = CascadeType.REFRESH,fetch = FetchType.LAZY)
    public Books getBook() {
        return book;
    }

    public void setBook(Books book) {
        this.book = book;
    }
    @ManyToOne(cascade = CascadeType.REFRESH,fetch = FetchType.LAZY)
    public Users getUser() {
        return user;
    }

    public void setUser(Users user) {
        this.user = user;
    }

    public Date getBorrow_time() {
        return borrow_time;
    }

    public void setBorrow_time(Date borrow_time) {
        this.borrow_time = borrow_time;
    }

    public Date getStill_time() {
        return still_time;
    }

    public void setStill_time(Date still_time) {
        this.still_time = still_time;
    }

    public int getIsreturn() {
        return isreturn;
    }

    public void setIsreturn(int isreturn) {
        this.isreturn = isreturn;
    }
}
