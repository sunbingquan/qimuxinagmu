package com.spboot.tx.pojo;

import com.baomidou.mybatisplus.annotation.*;
import java.io.Serializable;
import java.util.*;
import com.jntoo.db.*;

@TableName("fahuo")

public class Fahuo implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(type = IdType.AUTO)
    private Integer id;



    private Integer dingdanid;


    private String dingdanhao;


    private String shangpin;


    private String shouhuoren;


    private String lianxidianhua;


    private String xiangxidizhi;


    private String xiadanren;


    private String kuaididanhao;


    private String kuaidigongsi;


    private String kuaididianhua;


    private String addtime;

    public Integer getId() {
        return id;
    }
    public void setId(Integer id) {
        this.id = id;
    }
    public Long getShouhuoCount()
    {
        return DB.name("shouhuo").where("fahuoid" , id).count();
    }


    public Integer getDingdanid() {
        return dingdanid;
    }
    public void setDingdanid(Integer dingdanid) {
        this.dingdanid = dingdanid == null ? 0 : dingdanid;
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
    public List<Fahuoshangpin> getShangpinList() {
        return DB.name(Fahuoshangpin.class).where("fahuoid" , id).order("id asc").select();
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

    public String getXiadanren() {
        return xiadanren;
    }
    public void setXiadanren(String xiadanren) {
        this.xiadanren = xiadanren == null ? "" : xiadanren.trim();
    }

    public String getKuaididanhao() {
        return kuaididanhao;
    }
    public void setKuaididanhao(String kuaididanhao) {
        this.kuaididanhao = kuaididanhao == null ? "" : kuaididanhao.trim();
    }

    public String getKuaidigongsi() {
        return kuaidigongsi;
    }
    public void setKuaidigongsi(String kuaidigongsi) {
        this.kuaidigongsi = kuaidigongsi == null ? "" : kuaidigongsi.trim();
    }

    public String getKuaididianhua() {
        return kuaididianhua;
    }
    public void setKuaididianhua(String kuaididianhua) {
        this.kuaididianhua = kuaididianhua == null ? "" : kuaididianhua.trim();
    }

    public String getAddtime() {
        return addtime;
    }
    public void setAddtime(String addtime) {
        this.addtime = addtime == null ? "" : addtime.trim();
    }

}
