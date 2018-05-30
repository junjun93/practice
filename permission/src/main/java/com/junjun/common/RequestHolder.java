package com.junjun.common;

import com.junjun.model.SysUser;

/**
 * @author junjun
 * @date 2018/5/29 21:44:22
 **/
public class RequestHolder {

    private static final ThreadLocal<SysUser> userHolder = new ThreadLocal<>();
}
