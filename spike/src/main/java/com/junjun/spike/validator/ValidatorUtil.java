package com.junjun.spike.validator;

import org.apache.commons.lang3.StringUtils;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * @author junjun
 * @date 2018/9/26 20:48:46
 **/
public class ValidatorUtil {
    
    private static final Pattern mobile_pattern = Pattern.compile("1\\d{10}");
    
    public static boolean isMobile(String src){
        if(StringUtils.isEmpty(src)){
            return false;
        }
        Matcher m = mobile_pattern.matcher(src);
        return m.matches();
    }
}
