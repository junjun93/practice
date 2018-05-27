package com.junjun.shiro.model;

import lombok.Getter;
import lombok.Setter;

import java.util.HashSet;
import java.util.Set;

/**
 * @author junjun
 * @date 2018/5/24 16:57:06
 **/
@Getter
@Setter
public class User {

    private Integer uid;

    private String username;

    private String password;

    private Set<Role> roles = new HashSet<>();
}
