package com.lee.utils;
/**
 * 账号操作结果代码
 */
public enum OperationResultCode
{
    SUCCESS(0, "操作成功"),
    UPLOADING_FILE(1, "上传文件成功!"),
    UPLOADING_FILE_OPTION(2, "请选择上传文件"),
    ;

    private int id;
    private String msg;

    private OperationResultCode(int id, String msg)
    {
        this.id = id;
        this.msg = msg;
    }

    public int getId()
    {
        return id;
    }

    public void setId(int id)
    {
        this.id = id;
    }

    public String getMsg()
    {
        return msg;
    }

    public void setMsg(String msg)
    {
        this.msg = msg;
    }
}