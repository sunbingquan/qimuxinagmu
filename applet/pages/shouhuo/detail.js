// pages/shouhuo/detail.js

const app = getApp();
const DB = require("../../request/db");
const store = require("../../request/module/shouhuo");
const utils = require("../../utils/util");
var http = require("../../request/request");

Page({
    /**
     * 页面的初始数据
     */
    data: {
        id: "",

        map: {},
        commitRate: 5,
    },

    /**
     * 生命周期函数--监听页面加载
     */
    onLoad(options) {
        wx.setNavigationBarTitle({
            title: "收货",
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

    submitCommitForm(form) {
        form.biaoid = this.data.id;
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
        form.biao = "shouhuo";
        this.submitCommitForm(form);
    },
});
