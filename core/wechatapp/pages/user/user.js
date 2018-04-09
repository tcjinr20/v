// pages/user/user.js
var app = getApp();
var api = require('../../api.js');
Page({

    /**
     * 页面的初始数据
     */
    data: {

    },

    /**
     * 生命周期函数--监听页面加载
     */
    onLoad: function (options) {
        var user_info = wx.getStorageSync('user_info');
        var contact_tel = wx.getStorageSync('contact_tel');
        this.setData({
            user_info: user_info,
            contact_tel: contact_tel,
            store: wx.getStorageSync("store")
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
        var page = this;
        app.request({
            url: api.user.index,
            method: 'GET',
            success: function (res) {
                if (res.code == 0) {
                    page.setData({
                        user_info: res.data.user_info
                    });
                    wx.setStorageSync('user_info', res.data.user_info);
                }
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

    },

    /**
     * 页面上拉触底事件的处理函数
     */
    onReachBottom: function () {

    },
    tel: function (option) {
        var tel = option.currentTarget.dataset.tel;
        wx.makePhoneCall({
            phoneNumber: tel //仅为示例，并非真实的电话号码
        })
    }
})