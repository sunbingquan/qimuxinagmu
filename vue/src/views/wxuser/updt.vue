<template>
    <div class="wxuser-add" v-loading="loading">
        <el-card class="box-card">
            <div slot="header" class="clearfix updt">
                <el-page-header @back="$router.go(-1)" content="编辑微信用户"> </el-page-header>
            </div>
            <div class="form-database-form">
                <el-form :model="form" ref="formModel" label-width="130px" status-icon validate-on-rule-change>
                    <el-form-item label="昵称" prop="nickName"> <el-input type="text" placeholder="输入昵称" style="width: 250px" v-model="form.nickName" /> </el-form-item>

                    <el-form-item label="头像" prop="avatarUrl"> <e-upload-image v-model="form.avatarUrl"></e-upload-image> </el-form-item>

                    <el-form-item label="姓名" prop="xingming"> <el-input type="text" placeholder="输入姓名" style="width: 250px" v-model="form.xingming" /> </el-form-item>

                    <el-form-item label="性别" prop="xingbie">
                        <el-select v-model="form.xingbie"
                            ><el-option label="男" value="男"></el-option>
                            <el-option label="女" value="女"></el-option>
                        </el-select>
                    </el-form-item>

                    <el-form-item label="年龄" prop="nianling" :rules="[{validator:rule.checkNumber, message:'输入一个有效数字'}]">
                        <el-input type="number" placeholder="输入年龄" style="width: 250px" v-model.number="form.nianling" />
                    </el-form-item>

                    <el-form-item label="手机" prop="shouji" :rules="[{validator:rule.checkPhone, message:'请输入正确手机号码'}]">
                        <el-input type="text" placeholder="输入手机" style="width: 250px" v-model="form.shouji" />
                    </el-form-item>

                    <el-form-item label="邮箱" prop="youxiang" :rules="[{type:'email', message:'请输入正确邮箱地址'}]">
                        <el-input type="text" placeholder="输入邮箱" style="width: 250px" v-model="form.youxiang" />
                    </el-form-item>

                    <el-form-item label="住址" prop="zhuzhi"> <el-input type="text" placeholder="输入住址" style="width: 250px" v-model="form.zhuzhi" /> </el-form-item>

                    <el-form-item v-if="btnText">
                        <el-button type="primary" @click="submit">{{ btnText }}</el-button>
                    </el-form-item>
                </el-form>
            </div>
        </el-card>
    </div>
</template>
<style type="text/scss" scoped lang="scss">
    .wxuser-add {
    }
</style>
<script>
    import api from "@/api";
    import rule from "@/utils/rule";
    import { extend } from "@/utils/extend";
    import formUtil from "./form";

    export default {
        name: "wxuser-add",
        data() {
            return {
                rule,
                loading: false,
                form: {},
            };
        },
        watch: {
            id: {
                handler() {
                    this.loadInfo();
                },
            },
        },
        props: {
            isRead: {
                type: Boolean,
                default: true,
            },
            btnText: {
                type: String,
                default: "提交",
            },
            id: {
                type: [String, Number],
                required: true,
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
                            .dispatch("wxuser/update", form)
                            .then((res) => {
                                this.loading = false;
                                if (res.code == 0) {
                                    this.$message.success("更新成功");
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

                // 更新数据,获取数据
                this.loading = true;
                this.$store
                    .dispatch("wxuser/findById", this.id)
                    .then((res) => {
                        this.loading = false;
                        this.form = res;
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
