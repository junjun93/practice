package com.junjun.spike.service;

import com.junjun.spike.redis.KeyPrefix;

/**
 * @author junjun
 * @date 2018/9/26 15:57:14
 **/
public abstract class BasePrefix implements KeyPrefix {

    private int expireSeconds;

    private String prefix;

    public BasePrefix(String prefix){
        this(0, prefix);
    }

    public BasePrefix(int expireSeconds, String prefix){
        this.expireSeconds = expireSeconds;
        this.prefix = prefix;
    }

    //默认0代表永不过期
    @Override
    public int expireSeconds() {
        return expireSeconds;
    }

    @Override
    public String getPrefix() {
        //补充
        String className = getClass().getSimpleName();
        return className + ":" + prefix;
    }
}
