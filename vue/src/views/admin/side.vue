<template>
    <aside id="sidebar" class="scroll-scrollbar-style">
        <!-- 个人资料区 -->
        <div class="s-profile">
            <a class="waves-effect waves-light" href="javascript:;">
                <div class="sp-pic">
                    <e-img v-if="$session.touxiang" :src="$session.touxiang" />
                    <img v-else src="~@/assets/zheng/img/avatar.jpg" />
                </div>
                <div class="sp-info">
                    {{ $session.username }} 您好！
                    <i class="zmdi zmdi-caret-down"></i>
                </div>
            </a>
            <!--            <ul class="main-menu" v-if="user_menus && user_menus.length>0">
                &lt;!&ndash;菜单&ndash;&gt;
                <li v-for="m in user_menus">
                    <a v-if='m.isOpenTab' class="waves-effect" href="javascript:;" v-on:click="open_tab(m)"><i class="zmdi" :class="m.icon"></i> {{m.title}}</a>
                    <a v-else='' class="waves-effect" :href="m.url"><i class="zmdi" :class="m.icon"></i> {{m.title}}</a>
                </li>
            </ul>-->
        </div>
        <!-- /个人资料区 -->
        <!-- 菜单区 -->
        <ul class="main-menu">
            <template v-for="(menu,k) in menus">
                <li v-if="!menu.children || menu.children.length==0">
                    <a v-if="menu.isTab" class="waves-effect" href="javascript:;" @click="open_tab(menu)">
                        <i class="zmdi" :class="menu.icon?menu.icon:'zmdi-more'"></i> {{menu.label}}
                    </a>
                    <router-link v-else class="waves-effect" :to="menu.to"> <i class="zmdi" :class="menu.icon?menu.icon:'zmdi-more'"></i> {{menu.label}} </router-link>
                </li>
                <li v-else class="sub-menu system_menus" :class="{toggled: k == active}">
                    <a class="waves-effect" href="javascript:;" @click="active=k == active ? -1 : k">
                        <i class="zmdi" :class="menu.icon?menu.icon:'zmdi-more'"></i>
                        {{menu.label}}
                    </a>
                    <!--菜单-->
                    <ul v-show="k==active">
                        <li v-for="m in menu.children">
                            <a v-if="m.isTab" class="waves-effect" href="javascript:;" v-on:click="open_tab(m)"> <i class="zmdi" :class="m.icon"></i> {{ m.label }} </a>
                            <router-link v-else class="waves-effect" :to="m.to"><i class="zmdi" :class="m.icon"></i> {{ m.label }}</router-link>
                        </li>
                    </ul>
                </li>
            </template>
        </ul>
        <!-- /菜单区 -->
    </aside>
</template>
<style type="type/scss" lang="scss"></style>
<script>
    export default {
        name: "admin-sidebar",
        data() {
            return {
                active: 0,
            };
        },
        props: {
            user_menus: [Array],
            menus: [Array],
        },
        methods: {
            //将事件提交给父组件
            open_tab: function (menu) {
                this.$emit("open_tab", menu.title, menu.url);
            },
        },
    };
</script>
