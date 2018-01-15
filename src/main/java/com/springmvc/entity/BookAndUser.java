package com.springmvc.entity;

import javax.persistence.*;

/**
 * Created by Administrator on 2017/11/19 0019.
 */
@Entity
@Table(name = "book_user")
public class BookAndUser {

    private int bu_no;
    private Books book ;
    private Users user;

    public BookAndUser() {
    }

    public BookAndUser(int bu_no) {
        this.bu_no = bu_no;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public int getBu_no() {
        return bu_no;
    }

    public void setBu_no(int bu_no) {
        this.bu_no = bu_no;
    }

    @ManyToOne(cascade = CascadeType.REFRESH)
    public Books getBook() {
        return book;
    }

    public void setBook(Books book) {
        this.book = book;
    }
    @ManyToOne(cascade = CascadeType.REFRESH)
    public Users getUser() {
        return user;
    }

    public void setUser(Users user) {
        this.user = user;
    }
}
