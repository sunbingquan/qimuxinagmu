<template>
    <div class="xinwenxinxi-add" v-loading="loading">
        <el-card class="box-card">
            <div slot="header" class="clearfix">
                <span class="title"> 添加新闻信息</span>
            </div>
            <div class="form-database-form">
                <el-form :model="form" ref="formModel" label-width="130px" status-icon validate-on-rule-change>
                    <el-form-item
                        label="标题"
                        prop="biaoti"
                        required
                        :rules="[{required:true, message:'请填写标题'}, {validator:rule.checkRemote, message:'内容重复了', checktype:'insert', module:'xinwenxinxi', col:'biaoti', trigger:'blur'}]"
                    >
                        <el-input type="text" placeholder="输入标题" style="width: 450px" v-model="form.biaoti" />
                    </el-form-item>

                    <el-form-item label="分类" prop="fenlei" required :rules="[{required:true, message:'请填写分类'}]">
                        <el-select v-model="form.fenlei"><e-select-option type="option" module="xinwenfenlei" value="id" label="fenleimingcheng"></e-select-option></el-select>
                    </el-form-item>

                    <el-form-item label="图片" prop="tupian"> <e-upload-image v-model="form.tupian"></e-upload-image> </el-form-item>

                    <el-form-item label="发布人" prop="faburen"> <el-input v-model="form.faburen" readonly style="width: 250px"></el-input> </el-form-item>

                    <el-form-item label="内容" prop="neirong"> <e-editor v-model="form.neirong"></e-editor> </el-form-item>

                    <el-form-item v-if="btnText">
                        <el-button type="primary" @click="submit">{{ btnText }}</el-button>
                    </el-form-item>
                </el-form>
            </div>
        </el-card>
    </div>
</template>
<style type="text/scss" scoped lang="scss">
    .xinwenxinxi-add {
    }
</style>
<script>
    import api from "@/api";
    import rule from "@/utils/rule";
    import { extend } from "@/utils/extend";
    import formUtil from "./form";

    export default {
        name: "xinwenxinxi-add",
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
                            .dispatch("xinwenxinxi/insert", form)
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
