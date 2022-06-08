const constants = require("../utils/constants.js");

export function httpPost(url, data, params) {
    return request({
        url,
        data: JSON.stringify(data),
        method: "post",
        ...params,
    });
}

export function httpGet(url, query, params) {
    return request({
        url,
        data: query,
        method: "GET",
        ...params,
    });
}

export function request(params) {
    params.url = constants.host + params.url;
    var app = getApp();

    let authorization = app && app.globalData && app.globalData.token ? app.globalData.token : wx.getStorageSync("token");
    return new Promise((resolve, reject) => {
        wx.request({
            ...params,
            header: {
                "Content-Type": "application/json; charset=UTF-8",
                Authorization: authorization,
            },
            success: (res) => {
                if (res.statusCode === 401) {
                    wx.redirectTo({
                        url: "/pages/login/login",
                    });
                }
                resolve(res.data);
            },
            fail: (err) => {
                reject(err);
            },
        });
    });
}
