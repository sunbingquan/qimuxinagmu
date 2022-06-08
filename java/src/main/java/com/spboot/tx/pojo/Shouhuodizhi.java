package com.spboot.tx.pojo;

import com.baomidou.mybatisplus.annotation.*;
import com.jntoo.db.*;
import java.io.Serializable;
import java.util.*;

@TableName("shouhuodizhi")
public class Shouhuodizhi implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(type = IdType.AUTO)
    private Integer id;

    private String shouhuoren;

    private String lianxidianhua;

    private String xiangxidizhi;

    private String tianjiaren;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getShouhuoren() {
        return shouhuoren;
    }

    public void setShouhuoren(String shouhuoren) {
        this.shouhuoren = shouhuoren == null ? "" : shouhuoren.trim();
    }

    public String getLianxidianhua() {
        return lianxidianhua;
    }

    public void setLianxidianhua(String lianxidianhua) {
        this.lianxidianhua = lianxidianhua == null ? "" : lianxidianhua.trim();
    }

    public String getXiangxidizhi() {
        return xiangxidizhi;
    }

    public void setXiangxidizhi(String xiangxidizhi) {
        this.xiangxidizhi = xiangxidizhi == null ? "" : xiangxidizhi.trim();
    }

    public String getTianjiaren() {
        return tianjiaren;
    }

    public void setTianjiaren(String tianjiaren) {
        this.tianjiaren = tianjiaren == null ? "" : tianjiaren.trim();
    }
}
