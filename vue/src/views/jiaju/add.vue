<template>
    <div class="jiaju-add" v-loading="loading">
        <el-card class="box-card">
            <div slot="header" class="clearfix">
                <span class="title"> 添加家具</span>
            </div>
            <div class="form-database-form">
                <el-form :model="form" ref="formModel" label-width="130px" status-icon validate-on-rule-change>
                    <el-form-item label="编号" prop="bianhao" :rules="[{required:true, message:'请填写编号'}]">
                        <el-input type="text" placeholder="输入编号" style="width: 250px" v-model="form.bianhao" />
                    </el-form-item>

                    <el-form-item label="名称" prop="mingcheng" required :rules="[{required:true, message:'请填写名称'}]">
                        <el-input type="text" placeholder="输入名称" style="width: 450px" v-model="form.mingcheng" />
                    </el-form-item>

                    <el-form-item label="分类" prop="fenlei">
                        <el-select v-model="form.fenlei"><e-select-option type="option" module="fenlei" value="id" label="fenleiming"></e-select-option></el-select>
                    </el-form-item>

                    <el-form-item label="品牌" prop="pinpai"> <el-input type="text" placeholder="输入品牌" style="width: 250px" v-model="form.pinpai" /> </el-form-item>

                    <el-form-item label="图片" prop="tupian"> <e-upload-images v-model="form.tupian"></e-upload-images> </el-form-item>

                    <el-form-item label="价格" prop="jiage" required :rules="[{required:true, message:'请填写价格'}, {validator:rule.checkNumber, message:'输入一个有效数字'}]">
                        <el-input type="number" placeholder="输入价格" style="width: 250px" v-model.number="form.jiage" />
                    </el-form-item>

                    <el-form-item label="库存" prop="kucun" required :rules="[{required:true, message:'请填写库存'}, {validator:rule.checkNumber, message:'输入一个有效数字'}]">
                        <el-input type="number" placeholder="输入库存" style="width: 250px" v-model.number="form.kucun" />
                    </el-form-item>

                    <el-form-item label="详情" prop="xiangqing"> <e-editor v-model="form.xiangqing"></e-editor> </el-form-item>

                    <el-form-item label="添加人" prop="tianjiaren"> <el-input v-model="form.tianjiaren" readonly style="width: 250px"></el-input> </el-form-item>

                    <el-form-item v-if="btnText">
                        <el-button type="primary" @click="submit">{{ btnText }}</el-button>
                    </el-form-item>
                </el-form>
            </div>
        </el-card>
    </div>
</template>
<style type="text/scss" scoped lang="scss">
    .jiaju-add {
    }
</style>
<script>
    import api from "@/api";
    import rule from "@/utils/rule";
    import { extend } from "@/utils/extend";
    import formUtil from "./form";

    export default {
        name: "jiaju-add",
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
                            .dispatch("jiaju/insert", form)
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
