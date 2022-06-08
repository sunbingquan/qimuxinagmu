// pages/gouwuche/list.js

import DB from "../../request/db";
const utils = require("../../utils/util");
const store = require("../../request/module/gouwuche");

const app = getApp();

Page({
    /**
     * 页面的初始数据
     */
    data: {
        lists: [],
        search: {
            bianhao: "",
            mingcheng: "",
            fenlei: "",
            pinpai: "",
            shuliang_start: "",
            shuliang_end: "",
            xiaoji_start: "",
            xiaoji_end: "",
            page: 1, // 当前页
            pagesize: 12, // 页大小
            orderby: "id", // 默认排序
            sort: "DESC", // 倒序方式排序
        },
        totalPages: 0,
        totalCount: 0,
        total: {},
        selected: [],

        shopPrice: 0,
    },
    /**
     * 生命周期函数--监听页面加载
     */
    onLoad: function (option) {
        wx.setNavigationBarTitle({
            title: "购物车",
        });
        if (!utils.empty(option)) {
            this.setData(option);
        }

        this.data.lists = [];
        this.loadList(1);
        DB.name("gouwuche")
            .order("id desc")
            .where("goumairen", app.session("username"))
            .select()
            .then((res) => {
                const st = app.include("/request/module/gouwuche");
                var lists = res.data;
                st.formatDataList(lists);

                this.setData({
                    gouwuchelist: lists,
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
            .dispatch("querygoumairen", this.data.search)
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
    onChangeSelectShop(e) {
        this.setData({
            selected: e.detail,
        });
        this.onChangeSelected();
    },
    onChangeNumber(e) {
        var value = e.detail;
        var dataset = e.target.dataset;
        var list = this.data.gouwuchelist;
        var index = dataset.index;
        var vo = list[index];
        vo.shuliang = value;

        this.setDataObj("gouwuchelist[" + index + "].shuliang", value);
        const st = app.include("/request/module/gouwuche");
        // 这样更新数量 会出问题，会把数据上传上去,只需要提交两个字段就可以了
        var dat = {
            id: vo.id,
            shuliang: vo.shuliang,
        };

        st.dispatch("update", dat); // 更新数据库中得数量

        var selected = this.data.selected;
        var lists = this.data.gouwuchelist.filter((s) => utils.inArray(s.id, selected));
        this.calcPrice(lists);
    },
    calcPrice(list) {
        var result = 0;
        for (var i in list) {
            var ci = list[i];
            result += parseFloat(ci.jiage) * parseInt(ci.shuliang);
        }
        this.setData({
            shopPrice: result * 100, // 按分算，所以需要乘以100
        });
        return result;
    },
    onChangeSelected() {
        var lists = this.data.gouwuchelist; // 当前列表，筛选出对应列表来计算
        var selected = this.data.selected; // 当前选项id
        var filterList = lists.filter((s) => utils.inArray(s.id, selected));
        this.calcPrice(filterList);
    },
    onSubmitBar() {
        // 跳转到生成订单页面
        var selected = this.data.selected; // 当前选项id
        wx.navigateTo({
            url: "/pages/dingdan/add?ids=" + selected.join(","),
        });
    },
    onSelectAll(e) {
        this.setData({
            allSelect: e.detail,
        });
        var allSelect = e.detail;
        if (allSelect) {
            var lists = this.data.gouwuchelist;
            var selected = lists.map((s) => s.id);
            this.setData({
                selected,
            });
            this.calcPrice(lists);
        } else {
            this.setData({
                selected: [],
            });
            this.calcPrice([]);
        }
    },
});
