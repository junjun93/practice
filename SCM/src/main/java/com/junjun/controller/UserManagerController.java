package com.junjun.controller;

import com.junjun.service.UserManagerService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

/**
 * @author junjun
 * @date 2018/8/30 09:58:02
 **/
@Controller
@RequestMapping("/userManager")
public class UserManagerController {

    @Resource
    private UserManagerService userManagerService;

    @RequestMapping("/selectAll.do")
    @ResponseBody
    public void selectAll(){
        userManagerService.selectAll();
    }

}
