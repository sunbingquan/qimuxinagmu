package com.spboot.tx.utils;

import com.spboot.tx.pojo.*;
import java.io.Serializable;

public class SessionUser implements Serializable {
    private static final long serialVersionUID = 1L;
    // 用户id
    private Integer id;
    // 登录类型
    private String cx;
    // 用户名
    private String username;
    // 密码
    private String pwd;
    private String sub;
    private Long timer;

    public SessionUser()
    {

    }

    public SessionUser(Admins yonghu)
    {
        cx = yonghu.getCx();
        username = yonghu.getUsername();
        pwd = yonghu.getPwd();
        id = yonghu.getId();
    }

    public SessionUser(Wxuser user)
    {
        cx = "小程序";
        username = String.valueOf(user.getId());
        pwd = "";
        id = user.getId();
    }

    public String getSub() {
        return sub;
    }

    public void setSub(String sub) {
        this.sub = sub;
    }

    public Long getTimer() {
        return timer;
    }

    public void setTimer(Long timer) {
        this.timer = timer;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCx() {
        return cx;
    }

    public void setCx(String cx) {
        this.cx = cx;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

}
