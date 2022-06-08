import store from "@/store";
import router from "@/router";
import { extend } from "@/utils/extend";
import rule from "@/utils/rule";

export function createForm() {
    var $route = router.currentRoute;
    const $store = store;
    var form = {
        dingdanhao: rule.getID(),
        shangpin: "",
        jine: $route.query.sum_xiaoji,
        zhuangtai: "待付款",
        shouhuoxinxi: "",
        shouhuoren: "",
        lianxidianhua: "",
        xiangxidizhi: "",
        beizhu: "",
        xiadanren: store.state.user.session.username,
        iszf: "否",
    };

    return form;
}

export default {
    createForm,
};
