package com.junjun.util;

import org.apache.commons.lang3.StringUtils;

/**
 * @author junjun
 * @date 2018/6/3 20:27:52
 **/
public class LevelUtil {

    public final static String SEPARATOR = ".";
    public final static String ROOT = "0";

    public static String calculateLevel(String parentLevel, int parentId){
        if(StringUtils.isBlank(parentLevel)){
            return ROOT;
        }
        return StringUtils.join(parentLevel, SEPARATOR, parentId);
    }
}
