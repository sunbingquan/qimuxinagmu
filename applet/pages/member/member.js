// index.js
// 获取应用实例
import DB from "../../request/db";
const app = getApp();
const utils = require("../../utils/util");

Page({
    mixins: [require("../../utils/myMixin")],
    data: {},
    onLoad(option) {
        wx.setNavigationBarTitle({
            title: "个人中心",
        });
        if (!utils.empty(option)) {
            this.setData(option);
        }
        if (!app.session("username")) {
            wx.reLaunch({
                url: "/pages/login/login",
            });
            return;
        }
        this.setData({
            userInfo: app.globalData.userInfo,
            user: app.globalData.user,
            session: app.globalData.userInfo,
        });
    },
    onShow() {},
});
