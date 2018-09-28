package com.junjun.spike.redis;

/**
 * @author junjun
 * @date 2018/9/26 15:51:47
 **/
public interface KeyPrefix {

    public int expireSeconds();

    public String getPrefix();
}
