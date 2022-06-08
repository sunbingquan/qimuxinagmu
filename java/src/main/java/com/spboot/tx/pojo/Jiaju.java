package com.spboot.tx.pojo;

import com.baomidou.mybatisplus.annotation.*;
import com.jntoo.db.*;
import java.io.Serializable;
import java.util.*;

@TableName("jiaju")
public class Jiaju implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(type = IdType.AUTO)
    private Integer id;

    private String bianhao;

    private String mingcheng;

    private Integer fenlei;

    private String pinpai;

    private String tupian;

    private Double jiage;

    private Integer kucun;

    private Integer xiaoliang;

    private String xiangqing;

    private String tianjiaren;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Long getGouwucheCount() {
        return DB.name("gouwuche").where("jiajuid", id).count();
    }

    public String getBianhao() {
        return bianhao;
    }

    public void setBianhao(String bianhao) {
        this.bianhao = bianhao == null ? "" : bianhao.trim();
    }

    public String getMingcheng() {
        return mingcheng;
    }

    public void setMingcheng(String mingcheng) {
        this.mingcheng = mingcheng == null ? "" : mingcheng.trim();
    }

    public Integer getFenlei() {
        return fenlei;
    }

    public void setFenlei(Integer fenlei) {
        this.fenlei = fenlei == null ? 0 : fenlei;
    }

    public String getPinpai() {
        return pinpai;
    }

    public void setPinpai(String pinpai) {
        this.pinpai = pinpai == null ? "" : pinpai.trim();
    }

    public String getTupian() {
        return tupian;
    }

    public void setTupian(String tupian) {
        this.tupian = tupian == null ? "" : tupian.trim();
    }

    public Double getJiage() {
        return jiage;
    }

    public void setJiage(Double jiage) {
        this.jiage = jiage == null ? 0.0f : jiage;
    }

    public Integer getKucun() {
        return kucun;
    }

    public void setKucun(Integer kucun) {
        this.kucun = kucun == null ? 0 : kucun;
    }

    public Integer getXiaoliang() {
        return xiaoliang;
    }

    public void setXiaoliang(Integer xiaoliang) {
        this.xiaoliang = xiaoliang == null ? 0 : xiaoliang;
    }

    public String getXiangqing() {
        return xiangqing;
    }

    public void setXiangqing(String xiangqing) {
        this.xiangqing = xiangqing == null ? "" : xiangqing.trim();
    }

    public String getTianjiaren() {
        return tianjiaren;
    }

    public void setTianjiaren(String tianjiaren) {
        this.tianjiaren = tianjiaren == null ? "" : tianjiaren.trim();
    }
}
