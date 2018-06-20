package com.junjun.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * @author junjun
 * @date 2018/6/20 21:54:32
 **/
@Controller
@RequestMapping("/admin")
public class AdminController {

    @RequestMapping("index.page")
    public ModelAndView index(){
         return new ModelAndView("admin");
    }
}
