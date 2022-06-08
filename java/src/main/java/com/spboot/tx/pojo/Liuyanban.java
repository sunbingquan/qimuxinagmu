package com.spboot.tx.pojo;

import com.baomidou.mybatisplus.annotation.*;
import com.jntoo.db.*;
import java.io.Serializable;
import java.util.*;

@TableName("liuyanban")
public class Liuyanban implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(type = IdType.AUTO)
    private Integer id;

    private String xingming;

    private String lianxidianhua;

    private String liuyanneirong;

    private String liuyanren;

    private String huifuneirong;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getXingming() {
        return xingming;
    }

    public void setXingming(String xingming) {
        this.xingming = xingming == null ? "" : xingming.trim();
    }

    public String getLianxidianhua() {
        return lianxidianhua;
    }

    public void setLianxidianhua(String lianxidianhua) {
        this.lianxidianhua = lianxidianhua == null ? "" : lianxidianhua.trim();
    }

    public String getLiuyanneirong() {
        return liuyanneirong;
    }

    public void setLiuyanneirong(String liuyanneirong) {
        this.liuyanneirong = liuyanneirong == null ? "" : liuyanneirong.trim();
    }

    public String getLiuyanren() {
        return liuyanren;
    }

    public void setLiuyanren(String liuyanren) {
        this.liuyanren = liuyanren == null ? "" : liuyanren.trim();
    }

    public String getHuifuneirong() {
        return huifuneirong;
    }

    public void setHuifuneirong(String huifuneirong) {
        this.huifuneirong = huifuneirong == null ? "" : huifuneirong.trim();
    }
}
