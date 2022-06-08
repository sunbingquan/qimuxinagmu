// pages/wxuser/detail.js

const app = getApp();
const DB = require("../../request/db");
const store = require("../../request/module/wxuser");
const utils = require("../../utils/util");
var http = require("../../request/request");

Page({
    /**
     * 页面的初始数据
     */
    data: {
        id: "",

        map: {},
    },

    /**
     * 生命周期函数--监听页面加载
     */
    onLoad(options) {
        wx.setNavigationBarTitle({
            title: "微信用户",
        });

        if (!utils.empty(options)) {
            this.setData(options);
        }

        this.loadDetail();
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
});
