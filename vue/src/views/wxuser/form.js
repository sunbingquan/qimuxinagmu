import store from "@/store";
import router from "@/router";
import { extend } from "@/utils/extend";
import rule from "@/utils/rule";

export function createForm() {
    var $route = router.currentRoute;
    const $store = store;
    var form = {
        nickName: "",
        avatarUrl: "",
        xingming: "",
        xingbie: "",
        nianling: "",
        shouji: "",
        youxiang: "",
        zhuzhi: "",
    };

    return form;
}

export default {
    createForm,
};
