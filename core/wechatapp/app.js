//app.js
var api = require('./api.js');
var util = require('./utils/util.js');
var is_login = false;
App({
    is_on_launch: true,
    onLaunch: function () {
        this.setApi();
        api = this.api;
        this.login_1();
        this.getStore();
    },
    onShow: function () {
         //this.login_1();
    },
    getStore: function () {
        var page = this;
        this.request({
            url: api.default.store,
            success: function (res) {
                if (res.code == 0) {
                    wx.setStorageSync("store", res.data.store);
                    wx.setStorageSync("store_name", res.data.store_name);
                    wx.setStorageSync("show_customer_service", res.data.show_customer_service);
                    wx.setStorageSync("contact_tel", res.data.contact_tel);
                }
            }
        });
    },
    login: function () {
        is_login = true;
        wx.checkSession({
            success: function () {
                var access_token = wx.getStorageSync('access_token');
                if (!access_token) {
                    getApp().login_1();
                } else {
                    is_login = false;
                }
            }, fail: function () {
                getApp().login_1();
            }
        });
    },
    login_1: function () {
        if(is_login){
            return ;
        }
        is_login = true;
        var pages = getCurrentPages();
        var page = pages[(pages.length - 1)];
        wx.showLoading({
            title: "正在登陆",
            mask: true
        });
        wx.login({
            success: function (res) {
                if (res.code) {
                    var code = res.code;
                    console.log(code)
                    wx.getUserInfo({
                        success: function (res) {
                            getApp().request({
                                url: api.passport.login,
                                method: "POST",
                                data: {
                                    code: code,
                                    user_info: res.rawData,
                                    encrypted_data: res.encryptedData,
                                    iv: res.iv,
                                    signature: res.signature
                                },
                                success: function (result) {
                                    console.log('===>1212')
                                    wx.hideLoading();
                                    is_login = false;
                                    if (result.code == 0) {
                                        wx.setStorageSync("access_token", result.data.access_token);
                                        wx.setStorageSync("user_info", {
                                            nickname: result.data.nickname,
                                            avatar_url: result.data.avatar_url,
                                            id: result.data.id,
                                            is_comment: result.data.is_comment
                                        });
                                        var pages_now = getCurrentPages();
                                        var page_now = pages_now[(pages_now.length - 1)];
                                        page_now.onShow(); page_now.onLoad(pages_now.options);
                                        console.log(pages_now[(pages_now.length - 1)]);
                                        console.log(pages)
                                        if (page == undefined) {
                                            return;
                                        }
                                        wx.redirectTo({
                                            url: "/" + page.route + "?" + util.objectToUrlParams(page.options),
                                            fail: function () {
                                                wx.switchTab({
                                                    url: "/" + page.route,
                                                });
                                            },
                                        });
                                    } else {
                                        wx.showModal({
                                            title: '警告',
                                            content: result.msg,
                                            showCancel: false
                                        })
                                    }
                                }
                            });
                        },
                        fail: function (e) {
                            wx.hideToast();
                            getApp().getauth({
                                content: '需要获取您的用户信息授权，请到小程序设置中打开授权',
                                cancel: true,
                                success: function (e) {
                                    if (e) {
                                        getApp().login_1();
                                    }
                                },
                            });
                        }
                    });
                } else {
                    wx.showToast({
                        title: res.msg
                    });
                }
            },
            fail: function (e) {
                console.log(e);
            }
        });
    },
    getauth: function (object) {
        wx.showModal({
            title: '是否打开设置页面重新授权',
            content: object.content,
            confirmText: '去设置',
            success: function (e) {
                if (e.confirm) {
                    wx.openSetting({
                        success: function (res) {
                            if (object.success) {
                                object.success(res);
                            }
                        },
                        fail: function (res) {
                            if (object.fail) {
                                object.fail(res);
                            }
                        },
                        complete: function (res) {
                            if (object.complete)
                                object.complete(res);
                        }
                    })
                } else {
                    if (object.cancel) {
                        getApp().getauth(object);
                    }
                }
            }
        })
    },
    request: function (object) {
        var access_token = wx.getStorageSync("access_token");
        // console.log(object);
        // console.log(access_token);
        if (!object.data)
            object.data = {};
        if (access_token) {
            object.data.access_token = access_token;
        }
        object.data._uniacid = this.siteInfo.uniacid;
        object.data._acid = this.siteInfo.acid;
        wx.request({
            url: object.url,
            header: object.header || {
                'content-type': 'application/x-www-form-urlencoded'
            },
            data: object.data || {},
            method: object.method || "GET",
            dataType: object.dataType || "json",
            success: function (res) {
                if (res.data.code == -1 && !is_login) {
                    console.log('==>-1')
                    getApp().login_1();
                } else {
                    if (object.success)
                        object.success(res.data);
                }
            },
            fail: function (res) {
                var app = getApp();
                if (app.is_on_launch) {
                    app.is_on_launch = false;
                    wx.showModal({
                        title: "网络请求出错",
                        content: res.errMsg,
                        showCancel: false,
                        success: function (res) {
                            if (res.confirm) {
                                if (object.fail)
                                    object.fail(res);
                            }
                        }
                    });
                } else {
                    wx.showToast({
                        title: res.errMsg,
                        image: "/images/icon-warning.png",
                    });
                    if (object.fail)
                        object.fail(res);
                }
            },
            complete: function (res) {
                if (object.complete)
                    object.complete(res);
            }
        });
    },
    //微擎一键发布设置
    api: require('api.js'),
    setApi: function () {
        var siteroot = this.siteInfo.siteroot;
        siteroot = siteroot.replace('app/index.php', '');
        siteroot += 'addons/zjhj_video/core/web/index.php?store_id=-1&r=api/';

        function getNewApiUri(api) {
            for (var i in api) {
                if (typeof api[i] === 'string') {
                    api[i] = api[i].replace('{$_api_root}', siteroot);
                } else {
                    api[i] = getNewApiUri(api[i]);
                }
            }
            return api;
        }

        this.api = getNewApiUri(this.api);
    },
    siteInfo: require('siteinfo.js')
})