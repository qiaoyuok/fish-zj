
//获取应用实例
const app = getApp()
var comjs = require("../../utils/util.js");
var onlinemonitor;
var looponlinemonitor;
var warn1;
var warn2;
Page({
  data: {
    logininfo: {},
    device_name: "设备名称",
    device_id: "",
    scene: null,
    tem_scene: null,
    old_scene: null,
    scene_home_pic: "/images/scene_home_off.png",
    scene_class_pic: "/images/scene_class_off.png",
    scene_com_pic: "/images/scene_com_off.png",
    scene_diy_pic: "/images/scene_diy_off.png",
    control_p_light_pic: "/images/p_light_off.png",
    control_p_water_pic: "/images/p_water_off.png",
    control_f_light_pic: "/images/f_light_off.png",
    control_f_water_pic: "/images/f_water_off.png",
    p_light_v: -1,
    p_water_v: -2,
    f_light_v: -3,
    f_water_v: -4,
    home_v: -1,
    class_v: -2,
    com_v: -3,
    diy_v: -4,
    // ispress: false,
    ishidden: true,
    w_close: true,
    er_close: true,
    w_exists: false,
    er_exists: false,
    warn1: "水位警报",
    spliderwidth: 0,
    slider: true,
    endtime: 0,
    isres: false,
    send_msg: "",
    b_pic: "/images/p_bg.png",
    p_light_text_color: "D2D2D2",
    p_water_text_color: "D2D2D2",
    f_light_text_color: "D2D2D2",
    f_water_text_color: "D2D2D2",
    home_text_color: "D2D2D2",
    class_text_color: "D2D2D2",
    com_text_color: "D2D2D2",
    diy_text_color: "D2D2D2",
    bgurl:"default.png"
  },

  controlswitch: function (e) {
    var that = this;
    var control_v = e.currentTarget.dataset.control_v;

    if (control_v < 0) {
      var status = 1
    } else {
      var status = 0
    }

    var ru_no = Math.abs(control_v);
    switch (ru_no) {
      case 3: ru_no = 1; break;
      case 2: ru_no = 2; break;
      case 1: ru_no = 3; break;
      case 4: ru_no = 4; break;
    }
    ////console.log("控制哪一路", ru_no)
    ////console.log("当前指令状态", status)
    // if (ru_no == 4 && status == 1) {
    //   that.data.ispress = true;
    // }
    this.oneControll(161, ru_no, status)
  },

  controlStatus: function (control_v) {
    var that = this;
    switch (control_v) {
      case 1: var control_pic = "control_p_light_pic"; var control_pic_url = "/images/p_light_off.png"; var model = "p_light_v"; var value = -1; var text = "p_light_text_color"; var text_color = "D2D2D2"; break;
      case 2: var control_pic = "control_p_water_pic"; var control_pic_url = "/images/p_water_off.png"; var model = "p_water_v"; var value = -2; var text = "p_water_text_color"; var text_color = "D2D2D2"; break;
      case 3: var control_pic = "control_f_light_pic"; var control_pic_url = "/images/f_light_off.png"; var model = "f_light_v"; var value = -3; var text = "f_light_text_color"; var text_color = "D2D2D2"; break;
      case 4: var control_pic = "control_f_water_pic"; var control_pic_url = "/images/f_water_off.png"; var model = "f_water_v"; var value = -4; var text = "f_water_text_color"; var text_color = "D2D2D2"; break;
      case -1: var control_pic = "control_p_light_pic"; var control_pic_url = "/images/p_light.png"; var model = "p_light_v"; var value = 1; var text = "p_light_text_color"; var text_color = "76B161"; break;
      case -2: var control_pic = "control_p_water_pic"; var control_pic_url = "/images/p_water.png"; var model = "p_water_v"; var value = 2; var text = "p_water_text_color"; var text_color = "76B161"; break;
      case -3: var control_pic = "control_f_light_pic"; var control_pic_url = "/images/f_light.png"; var model = "f_light_v"; var value = 3; var text = "f_light_text_color"; var text_color = "76B161"; break;
      case -4: var control_pic = "control_f_water_pic"; var control_pic_url = "/images/f_water.png"; var model = "f_water_v"; var value = 4; var text = "f_water_text_color"; var text_color = "76B161"; break;
    }
    that.setData({
      [control_pic]: [control_pic_url],
      [model]: value,
      [text]: text_color
    })
  },

  oneControll: function (command_type, ru_no = null, status = null) {//单路控制       
    var command_type = command_type;                         //单路控制 A1
    var check_val = command_type + ru_no + status;		//校验
    var end_code = 13;								//结束位
    var str_command = "";
    str_command += String.fromCharCode(command_type);
    str_command += String.fromCharCode(ru_no);
    str_command += String.fromCharCode(status);
    str_command += String.fromCharCode(check_val);
    str_command += String.fromCharCode(end_code);

    var str_command = comjs.base64_encode(str_command);
    var str_send = "sendhex:" + this.data.device_id + "," + str_command;

    this.sendSocketMessage(str_send)
  },

  sendSocketMessage: function (msg) {
    this.data.send_msg = msg
    console.log("发送了消息。。。", msg)
    wx.sendSocketMessage({
      data: msg,
      complete: res => {
        ////console.log(res)
      }
    })

  },

  isOnline: function () {
    var that = this;
    var time = Date.parse(new Date()) + 10000;
    //console.log(time)
    app.globalData.isonline_send_time = time;
    that.oneControll(164);
    that.jianceIsOnLine();
    //console.log("发起监测")

    onlinemonitor = setTimeout(() => {
      that.isOnline();
    }, 20000)
  },

  jianceIsOnLine: function () {
    var that = this;
    //console.log("检测设备中....")
    //console.log("控制页的值：", app.globalData.isonline_send_time)

    var time = Date.parse(new Date());
    if (app.globalData.isonline_send_time != 0) {
      if (time > app.globalData.isonline_send_time) {
        // //console.log("设备离线")
        clearTimeout(onlinemonitor)
        clearTimeout(looponlinemonitor)
        wx.showToast({
          title: '设备离线',
        })
        setTimeout(() => {
          wx.navigateBack();
        }, 2000)
      } else {
        looponlinemonitor = setTimeout(() => {
          that.jianceIsOnLine();
        }, 500)
      }
    } else {
      return false;
    }
  },

  onShow: function () {
    var that = this;
    setTimeout(()=>{
      var msg = 'ldevice:20,' + that.data.device_id + ',2,0,63bb739e292f425ca1c2775c69930213';
      // //console.log(msg)
      that.sendSocketMessage(msg)
      that.sendSocketMessage("sendhex:" + that.data.device_id + "," + comjs.oneControll(that.data.device_id));
      setTimeout(() => {
        that.isOnline();
      }, 1000)
    },1000)
  },

  onLoad: function (option) {
    wx.showLoading({
      title: '加载中',
    })
    var that = this;
    var logininfo = wx.getStorageSync('logininfo');
    var device_id = option.device_id;
    that.setData({
      logininfo: logininfo,
      device_id: device_id,
    })
    wx.request({
      url: 'https://zj.yhqq.top/index.php?s=/admin/xcxapi/getDeviceInfo',
      data: {
        uid: logininfo.uid,
        token: logininfo.token,
        device_id: device_id,
      },
      header: {
        "content-type": "application/x-www-form-urlencoded"
      },
      method: 'POST',
      success: function (res) {
        ////console.log("设备详情：", res)
        if (res.data.status == 1) {
          that.setData({
            device_name: res.data.data.device_name,
            scene: res.data.data.scene,
          })
        } else {
          //console.log(device_id)
          if (device_id != "666666") {
            wx.hideLoading()
            wx.showModal({
              title: '提示',
              content: res.data.msg,
              complete: (res) => {
                wx.navigateBack({})
              }
            })
          }
        }

        ////console.log("场景值：", that.data.scene)
        // 现实场景装状态
        if (that.data.scene > 0) {
          that.sceneStatus(-parseInt(that.data.scene))
        }
      }
    })
    that.getbg();
    

    //监测收到数据
    wx.onSocketMessage((res) => {
      //console.log("收到数据", res)
      console.log('收到服务器内容：', res.data)
      if (res.data != "ldevice:1") {

        var data = comjs.split(res.data)
        if (data[0] == that.data.device_id) {
          app.globalData.isonline_send_time = 0;

          var res = comjs.decodeBase64(data[1]);
          ////console.log("收到了数据", res);
          if (res[0] == 164) {
            ////console.log("开始渲染")
            if (res[2] == 1) {
              ////console.log("调用了吗")
              that.controlStatus(-3)
            } else if (res[2] == 0) {
              ////console.log("调用了吗")
              that.controlStatus(3)
            }
            if (res[4] == 1) {
              ////console.log("调用了吗")
              that.controlStatus(-1)
            } else if (res[4] == 0) {
              ////console.log("调用了吗")
              that.controlStatus(1)
            }
            if (res[3] == 1) {
              ////console.log("调用了吗")
              that.controlStatus(-2)
            } else if (res[3] == 0) {
              ////console.log("调用了吗")
              that.controlStatus(2)
            }
            if (res[5] == 1) {
              ////console.log("调用了吗")
              that.controlStatus(-4)
            } else if (res[5] == 0) {
              ////console.log("调用了吗")
              that.controlStatus(4)
            }

            if (res[6] == 1 && !that.data.w_exists) {

              that.setData({
                ishidden: false,
                warn1: "水位警报",
              })

              ////console.log("开始显示警告！")
              that.showwarn(true, 1);
            }
            if (res[6] != 1 && that.data.w_exists) {
              ////console.log("开始关闭警告！")
              that.showwarn(false, 1);
            }

            if (res[6] == 8 && !that.data.er_exists) {

              that.setData({
                ishidden: false,
                warn1: "故障警报",
              })

              ////console.log("开始显示警告！")
              that.showwarn(true, 2);
            }
            if (res[6] != 8 && that.data.er_exists) {
              ////console.log("开始关闭警告！")
              that.showwarn(false, 2);
            }
          }
          if (res[0] == 270) {
            that.sendSocketMessage(that.data.send_msg)
          }
          if (res[0] == 162) {
            // 表示设置场景成功
            if (res[1] == 21) {
              that.changescene();
              wx.showToast({
                title: '设置成功',
                icon: "success",
                duration: 1000,
                complete: function () {
                  setTimeout(() => {
                    that.setData({
                      slider: true,
                      isres: true
                    })
                  }, 2000)

                }
              })
            } else {
              wx.showToast({
                title: '设置失败',
                icon: "none",
                duration: 1000,
                complete: function () {
                  setTimeout(() => {
                    that.setData({
                      slider: true,
                      isres: true
                    })
                  }, 2000)
                }
              })
            }

          }
        }

      }
    })
    setTimeout(() => {
      wx.hideLoading();
    }, 1000)
  },

  // 检测超水位，闪烁显示警告  间隔1s
  showwarn: function (status, flag) {

    if (status) {
      // ////console.log("异常标志：",flag)
      if (flag == 1) {
        this.setData({
          w_exists: true,
          w_close: false,
          ishidden: false
        })
      } else if (flag == 2) {
        this.setData({
          er_exists: true,
          er_close: false,
          ishidden: false
        })
      }
      // ////console.log("是否禁用闪烁",this.data.w_close)
      warn1 = setTimeout(() => {
        this.setData({
          ishidden: true
        })
        warn2 = setTimeout(() => {
          if (!this.data.w_close) {
            this.showwarn(true, flag)
          }
          if (!this.data.er_close) {
            this.showwarn(true, flag)
          }
        }, 500)
      }, 500)
    } else {
      ////console.log("关闭警告")
      if (flag == 1) {
        this.setData({
          ishidden: true,
          w_close: true,
          w_exists: false
        })
      } else if (flag == 2) {
        this.setData({
          ishidden: true,
          er_close: true,
          er_exists: false
        })
      }
    }
  },

  showmenu: function (e) {
    var temp_scene = Math.abs(parseInt(e.currentTarget.dataset.scene));
    var scene = e.currentTarget.dataset.scene;
    // //console.log(temp_scene)
    switch (temp_scene) {
      case 1: var scene_name = "家庭模式"; break;
      case 2: var scene_name = "办公模式"; break;
      case 3: var scene_name = "公共场所"; break;
      case 4: var scene_name = "自定义模式"; break;
      default: var scene_name = "默认模式"; break;
    }

    var list1 = "选择[" + scene_name + "]";
    var list2 = "查看[时间设置]";
    if (temp_scene == 4) {
      var list2 = "查看/设置[运行时间]";
    }
    var lists = [list1, list2];
    var that = this
    wx.showActionSheet({
      itemList: lists,
      itemColor: "#5FB878",
      success: function (res) {
        // //console.log(res)
        if (res.tapIndex == 0) {
          that.setswitch(scene);
        } else if (res.tapIndex == 1) {
          that.setting(temp_scene);
        }
      }
    })

  },

  /**
   * 场景设置
   */
  setting: function (scene) {
    wx.navigateTo({
      url: '/pages/setting/setting?scene=' + scene + '&device_id=' + this.data.device_id,
    })
  },

  setswitch: function (scene) {
    this.setData({
      spliderwidth: 0,
      old_scene: scene
    })
    //console.log(scene);
    if (scene > 0 && scene < 4) {
      return false;
    }
    var scene = Math.abs(scene)
    this.setData({
      tem_scene: scene
    })

    // 获取当前设备场景模式详情
    wx.request({
      url: 'https://zj.yhqq.top/index.php?s=/admin/xcxapi/getSet',
      data: {
        uid: this.data.logininfo.uid,
        token: this.data.logininfo.token,
        device_id: this.data.device_id,
        scene: scene
      },
      header: {
        "content-type": "application/x-www-form-urlencoded"
      },
      method: 'POST',
      success: (res) => {
        //console.log("当前场景设置详情：", res)
        if (res.data.status != 0) {
          if (scene == 4 && res.data.isupload == 1 && this.data.old_scene != -4) {
            return false;
          }
          if (scene == 4) {
            this.setData({
              old_scene: -4
            })
          }
          this.setData({
            slider: false,
          })
          var arr = [];
          var testarr = [];
          ////console.log("开始发送指令：")
          var data = res.data;
          // 获取每路三组数据   包括数据：周，组开时，组开分，组关时，组关分  十六进制传送 
          var num = 1;
          for (var i = 1; i <= 7; i++) {

            switch (i) {
              case 1: var w = "w_1"; break;
              case 2: var w = "w_2"; break;
              case 3: var w = "w_3"; break;
              case 4: var w = "w_4"; break;
              case 5: var w = "w_5"; break;
              case 6: var w = "w_6"; break;
              case 7: var w = "w_7"; break;
            }

            for (var j = 1; j <= 3; j++) {
              switch (j) {
                case 1: var ro_nu = "a"; break;
                case 2: var ro_nu = "b"; break;
                case 3: var ro_nu = "c"; break;
              }
              var str_command = "";
              var test = " ";
              test += 162 + " ";
              test += j + " ";
              test += i + " ";
              str_command += String.fromCharCode(162);
              str_command += String.fromCharCode(j);
              str_command += String.fromCharCode(i);

              for (var n = 1; n <= 3; n++) {
                switch (n) {
                  case 1: var group = "group_1"; break;
                  case 2: var group = "group_2"; break;
                  case 3: var group = "group_3"; break;
                }

                if (data[w][ro_nu][group]['on_time'] != "") {

                  var on_time_h = comjs.trans(comjs.split2(data[w][ro_nu][group].on_time));
                  str_command += String.fromCharCode(on_time_h);
                  test += on_time_h + " ";
                  var on_time_m = comjs.trans(comjs.split1(data[w][ro_nu][group].on_time));
                  str_command += String.fromCharCode(on_time_m);
                  test += on_time_m + " ";

                  var off_time_h = comjs.trans(comjs.split2(data[w][ro_nu][group].off_time));
                  str_command += String.fromCharCode(off_time_h);
                  test += off_time_h + " ";

                  var off_time_m = comjs.trans(comjs.split1(data[w][ro_nu][group].off_time));
                  str_command += String.fromCharCode(off_time_m);
                  test += off_time_m + " ";

                } else {
                  var on_time_h = comjs.trans(comjs.split2("00:00"));
                  str_command += String.fromCharCode(on_time_h);
                  test += on_time_h + " ";

                  var on_time_m = comjs.trans(comjs.split1("00:00"));
                  str_command += String.fromCharCode(on_time_m);
                  test += on_time_m + " ";

                  var off_time_h = comjs.trans(comjs.split2("00:00"));
                  str_command += String.fromCharCode(off_time_h);
                  test += off_time_h + " ";

                  var off_time_m = comjs.trans(comjs.split1("00:00"));
                  str_command += String.fromCharCode(off_time_m);
                  test += off_time_m + " ";

                }
              }
              str_command += String.fromCharCode(163);
              test += "校验位 ";

              str_command += String.fromCharCode(13);
              test += 13 + " ";

              // ////console.log("第几条数据：", num)
              // //console.log("该路数据内容：", data[w][ro_nu])
              // //console.log(num+"该数据内容：", test)
              var str_command = comjs.base64_encode(str_command);
              var str_send = "sendhex:" + this.data.device_id + "," + str_command;
              arr.push(str_send);
              testarr.push(test)
              num++
            }
          }
          var that = this;
          var unit = 100 / 21;
          for (var i = 1; i <= 21; i++) {
            (function (i) {
              setTimeout(() => {
                ////console.log(i)
                console.log("该数据内容", testarr[i-1])
                that.sendSocketMessage(arr[i - 1])
                var width = unit * i;
                // ////console.log("宽度：", width)
                that.setData({
                  spliderwidth: width
                })
              }, 300 * i)
            })(i)
          }
          setTimeout(() => {
            ////console.log("发送封装指令：")
            var str_command = comjs.base64_encode(String.fromCharCode(162) + "" + String.fromCharCode(160) + "" + String.fromCharCode(176) + String.fromCharCode(13));
            var str_send = "sendhex:" + this.data.device_id + "," + str_command;
            that.sendSocketMessage(str_send)

            var date = Date.parse(new Date()) + 3000;
            that.setData({
              endtime: date
            })
            that.monitor();
          }, 305 * i)
        }
      }
    })

  },

  // 更改当前设备场景模式
  changescene: function () {

    wx.request({
      url: 'https://zj.yhqq.top/index.php?s=/admin/xcxapi/saveScene',
      data: {
        uid: this.data.logininfo.uid,
        token: this.data.logininfo.token,
        device_id: this.data.device_id,
        scene: this.data.tem_scene
      },
      header: {
        "content-type": "application/x-www-form-urlencoded"
      },
      method: 'POST',
      success: function (res) {
        ////console.log(res)
      }
    })
    this.sceneStatus(this.data.old_scene);
  },

  // 检测发送21条有无返回
  monitor: function () {
    var that = this;
    ////console.log("调用监测")
    var time = Date.parse(new Date());
    if (time >= that.data.endtime) {
      if (that.data.isres == false) {
        ////console.log("设置超时,直接隐掉")
        wx.showToast({
          title: '设置失败',
          icon: "none",
          duration: 1000,
          complete: function () {
            setTimeout(() => {
              that.setData({
                slider: true
              })
            }, 2000)
          }
        })
      }
    } else {
      if (that.data.isres == false) {
        setTimeout(() => {
          that.monitor();
        }, 500)
      }
    }

  },

  sceneStatus: function (scene) {
    switch (scene) {
      case 1: var scene_pic = "scene_home_pic"; var scene_pic_url = "/images/scene_home_off.png"; var model = "home_v"; var value = -1; var text = "home_text_color"; var text_color = "D2D2D2"; break;
      case 2: var scene_pic = "scene_class_pic"; var scene_pic_url = "/images/scene_class_off.png"; var model = "class_v"; var value = -2; var text = "class_text_color"; var text_color = "D2D2D2"; break;
      case 3: var scene_pic = "scene_com_pic"; var scene_pic_url = "/images/scene_com_off.png"; var model = "com_v"; var value = -3; var text = "com_text_color"; var text_color = "D2D2D2"; break;
      case 4: var scene_pic = "scene_diy_pic"; var scene_pic_url = "/images/scene_diy_off.png"; var model = "diy_v"; var value = -4; var text = "diy_text_color"; var text_color = "D2D2D2"; break;
      case -1: var scene_pic = "scene_home_pic"; var scene_pic_url = "/images/scene_home.png"; var model = "home_v"; var value = 1; var text = "home_text_color"; var text_color = "76B161"; break;
      case -2: var scene_pic = "scene_class_pic"; var scene_pic_url = "/images/scene_class.png"; var model = "class_v"; var value = 2; var text = "class_text_color"; var text_color = "76B161"; break;
      case -3: var scene_pic = "scene_com_pic"; var scene_pic_url = "/images/scene_com.png"; var model = "com_v"; var value = 3; text = "com_text_color"; var text_color = "76B161"; break;
      case -4: var scene_pic = "scene_diy_pic"; var scene_pic_url = "/images/scene_diy.png"; var model = "diy_v"; var value = 4; var text = "diy_text_color"; var text_color = "76B161"; break;
    };

    this.setData({
      home_v: -1,
      class_v: -2,
      com_v: -3,
      diy_v: -4,
      home_text_color: "D2D2D2",
      class_text_color: "D2D2D2",
      com_text_color: "D2D2D2",
      diy_text_color: "D2D2D2",
      scene_home_pic: "/images/scene_home_off.png",
      scene_class_pic: "/images/scene_class_off.png",
      scene_com_pic: "/images/scene_com_off.png",
      scene_diy_pic: "/images/scene_diy_off.png",
      [scene_pic]: [scene_pic_url],
      [model]: value,
      [text]: text_color
    })
  },

  qa: function () {
    // //console.log("fdsfd")
    wx.navigateTo({
      url: '/pages/inabout/inabout',
    })
  },

  onUnload: function () {
    //console.log("页面销毁")
    this.clear(1)
  },
  
  clear:function(i){
    //console.log("开始清除")
    setTimeout(() => {
      clearTimeout(onlinemonitor)
      clearTimeout(looponlinemonitor)
      clearTimeout(warn1)
      clearTimeout(warn2)
      if (i<6) {
        //console.log(i)
        ++i;
        this.clear(i);
      }
      //console.log("执行清除")
    }, 500)
  },

  onHide: function () {
    //console.log("页面隐藏")
    this.clear(1)
  },

  getbg:function(){
    var that = this;
    wx.request({
      url: 'https://zj.yhqq.top/index.php?s=/admin/xcxapi/getBg',
      method:"POST",
      header:{
        "Content-Type":"application/x-www-form-urlencoded"
      },
      data:{
        uid: this.data.logininfo.uid,
        token: this.data.logininfo.token,
      },
      success: function(res){
        //console.log("获取到的图片名",res)
        if(res.data.status == 1){
          that.setData({
            bgurl:res.data.filename
          })
        }
      }
    })
  }
})