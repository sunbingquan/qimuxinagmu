package com.spboot.tx.pojo;

import com.baomidou.mybatisplus.annotation.*;
import java.io.Serializable;
import java.util.*;
import com.jntoo.db.*;

@TableName("shouhuo")

public class Shouhuo implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(type = IdType.AUTO)
    private Integer id;



    private Integer fahuoid;


    private String dingdanhao;


    private String shangpin;


    private String shouhuoren;


    private String xiadanren;


    private String kuaididanhao;


    private String kuaidigongsi;


    private String addtime;

    public Integer getId() {
        return id;
    }
    public void setId(Integer id) {
        this.id = id;
    }


    public Integer getFahuoid() {
        return fahuoid;
    }
    public void setFahuoid(Integer fahuoid) {
        this.fahuoid = fahuoid == null ? 0 : fahuoid;
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
    public List<Shouhuoshangpin> getShangpinList() {
        return DB.name(Shouhuoshangpin.class).where("shouhuoid" , id).order("id asc").select();
    }

    public String getShouhuoren() {
        return shouhuoren;
    }
    public void setShouhuoren(String shouhuoren) {
        this.shouhuoren = shouhuoren == null ? "" : shouhuoren.trim();
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

    public String getAddtime() {
        return addtime;
    }
    public void setAddtime(String addtime) {
        this.addtime = addtime == null ? "" : addtime.trim();
    }

}
