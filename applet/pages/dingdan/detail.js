// pages/dingdan/detail.js

const app = getApp();
const DB = require("../../request/db");
const store = require("../../request/module/dingdan");
const utils = require("../../utils/util");
var http = require("../../request/request");

Page({
    /**
     * 页面的初始数据
     */
    data: {
        id: "",

        map: {},
        activeSteps: 0,

        stepOptions: [
            { text: "待付款", desc: "" },
            { text: "已付款", desc: "" },
            { text: "已发货", desc: "" },
            { text: "已收货", desc: "" },
        ],

        shopLists: [],
    },

    /**
     * 生命周期函数--监听页面加载
     */
    onLoad(options) {
        wx.setNavigationBarTitle({
            title: "订单",
        });

        if (!utils.empty(options)) {
            this.setData(options);
        }

        this.loadDetail();

        DB.name("dingdanshangpin")
            .where("dingdanid", this.data.id)
            .order("id asc")
            .select()
            .then((res) => {
                const storeDingdan = app.include("/request/module/dingdanshangpin");
                var lists = res.data;
                storeDingdan.formatDataList(lists);
                this.setData({
                    shopLists: lists,
                });
            });
    },
    loadDetail() {
        if (this.data.loading) return;
        this.setData({
            loading: true,
        });
        store
            .dispatch("findById", this.data.id)
            .then((map) => {
                store.formatData(map); // 数据格式化
                this.setData({
                    loading: false,
                    map: map,
                });
                this.loadDetailCallback(map);
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

    loadDetailCallback(map) {
        var index = utils.findIndex(this.data.stepOptions, (step) => step.text == map.zhuangtai);
        if (index !== false) {
            this.setData({
                activeSteps: index,
            });
        }
    },

    onPaymentOrder(e) {
        wx.showLoading({
            title: "支付中",
            mask: true,
        });
        setTimeout(() => {
            var map = this.data.map;
            const { httpGet } = app.include("/request/request");
            var biao = "dingdan";
            var id = this.data.id;

            httpGet("/payment", { biao, id })
                .then((res) => {
                    wx.hideLoading({});
                    if (res.code == 0) {
                        this.loadDetail();
                        wx.showModal({
                            title: "温馨提示：",
                            content: "支付成功",
                            showCancel: false,
                        });
                    } else {
                        wx.showModal({
                            title: "温馨提示：",
                            content: "支付失败：" + res.msg,
                            showCancel: false,
                        });
                    }
                })
                .catch((e) => {
                    wx.hideLoading({});
                    wx.showModal({
                        title: "温馨提示：",
                        content: "支付失败：" + e.message,
                        showCancel: false,
                    });
                });
        }, 2000);
    },
});
