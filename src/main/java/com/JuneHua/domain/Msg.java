package com.JuneHua.domain;

import com.github.pagehelper.PageInfo;

import java.util.HashMap;

/**
 * 使用Msg类封装PageInfo数据，并对PageInfo进行增强
 */
public class Msg {
    //状态码，200表示正常，400表示错误
    private int code;

    //返回的消息
    private String msg;

    //用于分装数据
    private HashMap<String, Object> extend = new HashMap<>();

    //成功
    public static Msg success(){
        Msg msg=new Msg();
        msg.setCode(200);
        msg.setMsg("success");
        return msg;
    }

    //失败
    public static Msg fail(){
        Msg msg=new Msg();
        msg.setCode(400);
        msg.setMsg("fail");
        return msg;
    }

    //用于链式操作
    public Msg add(String key,Object value){
        this.getExtend().put(key, value);
        return this;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public HashMap<String, Object> getExtend() {
        return extend;
    }

    public void setExtend(HashMap<String, Object> extend) {
        this.extend = extend;
    }
}
