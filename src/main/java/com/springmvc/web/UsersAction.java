package com.springmvc.web;

import com.springmvc.entity.Users;
import com.springmvc.service.IBorrow_booksService;
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

    //注入接口
    @Resource(name="borrow_booksService")
    private IBorrow_booksService borrow_booksService;
    //根据ID查询用户
    @RequestMapping("/findUserById")
    public String findUserById(int id,RedirectAttributes attr){
        Users user = userService.findUserById(id);
        user.setUser_state(0);
        if(userService.updateUser(user)){
            attr.addAttribute("rtype","1");
        }else{
            attr.addAttribute("rtype","-1");
        }
        return "redirect:/Users_pages/showAllUsers.jsp";
    }
    //添加用户
    @RequestMapping("/addUsers")
    public String addUser(String sheng, String shi, String qu, Users user,RedirectAttributes attr){
        String address = ""+sheng+","+shi+","+qu+"";
        System.out.println(address);
        user.setUser_address(address);
        Users finduser = userService.findUserByName(user.getUser_name(),user.getUser_tel());
        if(finduser!=null){
            if(finduser.getUser_state()==0){
                attr.addAttribute("rtype","-2");
            }
        }else{
            if(userService.addUsers(user)){
                attr.addAttribute("rtype","1");
            }else{
                attr.addAttribute("rtype","-1");
            }
        }

        return "redirect:/Users_pages/addUsers.jsp";
    }

    //查询所有用户
    @RequestMapping("/findAllUser")
    @ResponseBody
    public List findUserList(){
        return userService.findUsersList();
    }
    //黑名单
    @RequestMapping("/findAllUserByBlackList")
    @ResponseBody
    public List findAllUserByBlackList(){
        return userService.findAllUserByBlackList();
    }

    //删除用户
    @RequestMapping("/deleteUserById")
    @ResponseBody
    public String deleteUser(int id,RedirectAttributes attr){
        System.out.println(id);
        //清空该用户借书表信息
        Users user = userService.findUserById(id);
        if(userService.deleteUser(user)){
            attr.addAttribute("rtype","1");
        }else{
            attr.addAttribute("rtype","-1");
        }
        return "redirect:/Users_pages/Blacklist.jsp";
    }

    public void setUserService(IUserService userService) {
        this.userService = userService;
    }


    public void setBorrow_booksService(IBorrow_booksService borrow_booksService) {
        this.borrow_booksService = borrow_booksService;
    }
}
