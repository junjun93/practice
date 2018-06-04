package com.junjun.controller;

import com.junjun.common.JsonData;
import com.junjun.exception.ParamException;
import com.junjun.exception.PermissionException;
import com.junjun.param.TestVo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @author junjun
 * @date 2018/6/4 21:27:32
 **/
@Controller
@RequestMapping("/test")
@Slf4j
public class TestController {

    @RequestMapping("hello.json")
    @ResponseBody
    public JsonData hello(){
        log.info("hello");
        throw new PermissionException("test exception");
        // return JsonData.success("hello, permission");
    }

    @RequestMapping("/validate.json")
    @ResponseBody
    public JsonData volidate(TestVo vo) throws ParamException{
        log.info("validate");
        return JsonData.success("test validate");
    }
}
