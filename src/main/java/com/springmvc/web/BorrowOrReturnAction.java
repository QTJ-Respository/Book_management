package com.springmvc.web;

import com.springmvc.entity.BookAndUser;
import com.springmvc.entity.Books;
import com.springmvc.entity.Users;
import com.springmvc.service.IBooksService;
import com.springmvc.service.IBorrow_booksService;
import com.springmvc.service.IUserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

/**
 * Created by Administrator on 2018/1/15 0015.
 */
@Controller
@RequestMapping("/borrowOrReturnAction")
public class BorrowOrReturnAction {
    //注入用户服务
    @Resource(name = "userService")
    private IUserService userService;
    //注入书籍服务
    @Resource(name = "booksService")
    private IBooksService booksService;
    //注入添加借阅记录服务
    @Resource(name = "borrow_booksService")
    private IBorrow_booksService borrow_booksService;


    //添加记录
    @RequestMapping("/addRecord")
    public String addRecord(BookAndUser bookAndUser, String utel, RedirectAttributes attr,  HttpServletResponse response) {   //添加记录
       // System.out.println(bookAndUser.getUser().getUser_name() + ":" + utel);
        Users users = userService.findUserByName(bookAndUser.getUser().getUser_name(), utel);//获取用户
        //获取书籍
        Books book = booksService.findBookByName(bookAndUser.getBook().getBook_name());
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = null;
        try {
            out = response.getWriter();
        } catch (IOException e) {
            e.printStackTrace();
        }
        if(book!=null) {
            if (users != null) {
                bookAndUser.setUser(users);
                bookAndUser.setBook(book);
                if (borrow_booksService.addRecord(bookAndUser)) {
                    attr.addAttribute("rtype", "1");
                } else {
                    attr.addAttribute("rtype", "-1");
                }
                return "redirect:/Borrow_book/Borrow_books.jsp";
            } else {
                out.print("<script>alert('请注册');location.href='../Users_pages/addUsers.jsp'</script>");
            }
        }else{
            out.print("<script>alert('该书籍不存在，查看该书籍');location.href='../book_pages/ShowAllBooks.jsp'</script>");
        }
        return null;
    }

    //查询所有记录
    @RequestMapping("/findRecord")
    @ResponseBody
    public List findRecord(){
        List list = borrow_booksService.findRecordList();
        return borrow_booksService.findRecordList();
    }

    //根据名称查询记录
    @RequestMapping("/findRecordByName")
    @ResponseBody
    public List findRecordByName(String username){
        return borrow_booksService.findRecordByName(username);
    }
    //还书记录
    @RequestMapping("/HuanShu")
    public String  huanshu(String param,RedirectAttributes attr){
        System.out.println(param);
        int rid = Integer.parseInt(param);
        BookAndUser bookAndUser = borrow_booksService.findRecordById(rid);
        bookAndUser.setIsreturn(1);
        borrow_booksService.updateRecord(bookAndUser);
        return "redirect:/Borrow_book/Show_Borrow_books.jsp";
    }




    public void setUserService(IUserService userService) {
        this.userService = userService;
    }

    public void setBooksService(IBooksService booksService) {
        this.booksService = booksService;
    }

}
