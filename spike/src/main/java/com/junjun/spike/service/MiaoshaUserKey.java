package com.junjun.spike.service;

/**
 * @author junjun
 * @date 2018/9/26 15:54:19
 **/
public class MiaoshaUserKey extends BasePrefix {

    public static final int TOKEN_EXPIRE = 3600 * 24 * 2;
    private String prefix;

    @Override
    public int expireSeconds() {
        return 0;
    }

    @Override
    public String getPrefix() {
        return null;
    }

    /*private  MiaoshaUserKey(int )*/
}
