// components/select/select-view.js
Component({
    /**
     * 组件的属性列表
     */
    properties: {
        module: String,
        value: {
            type: String,
            optionalTypes: [Number],
        },
        select: String,
        show: String,
    },
    observers: {
        "module,value,select,show": function () {
            this.getValue();
        },
    },
    /**
     * 组件的初始数据
     */
    data: {
        content: "",
    },

    /**
     * 组件的方法列表
     */
    methods: {
        getValue() {
            this.setData({
                content: "",
            });
            if (this.data.value) {
                var store = require("../../request/module/" + this.data.module);
                store.dispatch("selectAll").then((lists) => {
                    for (var ci of lists) {
                        if (ci[this.data.select] == this.data.value) {
                            this.setData({
                                content: ci[this.data.show],
                            });
                            break;
                        }
                    }
                });
            }
        },
    },
    attached() {
        this.getValue();
    },
});
