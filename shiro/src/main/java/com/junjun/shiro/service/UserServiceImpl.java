package com.junjun.shiro.service;

import com.junjun.shiro.mapper.UserMapper;
import com.junjun.shiro.model.User;

import javax.annotation.Resource;

/**
 * @author junjun
 * @date 2018/5/24 17:13:10
 **/
public class UserServiceImpl implements UserService {
    @Resource
    private UserMapper userMapper;

    @Override
    public User findByUsername(String username){
        return userMapper.findByUsername(username);
    }
}
