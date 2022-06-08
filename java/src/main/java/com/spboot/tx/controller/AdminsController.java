package com.spboot.tx.controller;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.util.StrUtil;
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
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.*;

@Api(tags = { "管理员控制器" })
@RestController
@RequestMapping("/api/admins")
public class AdminsController {

    @Autowired
    public AdminsService adminsService;

    @Autowired
    public AdminsMapper adminsMapper;

    @Resource
    private HttpServletRequest request;

    @Resource
    private HttpServletResponse response;

    @ApiOperation(value = "获取全部管理员", httpMethod = "GET")
    @RequestMapping("/selectAll")
    public ResponseData<List<Admins>> selectAll() {
        return adminsService.selectAll();
    }

    @ApiOperation(value = "根据条件筛选获取管理员列表，并分页", httpMethod = "POST")
    @RequestMapping("/selectPages")
    public ResponseData selectPages(@RequestBody Map<String, Object> req) {
        return adminsService.selectPages(req);
    }

    @ApiOperation(value = "根据过滤信息获取相关数据", httpMethod = "POST")
    @RequestMapping("/filter")
    public ResponseData<List<Admins>> filter(@RequestBody Map<String, Object> req) {
        return adminsService.filter(req);
    }

    @Autowired
    private AuthenticationManager authenticationManager;

    @ApiOperation(value = "修改密码", httpMethod = "POST")
    @PostMapping("/editPassword")
    public ResponseData<Object> editPassword(
        @RequestParam(required = false) String oldPassword,
        @RequestParam(required = false) String newPwd,
        @RequestParam(required = false) String newPwd2
    ) {
        Authentication authentication = null;
        SessionUser user = Request.user();
        if (!user.getCx().equals("小程序")) {
            if (StrUtil.hasBlank(oldPassword) || StrUtil.hasBlank(newPwd) || StrUtil.hasBlank(newPwd2)) {
                return JsonResult.error("请输入密码");
            }

            if (!newPwd.equals(newPwd2)) {
                return JsonResult.error("确认密码不正确，请重试");
            }

            try {
                //会自动调用loadUserByUsername方法，若查到用户，且用户名密码正确，则验证通过。
                // 关于密码的解密，配置在WebSecurityConfig类中（与注册时的加密策略保持相同）
                String pwd = oldPassword;
                authentication = authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(user.getUsername(), pwd));
            } catch (Exception e) {
                e.printStackTrace();
                //当loadUserByUsername方法找不到用户时，会进入此异常
                //若查到用户，且用户名密码不匹配，会进入此异常
                return JsonResult.error("原密码错误");
            }
            Admins admins = adminsMapper.selectById(user.getId());
            admins.setPwd(newPwd);
            return adminsService.update(admins, new HashMap());
        }
        return JsonResult.error("此用户不支持修改密码");
    }

    @ApiOperation(value = "根据id获取信息", httpMethod = "GET")
    @RequestMapping("/findById")
    @ApiImplicitParam(name = "id", value = "管理员对应的id", dataType = "Integer")
    public ResponseData findById(@RequestParam Integer id) {
        return adminsService.findById(id);
    }

    @ApiOperation(value = "根据id更新数据", httpMethod = "POST")
    @RequestMapping("/update")
    @ApiImplicitParam(name = "data", value = "使用json数据提交", type = "json", dataTypeClass = Admins.class, paramType = "body")
    public ResponseData update(@RequestBody Map data) {
        Admins post = BeanUtil.mapToBean(data, Admins.class, true);
        return adminsService.update(post, data);
    }

    @ApiOperation(value = "插入一行数据，返回插入后的管理员", httpMethod = "POST")
    @RequestMapping("/insert")
    @ApiImplicitParam(name = "data", value = "使用json数据提交", type = "json", dataTypeClass = Admins.class, paramType = "body")
    public ResponseData insert(@RequestBody Map data) {
        Admins post = BeanUtil.mapToBean(data, Admins.class, true);
        return adminsService.insert(post, data);
    }

    @ApiOperation(value = "根据id列表删除数据", httpMethod = "POST")
    @RequestMapping("/delete")
    @ApiImplicitParam(name = "id", value = "管理员对应的id", type = "json", dataTypeClass = List.class)
    public ResponseData delete(@RequestBody List<Integer> id) {
        return adminsService.delete(id);
    }
}
