package com.springmvc.entity;

import javax.persistence.*;

/**
 * Created by Administrator on 2017/11/8 0008.
 */
@Entity
@Table(name = "tb_Roles")
public class Roles {
    private int r_no;
    private String r_name;

    public Roles() {
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public int getR_no() {
        return r_no;
    }

    public void setR_no(int r_no) {
        this.r_no = r_no;
    }

    public String getR_name() {
        return r_name;
    }

    public void setR_name(String r_name) {
        this.r_name = r_name;
    }

    public Roles(int r_no, String r_name) {
        this.r_no = r_no;
        this.r_name = r_name;
    }
}
