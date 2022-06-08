package com.spboot.tx.pojo;

import com.baomidou.mybatisplus.annotation.*;
import java.io.Serializable;
import java.util.*;
import com.jntoo.db.*;

@TableName("dingdan")

public class Dingdan implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(type = IdType.AUTO)
    private Integer id;



    private String dingdanhao;


    private String shangpin;


    private Double jine;


    private String zhuangtai;


    private Integer shouhuoxinxi;


    private String shouhuoren;


    private String lianxidianhua;


    private String xiangxidizhi;


    private String beizhu;


    private String xiadanren;
    private String iszf;

    public Integer getId() {
        return id;
    }
    public void setId(Integer id) {
        this.id = id;
    }
    public Long getFahuoCount()
    {
        return DB.name("fahuo").where("dingdanid" , id).count();
    }


    public String getDingdanhao() {
        return dingdanhao;
    }
    public void setDingdanhao(String dingdanhao) {
        this.dingdanhao = dingdanhao == null ? "" : dingdanhao.trim();
    }

    public String getShangpin() {
        return shangpin;
    }
    public void setShangpin(String shangpin) {
        this.shangpin = shangpin == null ? "" : shangpin.trim();
    }
    public List<Dingdanshangpin> getShangpinList() {
        return DB.name(Dingdanshangpin.class).where("dingdanid" , id).order("id asc").select();
    }

    public Double getJine() {
        return jine;
    }
    public void setJine(Double jine) {
        this.jine = jine == null ? 0.0f : jine;
    }

    public String getZhuangtai() {
        return zhuangtai;
    }
    public void setZhuangtai(String zhuangtai) {
        this.zhuangtai = zhuangtai == null ? "" : zhuangtai.trim();
    }

    public Integer getShouhuoxinxi() {
        return shouhuoxinxi;
    }
    public void setShouhuoxinxi(Integer shouhuoxinxi) {
        this.shouhuoxinxi = shouhuoxinxi == null ? 0 : shouhuoxinxi;
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

    public String getBeizhu() {
        return beizhu;
    }
    public void setBeizhu(String beizhu) {
        this.beizhu = beizhu == null ? "" : beizhu.trim();
    }

    public String getXiadanren() {
        return xiadanren;
    }
    public void setXiadanren(String xiadanren) {
        this.xiadanren = xiadanren == null ? "" : xiadanren.trim();
    }
    public String getIszf() {
        return iszf;
    }
    public void setIszf(String iszf) {
        this.iszf = iszf == null ? "" : iszf.trim();
    }

}
