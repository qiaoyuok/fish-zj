// pages/add_share/add_share.js
var comjs = require("../../utils/util.js");

Page({

  /**
   * 页面的初始数据
   */
  data: {
      msg:"",
      ishidden:true,
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    var that = this;
    var options = decodeURIComponent(options.scene)
    var arr= comjs.split(options)
    console.log(arr)
    wx.getSetting({
      success: function (res) {
        //console.log(res)
        if (res.authSetting['scope.userInfo'] === false) {
          that.setData({
            ishidden:true
          })
        } else {
          that.setData({
            ishidden: false,
            msg:"正在添加设备......"
          })
        }
      }
    })

    var device_id = arr[0]
    var device_token = arr[1]
    console.log(device_id)
    console.log(device_token)
    // 获取该设备分享的关键参数
    // var qr = options.qr;
    var logininfo = wx.getStorageSync('logininfo');
    if (logininfo) {

      that.setData({
        logininfo: logininfo,
      })
      that.addshare(device_id, device_token);

    } else {
      //console.log("等待登陆。。。")
      setTimeout(() => {
        that.onLoad(options);
      }, 2000)
    }
  },

  // 添加分享的设备
  addshare: function (devcie_id = '', device_token = '') {
    var that = this;

    wx.request({
      url: 'https://zj.yhqq.top/index.php?s=/admin/xcxapi/addShare',
      data: {
        uid: that.data.logininfo.uid,
        token: that.data.logininfo.token,
        device_id: devcie_id,
        device_token: device_token
      },
      header: {
        "content-type": "application/x-www-form-urlencoded"
      },
      method: 'POST',
      success: function (res) {
        setTimeout(() => {
          //console.log(res)
          if (res.data.status == 1) {
            that.setData({
              ishidden: false,
              msg: res.data.msg+" 正在跳转......"
            })
          } else if (res.data.status == 0) {
            that.setData({
              ishidden: false,
              msg: res.data.msg + " 正在跳转......"
            })
          }
          setTimeout(() => {
            wx.reLaunch({
              url: '/pages/index/index',
            })
          }, 2000)
        }, 2000)
      }
    })
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

  /**
   * 用户点击右上角分享
   */
  onShareAppMessage: function () {

  }
})