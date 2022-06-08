<template>
    <div class="wxuser-detail" v-loading="loading" ref="print">
        <el-page-header @back="goBack" content="详情页面"></el-page-header>
        <div class="admin-detail">
            <div class="detail detail-text">
                <div class="detail-title">用户：</div>
                <div class="detail-content">{{ map.openid }}</div>
            </div>
            <div class="detail detail-text">
                <div class="detail-title">昵称：</div>
                <div class="detail-content">{{ map.nickName }}</div>
            </div>
            <div class="detail detail-text">
                <div class="detail-title">姓名：</div>
                <div class="detail-content">{{ map.xingming }}</div>
            </div>
            <div class="detail detail-text">
                <div class="detail-title">手机：</div>
                <div class="detail-content">{{ map.shouji }}</div>
            </div>
            <div class="detail detail-text">
                <div class="detail-title">邮箱：</div>
                <div class="detail-content">{{ map.youxiang }}</div>
            </div>
            <div class="detail detail-text">
                <div class="detail-title">住址：</div>
                <div class="detail-content">{{ map.zhuzhi }}</div>
            </div>
            <div class="detail detail-image">
                <div class="detail-title">头像：</div>
                <div class="detail-content">
                    <e-img :src="map.avatarUrl" style="max-width: 120px" />
                </div>
            </div>
            <div class="detail detail-select">
                <div class="detail-title">性别：</div>
                <div class="detail-content">{{ map.xingbie }}</div>
            </div>
            <div class="detail detail-number">
                <div class="detail-title">年龄：</div>
                <div class="detail-content">{{ map.nianling }}</div>
            </div>
        </div>
        <div class="mt10">
            <el-button type="default" class="hidePrint" @click="$router.go(-1)"> 返回 </el-button>
            <el-button type="success" class="hidePrint" @click="$print"> 打印本页 </el-button>
        </div>
    </div>
</template>
<style type="text/scss" scoped lang="scss">
    .wxuser-detail {
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
                    .dispatch("wxuser/findById", this.id)
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
