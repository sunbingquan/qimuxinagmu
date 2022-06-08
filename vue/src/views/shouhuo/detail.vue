<template>
    <div class="shouhuo-detail" v-loading="loading" ref="print">
        <el-page-header @back="goBack" content="详情页面"></el-page-header>
        <div class="admin-detail">
            <div class="detail detail-readmodule">
                <div class="detail-title">发货id：</div>
                <div class="detail-content">{{ map.fahuoid }}</div>
            </div>
            <div class="detail detail-text">
                <div class="detail-title">订单号：</div>
                <div class="detail-content">{{ map.dingdanhao }}</div>
            </div>
            <div class="detail detail-text">
                <div class="detail-title">收货人：</div>
                <div class="detail-content">{{ map.shouhuoren }}</div>
            </div>
            <div class="detail detail-text">
                <div class="detail-title">快递单号：</div>
                <div class="detail-content">{{ map.kuaididanhao }}</div>
            </div>
            <div class="detail detail-textuser">
                <div class="detail-title">下单人：</div>
                <div class="detail-content">{{ map.xiadanren }}</div>
            </div>
            <div class="detail detail-select">
                <div class="detail-title">快递公司：</div>
                <div class="detail-content">{{ map.kuaidigongsi }}</div>
            </div>
            <div class="detail detail-autotime">
                <div class="detail-title">收货时间：</div>
                <div class="detail-content">{{ map.addtime }}</div>
            </div>
            <div class="detail detail-dataset">
                <div class="detail-title">商品：</div>
                <div class="detail-content">
                    <e-dataset-table table="shouhuoshangpin" :where="{ shouhuoid : $route.query.id  }" order="id desc" var="dataSets">
                        <template v-slot="{dataSets}"
                            ><div id="dataListshangpin" style="text-align: left">
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                            <th>编号</th>
                                            <th>名称</th>
                                            <th>分类</th>
                                            <th>品牌</th>
                                            <th>图片</th>
                                            <th>价格</th>
                                            <th>数量</th>
                                            <th>小计</th>
                                            <th>购买人</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr v-for="dataMap in dataSets">
                                            <td>{{ dataMap.bianhao }}</td>
                                            <td>{{ dataMap.mingcheng }}</td>
                                            <td><e-select-view module="fenlei" :value="dataMap.fenlei" select="id" show="fenleiming"></e-select-view></td>
                                            <td>{{ dataMap.pinpai }}</td>
                                            <td><e-img :src="dataMap.tupian" type="list" style="max-width: 120px"></e-img></td>
                                            <td>{{ dataMap.jiage }}</td>
                                            <td>{{ dataMap.shuliang }}</td>
                                            <td>{{ dataMap.xiaoji }}</td>
                                            <td>{{ dataMap.goumairen }}</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </template>
                    </e-dataset-table>
                </div>
            </div>
        </div>
        <div class="mt10">
            <el-button type="default" class="hidePrint" @click="$router.go(-1)"> 返回 </el-button>
            <el-button type="success" class="hidePrint" @click="$print"> 打印本页 </el-button>
        </div>
    </div>
</template>
<style type="text/scss" scoped lang="scss">
    .shouhuo-detail {
        .admin-detail {
            display: flex;
            flex-wrap: wrap;
            margin-top: 30px;
            .detail {
                width: 50%;
                padding: 5px;
                display: flex;
                margin-bottom: 10px;
                border-bottom: 1px solid #DEDEDE;
                .detail-title {
                    width: 120px;
                    text-align: right;
                    flex-shrink: 0;
                }
                .detail-content {
                    flex-grow: 1;
                }
            }
            .detail.detail-images {
                width: 100%;
                flex-wrap: wrap;
                .detail-title {
                    display: none;
                }

                .detail-content {
                    width: 100%;
                    padding: 10px;
                }
            }
            .detail.detail-editor,
            .detail.detail-dataset {
                width: 100%;
                flex-wrap: wrap;
                .detail-title {
                    width: 100%;
                    padding: 10px;
                    margin-top: 10px;
                    background: #9a0606;
                    color: #ffffff;
                    text-align: left;
                }
                .detail-content {
                    padding: 10px;
                }
            }
        }
    }
</style>
<script>
    import api from "@/api";
    import { extend } from "@/utils/extend";

    export default {
        data() {
            return {
                loading: false,
                map: {},
            };
        },
        props: {
            id: {
                type: [String, Number],
                required: true,
            },
        },
        watch: {
            id: {
                handler() {
                    this.loadDetail();
                },
                immediate: true,
            },
        },
        computed: {},
        methods: {
            goBack() {
                this.$router.go(-1);
            },
            loadDetail() {
                if (this.loading) return;
                this.loading = true;
                this.$store
                    .dispatch("shouhuo/findById", this.id)
                    .then((res) => {
                        this.loading = false;
                        this.map = res;
                    })
                    .catch((err) => {
                        this.loading = false;
                        this.$message.error(err.message);
                    });
            },
        },
        created() {},
        mounted() {},
        destroyed() {},
    };
</script>
