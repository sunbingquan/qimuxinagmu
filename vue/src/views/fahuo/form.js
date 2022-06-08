import store from "@/store";
import router from "@/router";
import { extend } from "@/utils/extend";
import rule from "@/utils/rule";

export function createForm() {
    var $route = router.currentRoute;
    const $store = store;
    var form = {
        dingdanhao: "",
        shangpin: "",
        shouhuoren: "",
        lianxidianhua: "",
        xiangxidizhi: "",
        xiadanren: store.state.user.session.username,
        kuaididanhao: "",
        kuaidigongsi: "",
        kuaididianhua: "",

        dingdanid: 0,
    };

    return form;
}

export function loadInfo(id) {
    return new Promise((resolve, reject) => {
        store
            .dispatch("dingdan/findById", id)
            .then((data) => {
                var obj = createForm();
                var autoText = ["dingdanid", "dingdanhao", "shangpin", "shouhuoren", "lianxidianhua", "xiangxidizhi", "xiadanren"];
                for (var txt of autoText) {
                    obj[txt] = data[txt];
                }
                obj.dingdanid = id;
                resolve({ form: obj, readMap: data });
            })
            .catch((err) => {
                reject(err);
            });
    });
}

export default {
    createForm,
    loadInfo,
};
