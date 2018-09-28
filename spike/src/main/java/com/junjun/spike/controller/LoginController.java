package com.junjun.spike.controller;

import com.junjun.spike.result.Result;
import com.junjun.spike.service.MiaoshaUserService;
import com.junjun.spike.vo.LoginVo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

/**
 * @author junjun
 * @date 2018/9/26 14:49:45
 **/
@Controller
@RequestMapping("/login")
@Slf4j
public class LoginController {

    //补充代码
    @Autowired
    private MiaoshaUserService userService;

    @RequestMapping("/to_login")
    public String toLogin(){
        return "login";
    }

    @RequestMapping("/do_login")
    @ResponseBody
    public Result<String> doLogin(HttpServletResponse response, @Valid LoginVo loginVo){

        log.info(loginVo.toString());
        //登录  TODO
        String token = userService.login(response, loginVo);
        return Result.success(token);
    }

}
