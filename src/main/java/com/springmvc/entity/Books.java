package com.springmvc.entity;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by Administrator on 2017/11/14 0014.
 */
@Entity
@Table(name = "tb_books")
public class Books {
    //id ,名称，分类，作者，价格，总数量，目前数量，上架时间
    private int book_no;
    private String book_name;
    private String book_type;
    private String book_author;
    private double book_price;
    private int book_amount;
    private int book_num;
    private Date book_intime;

    public Books() {
    }

    public Books(int book_no, String book_name, String book_type, String book_author, double book_price, int book_amount, int book_num, Date book_intime) {
        this.book_no = book_no;
        this.book_name = book_name;
        this.book_type = book_type;
        this.book_author = book_author;
        this.book_price = book_price;
        this.book_amount = book_amount;
        this.book_num = book_num;
        this.book_intime = book_intime;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public int getBook_no() {
        return book_no;
    }

    public void setBook_no(int book_no) {
        this.book_no = book_no;
    }

    public String getBook_name() {
        return book_name;
    }

    public void setBook_name(String book_name) {
        this.book_name = book_name;
    }

    public String getBook_type() {
        return book_type;
    }

    public void setBook_type(String book_type) {
        this.book_type = book_type;
    }

    public String getBook_author() {
        return book_author;
    }

    public void setBook_author(String book_author) {
        this.book_author = book_author;
    }

    public double getBook_price() {
        return book_price;
    }

    public void setBook_price(double book_price) {
        this.book_price = book_price;
    }

    public int getBook_amount() {
        return book_amount;
    }

    public void setBook_amount(int book_amount) {
        this.book_amount = book_amount;
    }

    public int getBook_num() {
        return book_num;
    }

    public void setBook_num(int book_num) {
        this.book_num = book_num;
    }

    public Date getBook_intime() {
        return book_intime;
    }

    public void setBook_intime(Date book_intime) {
        this.book_intime = book_intime;
    }
}
