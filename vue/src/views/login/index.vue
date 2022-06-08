<template>
    <div class="login-zheng">
        <div id="login-window">
            <div style="color: #0b0b0b" class="title">{{ setting.title }}</div>
            <form method="post" style="padding-left: 30px" action="javascript:;" @submit="login">
                <zheng-input v-model="form.username" class="m-b-20" placeholder="帐号">
                    <i class="zmdi zmdi-account" slot="icon"></i>
                </zheng-input>

                <zheng-input v-model="form.pwd" type="password" class="m-b-20" placeholder="密码">
                    <i class="zmdi zmdi-male" slot="icon"></i>
                </zheng-input>

                <zheng-select v-model="form.cx" class="m-b-20">
                    <i class="zmdi zmdi-account" slot="icon"></i>
                    <el-option :value="r" :label="r" v-for="r in rules" :key="r"></el-option>
                </zheng-select>

                <zheng-input v-model="form.pagerandom" class="m-b-20" placeholder="验证码">
                    <i class="fa fa-reorder" slot="icon"></i>
                    <div slot="append">
                        <e-img :src="captchUrl"></e-img>
                    </div>
                </zheng-input>

                <div class="clearfix"></div>
                <a id="login-bt" href="javascript:;" @click="login" class="waves-effect waves-button waves-float">
                    <i class="zmdi zmdi-arrow-forward"></i>
                </a>
            </form>
        </div>
    </div>
</template>
<style type="type/scss" lang="scss">
    .login-zheng {
        width: 100vw;
        height: 100vh;
        background: #ECECEC;
        &:before {
            height: 50%;
            width: 100%;
            position: absolute;
            top: 0;
            left: 0;
           /* background: #29a176;
            content: "";
            z-index: 0;*/

        }
        background-image: url("./img.png");
        background-repeat: repeat;
        background-attachment: fixed;
        background-size: cover;
        background-repeat: repeat-x;
        #login-window {
            position: relative;
            top: 50%;
            left: 50%;
            width: 400px;
            height: 300px;
            /*margin-left: -150px;
        margin-top: -100px;*/
            transform: translateX(-50%) translateY(-50%);
            padding: 35px 55px 35px 25px;
            z-index: 10;
            color: #0a0c0e;
            background: #fff;
            box-shadow: 0 1px 11px rgb(0 0 0 / 27%);
            border-radius: 2px;
            .title {
                position: absolute;
                top: -50px;
                width: 100%;
                left: 0;
                text-align: center;
                color: #ffffff;
                font-size: 18px;
            }
        }
        .el-input__inner {
            border: none !important;
            padding-left: 0px !important;
        }
        .m-b-20 {
            margin-bottom: 20px;
        }
        .waves-effect {
            position: relative;
            cursor: pointer;
            display: inline-block;
            overflow: hidden;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
            -webkit-tap-highlight-color: transparent;
        }
        .waves-button,
        .waves-circle {
            -webkit-transform: translateZ(0);
            -moz-transform: translateZ(0);
            -ms-transform: translateZ(0);
            -o-transform: translateZ(0);
            transform: translateZ(0);
            -webkit-mask-image: -webkit-radial-gradient(circle, #fff 100%, #000 100%);
        }
        .waves-button {
            white-space: nowrap;
            vertical-align: middle;
            cursor: pointer;
            border: none;
            outline: 0;
            color: inherit;
            background-color: transparent;
            font-size: 1em;
            line-height: 1em;
            text-align: center;
            text-decoration: none;
            z-index: 1;
        }

        .waves-button {
            padding: 0.85em 1.1em;
            border-radius: 0.2em;
        }

        .waves-float {
            -webkit-mask-image: none;
            -webkit-box-shadow: 0 1px 1.5px 1px rgb(0 0 0 / 12%);
            box-shadow: 0 1px 1.5px 1px rgb(0 0 0 / 12%);
            -webkit-transition: all 300ms;
            -moz-transition: all 300ms;
            -o-transition: all 300ms;
            transition: all 300ms;
        }
        #login-bt {
            position: absolute;
            width: 50px;
            height: 50px;
            border-radius: 50%;
            line-height: 36px !important;
            top: 50%;
            margin-top: -25px;
            right: -25px;
            background: #FF4F0F;
        }
        #login-bt i {
            font-size: 23px;
            color: #fff;
        }
    }
</style>
<script>
    import setting from "@/setting";
    import "@/assets/zheng/material-design-iconic-font/css/material-design-iconic-font.css";
    import ZhengInput from "./input";
    import api from "@/api";
    import ZhengSelect from "./select";
    export default {
        name: "login-index",
        components: { ZhengSelect, ZhengInput },
        data() {
            return {
                setting,
                captchUrl: "",
                loading: false,
                form: {
                    username: "",
                    pwd: "",
                    cx: "管理员",

                    /* 验证码段 */
                    pagerandom: "",
                    a: "a",
                    /* 验证码段 */
                },
                rules: ["管理员"],
            };
        },
        watch: {},
        computed: {},
        methods: {
            login() {
                this.loading = true;
                this.$store
                    .dispatch("user/login", this.form)
                    .then((res) => {
                        this.loading = false;
                        if (res.code == api.code.OK) {
                            this.$message.success("登录成功");
                            var redirect = this.$route.query.redirect;
                            if (redirect) {
                                this.$router.replace(redirect);
                            } else {
                                this.$router.replace("/admin/sy");
                            }
                        } else {
                            this.$message.error(res.msg);
                        }
                        if (res.code == 20) {
                            this.loadCaptch();
                        }
                    })
                    .catch((err) => {
                        this.loading = false;
                        this.$message.error(err.message);
                    });
            },
            loadCaptch() {
                api.captch().then((res) => {
                    console.log(res);
                    this.form.captchToken = res.token;
                    this.captchUrl = res.url;
                });
            },
        },
        created() {
            this.loadCaptch();
            this.form.cx = this.rules[0];
        },
        mounted() {},
        destroyed() {},
    };
</script>
