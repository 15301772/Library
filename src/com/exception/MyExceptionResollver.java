package com.exception;

import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MyExceptionResollver implements HandlerExceptionResolver {
    @Override
    public ModelAndView resolveException(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) {
        ModelAndView mav = new ModelAndView();
       if (e instanceof ParamErrorException){
           mav.addObject("msg",e.toString());
       }else {
           mav.addObject("msg","未知的异常");
       }
       mav.setViewName("error.jsp");
       return mav;
    }
}
