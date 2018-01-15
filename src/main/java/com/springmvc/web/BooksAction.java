package com.springmvc.web;

import com.springmvc.entity.Books;
import com.springmvc.service.IBooksService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Administrator on 2017/11/22 0022.
 */
@Controller
@RequestMapping("/booksAction")
public class BooksAction {
    @Resource(name="booksService")
    private IBooksService bookService;

    //添加书籍
    @RequestMapping("/addBooks")
    public String addBooks(Books book, RedirectAttributes attr){
        //System.out.println(book.getBook_name()+book.getBook_intime());
        if(bookService.addBooks(book)){
            attr.addAttribute("rtype","1");
        }else{
            attr.addAttribute("rtype","-1");
        }
        return "redirect:/book_pages/AddBooks.jsp";
    }
    //查询所有书籍总数
    @RequestMapping("/findBookListCount")
    @ResponseBody
    public int findBooksList(){
        return bookService.showAllBooks().size();
    }

    //分页查询书籍
    @RequestMapping("/findBookListBypage")
    @ResponseBody
    public List findBooksList(int page){
        return bookService.showBooksByPage(page);
    }

    public void setBookService(IBooksService bookService) {
        this.bookService = bookService;
    }


}
