<template>
    <section id="main">
        <!-- 左侧导航区 -->
        <admin-sidebar v-on:open_tab="open_tab" :user_menus="user_menus" :menus="menus"></admin-sidebar>
        <!-- /左侧导航区 -->
        <section id="content">
            <!--            <div class="content_tab">
                <div class="tab_left">
                    <a class="waves-effect waves-light" href="javascript:;"><i class="zmdi zmdi-chevron-left"></i></a>
                </div>
                <div class="tab_right">
                    <a class="waves-effect waves-light" href="javascript:;"><i class="zmdi zmdi-chevron-right"></i></a>
                </div>
                <ul id="tabs" class="tabs">
                    <li id="tab_home" data-index="home" data-closeable="false" class="cur">
                        <a class="waves-effect waves-light">首页</a>
                    </li>
                </ul>
            </div>-->
            <div class="content_main">
                <slot></slot>
            </div>
        </section>
    </section>
</template>
<style type="type/scss" lang="scss"></style>
<script>
    import AdminSidebar from "./side";
    export default {
        name: "admin-main",
        components: { AdminSidebar },
        props: {
            user_menus: [Array],
            menus: [Array],
        },
        methods: {
            //将事件提交给父组件
            open_tab: function (title, url) {
                this.$emit("click_open_tab", title, url);
            },
        },
    };
</script>
