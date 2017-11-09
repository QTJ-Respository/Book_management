package com.springmvc.entity;

import javax.persistence.*;

/**
 * Created by Administrator on 2017/11/8 0008.
 */
@Entity
@Table(name = "book_admins")
public class Administrator {
    private int admins_no;//编号
    private String admins_name;//姓名
    private int admins_sex;//性别：1:男,0:女
    private int admins_age;//年龄
    private String admins_email;//邮箱
    private String admins_tel;//电话
    private String admins_address;//住址
    private String admins_ID;//身份证
    private int admins_state;//状态: 1：启用 0：禁用
    private String admins_img;//头像

    public Administrator() {
    }

    public Administrator(int admins_no, String admins_name, int admins_sex, int admins_age, String admins_email, String admins_tel, String admins_address, String admins_ID, int admins_state) {
        this.admins_no = admins_no;
        this.admins_name = admins_name;
        this.admins_sex = admins_sex;
        this.admins_age = admins_age;
        this.admins_email = admins_email;
        this.admins_tel = admins_tel;
        this.admins_address = admins_address;
        this.admins_ID = admins_ID;
        this.admins_state = admins_state;
    }

    public Administrator(int admins_no, String admins_name, int admins_sex, int admins_age, String admins_email, String admins_tel, String admins_address, String admins_ID, int admins_state, String admins_img) {
        this.admins_no = admins_no;
        this.admins_name = admins_name;
        this.admins_sex = admins_sex;
        this.admins_age = admins_age;
        this.admins_email = admins_email;
        this.admins_tel = admins_tel;
        this.admins_address = admins_address;
        this.admins_ID = admins_ID;
        this.admins_state = admins_state;
        this.admins_img = admins_img;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public int getAdmins_no() {
        return admins_no;
    }

    public void setAdmins_no(int admins_no) {
        this.admins_no = admins_no;
    }

    public String getAdmins_name() {
        return admins_name;
    }

    public void setAdmins_name(String admins_name) {
        this.admins_name = admins_name;
    }

    public int getAdmins_sex() {
        return admins_sex;
    }

    public void setAdmins_sex(int admins_sex) {
        this.admins_sex = admins_sex;
    }

    public int getAdmins_age() {
        return admins_age;
    }

    public void setAdmins_age(int admins_age) {
        this.admins_age = admins_age;
    }

    public String getAdmins_email() {
        return admins_email;
    }

    public void setAdmins_email(String admins_email) {
        this.admins_email = admins_email;
    }

    public String getAdmins_tel() {
        return admins_tel;
    }

    public void setAdmins_tel(String admins_tel) {
        this.admins_tel = admins_tel;
    }

    public String getAdmins_address() {
        return admins_address;
    }

    public void setAdmins_address(String admins_address) {
        this.admins_address = admins_address;
    }

    public String getAdmins_ID() {
        return admins_ID;
    }

    public void setAdmins_ID(String admins_ID) {
        this.admins_ID = admins_ID;
    }

    public int getAdmins_state() {
        return admins_state;
    }

    public void setAdmins_state(int admins_state) {
        this.admins_state = admins_state;
    }

    public String getAdmins_img() {
        return admins_img;
    }

    public void setAdmins_img(String admins_img) {
        this.admins_img = admins_img;
    }
}