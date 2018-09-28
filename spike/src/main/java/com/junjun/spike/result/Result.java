package com.junjun.spike.result;

import lombok.Getter;
import lombok.Setter;

/**
 * @author junjun
 * @date 2018/9/26 14:55:52
 **/
@Getter
@Setter
public class Result<T> {

    public int code;
    private String msg;
    private T data;

    /**
     * 请求成功时调用
     * */
    public static <T> Result<T> success(T data){
        return new Result<T>(data);
    }

    /**
     * 请求失败时调用
     * */
    public static <T> Result<T> error(CodeMsg codeMsg){
        return new Result<T>(codeMsg);
    }

    private Result(T data){
        this.data = data;
    }

    /**
     * 这个方法何用，姑且预留
     * */
    private Result(int code, String msg){
        this.code = code;
        this.msg = msg;
    }

    private Result(CodeMsg codeMsg){
        if(codeMsg != null){
            this.code = codeMsg.getCode();
            this.msg = codeMsg.getMsg();
        }
    }
}
