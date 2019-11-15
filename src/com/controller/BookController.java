package com.controller;

import com.pojo.Bill;
import com.pojo.Borrow;
import com.pojo.User;
import com.service.BillDao;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Controller
public class BookController {
    @Autowired
    BillDao billDao;
    @Autowired
    HttpServletRequest httpServletRequest;
    @RequestMapping("/billList.action")
    public ModelAndView billList(Bill bill){
        ModelAndView mav=new ModelAndView();
        List<Bill> billList = billDao.selectBillList(bill);
        mav.addObject("billList",billList);
        mav.setViewName("billList.jsp");
        return mav;
    }
    @RequestMapping("/bill2.action")
    public ModelAndView bill2(Bill bill){
        ModelAndView mav=new ModelAndView();
        List<Bill> bills = billDao.selectBill2(bill);
        mav.addObject("bills",bills);
        mav.setViewName("bill2.jsp");
        return mav;
    }
    @RequestMapping("/billView.action")
        public ModelAndView billView(Integer id){
            ModelAndView mav = new ModelAndView();
            Bill bills = billDao.selectById(id);
            mav.addObject("bill",bills);
            mav.setViewName("billView.jsp");
            return mav;
    }

    @RequestMapping(" /billAdd.action")
    public ModelAndView billAdd(){
        ModelAndView mav=new ModelAndView();
        mav.setViewName("billAdd.jsp");
        return mav;
    }

    @RequestMapping("/insertBook.action")
    public ModelAndView insertBook(Bill bill){
        ModelAndView mav=new ModelAndView();
        billDao.insertBook(bill);
        Bill bill1 = null;
        List<Bill> billList = billDao.selectBillList(bill1);
        mav.addObject("billList",billList);
        mav.setViewName("billList.jsp");
        return mav;
    }
    @RequestMapping("/deleteBook.action")
    public ModelAndView deleteBook(String id) {
        ModelAndView mav = new ModelAndView();
        Integer ID = Integer.parseInt(id);
        billDao.deleteBook(ID);
        Bill bill = null;
        List<Bill> billList = billDao.selectBillList(bill);
        mav.addObject("billList",billList);
        mav.setViewName("billList.jsp");
        return mav;
    }
    @RequestMapping("/billUpdate.action")
    public ModelAndView billUpdate(Integer id) {
        ModelAndView mav = new ModelAndView();
        Bill bills = billDao.selectById(id);
        mav.addObject("bill", bills);
        mav.setViewName("billUpdate.jsp");
        return mav;
    }
    @RequestMapping("/updateBook.action")
    public ModelAndView update(Bill bill){
        ModelAndView mav = new ModelAndView();
        billDao.updateBook(bill);
        Bill bill1 = null;
        List<Bill> billList = billDao.selectBillList(bill1);
        mav.addObject("billList",billList);
        mav.setViewName("billList.jsp");
        return mav;
    }

    @RequestMapping("/borrow.action")
    public ModelAndView borrow(String bill_id){
        HttpSession session = httpServletRequest.getSession();
        User user = (User) session.getAttribute("user");
        Integer userId=user.getId();
        Integer bookId= Integer.parseInt(bill_id);
        Borrow borrow=new Borrow();
        borrow.setBookId(bookId);
        borrow.setUserId(userId);
        ModelAndView mav = new ModelAndView();
        Bill bill=new Bill();
        bill.setId(bookId);
        billDao.insertBorrow(borrow);
        billDao.updatePress(bill);
        Bill bill1 = null;
        List<Bill> bills = billDao.selectBill2(bill1);
        mav.addObject("bills",bills);
        mav.setViewName("bill2.jsp");

        return mav;
    }
}
