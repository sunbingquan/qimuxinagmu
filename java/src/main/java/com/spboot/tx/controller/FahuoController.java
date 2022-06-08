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

@Api(tags = { "发货控制器" })
@RestController
@RequestMapping("/api/fahuo")
public class FahuoController {

    @Autowired
    public FahuoService fahuoService;

    @Resource
    private HttpServletRequest request;

    @Resource
    private HttpServletResponse response;

    @ApiOperation(value = "获取全部发货", httpMethod = "GET")
    @RequestMapping("/selectAll")
    public ResponseData<List<Fahuo>> selectAll() {
        return fahuoService.selectAll();
    }

    @ApiOperation(value = "根据条件筛选获取发货列表，并分页", httpMethod = "POST")
    @RequestMapping("/selectPages")
    public ResponseData selectPages(@RequestBody Map<String, Object> req) {
        return fahuoService.selectPages(req);
    }

    @ApiOperation(value = "根据条件筛选获取发货列表，并分页，且只出现某用户列表信息", httpMethod = "POST")
    @RequestMapping("/selectPagesXiadanren")
    public ResponseData selectPagesXiadanren(@RequestBody Map<String, Object> req) {
        req.put("session_name", "xiadanren");
        return fahuoService.selectPages(req);
    }

    @ApiOperation(value = "根据过滤信息获取相关数据", httpMethod = "POST")
    @RequestMapping("/filter")
    public ResponseData<List<Fahuo>> filter(@RequestBody Map<String, Object> req) {
        return fahuoService.filter(req);
    }

    @ApiOperation(value = "根据id获取信息", httpMethod = "GET")
    @RequestMapping("/findById")
    @ApiImplicitParam(name = "id", value = "发货对应的id", dataType = "Integer")
    public ResponseData findById(@RequestParam Integer id) {
        return fahuoService.findById(id);
    }

    @ApiOperation(value = "根据id更新数据", httpMethod = "POST")
    @RequestMapping("/update")
    @ApiImplicitParam(name = "data", value = "使用json数据提交", type = "json", dataTypeClass = Fahuo.class, paramType = "body")
    public ResponseData update(@RequestBody Map data) {
        Fahuo post = BeanUtil.mapToBean(data, Fahuo.class, true);
        return fahuoService.update(post, data);
    }

    @ApiOperation(value = "插入一行数据，返回插入后的发货", httpMethod = "POST")
    @RequestMapping("/insert")
    @ApiImplicitParam(name = "data", value = "使用json数据提交", type = "json", dataTypeClass = Fahuo.class, paramType = "body")
    public ResponseData insert(@RequestBody Map data) {
        Fahuo post = BeanUtil.mapToBean(data, Fahuo.class, true);
        return fahuoService.insert(post, data);
    }

    @ApiOperation(value = "根据id列表删除数据", httpMethod = "POST")
    @RequestMapping("/delete")
    @ApiImplicitParam(name = "id", value = "发货对应的id", type = "json", dataTypeClass = List.class)
    public ResponseData delete(@RequestBody List<Integer> id) {
        return fahuoService.delete(id);
    }
}
