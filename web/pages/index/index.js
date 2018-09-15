//logs.js
var comjs = require("../../utils/util.js");
var timer1;
var timer2;
const app = getApp()
Page({
  data: {
    devicelists: [],
    logininfo: '',
    userInfo: {},
    page: 1,
    limit: 5,
    msg: "",
    h: 0,
    ishidden: 1,
    device_name: "",
    device_id: "",
    sysheight: 0,
    demo: [{ "id": "2", "device_id": "666666", "uid": "0", "device_name": "演示设备" }],
  },

  /**
   * 用户转发定义
   */
  onShareAppMessage: function (res) {
    return {
      title: '植物屏风',
      path: '/pages/index/index',
      imageUrl: "/images/p_bg.jpg",
      success: function (res) {
        // 转发成功
        ////console.log(res)
      },
      fail: function (res) {
        // 转发失败
        ////console.log(res)
      }
    }
  },

  onShow: function () {
    var that = this;
    app.globalData.isonline_send_time = 0;
    //console.log("首页的值：",app.globalData.isonline_send_time)
    //console.log("首页面显示")
    //console.log("开启定时查询状态")
    that.getDevicestatus();
    setTimeout(()=>{
      that.getdevices(that.data.devicelists)
    },1000)
    // 监测接收数据
    wx.onSocketMessage((res) => {
      console.log("接收到的数据", res.data)
      var data = comjs.split(res.data);
      var devicelists = that.data.devicelists;
      // //console.log(data)
      for (var i = 0; i < devicelists.length; i++) {
        //console.log("开始判断是否在线")
        if (data[0] == devicelists[i].device_id) {
          //console.log("当前在线设备", devicelists[i].isonline)
          //console.log("当前该设备状态", data[0])
          var path1 = "devicelists" + "." + "[" + i + "]" + "." + ['time'];
          var time = Date.parse(new Date());
          if(devicelists[i].isonline != 1){
            var path = "devicelists" + "." + "[" + i + "]" + "." + ['isonline'];
            
            // //console.log(path)
            that.setData({
              [path]: 1,
              [path1]: time
            })
          }else{
            that.setData({
              [path1]: time
            })
          }
          // //console.log(that.data.devicelists)
        }else{
          var time1 = Date.parse(new Date());
          var cz = Math.abs(time1-devicelists[i].time);
          if(cz>30000){
            var path = "devicelists" + "." + "[" + i + "]" + "." + ['isonline'];
            //console.log(path)
            that.setData({
              [path]: 0
            })
          }
        }
      }
    })
  },

  /**
   * 监听页面加载,初始获取设备列表
   */
  onLoad: function () {
    var that = this;
    wx.showLoading({
      title: "加载中",
    });
    var res = wx.getSystemInfoSync();
    that.setData({
      sysheight: res.windowHeight
    })
    that.getDeviceLists();
  },

  getdevices: function (devicelists = '') {
    //console.log(devicelists)
    if (devicelists == "" || devicelists == null) {
      //console.log("空的")
      return false;
    }

    var that = this;
    for (var i = 0; i < devicelists.length; i++) {
      (function (i) {
        setTimeout(() => {
          //console.log(i)
          var msg = 'ldevice:20,' + devicelists[i]['device_id'] + ',2,0,63bb739e292f425ca1c2775c69930213';
          //console.log(msg)
          that.sendSocketMessage(msg)
          that.sendSocketMessage("sendhex:" + devicelists[i]['device_id'] + "," + comjs.oneControll(devicelists[i]['device_id']));
        }, 300 * (i + 1))
      })(i)
    }
    return i;
  },

  // 循环获取设备列表中设备状态
  getDevicestatus: function () {
    var that = this;
    timer1 = setTimeout(() => {
      //console.log("查询状态")
      var i = that.getdevices(that.data.devicelists)
      timer2 = setTimeout(() => {
        //console.log(i + "------------------------------------------------------------------------")
        that.getDevicestatus(that.data.devicelists)
      }, 305 * i)
    }, 30000)
  },

  onHide: function () {
    //console.log("关闭定时查询")
    clearTimeout(timer1)
    clearTimeout(timer2)
  },

  sendSocketMessage: function (msg) {
    console.log("发送了消息。。。", msg)
    wx.sendSocketMessage({
      data: msg,
      complete: res => {
        //console.log(res)
      }
    })
  },

  /**
   * 下拉刷新
   */
  onPullDownRefresh: function () {
    var that = this;
    that.setData({
      devicelists: [],
      page: 1,
      ishidden: 1,
      msg: ""
    })
    this.getDeviceLists();
  },
  /**
   * 获取设备列表函数
   */
  getDeviceLists: function () {
    var that = this;
    var logininfo = wx.getStorageSync('logininfo');
    that.setData({
      logininfo: logininfo,
    })
    if (logininfo) {
      wx.getUserInfo({
        success: res => {
          that.setData({
            userInfo: res.userInfo
          })
        }
      })
      that.getrequest(logininfo, this.data.page, this.data.limit);
    } else {
      setTimeout(() => {
        this.getDeviceLists()
      }, 2000)
    }
  },

  /**
   * 上啦触底函数
   */
  onReachBottom() {
    this.setData({
      msg: "努力加载中..."
    })
    setTimeout(() => {
      this.getrequest(this.data.logininfo, this.data.page, this.data.limit);
    }, 500)
  },

  /**
   * 请求获取设备列表接口
   */
  getrequest: function (logininfo, page, limit) {
    var that = this;
    // ////console.log(logininfo)
    wx.request({
      url: 'https://zj.yhqq.top/index.php?s=/admin/xcxapi/getDveviceLists',
      data: {
        uid: logininfo.uid,
        token: logininfo.token,
        page: page,
        limit: limit
      },
      header: {
        "content-type": "application/x-www-form-urlencoded"
      },
      method: 'POST',
      success: function (res) {
        // //console.log(res)
        if (res.data.status === 1) {
          if (res.data.data !== null) {
            var data = that.data.devicelists.concat(res.data.data)
            console.log(data)
            that.getdevices(data);
            that.setData({
              devicelists: data,
              page: ++page
            })
          } else if (res.data.data === null && that.data.page == 1) {
            that.setData({
              devicelists: res.data.data,
            })
          } else if (that.data.page > 1) {
            that.setData({
              msg: "我是有底线的"
            })
          }

          setTimeout(function () {
            wx.hideLoading()
            wx.stopPullDownRefresh()
            var query = wx.createSelectorQuery();
            //选择id
            query.select('.container').boundingClientRect()

            query.exec(res => {
              if (that.data.sysheight > res[0].height) {
                that.setData({
                  h: that.data.sysheight
                })
              } else {
                that.setData({
                  h: res[0].height
                })
              }
            })
          }, 500)
        } else {
          wx.clearStorageSync();
          ////console.log("开始重新调用")
          app.onLaunch();
          that.onLoad();
        }
      },
    })
  },

  /**
   * 取消弹窗
   */
  cancelmodel: function () {
    var that = this;
    that.setData({
      ishidden: 1,
    })
  },

  /**
   * 编辑设备①
   */
  editdevice: function (e) {
    var that = this;
    ////console.log(e.currentTarget.dataset.device_id)
    var device_id = e.currentTarget.dataset.device_id
    var device_name = e.currentTarget.dataset.device_name
    that.setData({
      ishidden: 0,
      device_name: device_name,
      device_id: device_id
    })
  },

  /**
   * 提交编辑
   */
  formSubmit: function (res) {
    var that = this;
    var device_id = res.detail.value.device_id;
    var device_name = res.detail.value.device_name;
    ////console.log(res.detail.value.device_name)
    wx.request({
      url: 'https://zj.yhqq.top/index.php?s=/admin/xcxapi/editDevice',
      data: {
        uid: that.data.logininfo.uid,
        token: that.data.logininfo.token,
        device_id: device_id,
        device_name: device_name
      },
      method: "POST",
      header: {
        "content-type": "application/x-www-form-urlencoded"
      },
      success: res => {
        ////console.log(res)
        if (res.data.status === 1) {
          wx.showToast({
            title: '编辑成功',
            icon: "success",
            duration: 2000
          })
        } else {
          wx.showToast({
            title: '编辑失败',
          })
        }
        setTimeout(() => {
          that.setData({
            devicelists: [],
            page: 1,
            ishidden: 1
          })
          that.onLoad();
        }, 1500)
      }
    })
  },
  /** 
   * 删除设备
   */
  deletedevice: function (e) {
    ////console.log(e)
    var that = this;
    var device_id = e.detail.value.device_id
    var device_name = e.detail.value.device_name
    var formid = e.detail.formId
    wx.showModal({
      title: '提示信息',
      content: '您确定要删除该设备吗？',
      success: res => {
        if (res.confirm) {
          wx.request({
            //url: 'https://zj.yhqq.top/index.php?s=/admin/xcxapi/deleteDevice',
            url: 'https://zj.yhqq.top/index.php?s=/admin/xcxapi/del_device',
            data: {
              uid: that.data.logininfo.uid,
              token: that.data.logininfo.token,
              device_id: device_id,
              device_name: device_name,
              formid: formid
            },
            method: "POST",
            header: {
              "content-type": "application/x-www-form-urlencoded"
            },
            success: res => {
              ////console.log(res)
              if (res.data.status === 1) {
                wx.showToast({
                  title: '删除成功',
                  icon: 'success',
                  duration: 2000,
                })
              } else {
                wx.showToast({
                  title: '删除失败',
                  icon: 'none',
                  duration: 2000,
                })
              }
              setTimeout(() => {
                that.setData({
                  devicelists: [],
                  page: 1
                })
                that.onLoad();
              }, 1500)
            }
          })
        }
      }
    })
  },

  shardevice: function (e) {
    var device_id = e.currentTarget.dataset.device_id;
    var device_name = e.currentTarget.dataset.device_name;
    ////console.log(e.currentTarget.dataset.device_id)
    wx.navigateTo({
      url: '../share/share?device_id=' + device_id + "&device_name=" + device_name
    })
  },


binddevice:function(e){
    var that = this;
    var logininfo = wx.getStorageSync('logininfo');
    console.log(that.data.logininfo.uid);
    wx.showModal({
      title: '提示信息',
      content: '请按设备上的wifi键后再扫描设备上的设备绑定二维码！',
      success: res => {
      if (res.confirm) {
        wx.scanCode({
          success: (res) => {
              var arr = res["result"].split("/");
              var device_id = arr["8"];
            //console.log(arr["8"]);
            wx.request({
              url: 'https://zj.yhqq.top/index.php?s=/admin/loginapi/bind_device',
              data: {
                uid: that.data.logininfo.uid,
                device_id: device_id
              },
              header: {
                "content-type": "application/x-www-form-urlencoded"
              },
              method: 'POST',
              success: function (res) {
              //console.log(res)
              if (res.data.status == 1) {
                wx.showToast({
                    title: '绑定成功',
                    icon: 'none',
                    duration: 2000,
                  })
                setTimeout(() => {
                  that.setData({
                    devicelists: [],
                    page: 1
                  })
                  that.onLoad();
                }, 1500)
            }else if(res.data.status == 2){
              wx.showToast({
                  title: '请按设备上wifi键后再绑定设备！',
                  icon: 'none',
                  duration: 2000,
              })
            }else{
              wx.showToast({
                  title: '绑定失败',
                  icon: 'none',
                  duration: 2000,
              })
            }
          }  
        })
        }
      })
     
      }
      }
       })
  }
  

})


