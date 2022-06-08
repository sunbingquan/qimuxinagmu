// pages/jiaju/detail.js

const app = getApp();
const DB = require("../../request/db");
const store = require("../../request/module/jiaju");
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
        commitRate: 5,

        commitList: [],
    },

    /**
     * 生命周期函数--监听页面加载
     */
    onLoad(options) {
        wx.setNavigationBarTitle({
            title: "家具",
        });
        if (!app.session("username")) {
            wx.reLaunch({
                url: "/pages/login/login",
            });
            return;
        }
        this.setData({
            userInfo: app.globalData.userInfo,
        });

        if (!utils.empty(options)) {
            this.setData(options);
        }

        this.loadDetail();
        this.loadCommit();
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
                    .where("biao", "jiaju")
                    .where("xwid", map.id)
                    .count()
                    .then((res) => {
                        this.setData({
                            shoucangCount: res.data,
                        });
                    });
                if (app.session("username")) {
                    DB.name("shoucang")
                        .where("biao", "jiaju")
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
            biao: "jiaju",
            xwid: map.id,
            biaoti: map.mingcheng,
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

    submitCommitForm(form) {
        form.biaoid = this.data.id;
        form.biaoti = this.data.map.mingcheng;
        form.pinglunneirong = this.data.commitContent;
        form.pingfen = this.data.commitRate;

        if (!this.data.commitContent.trim()) {
            wx.showModel({
                title: "温馨提示",
                content: "请填写评论内容",
                showCancel: false,
            });
            return;
        }
        this.setData({
            commitContent: "",
        });
        const commitStore = app.include("/request/module/pinglun");
        commitStore
            .dispatch("insert", form)
            .then((res) => {
                if (res.code == 0) {
                    wx.showToast({
                        title: "评论成功",
                        icon: "success",
                        duration: 2000,
                    });
                    this.loadCommit && this.loadCommit();
                } else {
                    wx.showToast({
                        title: res.msg,
                        icon: "error",
                        duration: 2000,
                    });
                }
            })
            .catch((e) => {
                wx.showToast({
                    title: e.message,
                    icon: "error",
                    duration: 2000,
                });
            });
    },

    submitCommit(e) {
        const commitForm = app.include("/request/module/pinglun");
        var form = commitForm.createForm();
        form.biao = "jiaju";
        this.submitCommitForm(form);
    },

    loadCommit() {
        DB.name("pinglun")
            .alias("p")
            .field("p.*,u.id as userid,u.nickName as nickname,u.avatarUrl headimgurl")
            .joinLeft("wxuser as u", "u.id=p.pinglunren")
            .where("p.biaoid", this.data.id)
            .where("p.biao", "jiaju")
            .select()
            .then((res) => {
                this.setData({
                    commitList: res.data,
                });
            });
    },
});
