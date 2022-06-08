package com.spboot.tx.controller;

import cn.hutool.core.bean.BeanUtil;
import com.spboot.tx.mapper.*;
import com.spboot.tx.pojo.*;
import com.spboot.tx.service.*;
import com.spboot.tx.utils.*;
import io.swagger.annotations.*;
import java.io.*;
import java.util.*;
import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@Api(tags = { "订单控制器" })
@RestController
@RequestMapping("/api/dingdan")
public class DingdanController {

    @Autowired
    public DingdanService dingdanService;

    @Resource
    private HttpServletRequest request;

    @Resource
    private HttpServletResponse response;

    @ApiOperation(value = "获取全部订单", httpMethod = "GET")
    @RequestMapping("/selectAll")
    public ResponseData<List<Dingdan>> selectAll() {
        return dingdanService.selectAll();
    }

    @ApiOperation(value = "根据条件筛选获取订单列表，并分页", httpMethod = "POST")
    @RequestMapping("/selectPages")
    public ResponseData selectPages(@RequestBody Map<String, Object> req) {
        return dingdanService.selectPages(req);
    }

    @ApiOperation(value = "根据条件筛选获取订单列表，并分页，且只出现某用户列表信息", httpMethod = "POST")
    @RequestMapping("/selectPagesXiadanren")
    public ResponseData selectPagesXiadanren(@RequestBody Map<String, Object> req) {
        req.put("session_name", "xiadanren");
        return dingdanService.selectPages(req);
    }

    @ApiOperation(value = "根据过滤信息获取相关数据", httpMethod = "POST")
    @RequestMapping("/filter")
    public ResponseData<List<Dingdan>> filter(@RequestBody Map<String, Object> req) {
        return dingdanService.filter(req);
    }

    @ApiOperation(value = "根据id获取信息", httpMethod = "GET")
    @RequestMapping("/findById")
    @ApiImplicitParam(name = "id", value = "订单对应的id", dataType = "Integer")
    public ResponseData findById(@RequestParam Integer id) {
        return dingdanService.findById(id);
    }

    @ApiOperation(value = "根据id更新数据", httpMethod = "POST")
    @RequestMapping("/update")
    @ApiImplicitParam(name = "data", value = "使用json数据提交", type = "json", dataTypeClass = Dingdan.class, paramType = "body")
    public ResponseData update(@RequestBody Map data) {
        Dingdan post = BeanUtil.mapToBean(data, Dingdan.class, true);
        return dingdanService.update(post, data);
    }

    @ApiOperation(value = "插入一行数据，返回插入后的订单", httpMethod = "POST")
    @RequestMapping("/insert")
    @ApiImplicitParam(name = "data", value = "使用json数据提交", type = "json", dataTypeClass = Dingdan.class, paramType = "body")
    public ResponseData insert(@RequestBody Map data) {
        Dingdan post = BeanUtil.mapToBean(data, Dingdan.class, true);
        return dingdanService.insert(post, data);
    }

    @ApiOperation(value = "根据id列表删除数据", httpMethod = "POST")
    @RequestMapping("/delete")
    @ApiImplicitParam(name = "id", value = "订单对应的id", type = "json", dataTypeClass = List.class)
    public ResponseData delete(@RequestBody List<Integer> id) {
        return dingdanService.delete(id);
    }
}
