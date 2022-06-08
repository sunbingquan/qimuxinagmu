package com.spboot.tx.pojo;

import com.baomidou.mybatisplus.annotation.*;
import com.jntoo.db.*;
import java.io.Serializable;
import java.util.*;

@TableName("gouwuche")
public class Gouwuche implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(type = IdType.AUTO)
    private Integer id;

    private Integer jiajuid;

    private String bianhao;

    private String mingcheng;

    private Integer fenlei;

    private String pinpai;

    private String tupian;

    private Double jiage;

    private Integer shuliang;

    private Double xiaoji;

    private String goumairen;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getJiajuid() {
        return jiajuid;
    }

    public void setJiajuid(Integer jiajuid) {
        this.jiajuid = jiajuid == null ? 0 : jiajuid;
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

    public Integer getShuliang() {
        return shuliang;
    }

    public void setShuliang(Integer shuliang) {
        this.shuliang = shuliang == null ? 0 : shuliang;
    }

    public Double getXiaoji() {
        return xiaoji;
    }

    public void setXiaoji(Double xiaoji) {
        this.xiaoji = xiaoji == null ? 0.0f : xiaoji;
    }

    public String getGoumairen() {
        return goumairen;
    }

    public void setGoumairen(String goumairen) {
        this.goumairen = goumairen == null ? "" : goumairen.trim();
    }
}
