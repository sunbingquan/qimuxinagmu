// pages/dingdan/add.js

const app = getApp();
const DB = require("../../request/db");
const store = require("../../request/module/dingdan");
const utils = require("../../utils/util");

Page({
    /**
     * 页面的初始数据
     */
    data: {
        loading: false,
        form: {},
        shouhuodizhiList: [],

        shopPrice: 0,
    },

    /**
     * 生命周期函数--监听页面加载
     */
    onLoad: function (options) {
        wx.setNavigationBarTitle({
            title: "订单添加",
        });
        if (!utils.empty(options)) {
            this.setData(options);
        }
        this.setData({
            channle: options.channle,
        });

        DB.name("gouwuche")
            .order("id desc")
            .where("id", "in", this.data.ids)
            .select()
            .then((res) => {
                const st = app.include("/request/module/gouwuche");
                var lists = res.data;
                st.formatDataList(lists);

                this.setData({
                    gouwuchelist: lists,
                });
                this.handlerShopList(lists);
            });
        DB.name("shouhuodizhi")
        .where("tianjiaren" , app.session('username'))
            .order("id desc")
            .select()
            .then((res) => {
                this.setData({
                    shouhuodizhiList: res.data,
                });
            });
        this.setData({ "form.xiadanren": app.session("username") });
        this.loadInfo();
    },

    submit(callback) {
        if (this.data.loading) return;
        this.setData({
            loading: true,
        });
        var form = utils.extend(true, {}, this.data.form);

        store
            .dispatch("insert", form)
            .then((res) => {
                this.setData({
                    loading: false,
                });
                if (res.code == 0) {
                    wx.showToast({
                        title: "添加成功",
                        icon: "success",
                        duration: 1250,
                    });
                    if (this.data.channle) {
                        const eventChannel = this.getOpenerEventChannel();
                        eventChannel.emit("updateData", res.data);
                    }
                    if (utils.isFunction(callback)) {
                        callback(res.data);
                    } else {
                        setTimeout(() => {
                            wx.navigateBack();
                        }, 1250);
                    }
                } else {
                    wx.showToast({
                        title: res.msg,
                        icon: "error",
                        duration: 2000,
                    });
                }
            })
            .catch((err) => {
                this.setData({
                    loading: false,
                });
                wx.showToast({
                    title: err.message,
                    icon: "error",
                    duration: 2000,
                });
            });
    },
    loadInfo() {
        if (this.data.loading) return;

        // 获取模块得数据
        this.setData({
            form: store.createForm(),
        });
    },
    /**
     * 生命周期函数--监听页面显示
     */
    onShow: function () {},

    changeUpdateshouhuoxinxi(e) {
        this.onInput(e);
        var form = this.data.form;
        var updateList = "shouhuoren,lianxidianhua,xiangxidizhi".split(",");
        var s = utils.findObject(this.data.shouhuodizhiList, (s) => s.id == form.shouhuoxinxi);
        for (var f of updateList) {
            this.setDataObj("form." + f, s[f]);
        }
    },
    calcPrice(list) {
        var result = 0;
        for (var i in list) {
            var ci = list[i];
            result += parseFloat(ci.jiage) * parseInt(ci.shuliang);
        }
        this.setData({
            shopPrice: result * 100, // 按分算，所以需要乘以100
        });
        return result;
    },
    handlerShopList(list) {
        var price = this.calcPrice(list);
        this.setData({
            "form.jine": price,
        });
    },
    onSubmitBar(e) {
        // 创建订单
        this.data.form.targetId = this.data.ids;
        this.submit((data) => {
            // 提交成功
            setTimeout(() => {
                wx.redirectTo({
                    url: "/pages/dingdan/detail?id=" + data.id,
                });
            }, 1250);
        });
    },
});
