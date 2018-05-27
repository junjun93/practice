package com.junjun.shiro.mapper;

import com.junjun.shiro.model.User;
import org.apache.ibatis.annotations.Param;

/**
 * @author junjun
 * @date 2018/5/24 17:10:48
 **/
public interface UserMapper {

    /**
     * 通过用户名找用户
     * */
    User findByUsername(@Param("username") String username);
}
