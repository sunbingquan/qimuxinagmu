import store from "@/store";
import router from "@/router";
import { extend } from "@/utils/extend";
import rule from "@/utils/rule";

export function createForm() {
    var $route = router.currentRoute;
    const $store = store;
    var form = {
        bianhao: "",
        mingcheng: "",
        fenlei: "",
        pinpai: "",
        tupian: "",
        jiage: "",
        shuliang: "",
        goumairen: store.state.user.session.username,
        jiajuid: 0,
    };

    return form;
}

export function loadInfo(id) {
    return new Promise((resolve, reject) => {
        store
            .dispatch("jiaju/findById", id)
            .then((data) => {
                var obj = createForm();
                var autoText = ["jiajuid", "bianhao", "mingcheng", "fenlei", "pinpai", "tupian", "jiage"];
                for (var txt of autoText) {
                    obj[txt] = data[txt];
                }
                obj.jiajuid = id;
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
