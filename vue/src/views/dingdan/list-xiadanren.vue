<template>
    <div class="v-list" v-loading="loading" element-loading-text="加载中">
        <el-card class="box-card">
            <div slot="header" class="clearfix">
                <span class="title"> 订单列表 </span>
            </div>
            <!-- 搜索 -->
            <div class="form-search">
                <el-form @submit.prevent.stop :inline="true" size="mini">
                    <el-form-item label="关键字">
                        <el-input v-model="search.keyword" style="width: 150px" placeholder="搜索关键字"></el-input>
                    </el-form-item>
                    <el-form-item label="订单号">
                        <el-input v-model="search.dingdanhao"></el-input>
                    </el-form-item>
                    <el-form-item label="状态">
                        <el-select v-model="search.zhuangtai"
                            ><el-option label="请选择" value=""></el-option><el-option label="待付款" value="待付款"></el-option>
                            <el-option label="已付款" value="已付款"></el-option>
                            <el-option label="已发货" value="已发货"></el-option>
                            <el-option label="已收货" value="已收货"></el-option>
                        </el-select>
                    </el-form-item>
                    <el-form-item>
                        <el-button type="primary" @click="searchSubmit" icon="el-icon-search">查询</el-button>
                    </el-form-item>
                </el-form>
            </div>

            <el-table border :data="list" style="width: 100%" highlight-current-row>
                <el-table-column type="index" label="#"></el-table-column>
                <!-- 序号 -->

                <el-table-column label="订单号" width="130">
                    <template slot-scope="{row}"> {{ row.dingdanhao }} </template>
                </el-table-column>
                <el-table-column label="金额" width="80">
                    <template slot-scope="{row}"> {{ row.jine }} </template>
                </el-table-column>
                <el-table-column label="状态" width="80">
                    <template slot-scope="{row}"> {{ row.zhuangtai }} </template>
                </el-table-column>
                <el-table-column label="收货人" width="130">
                    <template slot-scope="{row}"> {{ row.shouhuoren }} </template>
                </el-table-column>
                <el-table-column label="联系电话" width="130">
                    <template slot-scope="{row}"> {{ row.lianxidianhua }} </template>
                </el-table-column>
                <el-table-column label="详细地址" width="130">
                    <template slot-scope="{row}"> {{ row.xiangxidizhi }} </template>
                </el-table-column>
                <el-table-column label="备注">
                    <template slot-scope="{row}"> {{ row.beizhu }} </template>
                </el-table-column>
                <el-table-column label="下单人" width="80">
                    <template slot-scope="{row}"> {{ row.xiadanren }} </template>
                </el-table-column>

                <el-table-column label="是否支付" width="120">
                    <template slot-scope="{row}">
                        {{ row.iszf }}
                        <el-button
                            size="mini"
                            type="primary"
                            @click="$goto({path:'/admin/pay' , query:{biao:'dingdan' , id:row.id,ordersn:row.dingdanhao,zongji:row.jine } })"
                            v-if="row.iszf=='否'"
                        >
                            去支付
                        </el-button>
                    </template>
                </el-table-column>

                <el-table-column label="操作">
                    <template slot-scope="{row}">
                        <el-button-group>

                            <el-tooltip content="详情" placement="top">
                                <el-button @click="$goto({path:'/admin/dingdandetail',query:{id:row.id } })" icon="el-icon-info" type="info" size="mini"></el-button>
                            </el-tooltip>
                            <el-tooltip content="编辑" placement="top">
                                <el-button icon="el-icon-edit" @click="$goto({path:'/admin/dingdanupdt',query:{id:row.id } })" type="warning" size="mini"></el-button>
                            </el-tooltip>
                            <el-tooltip content="删除" placement="top">
                                <el-button icon="el-icon-delete" type="danger" size="mini" @click="deleteItem(row)"> </el-button>
                            </el-tooltip>
                        </el-button-group>
                    </template>
                </el-table-column>
            </el-table>

            <div class="e-pages" style="margin-top: 10px; text-align: center">
                <el-pagination
                    @current-change="loadList"
                    :current-page="page"
                    :page-size="pagesize"
                    @size-change="sizeChange"
                    layout="total, sizes, prev, pager, next, jumper"
                    :total="totalCount"
                >
                </el-pagination>
            </div>
        </el-card>
    </div>
</template>
<style type="text/scss" scoped lang="scss"></style>
<script>
    import api from "@/api";
    import { remove, checkIssh, findIndex } from "@/utils/utils";
    import { extend } from "@/utils/extend";
    import objectDiff from "objectdiff";

    /**
     * 后台列表页面
     */
    export default {
        data() {
            return {
                loading: false,
                list: [],
                search: {
                    keyword: "",
                    dingdanhao: "",
                    shangpin: "",
                    zhuangtai: "",
                },
                total: {},
                page: 1, // 当前页
                pagesize: 12, // 页大小
                totalCount: 0, // 总行数
                multipleSelection: [],
                //xinwenfenleiList: [],
            };
        },
        watch: {},
        computed: {},
        methods: {
            searchSubmit() {
                this.loadList(1);
            },
            selectTableChange(vals) {
                this.multipleSelection = vals;
            },
            sizeChange(e) {
                this.pagesize = e;
                this.loadList(1);
            },
            loadList(page) {
                // 防止重新点加载列表
                if (this.loading) return;
                this.loading = true;
                this.page = page;
                // 筛选条件
                var filter = extend(true, {}, this.search, { page: page + "", pagesize: this.pagesize + "" });
                var diff = objectDiff.diff(filter, this.$route.query);
                if (diff.changed != "equal") {
                    // 筛选的条件不一致则更新链接
                    this.$router.push({
                        // 更新query
                        path: this.$route.path,
                        query: filter,
                    });
                }

                filter.session_name = "xiadanren";

                this.$store
                    .dispatch("dingdan/query", filter)
                    .then((res) => {
                        this.loading = false;
                        if (res.code == api.code.OK) {
                            var data = res.data;
                            this.list = data.lists.records;
                            this.totalCount = data.lists.total;
                        }
                    })
                    .catch((err) => {
                        this.loading = false;
                        this.$message.error(err.message);
                    });
            },

            // 删除选中行数据
            batchDeleteItems() {
                this.deleteItems(this.multipleSelection);
            },
            // 删除某行方法
            deleteItem(row) {
                this.deleteItems([row]);
            },
            deleteItems(items) {
                this.$confirm("确定删除数据？此操作不可恢复", "警告", {
                    type: "error",
                }).then(() => {
                    this.loading = true;
                    var ids = items.map((element) => {
                        return element.id;
                    });
                    this.$store.dispatch("dingdan/delete", ids).then((res) => {
                        this.loading = false;
                        if (res.code != api.code.OK) {
                            this.$message.error(res.msg);
                        } else {
                            for (var i = 0; i < ids.length; i++) {
                                var ci = ids[i];
                                var index = findIndex(this.list, (v) => v.id == ci);
                                remove(this.list, index);
                                this.totalCount--;
                            }
                            if (this.list.length == 0) {
                                this.loadList(this.page); // 没数据了重新加载数据
                            }
                            this.$message.success("删除成功");
                        }
                    });
                });
            },
        },
        beforeRouteUpdate(to, form, next) {
            extend(this.search, to.query);
            this.loadList(1);
            next();
        },
        created() {
            var search = extend(this.search, this.$route.query);
            if (search.page) {
                this.page = Math.floor(this.$route.query.page);
                delete search.page;
            }
            if (search.pagesize) {
                this.pagesize = Math.floor(this.$route.query.pagesize);
                delete search.pagesize;
            }

            this.loadList(1);
        },
        mounted() {},
        destroyed() {},
    };
</script>
