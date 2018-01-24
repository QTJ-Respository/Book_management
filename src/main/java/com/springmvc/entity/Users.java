package com.springmvc.entity;


import javax.persistence.*;
import javax.validation.constraints.NotNull;

/**
 * Created by Administrator on 2017/11/14 0014.
 */
@Entity
@Table(name = "tb_users")
public class Users {
    //id,用户名，性别,电话，身份证，地址，定金，状态
    private int user_no;
    @NotNull(message = "请输入姓名")
    private String user_name;
    private int user_sex;
    private String user_tel;
    private String user_ID;
    private String user_address;
    private double user_money;
    private int user_state;


    public Users(int user_no, String user_name,int user_sex, String user_tel, String user_ID, String user_address, double user_money, int user_state) {
        this.user_no = user_no;
        this.user_name = user_name;
        this.user_sex = user_sex;
        this.user_tel = user_tel;
        this.user_ID = user_ID;
        this.user_address = user_address;
        this.user_money = user_money;
        this.user_state = user_state;
    }

    public Users() {
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public int getUser_no() {
        return user_no;
    }

    public void setUser_no(int user_no) {
        this.user_no = user_no;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public int getUser_sex() {
        return user_sex;
    }

    public void setUser_sex(int user_sex) {
        this.user_sex = user_sex;
    }

    public String getUser_tel() {
        return user_tel;
    }

    public void setUser_tel(String user_tel) {
        this.user_tel = user_tel;
    }

    public String getUser_ID() {
        return user_ID;
    }

    public void setUser_ID(String user_ID) {
        this.user_ID = user_ID;
    }

    public String getUser_address() {
        return user_address;
    }

    public void setUser_address(String user_address) {
        this.user_address = user_address;
    }

    public double getUser_money() {
        return user_money;
    }

    public void setUser_money(double user_money) {
        this.user_money = user_money;
    }

    public int getUser_state() {
        return user_state;
    }

    public void setUser_state(int user_state) {
        this.user_state = user_state;
    }

}
