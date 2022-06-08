// pages/xinwenxinxi/detail.js

const app = getApp();
const DB = require("../../request/db");
const store = require("../../request/module/xinwenxinxi");
const utils = require("../../utils/util");
var http = require("../../request/request");

Page({
    /**
     * 页面的初始数据
     */
    data: {
        id: "",

        is_shoucang: false,
        shoucangCount: 0,

        map: {},
    },

    /**
     * 生命周期函数--监听页面加载
     */
    onLoad(options) {
        wx.setNavigationBarTitle({
            title: "新闻信息",
        });

        if (!utils.empty(options)) {
            this.setData(options);
        }

        this.loadDetail();
        http.httpGet("/xinwenxinxi/webDetail", { id: options.id });
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

                DB.name("shoucang")
                    .where("biao", "xinwenxinxi")
                    .where("xwid", map.id)
                    .count()
                    .then((res) => {
                        this.setData({
                            shoucangCount: res.data,
                        });
                    });
                if (app.session("username")) {
                    DB.name("shoucang")
                        .where("biao", "xinwenxinxi")
                        .where("xwid", map.id)
                        .where("username", app.session("username"))
                        .count()
                        .then((res) => {
                            this.setData({
                                is_shoucang: res.data > 0,
                            });
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
    onShoucangChange() {
        if (this.loading) return;
        this.loading = true;
        var map = this.data.map;

        http.httpPost("/shoucang/insert", {
            biao: "xinwenxinxi",
            xwid: map.id,
            biaoti: map.biaoti,
        })
            .then((res) => {
                if (res.code == 0) {
                    if (this.data.is_shoucang) {
                        wx.showToast({
                            title: "已取消收藏",
                        });
                        this.setData({
                            is_shoucang: false,
                            shoucangCount: this.data.shoucangCount - 1,
                        });
                    } else {
                        wx.showToast({
                            title: "已收藏",
                        });
                        this.setData({
                            is_shoucang: false,
                            shoucangCount: this.data.shoucangCount + 1,
                        });
                    }
                } else {
                    wx.showToast({
                        title: res.msg,
                        icon: "error",
                    });
                }
                this.loading = false;
            })
            .catch((err) => {
                this.loading = false;
                wx.showToast({
                    title: err.message,
                    icon: "error",
                });
            });
    },
});
