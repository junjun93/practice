package com.junjun.spike.service;

/**
 * @author junjun
 * @date 2018/9/26 15:54:19
 **/
public class MiaoshaUserKey extends BasePrefix {

    public static final int TOKEN_EXPIRE = 3600 * 24 * 2;
    private String prefix;

    private  MiaoshaUserKey(int expireSeconds, String prefix){
        super(expireSeconds, prefix);
        this.prefix = prefix;
    }

    public static MiaoshaUserKey token = new MiaoshaUserKey(TOKEN_EXPIRE, "tk");

    public static MiaoshaUserKey getById = new MiaoshaUserKey(0, "id");

    public MiaoshaUserKey withExpire(int seconds){
        return new MiaoshaUserKey(seconds, prefix);
    }
}
