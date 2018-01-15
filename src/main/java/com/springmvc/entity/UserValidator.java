package com.springmvc.entity;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

/**
 * Created by Administrator on 2017/12/24 0024.
 */
public class UserValidator implements Validator {
    @Override
    public boolean supports(Class<?> aClass) {
        return Users.class.equals(aClass);
    }

    @Override
    public void validate(Object o, Errors errors) {
        Users u = (Users) o;
        if (u.getUser_name().length()<6){
            //此方法可以加四个参数,第一个表单域field,
            //区分是哪个表单出错,第二个errorCode错误码,
            //第三个制定了资源文件中占位符,第四个具体错误返回信息
            //简写版可以把2,3参数去掉
            errors.rejectValue("name",null,null,"name is null");
        }
    }
}
