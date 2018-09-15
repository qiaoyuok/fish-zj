// pages/share/share.js
Page({

  /**
   * 页面的初始数据
   */
  data: {
    qr: "",
    device_id: "",
    device_name: "默认设备",
    height: 0,
    logininfo: {},
    users: {}
  },

  // 生成二维码
  getqr: function (e) {
    
    var that = this;
    var device_id = that.data.device_id;
    wx.request({
      url: 'https://zj.yhqq.top/index.php?s=/admin/xcxapi/getQr',
      data: {
        uid: that.data.logininfo.uid,
        token: that.data.logininfo.token,
        device_id: that.data.device_id
      },
      header: {
        "content-type": "application/x-www-form-urlencoded"
      },
      method: 'POST',
      success: function (res) {
        //console.log(res)
        if (res.data.status == 1) {
          that.setData({
            qr: res.data.url
          })
          wx.setStorageSync("qrurl" + device_id, res.data.url)
          if(e){
              wx.showToast({
                title: '更新二维码成功',
              })
          }
        }else{
          if (e) {
            wx.showToast({
              title: '更新二维码失败',
              icon: 'none ',
            })
          }
        }
        console.log("此时的url", wx.getStorageSync("qrurl" + device_id))
      }
      
    })
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    //console.log(options)
    wx.showLoading({
      title: '加载中',
    })
    var that = this;
    var device_id = options.device_id;
    var device_name = options.device_name;
    var logininfo = wx.getStorageSync('logininfo');
    console.log("登录信息",logininfo)
    that.setData({
      logininfo: logininfo,
      device_id: device_id,
      device_name: device_name
    })
    // 获取二维码
    console.log(wx.getStorageSync("qrurl" + device_id))
    var qrurl = wx.getStorageSync("qrurl" + device_id);
    console.log("qrurl" + device_id,qrurl)
    if(!qrurl){
      that.getqr();
    }else{
      that.setData({
        qr: qrurl
      })
    }
    that.getshareusers();
    wx.getSystemInfo({
      success: function (res) {
        var windowheight = res.windowHeight;
        var windowwidth = res.screenWidth;
        var height = (750 / windowwidth) * windowheight - 790 + "rpx";
        that.setData({
          height: height,
        })
      },
    })
  },

  // 获取已被分享的用户
  getshareusers: function () {
    var that = this;
    wx.request({
      url: 'https://zj.yhqq.top/index.php?s=/admin/xcxapi/getShareUsers',
      data: {
        uid: that.data.logininfo.uid,
        token: that.data.logininfo.token,
        device_id: that.data.device_id
      },
      header: {
        "content-type": "application/x-www-form-urlencoded"
      },
      method: 'POST',
      success: function (res) {
        //console.log(res)
        if (res.data.status == 1) {
          that.setData({
            users: res.data.data
          })
        }
      }
    })
  },

  cancelshare: function (e) {
    var that = this;
    //console.log(e)
    var canceluid = e.currentTarget.dataset.canceluid;
    var nickname = e.currentTarget.dataset.nickname
    wx.showModal({
      title: '提示信息',
      content: '你确定要取消对[' + nickname + "]的设备分享吗?",
      success: res => {
        //console.log(res)
        if (res.confirm) {
          wx.request({
            url: 'https://zj.yhqq.top/index.php?s=/admin/xcxapi/cancelShare',
            data: {
              uid: that.data.logininfo.uid,
              token: that.data.logininfo.token,
              device_id: that.data.device_id,
              canceluid: canceluid
            },
            header: {
              "content-type": "application/x-www-form-urlencoded"
            },
            method: 'POST',
            success: function (res) {
              //console.log(res)
              if (res.data.status == 1) {
                wx.showToast({
                  title: res.data.msg,
                })
              } else if (res.data.status == 0) {
                wx.showToast({
                  title: res.data.msg,
                  icon: "none"
                })
              }
              that.getshareusers();
            }
          })
        }
      }
    })
  },

  /**
   * 生命周期函数--监听页面初次渲染完成
   */
  onReady: function () {
    //console.log("渲染")
    setTimeout(()=>{
      wx.hideLoading();
    },500)
  },

  /**
   * 生命周期函数--监听页面显示
   */
  onShow: function () {

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
})