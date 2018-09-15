//app.js
var isConnect = false;
App({
  getSet: function () {
    var that = this;
    wx.getSetting({
      success: function (res) {
        //console.log(res)
        if (res.authSetting['scope.userInfo'] !== true) {
          if (res.authSetting['scope.userInfo'] === false) {
            wx.hideLoading()
            wx.showModal({
              content: '你需要先开启用户授权才可以正常使用',
              success: function (res) {
                if (res.confirm) {
                  wx.openSetting({
                    success: function (res) {
                      if (res.authSetting['scope.userInfo'] !== true) {
                        that.getSet();
                      } else {
                        that.onLaunch();
                      }
                    }
                  })
                } else {
                  that.getSet();
                }
              }
            })
          } else {
            setTimeout(() => {
              that.getSet();
            }, 1000)
          }
        }
      }
    })
  },

  onShow: function () {
    var that = this;
    if (!isConnect){
      that.connect();    
    }
    wx.onSocketClose(function (res) {
      console.log('WebSocket 已关闭')
      isConnect = false;
      that.connect();
    })

    wx.onSocketError(function (res) {
      //console.log('WebSocket连接打开失败，请检查！')
      // wx.showModal({
      //   title: 'connect error!',
      //   content: res.errMsg,
      // })
    })
    
  },

  onLaunch: function () {
    const updateManager = wx.getUpdateManager()

    updateManager.onCheckForUpdate(function (res) {
      // 请求完新版本信息的回调
      //console.log(res.hasUpdate)
    })

    updateManager.onUpdateReady(function () {
      wx.showModal({
        title: '更新提示',
        content: '新版本已经准备好，是否重启应用？',
        success: function (res) {
          if (res.confirm) {
            // 新的版本已经下载好，调用 applyUpdate 应用新版本并重启
            updateManager.applyUpdate()
          }
        }
      })

    })

    updateManager.onUpdateFailed(function () {
      // 新的版本下载失败
      //console.log("新的版本下载失败")
    })
    var that = this;
    // 展示本地存储能力
    var logininfo = wx.getStorageSync('logininfo');
    var now_time = Date.parse(new Date())
    if (logininfo.out_time<now_time){
      console.log("登录态过期");
      wx.removeStorage({
        key: 'logininfo',
        success: function (res) {
          console.log(res.data)
        }
      })
      logininfo = null;
    }
    console.log(logininfo)

    if (!logininfo) {

      // 查看用户是否授权获取用户信息，没有授权提示用户授权
      that.getSet();
      wx.login({
        success: res => {
          // 发送 res.code 到后台换取 openId, sessionKey, unionId
          console.log(res)
          wx.request({
            url: 'https://zj.yhqq.top/index.php?s=/admin/loginapi/getopenid',
            data: {
              code: res.code
            },
            method: "POST",
            header: {
              "content-type": "application/x-www-form-urlencoded"
            },
            success: function (r) {
              
              // 已经授权，可以直接调用 getUserInfo 获取头像昵称，不会弹框
              wx.getUserInfo({
                success: res => {
                  //console.log("code换取的openid和sessionkey", r)
                  //console.log("授权后获取的用户信息", res)
                  // 可以将 res 发送给后台解码出 unionId
                  wx.request({
                    url: 'https://zj.yhqq.top/index.php?s=/admin/loginapi/login',
                    data: {
                      encryptedData: res.encryptedData,
                      iv: res.iv,
                      sessionKey: r.data.session_key
                    },
                    method: "POST",
                    header: {
                      "content-type": "application/x-www-form-urlencoded"
                    },
                    success: function (res) {
                      //console.log("解密后返回数据", res);
                      if (res.data.status == 1) {
                        wx.setStorage({
                          key: "logininfo",
                          data: {
                            uid: res.data.uid,
                            token: res.data.token,
                            out_time: Date.parse(new Date()) + 86428000
                          },
                          success: function (res) {
                            console.log("登陆成功")
                          }
                        })
                      } else if (res.data.status == 0) {
                        wx.showToast({
                          title: '登录出错 请稍后重试',
                          icon: "none"
                        })
                      }
                    }
                  })

                  // 由于 getUserInfo 是网络请求，可能会在 Page.onLoad 之后才返回
                  // 所以此处加入 callback 以防止这种情况
                  if (this.userInfoReadyCallback) {
                    this.userInfoReadyCallback(res)
                  }
                }
              })
            }
          })
        }
      })
    }
  },
  globalData: {
    connectnum: 0,
    isonline_send_time: 0,
    getdevicedata: "",
    ismonitor: false,
    setTime: ""
  },

  connect: function () {
    var that = this;
    //链接websocket
    wx.connectSocket({
      url: 'wss://zjso.yhqq.top/xnet_ws/message',
      success: res => {
        console.log(res.errMsg)
      }
    })
    // 监听websocket打开事件
    wx.onSocketOpen((res) => {
      console.log("打开链接")
      isConnect = true;
    })
  },
})