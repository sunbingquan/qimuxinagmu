package com.spboot.tx.pojo;

import com.baomidou.mybatisplus.annotation.*;
import com.jntoo.db.*;
import java.io.Serializable;
import java.util.*;

@TableName("wxuser")
public class Wxuser implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(type = IdType.AUTO)
    private Integer id;

    private String openid;

    @TableField("nickName")
    private String nickName;

    @TableField("avatarUrl")
    private String avatarUrl;

    private String xingming;

    private String xingbie;

    private Integer nianling;

    private String shouji;

    private String youxiang;

    private String zhuzhi;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getOpenid() {
        return openid;
    }

    public void setOpenid(String openid) {
        this.openid = openid == null ? "" : openid.trim();
    }

    public String getNickName() {
        return nickName;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName == null ? "" : nickName.trim();
    }

    public String getAvatarUrl() {
        return avatarUrl;
    }

    public void setAvatarUrl(String avatarUrl) {
        this.avatarUrl = avatarUrl == null ? "" : avatarUrl.trim();
    }

    public String getXingming() {
        return xingming;
    }

    public void setXingming(String xingming) {
        this.xingming = xingming == null ? "" : xingming.trim();
    }

    public String getXingbie() {
        return xingbie;
    }

    public void setXingbie(String xingbie) {
        this.xingbie = xingbie == null ? "" : xingbie.trim();
    }

    public Integer getNianling() {
        return nianling;
    }

    public void setNianling(Integer nianling) {
        this.nianling = nianling == null ? 0 : nianling;
    }

    public String getShouji() {
        return shouji;
    }

    public void setShouji(String shouji) {
        this.shouji = shouji == null ? "" : shouji.trim();
    }

    public String getYouxiang() {
        return youxiang;
    }

    public void setYouxiang(String youxiang) {
        this.youxiang = youxiang == null ? "" : youxiang.trim();
    }

    public String getZhuzhi() {
        return zhuzhi;
    }

    public void setZhuzhi(String zhuzhi) {
        this.zhuzhi = zhuzhi == null ? "" : zhuzhi.trim();
    }
}
