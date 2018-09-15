<?php if (!defined('THINK_PATH')) exit();?><!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <title><?php echo ($meta_title); ?>|OneThink管理平台</title>
    <link href="/Public/favicon.ico" type="image/x-icon" rel="shortcut icon">
    <link rel="stylesheet" type="text/css" href="/Public/Admin/css/base.css" media="all">
    <link rel="stylesheet" type="text/css" href="/Public/Admin/css/common.css" media="all">
    <link rel="stylesheet" type="text/css" href="/Public/Admin/css/module.css">
    <link rel="stylesheet" type="text/css" href="/Public/Admin/css/style.css" media="all">
    <link rel="stylesheet" type="text/css" href="/Public/Admin/css/<?php echo (C("COLOR_STYLE")); ?>.css" media="all">
     <!--[if lt IE 9]>
    <script type="text/javascript" src="/Public/static/jquery-1.10.2.min.js"></script>
    <![endif]--><!--[if gte IE 9]><!-->
    <script type="text/javascript" src="/Public/static/jquery-2.0.3.min.js"></script>
    <script type="text/javascript" src="/Public/Admin/js/jquery.mousewheel.js"></script>
    <!--<![endif]-->
    
</head>
<body>
    <!-- 头部 -->
    <div class="header">
        <!-- Logo -->
        <span class="logo"></span>
        <!-- /Logo -->

        <!-- 主导航 -->
        <ul class="main-nav">
            <?php if(is_array($__MENU__["main"])): $i = 0; $__LIST__ = $__MENU__["main"];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$menu): $mod = ($i % 2 );++$i;?><li class="<?php echo ((isset($menu["class"]) && ($menu["class"] !== ""))?($menu["class"]):''); ?>"><a href="<?php echo (u($menu["url"])); ?>"><?php echo ($menu["title"]); ?></a></li><?php endforeach; endif; else: echo "" ;endif; ?>
        </ul>
        <!-- /主导航 -->

        <!-- 用户栏 -->
        <div class="user-bar">
            <a href="javascript:;" class="user-entrance"><i class="icon-user"></i></a>
            <ul class="nav-list user-menu hidden">
                <li class="manager">你好，<em title="<?php echo session('user_auth.username');?>"><?php echo session('user_auth.username');?></em></li>
                <li><a href="<?php echo U('User/updatePassword');?>">修改密码</a></li>
                <li><a href="<?php echo U('User/updateNickname');?>">修改昵称</a></li>
                <li><a href="<?php echo U('Public/logout');?>">退出</a></li>
            </ul>
        </div>
    </div>
    <!-- /头部 -->

    <!-- 边栏 -->
    <div class="sidebar">
        <!-- 子导航 -->
        
            <div id="subnav" class="subnav">
                <?php if(!empty($_extra_menu)): ?>
                    <?php echo extra_menu($_extra_menu,$__MENU__); endif; ?>
                <?php if(is_array($__MENU__["child"])): $i = 0; $__LIST__ = $__MENU__["child"];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$sub_menu): $mod = ($i % 2 );++$i;?><!-- 子导航 -->
                    <?php if(!empty($sub_menu)): if(!empty($key)): ?><h3><i class="icon icon-unfold"></i><?php echo ($key); ?></h3><?php endif; ?>
                        <ul class="side-sub-menu">
                            <?php if(is_array($sub_menu)): $i = 0; $__LIST__ = $sub_menu;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$menu): $mod = ($i % 2 );++$i;?><li>
                                    <a class="item" href="<?php echo (u($menu["url"])); ?>"><?php echo ($menu["title"]); ?></a>
                                </li><?php endforeach; endif; else: echo "" ;endif; ?>
                        </ul><?php endif; ?>
                    <!-- /子导航 --><?php endforeach; endif; else: echo "" ;endif; ?>
            </div>
        
        <!-- /子导航 -->
    </div>
    <!-- /边栏 -->

    <!-- 内容区 -->
    <div id="main-content">
        <div id="top-alert" class="fixed alert alert-error" style="display: none;">
            <button class="close fixed" style="margin-top: 4px;">&times;</button>
            <div class="alert-content">这是内容</div>
        </div>
        <div id="main" class="main">
            
            <!-- nav -->
            <?php if(!empty($_show_nav)): ?><div class="breadcrumb">
                <span>您的位置:</span>
                <?php $i = '1'; ?>
                <?php if(is_array($_nav)): foreach($_nav as $k=>$v): if($i == count($_nav)): ?><span><?php echo ($v); ?></span>
                    <?php else: ?>
                    <span><a href="<?php echo ($k); ?>"><?php echo ($v); ?></a>&gt;</span><?php endif; ?>
                    <?php $i = $i+1; endforeach; endif; ?>
            </div><?php endif; ?>
            <!-- nav -->
            

            
    <div class="devicelists_box">
    	<div class="diymodel"></div>
        <div class="devicelists">
            <h3>设备列表</h3>
            <div class="search">
                <div>
                    <input type="text" name="device_name" id="like">
                </div>
                <p id="device_search">搜索</p>
            </div>
            <div class="list">
                <ul class="thead">
                    <li>设备ID号</li>
                    <li>设备绑定者</li>
                    <li>操作</li>
                </ul>
                <div class="list_box">
                </div>
            </div>
            <div class="dpage">
            </div>
        </div>
    </div>
    <!-- 标题栏 -->
    <div class="main-title">
        <h2>用户列表</h2>
    </div>
    <div class="cf">
        <div class="fl">
        </div>
        <!-- 高级搜索 -->
        <div class="search-form fr cf">
            <div class="sleft">
                <input type="text" name="nickname" class="search-input" value="<?php echo I('nickname');?>" placeholder="请输入用户昵称">
                <a class="sch-btn" href="javascript:;" id="search" url="<?php echo U('index');?>"><i class="btn-search"></i></a>
            </div>
        </div>
    </div>
    <!-- 数据列表 -->
    <div class="data-table table-striped">
        <table class="">
            <thead>
                <tr>
                    <th class="row-selected row-selected">
                        <!-- <input class="check-all" type="checkbox" /> -->
                    </th>
                    <th class="">UID</th>
                    <th class="">昵称</th>
                    <th class="">头像</th>
                    <th class="">省份</th>
                    <th class="">城市</th>
                    <th class="">性别</th>
                    <th class="">注册时间</th>
                    <th class="">操作</th>
                </tr>
            </thead>
            <tbody>
                <?php if(!empty($_list)): if(is_array($_list)): $i = 0; $__LIST__ = $_list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><tr>
                            <td>
                                <!-- <input class="ids" type="checkbox" name="id[]" value="<?php echo ($vo["uid"]); ?>" /> -->
                            </td>
                            <td><?php echo ($vo["uid"]); ?> </td>
                            <td><?php echo ($vo["nickname"]); ?></td>
                            <td><img style="width: 35px;height: 35px;border-radius: 5px" src="<?php echo ($vo["avatarurl"]); ?>"></td>
                            <td><?php echo ($vo["province"]); ?></td>
                            <td><span><?php echo ($vo["city"]); ?></span></td>
                            <td><span><?php if(($vo["gender"]) == "1"): ?>男<?php else: ?>女<?php endif; ?></span></td>
                            <td><?php echo (date( "Y-m-d H:i:s",$vo["create_time"])); ?></td>
                            <td>
                                <a href="/index.php?s=/Admin/User/deleteUser/uid/<?php echo ($vo['uid']); ?>" class="confirm ajax-get">删除</a>
                                <a href="javascript:;" data-uid="<?php echo ($vo['uid']); ?>" onclick="adddevice(event)">添加设备</a>
                            </td>
                        </tr><?php endforeach; endif; else: echo "" ;endif; ?>
                    <?php else: ?>
                    <td colspan="9" class="text-center"> aOh! 暂时还没有内容! </td><?php endif; ?>
            </tbody>
        </table>
    </div>
    <div class="page">
        <?php echo ($_page); ?>
    </div>

        </div>
        <div class="cont-ft">
            <div class="copyright">
                <!-- <div class="fl">感谢使用<a href="http://www.onethink.cn" target="_blank">OneThink</a>管理平台</div>
                <div class="fr">V<?php echo (ONETHINK_VERSION); ?></div> -->
            </div>
        </div>
    </div>
    <!-- /内容区 -->
    <script type="text/javascript">
    (function(){
        var ThinkPHP = window.Think = {
            "ROOT"   : "", //当前网站地址
            "APP"    : "/index.php?s=", //当前项目地址
            "PUBLIC" : "/Public", //项目公共目录地址
            "DEEP"   : "<?php echo C('URL_PATHINFO_DEPR');?>", //PATHINFO分割符
            "MODEL"  : ["<?php echo C('URL_MODEL');?>", "<?php echo C('URL_CASE_INSENSITIVE');?>", "<?php echo C('URL_HTML_SUFFIX');?>"],
            "VAR"    : ["<?php echo C('VAR_MODULE');?>", "<?php echo C('VAR_CONTROLLER');?>", "<?php echo C('VAR_ACTION');?>"]
        }
    })();
    </script>
    <script type="text/javascript" src="/Public/static/think.js"></script>
    <script type="text/javascript" src="/Public/Admin/js/common.js"></script>
    <script type="text/javascript">
        +function(){
            var $window = $(window), $subnav = $("#subnav"), url;
            $window.resize(function(){
                $("#main").css("min-height", $window.height() - 130);
            }).resize();

            /* 左边菜单高亮 */
            url = window.location.pathname + window.location.search;
            url = url.replace(/(\/(p)\/\d+)|(&p=\d+)|(\/(id)\/\d+)|(&id=\d+)|(\/(group)\/\d+)|(&group=\d+)/, "");
            $subnav.find("a[href='" + url + "']").parent().addClass("current");

            /* 左边菜单显示收起 */
            $("#subnav").on("click", "h3", function(){
                var $this = $(this);
                $this.find(".icon").toggleClass("icon-fold");
                $this.next().slideToggle("fast").siblings(".side-sub-menu:visible").
                      prev("h3").find("i").addClass("icon-fold").end().end().hide();
            });

            $("#subnav h3 a").click(function(e){e.stopPropagation()});

            /* 头部管理员菜单 */
            $(".user-bar").mouseenter(function(){
                var userMenu = $(this).children(".user-menu ");
                userMenu.removeClass("hidden");
                clearTimeout(userMenu.data("timeout"));
            }).mouseleave(function(){
                var userMenu = $(this).children(".user-menu");
                userMenu.data("timeout") && clearTimeout(userMenu.data("timeout"));
                userMenu.data("timeout", setTimeout(function(){userMenu.addClass("hidden")}, 100));
            });

	        /* 表单获取焦点变色 */
	        $("form").on("focus", "input", function(){
		        $(this).addClass('focus');
	        }).on("blur","input",function(){
				        $(this).removeClass('focus');
			        });
		    $("form").on("focus", "textarea", function(){
			    $(this).closest('label').addClass('focus');
		    }).on("blur","textarea",function(){
			    $(this).closest('label').removeClass('focus');
		    });

            // 导航栏超出窗口高度后的模拟滚动条
            var sHeight = $(".sidebar").height();
            var subHeight  = $(".subnav").height();
            var diff = subHeight - sHeight; //250
            var sub = $(".subnav");
            if(diff > 0){
                $(window).mousewheel(function(event, delta){
                    if(delta>0){
                        if(parseInt(sub.css('marginTop'))>-10){
                            sub.css('marginTop','0px');
                        }else{
                            sub.css('marginTop','+='+10);
                        }
                    }else{
                        if(parseInt(sub.css('marginTop'))<'-'+(diff-10)){
                            sub.css('marginTop','-'+(diff-10));
                        }else{
                            sub.css('marginTop','-='+10);
                        }
                    }
                });
            }
        }();
    </script>
    
    <script src="/Public/static/thinkbox/jquery.thinkbox.js"></script>
    <script type="text/javascript">
    //搜索功能
    var data;
    var i = 0;
    var length;
    var pages;
    var limit = 6;
    var uid;
    var device_id;
    var like = "";
    $("#search").click(function() {
        var url = $(this).attr('url');
        var query = $('.search-form').find('input').serialize();
        query = query.replace(/(&|^)(\w*?\d*?\-*?_*?)*?=?((?=&)|(?=$))/g, '');
        query = query.replace(/^&/g, '');
        if (url.indexOf('?') > 0) {
            url += '&' + query;
        } else {
            url += '?' + query;
        }
        window.location.href = url;
    });
    //回车搜索
    $(".search-input").keyup(function(e) {
        if (e.keyCode === 13) {
            $("#search").click();
            return false;
        }
    });
    //导航高亮
    highlight_subnav('<?php echo U('
        User / index ');?>');

    /**
     * 获取设备列表
     * @Author   孙乔雨
     * @DateTime 2018-04-27
     * @return   {[type]}   [description]
     */
    function adddevice(e) {
        var that = this;
        console.log(e)
        if (e!=undefined) {
        	that.uid = e.currentTarget.dataset.uid;
        }
        $(".devicelists_box").show();
        $.post('/index.php?s=/Admin/User/devicelists', "like=" + that.like, function(res) {
            that.data = JSON.parse(res);
            if (that.data == null) {
                var children = $(".list_box").children();
                if (children.length > 0) {
                    for (var j = 0; j < children.length; j++) {
                        children[j].remove();
                    }
                }
                var children = $(".dpage").children();
                if (children.length > 0) {
                    for (var j = 0; j < children.length; j++) {
                        children[j].remove();
                    }
                }
                $(".list_box").append('<p style="width:100%;height:45px;line-height:45px;text-align:center;margin-top:120px;color:#515151">暂无数据</p>');
                return false;
            }
            that.length = that.data.length;
            that.pages = Math.ceil(that.data.length / that.limit);
            console.log("设备列表：", that.data)
            console.log("总个数：", that.length)
            console.log("总页数：", that.pages)
            that.i = 0;
            showlist();



        });

    }

    /**
     * 显示设备列表
     * @Author   孙乔雨
     * @DateTime 2018-04-27
     * @return   {[type]}   [description]
     */
    function showlist() {
        var that = this;
        var children = $(".list_box").children();
        if (children.length > 0) {
            for (var j = 0; j < children.length; j++) {
                children[j].remove();
            }
        }

        console.log("第几页：", that.i)
        console.log("总页数：", that.pages)
        // 开始的位置
        var start = that.i * limit;
        console.log("开始的位置：",start);
        // 结束的位置
        if (that.limit > (that.length-start)) {
            var end = that.length;
        } else {
            var end = start+that.limit;
        }

        console.log("结束的位置：",end-1)
        for (var n = start; n < end; n++) {
            console.log(n)
            $(".list_box").append('<ul class="tbody"><li>' + that.data[n]['device_id'] + '</li><li>' + that.data[n]['nickname'] + '</li><li><span class="choose" id='+that.data[n]['device_id'] +'>选择</span></li></ul>');
        }
        showpage();
    }

    /**
     * 显示分页信息
     * @Author   孙乔雨
     * @DateTime 2018-04-27
     * @return   {[type]}   [description]
     */
    function showpage() {

        var that = this;
        var children = $(".dpage").children();
        if (children.length > 0) {
            for (var j = 0; j < children.length; j++) {
                children[j].remove();
            }
        }
        var nowpage = that.i;
        $(".dpage").append("<p onclick='prev()'>上一页</p><p style='background:#fff;width:100px;'>共"+that.length+"条</p><p style='background:#fff;width:100px;'>第" + (++nowpage) + "页</p><p style='background:#fff;width:100px;'>共"+that.pages+"页</p><p onclick='next()'>下一页</p>");
    }

    function prev() {
        var that = this;
        if (that.i > 0) {
            --that.i
        }
        showlist()
    }

    function next() {
        var that = this;
        if (that.i < that.pages) {
            ++that.i

        }
        if (that.i > that.pages - 1) {
            return false;
        }
        showlist()

        console.log("下一页")
    }

    $(".devicelists").click(function(e) {
        $(".devicelists_box").show();
        e.stopPropagation()
    })

    $(".devicelists_box").click(function(e) {
        $(".devicelists_box").hide();
    })

    $("#device_search").click(function() {
        like = $("#like").val();
        adddevice()

    })

    $(".list_box").on("click",".choose",function(e) {
    	device_id = e.currentTarget.id;
    	console.log(device_id)
    	console.log(uid)
    	$.post("/index.php?s=/Admin/User/addDevice","device_id= "+device_id+"&uid="+uid,function(res) {
    		console.log(res)
    		var res = JSON.parse(res);
    		$(".diymodel").show(100);
            $(".diymodel").html(res.msg);
            setTimeout(function() {
                $(".diymodel").hide(100);
            }, 2000)
    	})
    })
    </script>

</body>
</html>