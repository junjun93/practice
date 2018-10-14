package com.junjun.spike.redis;

import lombok.AllArgsConstructor;

/**
 * @author junjun
 * @date 2018/9/27 17:08:01
 **/
@AllArgsConstructor
public class BasePrefix implements KeyPrefix {

    private int expireSeconds;
    private String prefix;

    private BasePrefix(String prefix){
        this(0, prefix);
    }

    @Override
    public int expireSeconds(){
        return expireSeconds;
    }

    @Override
    public String getPrefix(){
        String className = getClass().getSimpleName();
        return className + ":" + prefix;
    }
}
