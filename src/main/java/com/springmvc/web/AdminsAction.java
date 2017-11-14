package com.springmvc.web;

import com.springmvc.entity.Administrator;
import com.springmvc.service.IAdminsService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.List;

/**
 * Created by Administrator on 2017/11/9 0009.
 */
@Controller
@RequestMapping("/adminsAction")
public class AdminsAction {

    //注入服务接口
    @Resource(name = "adminsService")
    private IAdminsService adminsService;

    //根据名称模糊查询管理元
    @RequestMapping("/findAdminsByName")
    @ResponseBody
    public List findAdminsByName(String admins_name){
        System.out.println(admins_name);
        System.out.println(adminsService.findAdminsByName(admins_name));
        return adminsService.findAdminsByName(admins_name);
    }
    //查询所有管理员
    @RequestMapping("/findAdmins")
    @ResponseBody
    public List findAdminsList(){
        return adminsService.findAdminsList();
    }
    //添加管理员
    @RequestMapping("/addAdmins")
    public String addAdmins(MultipartFile ufile, Administrator admins,String sheng,String shi,String qu, HttpSession session,RedirectAttributes attr){
        //上传文件
        if(!ufile.isEmpty()){
            //获取服务器路径
            String basePath=session.getServletContext().getRealPath("/images");
            String realName=ufile.getOriginalFilename();//真实上传的文件名
            //执行上传操作
            try {
                ufile.transferTo(new File(basePath+"/"+realName));
                String address = ""+sheng+","+shi+","+qu+"";
                admins.setAdmins_address(address);
                admins.setAdmins_img("/"+realName);
                if(adminsService.addAdmins(admins)){
                    attr.addAttribute("rtype","1");
                }else{
                    attr.addAttribute("rtype","-1");
                }
                return "redirect:/Admins_pages/addAdmins.jsp";
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return null;
    }

    public void setAdminsService(IAdminsService adminsService) {
        this.adminsService = adminsService;
    }
}
