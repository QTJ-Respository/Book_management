package com.springmvc.web;

import com.springmvc.entity.Users;
import com.springmvc.service.IUserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Administrator on 2017/12/20 0020.
 */
@Controller
@RequestMapping("/usersAction")
public class UsersAction {

    //注入服务层接口
    @Resource(name="userService")
    private IUserService userService;
    //添加用户
    @RequestMapping("/addUsers")
    public String addUser(String sheng, String shi, String qu, Users user,RedirectAttributes attr){
        String address = ""+sheng+","+shi+","+qu+"";
        System.out.println(address);
        user.setUser_address(address);
        if(userService.addUsers(user)){
            attr.addAttribute("rtype","1");
        }else{
            attr.addAttribute("rtype","-1");
        }
        return "redirect:/Users_pages/addUsers.jsp";
    }

    //查询所有用户
    @RequestMapping("/findAllUser")
    @ResponseBody
    public List findUserList(){
        return userService.findUsersList();
    }


    public void setUserService(IUserService userService) {
        this.userService = userService;
    }
}
