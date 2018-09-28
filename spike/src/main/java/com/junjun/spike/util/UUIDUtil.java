package com.junjun.spike.util;

import java.util.UUID;

/**
 * @author junjun
 * @date 2018/9/26 16:22:08
 **/
public class UUIDUtil {

    public static String uuid(){
        return UUID.randomUUID().toString().replace("-", "");
    }
}
