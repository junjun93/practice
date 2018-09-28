package com.lee.utils;

import java.io.Serializable;

/**
 * 操作结果通知信息                     
 */
public class OperationResultMsg implements Serializable
{
    /**
     * 
     */
    private static final long serialVersionUID = -3349098656492188022L;
    private int id;
    private String resultMsg;
    private Object extraMsg;

    public OperationResultMsg(OperationResultCode code)
    {
        this.id = code.getId();
        this.resultMsg = code.getMsg();
    }

    public OperationResultMsg(OperationResultCode code, Object extraMsg)
    {
        this.id = code.getId();
        this.resultMsg = code.getMsg();
        this.extraMsg = extraMsg;
    }
    public OperationResultMsg()
    {
    }

    public int getId()
    {
        return id;
    }

    public void setId(int id)
    {
        this.id = id;
    }

    public Object getExtraMsg()
    {
        return extraMsg;
    }

    public void setExtraMsg(Object extraMsg)
    {
        this.extraMsg = extraMsg;
    }

    public String getResultMsg()
    {
        return resultMsg;
    }
    public void setResultMsg(String resultMsg)
    {
        this.resultMsg = resultMsg;
    }
}