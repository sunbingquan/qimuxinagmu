// pages/jiaju/list.js

import DB from "../../request/db";
const utils = require("../../utils/util");
const store = require("../../request/module/jiaju");

const app = getApp();

Page({
    /**
     * 页面的初始数据
     */
    data: {
        lists: [],
        search: {
            keyword: "",
            bianhao: "",
            mingcheng: "",
            fenlei: "",
            pinpai: "",
            page: 1, // 当前页
            pagesize: 12, // 页大小
            orderby: "id", // 默认排序
            sort: "DESC", // 倒序方式排序
        },
        totalPages: 0,
        totalCount: 0,
        total: {},
        fenleiList: [],

        orderOptions: [
            { value: "id", text: "默认排序" },
            { value: "jiage", text: "价格排序" },

            { value: "xiaoliang", text: "销量排序" },
        ],
    },
    /**
     * 生命周期函数--监听页面加载
     */
    onLoad: function (option) {
        wx.setNavigationBarTitle({
            title: "列表",
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
        if (!utils.empty(option)) {
            this.setData(option);
        }
        this.setData({
            'search.fenlei':option.fenlei
        })
        this.data.lists = [];
        this.loadList(1);
        // 动态加载后台选项数据
        DB.name("fenlei")
            .field("id as value")
            .field("fenleiming as text")
            .select()
            .then((res) => {
                var list = [{ value: "", text: "全部分类" }, ...res.data];

                this.setData({
                    fenleiList: list,
                });
            });
    },
    onShow() {},

    loadList(page) {
        if (this.data.loading) return;
        this.setData({
            "search.page": page,
            loading: true,
        });
        store
            .dispatch("query", this.data.search)
            .then((res) => {
                this.setData({
                    loading: false,
                });
                if (res.code == 0) {
                    var data = res.data;
                    var lists = data.lists.records;

                    store.formatDataList(lists);
                    this.handlerListData(lists);
                    lists = this.data.lists.concat(lists);
                    this.setData({
                        totalCount: data.lists.total,
                        totalPages: data.lists.pages,
                    });
                    this.setData({
                        lists: lists,
                    });
                }
            })
            .catch((err) => {
                this.setData({
                    loading: false,
                });
            });
    },
    handlerListData(lists) {},

    /**
     * 页面相关事件处理函数--监听用户下拉动作
     */
    onPullDownRefresh: function () {
        this.setData({
            lists: [],
        });
        this.loadList(1);
    },

    /**
     * 页面上拉触底事件的处理函数
     */
    onReachBottom: function () {
        if (this.data.totalPages > this.data.search.page) {
            this.loadList(this.data.search.page + 1);
        }
    },
    goBack() {
        wx.navigateBack({
            delta: 1,
        });
    },
    onSelectSearch(e) {
        this.onInput(e);
        this.setData({
            lists: [],
        });
        this.loadList(1);
    },
    onListOrderBy(e) {
        this.setData({
            "search.orderby": e.detail,
            lists: [],
        });
        this.loadList(1);
    },
    onSearchjiaju() {
        this.setData({
            lists: [],
        });
        this.loadList(1);
    },
});
