import { httpGet, httpPost } from "../request";
import rule from "../../utils/rule";
const utils = require("../../utils/util");

const readStore = require("./dingdan");
const app = getApp();

const { handlerKeyValue, remove, findIndex, isArray, extend } = utils;
const state = {
    status: 0,
    lists: [],
    objLists: {},
};

var actions = {};
const mutations = {
    setLists(state, data) {
        state.lists = data;
        state.objLists = handlerKeyValue(data);
    },
    setStatus(state, data) {
        state.status = data;
    },
    push(state, data) {
        state.lists.push(data);
        state.objLists[data.id] = data;
    },
    insert(state, data) {
        // 从头部插入数据
        state.lists.unshift(data);
        state.objLists[data.id] = data;
    },
    update(state, data) {
        if (!data.id || !state.objLists[data.id]) return;
        extend(state.objLists[data.id], data); // 合并数据
    },
    replace(state, data) {
        // 判断是否存在，存在则插入，不存在则
        if (!state.objLists[data.id]) {
            // 不存在，则插入数据
            state.lists.unshift(data);
            state.objLists[data.id] = data;
        } else {
            extend(state.objLists[data.id], data); // 合并数据
        }
    },
    delete(state, listIds) {
        for (var i = 0; i < listIds.length; i++) {
            var index = findIndex(state.lists, (r) => r.id == listIds[i]);
            if (index !== false) {
                remove(state.lists, index);
            }
        }
    },
};

var content = (actions = {
    selectAll() { // 获取所有数据
        return new Promise((resolve, reject) => {
            if (content.state.status == 0) {
                content.commit("setStatus", 1);
                httpGet("/fahuo/selectAll").then(
                    (res) => {
                        if (res.code == 0) {
                            content.commit("setLists", res.data);
                            content.commit("setStatus", 2);
                            resolve(res.data);
                        } else {
                            content.commit("setStatus", 0);
                        }
                    },
                    (err) => {
                        reject(err);
                        content.commit("setStatus", 0);
                    }
                );
            } else if (content.state.status == 1) {
                // 等待数据完成
                var callbackFunc = () => {
                    var status = content.state.status;
                    if (status == 1) {
                        setTimeout(callbackFunc, 20);
                    } else if (status == 2) {
                        resolve(content.state.lists);
                    } else {
                        reject(new Error("估计网络出错了"));
                    }
                };
                setTimeout(callbackFunc, 20);
            } else {
                resolve(content.state.lists);
            }
        });
    },
    findById(id) {
        return new Promise((resolve, reject) => {
            httpGet("/fahuo/findById", { id }).then((res) => {
                if (res.code == 0) {
                    resolve(res.data);
                } else {
                    reject(res.msg);
                }
            });
        });
    },
    filter(data) {
        return new Promise((resolve, reject) => {
            httpPost("/fahuo/filter", data).then(
                (res) => {
                    if (res.code == 0) {
                        resolve(res);
                    } else {
                        reject(res.msg);
                    }
                },
                (err) => {
                    reject(err);
                }
            );
        });
    },

    query(data) {
        // 分页查询数据
        return new Promise((resolve, reject) => {
            httpPost("/fahuo/selectPages", data).then(
                (res) => {
                    if (res.code == 0) {
                        resolve(res);
                    } else {
                        reject(res.msg);
                    }
                },
                (err) => {
                    reject(err);
                }
            );
        });
    },

    queryxiadanren(data) {
        // 分页查询数据
        return new Promise((resolve, reject) => {
            httpPost("/fahuo/selectPagesXiadanren", data).then(
                (res) => {
                    if (res.code == 0) {
                        resolve(res);
                    } else {
                        reject(res.msg);
                    }
                },
                (err) => {
                    reject(err);
                }
            );
        });
    },
    update(data) {
        // 更新数据
        return new Promise((resolve, reject) => {
            httpPost("/fahuo/update", data).then(
                (res) => {
                    if (res.code == 0) {
                        if (content.state.status == 0) {
                            content.dispatch("selectAll");
                        } else {
                            content.commit("update", res.data);
                        }
                    }
                    resolve(res);
                },
                (err) => {
                    reject(err);
                }
            );
        });
    },
    insert(data) {
        // 插入数据
        return new Promise((resolve, reject) => {
            httpPost("/fahuo/insert", data).then(
                (res) => {
                    if (res.code == 0) {
                        if (content.state.status == 0) {
                            content.dispatch("selectAll");
                        } else {
                            content.commit("insert", res.data);
                        }
                    }
                    resolve(res);
                },
                (err) => {
                    reject(err);
                }
            );
        });
    },
    delete(data) {
        // 删除数据
        return new Promise((resolve, reject) => {
            httpPost("/fahuo/delete", isArray(data) ? data : [data]).then(
                (res) => {
                    if (res.code == 0) {
                        if (content.state.status == 0) {
                            content.dispatch("selectAll");
                        } else {
                            content.commit("delete", data);
                        }
                    }
                    resolve(res);
                },
                (err) => {
                    reject(err);
                }
            );
        });
    },

    state: state,
    commit(name, data) {
        if (mutations[name]) {
            mutations[name](state, data);
        }
    },
    dispatch(name, data) {
        if (actions[name]) {
            return actions[name](data);
        }
    },
    formatDataList(lists) {
        for (var map of lists) {
            this.formatData(map);
        }
    },
    // 格式化数据
    formatData(map) {
        if (map.shangpinList) {
            var st = app.include("/request/module/fahuoshangpin");
            st.formatDataList(map.shangpinList);
        }
    },
    createForm() {
        var form = {
            dingdanhao: "",
            shangpin: "",
            shouhuoren: "",
            lianxidianhua: "",
            xiangxidizhi: "",
            xiadanren: app.session("username"),
            kuaididanhao: "",
            kuaidigongsi: "",
            kuaididianhua: "",
            dingdanid: 0,
        };
        return form;
    },
    loadInfo(id) {
        return new Promise((resolve, reject) => {
            readStore
                .dispatch("findById", id)
                .then((data) => {
                    var obj = this.createForm();
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
    },
});

module.exports = actions;
