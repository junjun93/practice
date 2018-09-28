package com.junjun.service;

import com.junjun.dao.admmaMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * @author junjun
 * @date 2018/8/30 10:12:24
 **/
@Service
public class UserManagerService {

    @Resource
    public admmaMapper admmaMapper;

    public void selectAll(){
        admmaMapper.select();
    }
}
