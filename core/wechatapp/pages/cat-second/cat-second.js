// pages/cat-second/cat-second.js
var app = getApp();
var api = require('../../api.js');
var is_loading_more = false;
var is_no_more = false;
Page({

    /**
     * 页面的初始数据
     */
    data: {
        page: 1,
    },

    /**
     * 生命周期函数--监听页面加载
     */
    onLoad: function (options) {
        is_loading_more = false;
        is_no_more = false;
        var page = this;
        page.setData({
            cat_id: options.cat_id
        });
    },

    /**
     * 生命周期函数--监听页面初次渲染完成
     */
    onReady: function () {

    },

    /**
     * 生命周期函数--监听页面显示
     */
    onShow: function () {
        this.loadData();
    },

    loadData: function () {
        var page = this;
        wx.showLoading({
            title: '正在加载',
        });
        is_loading_more = true;
        app.request({
            url: api.default.cat_video,
            data: { cat_id: page.data.cat_id },
            success: function (res) {
                if (res.code == 0) {
                    if (!res.data.cat_name) {
                        wx.switchTab({
                            url: '/pages/index/index',
                        });
                        return;
                    }
                    page.setData({
                        video_list: res.data.list
                    });
                    wx.setNavigationBarTitle({
                        title: res.data.cat_name,
                    });
                }
            },
            complete: function () {
                wx.hideLoading();
                wx.stopPullDownRefresh();
                is_loading_more = false;
            }
        });
    },

    /**
     * 生命周期函数--监听页面隐藏
     */
    onHide: function () {

    },

    /**
     * 生命周期函数--监听页面卸载
     */
    onUnload: function () {

    },

    /**
     * 页面相关事件处理函数--监听用户下拉动作
     */
    onPullDownRefresh: function () {
        this.loadData();
        this.setData({
            page: 1
        });
        is_no_more = false;
        is_loading_more = false;
    },

    /**
     * 页面上拉触底事件的处理函数
     */
    onReachBottom: function () {
        var page = this;
        if (is_no_more)
            return;
        page.loadMoreGoodsList();
    },
    loadMoreGoodsList: function () {
        var page = this;
        if (is_loading_more)
            return;
        page.setData({
            show_loading_bar: true,
        });
        is_loading_more = true;
        var p = page.data.page;
        app.request({
            url: api.default.cat_video,
            data: { cat_id: page.data.cat_id, page: p },
            success: function (res) {
                if (res.data.list.length == 0)
                    is_no_more = true;
                var video_list = page.data.video_list.concat(res.data.list);
                page.setData({
                    video_list: video_list,
                    page: (p + 1),
                });
            },
            complete: function () {
                is_loading_more = false;
                page.setData({
                    show_loading_bar: false,
                });
            }
        });
    },
})