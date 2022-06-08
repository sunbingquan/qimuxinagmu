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
            title: "主页",
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
        });
        DB.name("lunbotu")
            .order("id desc")
            .limit(5)
            .select()
            .then((res) => {
                this.setData({ bhtList: res.data });
            });
        DB.name("jiaju")
        .where("fenlei","1")
            .limit("4")
            .order("id desc")
            .select()
            .then((res) => {
                const st = app.include("/request/module/jiaju");
                var lists = res.data;
                st.formatDataList(lists);

                this.setData({
                    jiajulist1: lists,
                });
            });
        DB.name("jiaju")
        .where("fenlei","2")
            .limit("4")
            .order("id desc")
            .select()
            .then((res) => {
                const st = app.include("/request/module/jiaju");
                var lists = res.data;
                st.formatDataList(lists);

                this.setData({
                    jiajulist2: lists,
                });
            });
        DB.name("xinwenxinxi")
            .limit("4")
            .order("id desc")
            .select()
            .then((res) => {
                const st = app.include("/request/module/xinwenxinxi");
                var lists = res.data;
                st.formatDataList(lists);
               
                this.setData({
                    xinwenxinxilist3: lists,
                });
            });
    },
    onShow() {},
});
