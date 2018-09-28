package com.junjun.spike.redis;

import lombok.AllArgsConstructor;

/**
 * @author junjun
 * @date 2018/9/27 17:08:01
 **/
@AllArgsConstructor
public class BasePrefix {

    private int expireSeconds;
    private String prefix;

    private BasePrefix(String prefix){
        this(0, prefix);
    }

    public int expireSeconds(){
        return expireSeconds;
    }

    private String getPrefix(){
        String className = getClass().getSimpleName();
        return className + ":" + prefix;
    }
}
