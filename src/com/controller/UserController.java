package com.controller;

import com.exception.ParamErrorException;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.pojo.User;
import com.service.UserDao;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

@Controller
public class UserController {
    @Autowired
    UserDao userDao;
    @Autowired
    HttpServletRequest httpServletRequest;

    @RequestMapping("/loginPage.action")
    public String loginPage() {
        return "login.jsp";
    }

    @RequestMapping("/login.action")
    public String Login(User user, Model model) throws ParamErrorException {
        HttpSession session = httpServletRequest.getSession();
        User user1 = userDao.Login(user);
        String password = user.getPassword();
        if (password.length() < 3) {
            throw new ParamErrorException();
        }
        if (user1 != null) {
            session.setAttribute("user", user1);
            return "redirect:frame.jsp";
        } else {
            model.addAttribute("msg", "用户名或密码错误，请重新登录");
            return "login.jsp";
        }
    }

    @RequestMapping("/userList.action")
    public ModelAndView userList(@RequestParam(required = false, defaultValue = "1", value = "page") int page,User user) {
        ModelAndView modelAndView = new ModelAndView();
        PageHelper.startPage(page, 2);
        List<User> users = userDao.selectUser(user);
        PageInfo pageInfo = new PageInfo(users);
        String name=user.getName();
        modelAndView.addObject("name",name);
        modelAndView.addObject("pageInfo", pageInfo);
        modelAndView.setViewName("userList.jsp");
        return modelAndView;
    }
    @RequestMapping("/updateItemFile.action")
    public String updateItemFile(User user , MultipartFile multipartFile) throws IOException {
        String fileName = UUID.randomUUID().toString().replaceAll("-","");
        String extension = FilenameUtils.getExtension(multipartFile.getOriginalFilename());
        fileName = fileName + "." + extension;
        multipartFile.transferTo(new File("E:\\uplaod\\" + fileName));
        user.getHeadPath();
        return "redirect:/userList.action";
    }

    @RequestMapping("/userView.action")
    public ModelAndView userView(Integer id) {
        ModelAndView mav = new ModelAndView();
        User users = userDao.selectById(id);
        mav.addObject("user", users);
        mav.setViewName("userView.jsp");
        return mav;
    }

    @RequestMapping("/userAdd.action")
        public ModelAndView billAdd() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("userAdd.jsp");
        return mav;
    }

    @RequestMapping("/insertUser.action")
    public ModelAndView insertBook(@RequestParam(required = false, defaultValue = "1", value = "page") int page,User user) {
        ModelAndView mav = new ModelAndView();
        PageHelper.startPage(page, 2);
        userDao.insertUser(user);
        User user1=null;
        List<User> userList = userDao.selectUser(user1);
        PageInfo pageInfo = new PageInfo(userList);
        mav.addObject("pageInfo", pageInfo);
        mav.setViewName("userList.jsp");
        return mav;
    }

    @RequestMapping("/deleteUser.action")
    public ModelAndView deleteBook(@RequestParam(required = false, defaultValue = "1", value = "page") int page,Integer id) {
        ModelAndView mav = new ModelAndView();
        PageHelper.startPage(page, 2);
        userDao.deleteUser(id);
        User user=null;
        List<User> userList = userDao.selectUser(user);
        PageInfo pageInfo = new PageInfo(userList);
        mav.addObject("pageInfo", pageInfo);
        mav.setViewName("userList.jsp");
        return mav;
    }

    @RequestMapping("/userUpdate.action")
    public ModelAndView billUpdate(Integer id) {
        ModelAndView mav = new ModelAndView();
        User user = userDao.selectById(id);
        mav.addObject("user", user);
        mav.setViewName("userUpdate.jsp");
        return mav;
    }

    @RequestMapping("/updateUser.action")
    public ModelAndView updateBook(@RequestParam(required = false, defaultValue = "1", value = "page") int page,User user) {
        ModelAndView mav = new ModelAndView();
        PageHelper.startPage(page, 2);
        userDao.updateUser(user);
        User user1=null;
        List<User> userList = userDao.selectUser(user1);
        PageInfo pageInfo = new PageInfo(userList);
        mav.addObject("pageInfo", pageInfo);
        mav.setViewName("userList.jsp");
        return mav;
    }

    @RequestMapping("/updatePwd.action")
    public ModelAndView updatePwd() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("updatePwd.jsp");
        return mav;
    }

    @RequestMapping("/pwdUpdate.action")
    public ModelAndView pwdUpdate(@RequestParam(required = false, defaultValue = "1", value = "page") int page,User user) {
        ModelAndView mav = new ModelAndView();
        PageHelper.startPage(page, 2);
        userDao.pwdUpdate(user);
        User user1=null;
        List<User> userList = userDao.selectUser(user1);
        PageInfo pageInfo = new PageInfo(userList);
        mav.addObject("pageInfo", pageInfo);
        mav.setViewName("userList.jsp");
        return mav;
    }
    @ResponseBody
    @RequestMapping("/check.action")
    public String check(String name) {
        int i = userDao.CheckUserName(name);
        if (i > 0){
            return "用户名已被注册";
        }else {
            return "用户名没有被注册可以使用";
        }
    }

}