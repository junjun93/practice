package com.junjun.controller;

import com.junjun.beans.PageQuery;
import com.junjun.common.JsonData;
import com.junjun.param.AclParam;
import com.junjun.service.SysAclService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

/**
 * @author junjun
 * @date 2018/7/27 15:20:17
 **/
@Controller
@RequestMapping("/sys/acl")
@Slf4j
public class SysAclController {
    @Resource
    private SysAclService sysAclService;

    @RequestMapping("/save.json")
    @ResponseBody
    public JsonData saveAclModule(AclParam param){
        sysAclService.save(param);
        return JsonData.success();
    }

    @RequestMapping("/update.json")
    @ResponseBody
    public JsonData updateModule(AclParam param){
        sysAclService.update(param);
        return JsonData.success();
    }

    @RequestMapping("/page.json")
    @ResponseBody
    public JsonData list(@RequestParam("aclModuleId") Integer aclModuleId, PageQuery pageQuery){
        return JsonData.success(sysAclService.getPageByAclModuleId(aclModuleId, pageQuery));
    }
}
