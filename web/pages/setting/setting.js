const app = getApp();
var comjs = require("../../utils/util.js");
Page({

  /**
   * 页面的初始数据
   */
  data: {
    logininfo: {},
    scene: 0,
    device_id: "",
    w_1: {},
    w_2: {},
    w_3: {},
    w_4: {},
    w_5: {},
    w_6: {},
    w_7: {},
    height: 0,
    isdisabled: true
  },

  //比较数据是否符合要求
  compare: function (data, position, value) {
    //console.log(position)
    //console.log(value)
    var arr = [];
    for (var i = 0; i <= 2; i++) {
      var group = "group_" + (i + 1);
      if (data[group]["on_time"] != "" && data[group]["on_time"] != "") {
        arr.push(data[group]["on_time"])
        arr.push(data[group]["off_time"])
      }
    }
    arr[position] = value;
    var length = arr.length;
    // 比较是否符合
    console.log("处理后的数组为：", arr)
    if (length == 2) {
      if (position == 0) {
        arr[1] = value;
        return "ok";
      } else {
        var time1 = arr[0];
        var time2 = arr[1];
        // console.log(time1)
        // console.log(time2)
        time1 = Date.parse(new Date("2012/12/12 " + time1));
        time2 = Date.parse(new Date("2012/12/12 " + time2));
        // console.log("开始时间",time1)
        // console.log("结束时间",time2)
        var mid = (time2 - time1) / 60000;
        // console.log("比值", mid)
        if (mid > 3 || mid < 0) {
          return null;
        }
      }
    } else {
      for (i = 0; i <= length - 1; i++) {

        var mod = position % 2;
        // console.log(position)
        // console.log(mod)
        if (mod != 0) {
          // console.log("偶数")
          
          if (position < i) {
            if (value >= arr[i]) {
              return false;
            }
          } else if (position > i) {
            if (value <= arr[i]) {
              return false;
            }
          }
        } else {
          // console.log("奇数")
          switch (position) {
            case 0: if (arr[0] >= arr[2]) return false;break;
            case 2: if (arr[2] >= arr[4] || arr[2] <= arr[1]) return false; break;
            case 4: if (arr[4] <= arr[3]) return false; break;
          }
          return "ok";
        }
      }
    }
    return true;
  },

  bindTimeChange: function (e) {
    //console.log(e)
    var w = e.currentTarget.dataset.w;  //周
    var road_num = e.currentTarget.dataset.road_num;  //路
    var group = e.currentTarget.dataset.group; //组
    var model = e.currentTarget.dataset.model; //模式
    var value = e.detail.value;  //当前值

    var editname = w + "." + [road_num] + "." + [group] + "." + [model];
    switch (group) {
      case "group_1": var position = (model == "on_time") ? 0 : 1; break;
      case "group_2": var position = (model == "on_time") ? 2 : 3; break;
      case "group_3": var position = (model == "on_time") ? 4 : 5; break;
    }


    //console.log("确定的元素：", editname)
    //console.log("该天的详情1", this.data.w_1)
    //console.log("当前数据是：", this.data[w][road_num][group][model])

    var comparedata = this.data[w][road_num];
    //console.log(comparedata, position, value)
    var res = this.compare(comparedata, position, value);
    //console.log("比较返回结果", res)
    switch (res) {
      case null:
        wx.showModal({
          content: '植物补水时间不能超过3分钟 请做调整!',
          showCancel: false,
          confirmText: '确定',
        })
        return false;
        break;
      case false:
        wx.showModal({
          content: '每天时间从左至右为依次递增 请做调整!',
          showCancel: false,
          confirmText: '确定',
        })
        return false;
      case "ok":
        var model = "off_time";
        var editname2 = w + "." + [road_num] + "." + [group] + "." + [model];
        console.log(w)
        console.log(editname2)
        this.setData({
          [editname2]: value,
        })
        break;
    }

    this.setData({
      [editname]: value,
    })

    //console.log("该天的详情2", this.data[w])
  },
  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    var that = this;

    //console.log(that.data.w_1)
    //console.log("当前场景是否禁用：", that.data.isdisabled)
    var device_id = options.device_id;

    var scene = parseInt(options.scene);
    wx.getSystemInfo({
      success: function (res) {
        var windowheight = res.windowHeight;
        var windowwidth = res.screenWidth;
        if (scene == 4) {
          // 计算星期时间所占高度 单位rpx
          var height = (750 / windowwidth) * windowheight - 110 + "rpx";
        } else {
          // 计算星期时间所占高度 单位rpx
          var height = "100%";
        }
        that.setData({
          height: height
        })
      },
    })
    //console.log("scene",scene)
    switch (scene) {
      case 1: wx.setNavigationBarTitle({ title: "家庭模式－不可改变" }); break;
      case 2: wx.setNavigationBarTitle({ title: "办公模式－不可改变" }); break;
      case 3: wx.setNavigationBarTitle({ title: "公共场所－不可改变" }); break;
      case 4: wx.setNavigationBarTitle({ title: "自定义模式" }); that.setData({ isdisabled: false }); break;
    }
    var logininfo = wx.getStorageSync('logininfo');
    that.setData({
      logininfo: logininfo,
      scene: scene,
      device_id: device_id
    })
    if (logininfo) {
      wx.request({
        url: 'https://zj.yhqq.top/index.php?s=/admin/xcxapi/getSet',
        data: {
          uid: logininfo.uid,
          token: logininfo.token,
          device_id: device_id,
          scene: scene
        },
        header: {
          "content-type": "application/x-www-form-urlencoded"
        },
        method: 'POST',
        success: function (res) {
          //console.log("配置信息：", res)
          that.setData({
            w_1: res.data.w_1,
            w_2: res.data.w_2,
            w_3: res.data.w_3,
            w_4: res.data.w_4,
            w_5: res.data.w_5,
            w_6: res.data.w_6,
            w_7: res.data.w_7,
          })

          //console.log(that.data.w_1)
        }
      })
    }
  },
  confirm: function () {
    var savedata = JSON.stringify({
      w_1: this.data.w_1,
      w_2: this.data.w_2,
      w_3: this.data.w_3,
      w_4: this.data.w_4,
      w_5: this.data.w_5,
      w_6: this.data.w_6,
      w_7: this.data.w_7,
    })
    wx.request({
      url: 'https://zj.yhqq.top/index.php?s=/admin/xcxapi/saveSet',
      data: {
        uid: this.data.logininfo.uid,
        token: this.data.logininfo.token,
        device_id: this.data.device_id,
        scene: this.data.scene,
        data: savedata
      },
      header: {
        "content-type": "application/x-www-form-urlencoded"
      },
      method: 'POST',
      success: function (res) {
        //console.log(res)
        if (res.data.status == 1) {
          wx.showToast({
            title: '编辑成功',
            icon: "success",
            duration: 2000
          })
          setTimeout(() => {
            wx.navigateBack({
              delta: 1
            })
          }, 1000)
        } else {
          wx.showToast({
            title: '编辑失败',
            icon: "success",
            duration: 2000
          })
        }
      }
    })
  },

  cancel: function () {
    wx.navigateBack({
      delta: 1
    })
  },
})