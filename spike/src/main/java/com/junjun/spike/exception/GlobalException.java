package com.junjun.spike.exception;

import com.junjun.spike.result.CodeMsg;

/**
 * @author junjun
 * @date 2018/9/26 16:11:58
 **/
public class GlobalException extends RuntimeException{

    private static final long serialVersionUID = 1L;

    private CodeMsg cm;

    public  GlobalException(CodeMsg cm){
        super(cm.toString());
        this.cm = cm;
    }

    public CodeMsg getCm(){
        return cm;
    }
}
