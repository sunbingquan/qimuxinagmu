<template>
    <div class="dingdan-add" v-loading="loading">
        <el-card class="box-card">
            <div slot="header" class="clearfix">
                <span class="title"> 添加订单</span>
            </div>
            <div class="form-database-form">
                <el-form :model="form" ref="formModel" label-width="130px" status-icon validate-on-rule-change>
                    <el-form-item label="订单号" prop="dingdanhao" :rules="[{required:true, message:'请填写订单号'}]">
                        <el-input type="text" placeholder="输入订单号" style="width: 250px" v-model="form.dingdanhao" />
                    </el-form-item>

                    <el-form-item label="商品" prop="shangpin">
                        <e-dataset-table table="gouwuche" :where="{ goumairen : $session.username  }" order="id desc" var="dataSets">
                            <template v-slot="{dataSets}">
                                <div id="dataListshangpin" style="text-align: left">
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
                    </el-form-item>

                    <el-form-item label="金额" prop="jine" required :rules="[{required:true, message:'请填写金额'}, {validator:rule.checkNumber, message:'输入一个有效数字'}]">
                        <el-input type="number" placeholder="输入金额" style="width: 250px" v-model.number="form.jine" />
                    </el-form-item>

                    <el-form-item label="收货信息" prop="shouhuoxinxi">
                        <e-select-list
                            :model="form"
                            v-model="form.shouhuoxinxi"
                            module="shouhuodizhi"
                            select-update="shouhuoren,lianxidianhua,xiangxidizhi"
                            search-update=""
                        ></e-select-list>
                        <table>
                            <tr>
                                <td width="120">收货人</td>
                                <td>{{ form.shouhuoren }}</td>
                            </tr>
                            <tr>
                                <td width="120">联系电话</td>
                                <td>{{ form.lianxidianhua }}</td>
                            </tr>
                            <tr>
                                <td width="120">详细地址</td>
                                <td>{{ form.xiangxidizhi }}</td>
                            </tr>
                        </table>
                    </el-form-item>

                    <el-form-item label="收货人" prop="shouhuoren"> <el-input type="text" placeholder="输入收货人" style="width: 250px" v-model="form.shouhuoren" /> </el-form-item>

                    <el-form-item label="联系电话" prop="lianxidianhua">
                        <el-input type="text" placeholder="输入联系电话" style="width: 250px" v-model="form.lianxidianhua" />
                    </el-form-item>

                    <el-form-item label="详细地址" prop="xiangxidizhi">
                        <el-input type="text" placeholder="输入详细地址" style="width: 250px" v-model="form.xiangxidizhi" />
                    </el-form-item>

                    <el-form-item label="备注" prop="beizhu"> <el-input type="textarea" v-model="form.beizhu"></el-input> </el-form-item>

                    <el-form-item label="下单人" prop="xiadanren"> <el-input v-model="form.xiadanren" readonly style="width: 250px"></el-input> </el-form-item>

                    <el-form-item v-if="btnText">
                        <el-button type="primary" @click="submit">{{ btnText }}</el-button>
                    </el-form-item>
                </el-form>
            </div>
        </el-card>
    </div>
</template>
<style type="text/scss" scoped lang="scss">
    .dingdan-add {
    }
</style>
<script>
    import api from "@/api";
    import rule from "@/utils/rule";
    import { extend } from "@/utils/extend";
    import formUtil from "./form";

    export default {
        name: "dingdan-add",
        data() {
            return {
                rule,
                loading: false,
                form: {},
            };
        },
        watch: {},
        props: {
            isRead: {
                type: Boolean,
                default: true,
            },
            btnText: {
                type: String,
                default: "提交",
            },
        },

        computed: {},
        methods: {
            submit() {
                this.$refs.formModel
                    .validate()
                    .then((res) => {
                        if (this.loading) return;
                        this.loading = true;
                        var form = this.form;

                        this.$store
                            .dispatch("dingdan/insert", form)
                            .then((res) => {
                                this.loading = false;
                                if (res.code == 0) {
                                    this.$message.success("添加成功");
                                    this.loadInfo();
                                } else {
                                    this.$message.error(res.msg);
                                }
                            })
                            .catch((err) => {
                                this.loading = false;
                                this.$message.error(err.message);
                            });
                    })
                    .catch((err) => {
                        console.log(err.message);
                    });
            },
            loadInfo() {
                if (this.loading) return;
                var form = this.form;
                this.form = formUtil.createForm();

                // 获取模块得数据
            },
        },
        created() {
            this.loadInfo();
        },
        mounted() {},
        destroyed() {},
    };
</script>
