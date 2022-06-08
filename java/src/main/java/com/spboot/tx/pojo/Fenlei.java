package com.spboot.tx.pojo;

import com.baomidou.mybatisplus.annotation.*;
import com.jntoo.db.*;
import java.io.Serializable;
import java.util.*;

@TableName("fenlei")
public class Fenlei implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(type = IdType.AUTO)
    private Integer id;

    private String fenleiming;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getFenleiming() {
        return fenleiming;
    }

    public void setFenleiming(String fenleiming) {
        this.fenleiming = fenleiming == null ? "" : fenleiming.trim();
    }
}
