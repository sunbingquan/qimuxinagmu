import store from "@/store";
import router from "@/router";
import { extend } from "@/utils/extend";
import rule from "@/utils/rule";

export function createForm() {
    var $route = router.currentRoute;
    const $store = store;
    var form = {
        xwid: "{{$get.xwid}}",
        biao: "{{$get.biao}}",
        biaoti: "{{$get.biaoti}}",
    };

    return form;
}

export default {
    createForm,
};
