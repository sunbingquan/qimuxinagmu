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

        DB.name("shouhuodizhi")
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

    changeUpdateshouhuoxinxi(e) {
        this.onInput(e);
        var form = this.data.form;
        var updateList = "shouhuoren,lianxidianhua,xiangxidizhi".split(",");
        var s = utils.findObject(this.data.shouhuodizhiList, (s) => s.id == form.shouhuoxinxi);
        for (var f of updateList) {
            this.setDataObj("form." + f, s[f]);
        }
    },
});
