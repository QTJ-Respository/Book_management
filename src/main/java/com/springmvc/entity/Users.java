package com.springmvc.entity;

import javax.persistence.*;

/**
 * Created by Administrator on 2017/11/8 0008.
 */
@Entity
@Table(name = "book_user")
public class Users {
    private int user_no;//编号
    private String user_name;//姓名
    private int user_sex;//性别：1:男,0:女
    private int user_age;//年龄
    private String user_email;//邮箱
    private String user_tel;//电话
    private String user_address;//住址
    private String user_ID;//身份证
    private int user_state;//状态

    //配置多对一：一个人对应一个角色
    private Roles roles;
    public Users() {
    }

    public Users(int user_no, String user_name, int user_sex, int user_age, String user_email, String user_tel, String user_address, String user_ID, int user_state) {
        this.user_no = user_no;
        this.user_name = user_name;
        this.user_sex = user_sex;
        this.user_age = user_age;
        this.user_email = user_email;
        this.user_tel = user_tel;
        this.user_address = user_address;
        this.user_ID = user_ID;
        this.user_state = user_state;
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

    public int getUser_age() {
        return user_age;
    }

    public void setUser_age(int user_age) {
        this.user_age = user_age;
    }

    public String getUser_email() {
        return user_email;
    }

    public void setUser_email(String user_email) {
        this.user_email = user_email;
    }

    public String getUser_tel() {
        return user_tel;
    }

    public void setUser_tel(String user_tel) {
        this.user_tel = user_tel;
    }

    public String getUser_address() {
        return user_address;
    }

    public void setUser_address(String user_address) {
        this.user_address = user_address;
    }

    public String getUser_ID() {
        return user_ID;
    }

    public void setUser_ID(String user_ID) {
        this.user_ID = user_ID;
    }

    public int getUser_state() {
        return user_state;
    }

    public void setUser_state(int user_state) {
        this.user_state = user_state;
    }

    @ManyToOne(cascade = CascadeType.REFRESH)
    @JoinColumn(name = "u_rno")
    public Roles getRoles() {
        return roles;
    }

    public void setRoles(Roles roles) {
        this.roles = roles;
    }
}