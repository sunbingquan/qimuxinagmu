<template>
    <div class="fahuo-add" v-loading="loading">
        <el-card class="box-card">
            <div slot="header" class="clearfix">
                <span class="title"> 添加发货</span>
            </div>
            <div class="form-database-form">
                <el-form :model="form" ref="formModel" label-width="130px" status-icon validate-on-rule-change>
                    <el-form-item v-if="isRead" label="订单号" prop="dingdanhao"> {{ form.dingdanhao }} </el-form-item>

                    <el-form-item v-if="isRead" label="商品" prop="shangpin">
                        <e-dataset-table table="dingdanshangpin" :where="{ dingdanid : $route.query.id  }" order="id desc" var="dataSets">
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
                    </el-form-item>

                    <el-form-item v-if="isRead" label="收货人" prop="shouhuoren"> {{ form.shouhuoren }} </el-form-item>

                    <el-form-item v-if="isRead" label="联系电话" prop="lianxidianhua"> {{ form.lianxidianhua }} </el-form-item>

                    <el-form-item v-if="isRead" label="详细地址" prop="xiangxidizhi"> {{ form.xiangxidizhi }} </el-form-item>

                    <el-form-item v-if="isRead" label="下单人" prop="xiadanren"> {{ form.xiadanren }} </el-form-item>

                    <el-form-item
                        label="快递单号"
                        prop="kuaididanhao"
                        required
                        :rules="[{required:true, message:'请填写快递单号'}, {validator:rule.checkRemote, message:'内容重复了', checktype:'insert', module:'fahuo', col:'kuaididanhao', trigger:'blur'}]"
                    >
                        <el-input type="text" placeholder="输入快递单号" style="width: 250px" v-model="form.kuaididanhao" />
                    </el-form-item>

                    <el-form-item label="快递公司" prop="kuaidigongsi" required :rules="[{required:true, message:'请填写快递公司'}]">
                        <el-select v-model="form.kuaidigongsi"
                            ><el-option label="顺丰" value="顺丰"></el-option>
                            <el-option label="京东" value="京东"></el-option>
                            <el-option label="邮政" value="邮政"></el-option>
                            <el-option label="中通" value="中通"></el-option>
                            <el-option label="申通" value="申通"></el-option>
                            <el-option label="圆通" value="圆通"></el-option>
                            <el-option label="韵达" value="韵达"></el-option>
                        </el-select>
                    </el-form-item>

                    <el-form-item
                        label="快递电话"
                        prop="kuaididianhua"
                        required
                        :rules="[{required:true, message:'请填写快递电话'}, {validator:rule.checkTel, message:'请输入正确固定号码'}]"
                    >
                        <el-input type="text" placeholder="输入快递电话" style="width: 250px" v-model="form.kuaididianhua" />
                    </el-form-item>

                    <el-form-item v-if="btnText">
                        <el-button type="primary" @click="submit">{{ btnText }}</el-button>
                    </el-form-item>
                </el-form>
            </div>
        </el-card>
    </div>
</template>
<style type="text/scss" scoped lang="scss">
    .fahuo-add {
    }
</style>
<script>
    import api from "@/api";
    import rule from "@/utils/rule";
    import { extend } from "@/utils/extend";
    import formUtil from "./form";

    export default {
        name: "fahuo-add",
        data() {
            return {
                readMap: {},
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
                            .dispatch("fahuo/insert", form)
                            .then((res) => {
                                this.loading = false;
                                if (res.code == 0) {
                                    this.$message.success("添加成功");
                                    this.$router.go(-1);
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
                this.loading = true;
                formUtil
                    .loadInfo(this.$route.query.id)
                    .then((res) => {
                        this.loading = false;
                        this.form = res.form;
                        this.readMap = res.readMap;
                    })
                    .catch((err) => {
                        this.loading = false;
                        this.$message.error(err.message);
                        this.$router.go(-1);
                    });
            },
        },
        created() {
            this.loadInfo();
        },
        mounted() {},
        destroyed() {},
    };
</script>
