<template>
    <div class="v-admin-sy">
        <el-row :gutter="50">
            <el-col :span="6" style="margin-bottom: 50px">
                <div class="msg-box">
                    <div class="number">{{ adminsList.length }}</div>
                    <div class="text">管理员</div>
                </div>
            </el-col>
            <el-col :span="6" style="margin-bottom: 50px">
                <div class="msg-box">
                    <div class="number">{{ xinwenfenleiList.length }}</div>
                    <div class="text">新闻分类</div>
                </div>
            </el-col>
            <el-col :span="6" style="margin-bottom: 50px">
                <div class="msg-box">
                    <div class="number">{{ xinwenxinxiList.length }}</div>
                    <div class="text">新闻信息</div>
                </div>
            </el-col>
            <el-col :span="6" style="margin-bottom: 50px">
                <div class="msg-box">
                    <div class="number">{{ liuyanbanList.length }}</div>
                    <div class="text">留言板</div>
                </div>
            </el-col>
            <el-col :span="6" style="margin-bottom: 50px">
                <div class="msg-box">
                    <div class="number">{{ lunbotuList.length }}</div>
                    <div class="text">轮播图</div>
                </div>
            </el-col>
            <el-col :span="6" style="margin-bottom: 50px">
                <div class="msg-box">
                    <div class="number">{{ shoucangList.length }}</div>
                    <div class="text">收藏</div>
                </div>
            </el-col>
            <el-col :span="6" style="margin-bottom: 50px">
                <div class="msg-box">
                    <div class="number">{{ wxuserList.length }}</div>
                    <div class="text">微信用户</div>
                </div>
            </el-col>
            <el-col :span="6" style="margin-bottom: 50px">
                <div class="msg-box">
                    <div class="number">{{ fenleiList.length }}</div>
                    <div class="text">分类</div>
                </div>
            </el-col>
            <el-col :span="6" style="margin-bottom: 50px">
                <div class="msg-box">
                    <div class="number">{{ jiajuList.length }}</div>
                    <div class="text">家具</div>
                </div>
            </el-col>
            <el-col :span="6" style="margin-bottom: 50px">
                <div class="msg-box">
                    <div class="number">{{ gouwucheList.length }}</div>
                    <div class="text">购物车</div>
                </div>
            </el-col>
            <el-col :span="6" style="margin-bottom: 50px">
                <div class="msg-box">
                    <div class="number">{{ dingdanList.length }}</div>
                    <div class="text">订单</div>
                </div>
            </el-col>
            <el-col :span="6" style="margin-bottom: 50px">
                <div class="msg-box">
                    <div class="number">{{ shouhuodizhiList.length }}</div>
                    <div class="text">收货地址</div>
                </div>
            </el-col>
            <el-col :span="6" style="margin-bottom: 50px">
                <div class="msg-box">
                    <div class="number">{{ fahuoList.length }}</div>
                    <div class="text">发货</div>
                </div>
            </el-col>
            <el-col :span="6" style="margin-bottom: 50px">
                <div class="msg-box">
                    <div class="number">{{ shouhuoList.length }}</div>
                    <div class="text">收货</div>
                </div>
            </el-col>
            <el-col :span="6" style="margin-bottom: 50px">
                <div class="msg-box">
                    <div class="number">{{ dingdanshangpinList.length }}</div>
                    <div class="text">订单商品</div>
                </div>
            </el-col>
            <el-col :span="6" style="margin-bottom: 50px">
                <div class="msg-box">
                    <div class="number">{{ fahuoshangpinList.length }}</div>
                    <div class="text">发货商品</div>
                </div>
            </el-col>
            <el-col :span="6" style="margin-bottom: 50px">
                <div class="msg-box">
                    <div class="number">{{ shouhuoshangpinList.length }}</div>
                    <div class="text">收货商品</div>
                </div>
            </el-col>
            <el-col :span="6" style="margin-bottom: 50px">
                <div class="msg-box">
                    <div class="number">{{ pinglunList.length }}</div>
                    <div class="text">评论</div>
                </div>
            </el-col>
        </el-row>
    </div>
</template>
<style type="text/scss" lang="scss">
    .v-admin-sy {
        padding: 0 20px;
        .msg-box {
            padding: 10px;
            background: #ffffff;
            text-align: center;
            .number {
                padding: 10px 0;
                font-size: 36px;
                font-weight: bold;
                color: #900;
            }

            .text {
                font-size: 16px;
                padding-bottom: 10px;
            }
        }
    }
</style>
<script>
    import store from "@/store";
    const setting = require("@/setting");
    export default {
        name: "v-admin-sy",
        data() {
            return {
                setting,
            };
        },
        watch: {},
        computed: {
            adminsList() {
                return store.state.admins.lists;
            },
            xinwenfenleiList() {
                return store.state.xinwenfenlei.lists;
            },
            xinwenxinxiList() {
                return store.state.xinwenxinxi.lists;
            },
            liuyanbanList() {
                return store.state.liuyanban.lists;
            },
            lunbotuList() {
                return store.state.lunbotu.lists;
            },
            shoucangList() {
                return store.state.shoucang.lists;
            },
            wxuserList() {
                return store.state.wxuser.lists;
            },
            fenleiList() {
                return store.state.fenlei.lists;
            },
            jiajuList() {
                return store.state.jiaju.lists;
            },
            gouwucheList() {
                return store.state.gouwuche.lists;
            },
            dingdanList() {
                return store.state.dingdan.lists;
            },
            shouhuodizhiList() {
                return store.state.shouhuodizhi.lists;
            },
            fahuoList() {
                return store.state.fahuo.lists;
            },
            shouhuoList() {
                return store.state.shouhuo.lists;
            },
            dingdanshangpinList() {
                return store.state.dingdanshangpin.lists;
            },
            fahuoshangpinList() {
                return store.state.fahuoshangpin.lists;
            },
            shouhuoshangpinList() {
                return store.state.shouhuoshangpin.lists;
            },
            pinglunList() {
                return store.state.pinglun.lists;
            },
        },
        methods: {},
        created() {
            store.dispatch("admins/selectAll");

            store.dispatch("xinwenfenlei/selectAll");

            store.dispatch("xinwenxinxi/selectAll");

            store.dispatch("liuyanban/selectAll");

            store.dispatch("lunbotu/selectAll");

            store.dispatch("shoucang/selectAll");

            store.dispatch("wxuser/selectAll");

            store.dispatch("fenlei/selectAll");

            store.dispatch("jiaju/selectAll");

            store.dispatch("gouwuche/selectAll");

            store.dispatch("dingdan/selectAll");

            store.dispatch("shouhuodizhi/selectAll");

            store.dispatch("fahuo/selectAll");

            store.dispatch("shouhuo/selectAll");

            store.dispatch("dingdanshangpin/selectAll");

            store.dispatch("fahuoshangpin/selectAll");

            store.dispatch("shouhuoshangpin/selectAll");

            store.dispatch("pinglun/selectAll");
        },
        mounted() {},
        destroyed() {},
    };
</script>
