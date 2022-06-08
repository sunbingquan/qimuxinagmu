//index.js
//获取应用实例
import { request } from "../../request/request.js";

const app = getApp();

Page({
    data: {
        hasUserInfo: false,
        canIUseGetUserProfile: false,
    },
    onLoad: function () {
        if (app.globalData.userInfo) {
            this.setData({
                userInfo: app.globalData.userInfo,
                hasUserInfo: true,
            });
        }
        if (wx.getUserProfile) {
            this.setData({
                canIUseGetUserProfile: true,
            });
        }
    },
    getUserInfo: function (e) {
        let that = this;
        if (e.detail.userInfo != null) {
            let userInfo = e.detail.userInfo;
            that.updateInfo(userInfo);
        }
    },
    getUserProfile(e) {
        // 推荐使用wx.getUserProfile获取用户信息，开发者每次通过该接口获取用户个人信息均需用户确认，开发者妥善保管用户快速填写的头像昵称，避免重复弹窗
        var that = this;
        wx.getUserProfile({
            desc: "展示用户信息", // 声明获取用户个人信息后的用途，后续会展示在弹窗中，请谨慎填写
            success: (res) => {
                console.log(res);
                that.updateInfo(res.userInfo);
                that.setData({
                    userInfo: res.userInfo,
                    hasUserInfo: true,
                });
            },
        });
    },
    updateInfo(userInfo) {
        var that = this;
        wx.login({
            success: function (res) {
                if (res.code) {
                    request({
                        url: "/wxuser/login?code=" + res.code + "&date=" + Math.floor(Math.random() * 100000000),
                        data: JSON.stringify(userInfo),
                        method: "post",
                    }).then((rs) => {
                        console.log(rs);
                        if (rs.code == 0) {
                            wx.setStorageSync("token", rs.data.token);
                            wx.setStorageSync("userInfo", rs.data.session);
                            app.globalData.userInfo = rs.data.session;
                            app.globalData.token = rs.data.token;

                            that.setData({
                                hasUserInfo: true,
                            });
                            wx.reLaunch({
                                url: "/pages/index/index",
                            });
                            wx.showToast({
                                title: "登录成功",
                                duration: 2000,
                            });
                        } else {
                            wx.showToast({
                                title: rs.msg,
                                icon: "error",
                                duration: 2000,
                            });
                        }
                    });
                }
            },
            fail: (res) => {
                wx.showToast({
                    title: "登录失败",
                    icon: "none",
                    duration: 2000,
                });
            },
        });
    },
});
