// pages/shouhuo/add.js

const app = getApp();
const DB = require("../../request/db");
const store = require("../../request/module/shouhuo");
const utils = require("../../utils/util");

Page({
    /**
     * 页面的初始数据
     */
    data: {
        loading: false,
        form: {},
    },

    /**
     * 生命周期函数--监听页面加载
     */
    onLoad: function (options) {
        wx.setNavigationBarTitle({
            title: "收货添加",
        });
        if (!utils.empty(options)) {
            this.setData(options);
        }

        this.loadInfo();
    },

    submit(callback) {
        if (this.data.loading) return;
        this.setData({
            loading: true,
        });
        var form = utils.extend(true, {}, this.data.form);

        store
            .dispatch("update", form)
            .then((res) => {
                this.setData({
                    loading: false,
                });
                if (res.code == 0) {
                    wx.showToast({
                        title: "更新成功",
                        icon: "success",
                        duration: 1250,
                    });
                    const eventChannel = this.getOpenerEventChannel();
                    eventChannel.emit("updateData", res.data);

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

        // 更新数据,获取数据
        this.setData({
            loading: true,
        });
        store
            .dispatch("findById", this.data.id)
            .then((res) => {
                this.setData({
                    loading: false,
                });
                this.setData({
                    form: res,
                });
                store.loadInfo(res.fahuoid).then((rs) => {
                    this.setData({
                        readMap: rs.readMap,
                    });
                });
            })
            .catch((err) => {
                this.setData({
                    loading: false,
                });
                console.log(err);
                // this.$message.error(err.message);
                // this.$router.go(-1);
            });
    },
    /**
     * 生命周期函数--监听页面显示
     */
    onShow: function () {},
});
