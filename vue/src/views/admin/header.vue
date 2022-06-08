<template>
    <header id="header">
        <ul id="menu">
            <li id="guide" class="line-trigger">
                <div class="line-wrap">
                    <div class="line top"></div>
                    <div class="line center"></div>
                    <div class="line bottom"></div>
                </div>
            </li>
            <li id="logo" class="hidden-xs">
                <router-link to="/">
                    <img src="~@/assets/zheng/img/logo.png" />
                </router-link>
                <span id="system_title" v-text="title"></span>
            </li>
            <li class="pull-right">
                <ul class="hi-menu">
                    <li class="dropdown">
                        <el-dropdown trigger="click">
                            <a class="waves-effect waves-light" style="color: #ffffff" href="javascript:;">
                                <i class="him-icon zmdi zmdi-dropbox"></i>
                            </a>
                            <el-dropdown-menu slot="dropdown">
                                <el-dropdown-item v-for="sys in system_list" @click.native="sys_switch(sys)">
                                    <a class="waves-effect switch-systems" href="javascript:;">
                                        <i class="zmdi" :class="sys.icon"></i>
                                        {{sys.title}}
                                    </a>
                                </el-dropdown-item>
                            </el-dropdown-menu>
                        </el-dropdown>
                    </li>
                    <li>
                        <a href="javascript:;" @click="logout" class="waves-effect waves-light"> 退出登录 </a>
                    </li>
                </ul>
            </li>
        </ul>
    </header>
</template>
<style type="type/scss" lang="scss"></style>
<script>
    import api from "@/api";

    export default {
        name: "admin-header",
        props: {
            title: [String],
            system_list: [Array],
            user_menus: [Array],
        },
        data: function () {
            return {
                search_text: "",
            };
        },
        methods: {
            //将事件提交给父组件
            sys_switch: function (sys) {
                this.title = sys.title;
                this.$emit("click_sys_switch", sys);
            },
            logout() {
                this.$confirm("确定退出登录？", "确认信息").then(() => {
                    // 退出登录
                    this.$store
                        .dispatch("user/logout")
                        .then((res) => {
                            if (res.code == api.code.OK) {
                                this.$message.success("退出登录成功");
                                this.$router.replace("/index");
                            } else {
                                this.$message.error(res.msg);
                            }
                        })
                        .catch((err) => {
                            this.$message.error(err.message);
                        });
                });
            },
        },
    };
</script>
