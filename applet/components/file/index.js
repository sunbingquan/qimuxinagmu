// components/image/upload-images.js
const { uploadFile } = require("../../request/upload");
const { isArray, each } = require("../../utils/extend");
const utils = require("../../utils/util");

Component({
    /**
     * 组件的属性列表
     */
    properties: {
        value: String,
    },
    /**
     * 组件的初始数据
     */
    data: {
        downloadText: "下载",
        downloadFile: "",
    },
    /**
     * 组件的方法列表
     */
    methods: {
        download(e) {
            var file = this.data.value;
            var down = wx.downloadFile({
                url: utils.formatImageSrc(file),
                success: (res) => {
                    if (res.statusCode == 200) {
                        // 下载完成
                        this.setData({
                            downloadText: "下载完成打开文件",
                            downloadFile: res.tempFilePath,
                        });
                    } else {
                        wx.showToast({
                            title: "下载失败",
                            icon: "error",
                        });
                    }
                },
            });
            down.onProgressUpdate((progress, totalBytesWritten, totalBytesExpectedToWrite) => {
                this.setDataObj("downloadText", "已下载：" + progress + "%");
            });
        },
        openDocument(e) {
            wx.openDocument({
                filePath: this.data.downloadFile,
            });
        },
    },
});
