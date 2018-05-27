package com.junjun.shiro.service;

import com.junjun.shiro.mapper.UserMapper;
import com.junjun.shiro.model.User;

import javax.annotation.Resource;

/**
 * @author junjun
 * @date 2018/5/24 17:14:12
 **/
public interface UserService {

    User findByUsername(String username);
}
