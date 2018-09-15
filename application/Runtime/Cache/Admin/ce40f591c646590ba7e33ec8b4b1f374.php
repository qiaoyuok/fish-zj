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
            

            
    <!-- 标题栏 -->
    <div class="main-title">
        <h2>模式时间设置</h2>
    </div>
    <div class="diymodel"></div>
    <div class="scene_box">
        <div class="model_menu">
            <ul>
                <li id="home" data-scene="home">家庭模式</li>
                <li id="clas" data-scene="clas">办公模式</li>
                <li id="com" data-scene="com">公共场所模式</li>
            </ul>
        </div>
        <div class="scene">
            <div class="item" id="home_box">
                <div class="detail">
                    <h4>星期一</h4>
                    <div class="road_group">
                        <div class="road">
                            <p>植物补光</p>
                            <p>植物灌溉</p>
                            <p>鱼缸补光</p>
                        </div>
                        <div class="group">
                            <?php if(is_array($defaultset[0]['w_1'])): $r = 0; $__LIST__ = $defaultset[0]['w_1'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vos): $mod = ($r % 2 );++$r;?><div class="group_items">
                                    <?php if(is_array($vos)): $i = 0; $__LIST__ = $vos;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><div class="group_item">
                                            <p>
                                                <?php if(!empty($vo["off_time"])): ?><input type="text" class="time" id="w_1_<?php echo ($r); ?>_<?php echo ($i); ?>_on" name="w_1_<?php echo ($r); ?>_<?php echo ($i); ?>_on" readonly="readonly" value="<?php echo ($vo["on_time"]); ?>" /><?php endif; ?>
                                            </p>
                                            <p>-</p>
                                            <p>
                                                <?php if(!empty($vo["off_time"])): ?><input type="text" class="time" id="w_1_<?php echo ($r); ?>_<?php echo ($i); ?>_of" name="w_1_<?php echo ($r); ?>_<?php echo ($i); ?>_of" readonly="readonly" value="<?php echo ($vo["off_time"]); ?>" /><?php endif; ?>
                                            </p>
                                        </div><?php endforeach; endif; else: echo "" ;endif; ?>
                                </div><?php endforeach; endif; else: echo "" ;endif; ?>
                        </div>
                    </div>
                    <h4>星期二</h4>
                    <div class="road_group">
                        <div class="road">
                            <p>植物补光</p>
                            <p>植物灌溉</p>
                            <p>鱼缸补光</p>
                        </div>
                        <div class="group">
                            <?php if(is_array($defaultset[0]['w_2'])): $r = 0; $__LIST__ = $defaultset[0]['w_2'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vos): $mod = ($r % 2 );++$r;?><div class="group_items">
                                    <?php if(is_array($vos)): $i = 0; $__LIST__ = $vos;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><div class="group_item">
                                            <p>
                                                <?php if(!empty($vo["off_time"])): ?><input type="text" class="time" id="w_2_<?php echo ($r); ?>_<?php echo ($i); ?>_on" name="w_2_<?php echo ($r); ?>_<?php echo ($i); ?>_on" readonly="readonly" value="<?php echo ($vo["on_time"]); ?>" /><?php endif; ?>
                                            </p>
                                            <p>-</p>
                                            <p>
                                                <?php if(!empty($vo["off_time"])): ?><input type="text" class="time" id="w_2_<?php echo ($r); ?>_<?php echo ($i); ?>_of" name="w_2_<?php echo ($r); ?>_<?php echo ($i); ?>_of" readonly="readonly" value="<?php echo ($vo["off_time"]); ?>" /><?php endif; ?>
                                            </p>
                                        </div><?php endforeach; endif; else: echo "" ;endif; ?>
                                </div><?php endforeach; endif; else: echo "" ;endif; ?>
                        </div>
                    </div>
                    <h4>星期三</h4>
                    <div class="road_group">
                        <div class="road">
                            <p>植物补光</p>
                            <p>植物灌溉</p>
                            <p>鱼缸补光</p>
                        </div>
                        <div class="group">
                            <?php if(is_array($defaultset[0]['w_3'])): $r = 0; $__LIST__ = $defaultset[0]['w_3'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vos): $mod = ($r % 2 );++$r;?><div class="group_items">
                                    <?php if(is_array($vos)): $i = 0; $__LIST__ = $vos;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><div class="group_item">
                                            <p>
                                                <?php if(!empty($vo["off_time"])): ?><input type="text" class="time" id="w_3_<?php echo ($r); ?>_<?php echo ($i); ?>_on" name="w_3_<?php echo ($r); ?>_<?php echo ($i); ?>_on" readonly="readonly" value="<?php echo ($vo["on_time"]); ?>" /><?php endif; ?>
                                            </p>
                                            <p>-</p>
                                            <p>
                                                <?php if(!empty($vo["off_time"])): ?><input type="text" class="time" id="w_3_<?php echo ($r); ?>_<?php echo ($i); ?>_of" name="w_3_<?php echo ($r); ?>_<?php echo ($i); ?>_of" readonly="readonly" value="<?php echo ($vo["off_time"]); ?>" /><?php endif; ?>
                                            </p>
                                        </div><?php endforeach; endif; else: echo "" ;endif; ?>
                                </div><?php endforeach; endif; else: echo "" ;endif; ?>
                        </div>
                    </div>
                    <h4>星期四</h4>
                    <div class="road_group">
                        <div class="road">
                            <p>植物补光</p>
                            <p>植物灌溉</p>
                            <p>鱼缸补光</p>
                        </div>
                        <div class="group">
                            <?php if(is_array($defaultset[0]['w_4'])): $r = 0; $__LIST__ = $defaultset[0]['w_4'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vos): $mod = ($r % 2 );++$r;?><div class="group_items">
                                    <?php if(is_array($vos)): $i = 0; $__LIST__ = $vos;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><div class="group_item">
                                            <p>
                                                <?php if(!empty($vo["off_time"])): ?><input type="text" class="time" id="w_4_<?php echo ($r); ?>_<?php echo ($i); ?>_on" name="w_4_<?php echo ($r); ?>_<?php echo ($i); ?>_on" readonly="readonly" value="<?php echo ($vo["on_time"]); ?>" /><?php endif; ?>
                                            </p>
                                            <p>-</p>
                                            <p>
                                                <?php if(!empty($vo["off_time"])): ?><input type="text" class="time" id="w_4_<?php echo ($r); ?>_<?php echo ($i); ?>_of" name="w_4_<?php echo ($r); ?>_<?php echo ($i); ?>_of" readonly="readonly" value="<?php echo ($vo["off_time"]); ?>" /><?php endif; ?>
                                            </p>
                                        </div><?php endforeach; endif; else: echo "" ;endif; ?>
                                </div><?php endforeach; endif; else: echo "" ;endif; ?>
                        </div>
                    </div>
                    <h4>星期五</h4>
                    <div class="road_group">
                        <div class="road">
                            <p>植物补光</p>
                            <p>植物灌溉</p>
                            <p>鱼缸补光</p>
                        </div>
                        <div class="group">
                            <?php if(is_array($defaultset[0]['w_5'])): $r = 0; $__LIST__ = $defaultset[0]['w_5'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vos): $mod = ($r % 2 );++$r;?><div class="group_items">
                                    <?php if(is_array($vos)): $i = 0; $__LIST__ = $vos;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><div class="group_item">
                                            <p>
                                                <?php if(!empty($vo["off_time"])): ?><input type="text" class="time" id="w_5_<?php echo ($r); ?>_<?php echo ($i); ?>_on" name="w_5_<?php echo ($r); ?>_<?php echo ($i); ?>_on" readonly="readonly" value="<?php echo ($vo["on_time"]); ?>" /><?php endif; ?>
                                            </p>
                                            <p>-</p>
                                            <p>
                                                <?php if(!empty($vo["off_time"])): ?><input type="text" class="time" id="w_5_<?php echo ($r); ?>_<?php echo ($i); ?>_of" name="w_5_<?php echo ($r); ?>_<?php echo ($i); ?>_of" readonly="readonly" value="<?php echo ($vo["off_time"]); ?>" /><?php endif; ?>
                                            </p>
                                        </div><?php endforeach; endif; else: echo "" ;endif; ?>
                                </div><?php endforeach; endif; else: echo "" ;endif; ?>
                        </div>
                    </div>
                    <h4>星期六</h4>
                    <div class="road_group">
                        <div class="road">
                            <p>植物补光</p>
                            <p>植物灌溉</p>
                            <p>鱼缸补光</p>
                        </div>
                        <div class="group">
                            <?php if(is_array($defaultset[0]['w_6'])): $r = 0; $__LIST__ = $defaultset[0]['w_6'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vos): $mod = ($r % 2 );++$r;?><div class="group_items">
                                    <?php if(is_array($vos)): $i = 0; $__LIST__ = $vos;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><div class="group_item">
                                            <p>
                                                <?php if(!empty($vo["off_time"])): ?><input type="text" class="time" id="w_6_<?php echo ($r); ?>_<?php echo ($i); ?>_on" name="w_6_<?php echo ($r); ?>_<?php echo ($i); ?>_on" readonly="readonly" value="<?php echo ($vo["on_time"]); ?>" /><?php endif; ?>
                                            </p>
                                            <p>-</p>
                                            <p>
                                                <?php if(!empty($vo["off_time"])): ?><input type="text" class="time" id="w_6_<?php echo ($r); ?>_<?php echo ($i); ?>_of" name="w_6_<?php echo ($r); ?>_<?php echo ($i); ?>_of" readonly="readonly" value="<?php echo ($vo["off_time"]); ?>" /><?php endif; ?>
                                            </p>
                                        </div><?php endforeach; endif; else: echo "" ;endif; ?>
                                </div><?php endforeach; endif; else: echo "" ;endif; ?>
                        </div>
                    </div>
                    <h4>星期日</h4>
                    <div class="road_group">
                        <div class="road">
                            <p>植物补光</p>
                            <p>植物灌溉</p>
                            <p>鱼缸补光</p>
                        </div>
                        <div class="group">
                            <?php if(is_array($defaultset[0]['w_7'])): $r = 0; $__LIST__ = $defaultset[0]['w_7'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vos): $mod = ($r % 2 );++$r;?><div class="group_items">
                                    <?php if(is_array($vos)): $i = 0; $__LIST__ = $vos;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><div class="group_item">
                                            <p>
                                                <?php if(!empty($vo["off_time"])): ?><input type="text" class="time" id="w_7_<?php echo ($r); ?>_<?php echo ($i); ?>_on" name="w_7_<?php echo ($r); ?>_<?php echo ($i); ?>_on" readonly="readonly" value="<?php echo ($vo["on_time"]); ?>" /><?php endif; ?>
                                            </p>
                                            <p>-</p>
                                            <p>
                                                <?php if(!empty($vo["off_time"])): ?><input type="text" class="time" id="w_7_<?php echo ($r); ?>_<?php echo ($i); ?>_of" name="w_7_<?php echo ($r); ?>_<?php echo ($i); ?>_of" readonly="readonly" value="<?php echo ($vo["off_time"]); ?>" /><?php endif; ?>
                                            </p>
                                        </div><?php endforeach; endif; else: echo "" ;endif; ?>
                                </div><?php endforeach; endif; else: echo "" ;endif; ?>
                        </div>
                    </div>
                </div>
            </div>
            <div class="item" id="clas_box">
                <div class="detail">
                    <h4>星期一</h4>
                    <div class="road_group">
                        <div class="road">
                            <p>植物补光</p>
                            <p>植物灌溉</p>
                            <p>鱼缸补光</p>
                        </div>
                        <div class="group">
                            <?php if(is_array($defaultset[1]['w_1'])): $r = 0; $__LIST__ = $defaultset[1]['w_1'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vos): $mod = ($r % 2 );++$r;?><div class="group_items">
                                    <?php if(is_array($vos)): $i = 0; $__LIST__ = $vos;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><div class="group_item">
                                            <p>
                                                <?php if(!empty($vo["off_time"])): ?><input type="text" class="time" id="w_1_<?php echo ($r); ?>_<?php echo ($i); ?>_on" name="w_1_<?php echo ($r); ?>_<?php echo ($i); ?>_on" readonly="readonly" value="<?php echo ($vo["on_time"]); ?>" /><?php endif; ?>
                                            </p>
                                            <p>-</p>
                                            <p>
                                                <?php if(!empty($vo["off_time"])): ?><input type="text" class="time" id="w_1_<?php echo ($r); ?>_<?php echo ($i); ?>_of" name="w_1_<?php echo ($r); ?>_<?php echo ($i); ?>_of" readonly="readonly" value="<?php echo ($vo["off_time"]); ?>" /><?php endif; ?>
                                            </p>
                                        </div><?php endforeach; endif; else: echo "" ;endif; ?>
                                </div><?php endforeach; endif; else: echo "" ;endif; ?>
                        </div>
                    </div>
                    <h4>星期二</h4>
                    <div class="road_group">
                        <div class="road">
                            <p>植物补光</p>
                            <p>植物灌溉</p>
                            <p>鱼缸补光</p>
                        </div>
                        <div class="group">
                            <?php if(is_array($defaultset[1]['w_2'])): $r = 0; $__LIST__ = $defaultset[1]['w_2'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vos): $mod = ($r % 2 );++$r;?><div class="group_items">
                                    <?php if(is_array($vos)): $i = 0; $__LIST__ = $vos;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><div class="group_item">
                                            <p>
                                                <?php if(!empty($vo["off_time"])): ?><input type="text" class="time" id="w_2_<?php echo ($r); ?>_<?php echo ($i); ?>_on" name="w_2_<?php echo ($r); ?>_<?php echo ($i); ?>_on" readonly="readonly" value="<?php echo ($vo["on_time"]); ?>" /><?php endif; ?>
                                            </p>
                                            <p>-</p>
                                            <p>
                                                <?php if(!empty($vo["off_time"])): ?><input type="text" class="time" id="w_2_<?php echo ($r); ?>_<?php echo ($i); ?>_of" name="w_2_<?php echo ($r); ?>_<?php echo ($i); ?>_of" readonly="readonly" value="<?php echo ($vo["off_time"]); ?>" /><?php endif; ?>
                                            </p>
                                        </div><?php endforeach; endif; else: echo "" ;endif; ?>
                                </div><?php endforeach; endif; else: echo "" ;endif; ?>
                        </div>
                    </div>
                    <h4>星期三</h4>
                    <div class="road_group">
                        <div class="road">
                            <p>植物补光</p>
                            <p>植物灌溉</p>
                            <p>鱼缸补光</p>
                        </div>
                        <div class="group">
                            <?php if(is_array($defaultset[1]['w_3'])): $r = 0; $__LIST__ = $defaultset[1]['w_3'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vos): $mod = ($r % 2 );++$r;?><div class="group_items">
                                    <?php if(is_array($vos)): $i = 0; $__LIST__ = $vos;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><div class="group_item">
                                            <p>
                                                <?php if(!empty($vo["off_time"])): ?><input type="text" class="time" id="w_3_<?php echo ($r); ?>_<?php echo ($i); ?>_on" name="w_3_<?php echo ($r); ?>_<?php echo ($i); ?>_on" readonly="readonly" value="<?php echo ($vo["on_time"]); ?>" /><?php endif; ?>
                                            </p>
                                            <p>-</p>
                                            <p>
                                                <?php if(!empty($vo["off_time"])): ?><input type="text" class="time" id="w_3_<?php echo ($r); ?>_<?php echo ($i); ?>_of" name="w_3_<?php echo ($r); ?>_<?php echo ($i); ?>_of" readonly="readonly" value="<?php echo ($vo["off_time"]); ?>" /><?php endif; ?>
                                            </p>
                                        </div><?php endforeach; endif; else: echo "" ;endif; ?>
                                </div><?php endforeach; endif; else: echo "" ;endif; ?>
                        </div>
                    </div>
                    <h4>星期四</h4>
                    <div class="road_group">
                        <div class="road">
                            <p>植物补光</p>
                            <p>植物灌溉</p>
                            <p>鱼缸补光</p>
                        </div>
                        <div class="group">
                            <?php if(is_array($defaultset[1]['w_4'])): $r = 0; $__LIST__ = $defaultset[1]['w_4'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vos): $mod = ($r % 2 );++$r;?><div class="group_items">
                                    <?php if(is_array($vos)): $i = 0; $__LIST__ = $vos;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><div class="group_item">
                                            <p>
                                                <?php if(!empty($vo["off_time"])): ?><input type="text" class="time" id="w_4_<?php echo ($r); ?>_<?php echo ($i); ?>_on" name="w_4_<?php echo ($r); ?>_<?php echo ($i); ?>_on" readonly="readonly" value="<?php echo ($vo["on_time"]); ?>" /><?php endif; ?>
                                            </p>
                                            <p>-</p>
                                            <p>
                                                <?php if(!empty($vo["off_time"])): ?><input type="text" class="time" id="w_4_<?php echo ($r); ?>_<?php echo ($i); ?>_of" name="w_4_<?php echo ($r); ?>_<?php echo ($i); ?>_of" readonly="readonly" value="<?php echo ($vo["off_time"]); ?>" /><?php endif; ?>
                                            </p>
                                        </div><?php endforeach; endif; else: echo "" ;endif; ?>
                                </div><?php endforeach; endif; else: echo "" ;endif; ?>
                        </div>
                    </div>
                    <h4>星期五</h4>
                    <div class="road_group">
                        <div class="road">
                            <p>植物补光</p>
                            <p>植物灌溉</p>
                            <p>鱼缸补光</p>
                        </div>
                        <div class="group">
                            <?php if(is_array($defaultset[1]['w_5'])): $r = 0; $__LIST__ = $defaultset[1]['w_5'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vos): $mod = ($r % 2 );++$r;?><div class="group_items">
                                    <?php if(is_array($vos)): $i = 0; $__LIST__ = $vos;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><div class="group_item">
                                            <p>
                                                <?php if(!empty($vo["off_time"])): ?><input type="text" class="time" id="w_5_<?php echo ($r); ?>_<?php echo ($i); ?>_on" name="w_5_<?php echo ($r); ?>_<?php echo ($i); ?>_on" readonly="readonly" value="<?php echo ($vo["on_time"]); ?>" /><?php endif; ?>
                                            </p>
                                            <p>-</p>
                                            <p>
                                                <?php if(!empty($vo["off_time"])): ?><input type="text" class="time" id="w_5_<?php echo ($r); ?>_<?php echo ($i); ?>_of" name="w_5_<?php echo ($r); ?>_<?php echo ($i); ?>_of" readonly="readonly" value="<?php echo ($vo["off_time"]); ?>" /><?php endif; ?>
                                            </p>
                                        </div><?php endforeach; endif; else: echo "" ;endif; ?>
                                </div><?php endforeach; endif; else: echo "" ;endif; ?>
                        </div>
                    </div>
                    <h4>星期六</h4>
                    <div class="road_group">
                        <div class="road">
                            <p>植物补光</p>
                            <p>植物灌溉</p>
                            <p>鱼缸补光</p>
                        </div>
                        <div class="group">
                            <?php if(is_array($defaultset[1]['w_6'])): $r = 0; $__LIST__ = $defaultset[1]['w_6'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vos): $mod = ($r % 2 );++$r;?><div class="group_items">
                                    <?php if(is_array($vos)): $i = 0; $__LIST__ = $vos;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><div class="group_item">
                                            <p>
                                                <?php if(!empty($vo["off_time"])): ?><input type="text" class="time" id="w_6_<?php echo ($r); ?>_<?php echo ($i); ?>_on" name="w_6_<?php echo ($r); ?>_<?php echo ($i); ?>_on" readonly="readonly" value="<?php echo ($vo["on_time"]); ?>" /><?php endif; ?>
                                            </p>
                                            <p>-</p>
                                            <p>
                                                <?php if(!empty($vo["off_time"])): ?><input type="text" class="time" id="w_6_<?php echo ($r); ?>_<?php echo ($i); ?>_of" name="w_6_<?php echo ($r); ?>_<?php echo ($i); ?>_of" readonly="readonly" value="<?php echo ($vo["off_time"]); ?>" /><?php endif; ?>
                                            </p>
                                        </div><?php endforeach; endif; else: echo "" ;endif; ?>
                                </div><?php endforeach; endif; else: echo "" ;endif; ?>
                        </div>
                    </div>
                    <h4>星期日</h4>
                    <div class="road_group">
                        <div class="road">
                            <p>植物补光</p>
                            <p>植物灌溉</p>
                            <p>鱼缸补光</p>
                        </div>
                        <div class="group">
                            <?php if(is_array($defaultset[1]['w_7'])): $r = 0; $__LIST__ = $defaultset[1]['w_7'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vos): $mod = ($r % 2 );++$r;?><div class="group_items">
                                    <?php if(is_array($vos)): $i = 0; $__LIST__ = $vos;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><div class="group_item">
                                            <p>
                                                <?php if(!empty($vo["off_time"])): ?><input type="text" class="time" id="w_7_<?php echo ($r); ?>_<?php echo ($i); ?>_on" name="w_7_<?php echo ($r); ?>_<?php echo ($i); ?>_on" readonly="readonly" value="<?php echo ($vo["on_time"]); ?>" /><?php endif; ?>
                                            </p>
                                            <p>-</p>
                                            <p>
                                                <?php if(!empty($vo["off_time"])): ?><input type="text" class="time" id="w_7_<?php echo ($r); ?>_<?php echo ($i); ?>_of" name="w_7_<?php echo ($r); ?>_<?php echo ($i); ?>_of" readonly="readonly" value="<?php echo ($vo["off_time"]); ?>" /><?php endif; ?>
                                            </p>
                                        </div><?php endforeach; endif; else: echo "" ;endif; ?>
                                </div><?php endforeach; endif; else: echo "" ;endif; ?>
                        </div>
                    </div>
                </div>
            </div>
            <div class="item" id="com_box">
                <div class="detail">
                    <h4>星期一</h4>
                    <div class="road_group">
                        <div class="road">
                            <p>植物补光</p>
                            <p>植物灌溉</p>
                            <p>鱼缸补光</p>
                        </div>
                        <div class="group">
                            <?php if(is_array($defaultset[2]['w_1'])): $r = 0; $__LIST__ = $defaultset[2]['w_1'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vos): $mod = ($r % 2 );++$r;?><div class="group_items">
                                    <?php if(is_array($vos)): $i = 0; $__LIST__ = $vos;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><div class="group_item">
                                            <p>
                                                <?php if(!empty($vo["off_time"])): ?><input type="text" class="time" id="w_1_<?php echo ($r); ?>_<?php echo ($i); ?>_on" name="w_1_<?php echo ($r); ?>_<?php echo ($i); ?>_on" readonly="readonly" value="<?php echo ($vo["on_time"]); ?>" /><?php endif; ?>
                                            </p>
                                            <p>-</p>
                                            <p>
                                                <?php if(!empty($vo["off_time"])): ?><input type="text" class="time" id="w_1_<?php echo ($r); ?>_<?php echo ($i); ?>_of" name="w_1_<?php echo ($r); ?>_<?php echo ($i); ?>_of" readonly="readonly" value="<?php echo ($vo["off_time"]); ?>" /><?php endif; ?>
                                            </p>
                                        </div><?php endforeach; endif; else: echo "" ;endif; ?>
                                </div><?php endforeach; endif; else: echo "" ;endif; ?>
                        </div>
                    </div>
                    <h4>星期二</h4>
                    <div class="road_group">
                        <div class="road">
                            <p>植物补光</p>
                            <p>植物灌溉</p>
                            <p>鱼缸补光</p>
                        </div>
                        <div class="group">
                            <?php if(is_array($defaultset[2]['w_2'])): $r = 0; $__LIST__ = $defaultset[2]['w_2'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vos): $mod = ($r % 2 );++$r;?><div class="group_items">
                                    <?php if(is_array($vos)): $i = 0; $__LIST__ = $vos;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><div class="group_item">
                                            <p>
                                                <?php if(!empty($vo["off_time"])): ?><input type="text" class="time" id="w_2_<?php echo ($r); ?>_<?php echo ($i); ?>_on" name="w_2_<?php echo ($r); ?>_<?php echo ($i); ?>_on" readonly="readonly" value="<?php echo ($vo["on_time"]); ?>" /><?php endif; ?>
                                            </p>
                                            <p>-</p>
                                            <p>
                                                <?php if(!empty($vo["off_time"])): ?><input type="text" class="time" id="w_2_<?php echo ($r); ?>_<?php echo ($i); ?>_of" name="w_2_<?php echo ($r); ?>_<?php echo ($i); ?>_of" readonly="readonly" value="<?php echo ($vo["off_time"]); ?>" /><?php endif; ?>
                                            </p>
                                        </div><?php endforeach; endif; else: echo "" ;endif; ?>
                                </div><?php endforeach; endif; else: echo "" ;endif; ?>
                        </div>
                    </div>
                    <h4>星期三</h4>
                    <div class="road_group">
                        <div class="road">
                            <p>植物补光</p>
                            <p>植物灌溉</p>
                            <p>鱼缸补光</p>
                        </div>
                        <div class="group">
                            <?php if(is_array($defaultset[2]['w_3'])): $r = 0; $__LIST__ = $defaultset[2]['w_3'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vos): $mod = ($r % 2 );++$r;?><div class="group_items">
                                    <?php if(is_array($vos)): $i = 0; $__LIST__ = $vos;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><div class="group_item">
                                            <p>
                                                <?php if(!empty($vo["off_time"])): ?><input type="text" class="time" id="w_3_<?php echo ($r); ?>_<?php echo ($i); ?>_on" name="w_3_<?php echo ($r); ?>_<?php echo ($i); ?>_on" readonly="readonly" value="<?php echo ($vo["on_time"]); ?>" /><?php endif; ?>
                                            </p>
                                            <p>-</p>
                                            <p>
                                                <?php if(!empty($vo["off_time"])): ?><input type="text" class="time" id="w_3_<?php echo ($r); ?>_<?php echo ($i); ?>_of" name="w_3_<?php echo ($r); ?>_<?php echo ($i); ?>_of" readonly="readonly" value="<?php echo ($vo["off_time"]); ?>" /><?php endif; ?>
                                            </p>
                                        </div><?php endforeach; endif; else: echo "" ;endif; ?>
                                </div><?php endforeach; endif; else: echo "" ;endif; ?>
                        </div>
                    </div>
                    <h4>星期四</h4>
                    <div class="road_group">
                        <div class="road">
                            <p>植物补光</p>
                            <p>植物灌溉</p>
                            <p>鱼缸补光</p>
                        </div>
                        <div class="group">
                            <?php if(is_array($defaultset[2]['w_4'])): $r = 0; $__LIST__ = $defaultset[2]['w_4'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vos): $mod = ($r % 2 );++$r;?><div class="group_items">
                                    <?php if(is_array($vos)): $i = 0; $__LIST__ = $vos;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><div class="group_item">
                                            <p>
                                                <?php if(!empty($vo["off_time"])): ?><input type="text" class="time" id="w_4_<?php echo ($r); ?>_<?php echo ($i); ?>_on" name="w_4_<?php echo ($r); ?>_<?php echo ($i); ?>_on" readonly="readonly" value="<?php echo ($vo["on_time"]); ?>" /><?php endif; ?>
                                            </p>
                                            <p>-</p>
                                            <p>
                                                <?php if(!empty($vo["off_time"])): ?><input type="text" class="time" id="w_4_<?php echo ($r); ?>_<?php echo ($i); ?>_of" name="w_4_<?php echo ($r); ?>_<?php echo ($i); ?>_of" readonly="readonly" value="<?php echo ($vo["off_time"]); ?>" /><?php endif; ?>
                                            </p>
                                        </div><?php endforeach; endif; else: echo "" ;endif; ?>
                                </div><?php endforeach; endif; else: echo "" ;endif; ?>
                        </div>
                    </div>
                    <h4>星期五</h4>
                    <div class="road_group">
                        <div class="road">
                            <p>植物补光</p>
                            <p>植物灌溉</p>
                            <p>鱼缸补光</p>
                        </div>
                        <div class="group">
                            <?php if(is_array($defaultset[2]['w_5'])): $r = 0; $__LIST__ = $defaultset[2]['w_5'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vos): $mod = ($r % 2 );++$r;?><div class="group_items">
                                    <?php if(is_array($vos)): $i = 0; $__LIST__ = $vos;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><div class="group_item">
                                            <p>
                                                <?php if(!empty($vo["off_time"])): ?><input type="text" class="time" id="w_5_<?php echo ($r); ?>_<?php echo ($i); ?>_on" name="w_5_<?php echo ($r); ?>_<?php echo ($i); ?>_on" readonly="readonly" value="<?php echo ($vo["on_time"]); ?>" /><?php endif; ?>
                                            </p>
                                            <p>-</p>
                                            <p>
                                                <?php if(!empty($vo["off_time"])): ?><input type="text" class="time" id="w_5_<?php echo ($r); ?>_<?php echo ($i); ?>_of" name="w_5_<?php echo ($r); ?>_<?php echo ($i); ?>_of" readonly="readonly" value="<?php echo ($vo["off_time"]); ?>" /><?php endif; ?>
                                            </p>
                                        </div><?php endforeach; endif; else: echo "" ;endif; ?>
                                </div><?php endforeach; endif; else: echo "" ;endif; ?>
                        </div>
                    </div>
                    <h4>星期六</h4>
                    <div class="road_group">
                        <div class="road">
                            <p>植物补光</p>
                            <p>植物灌溉</p>
                            <p>鱼缸补光</p>
                        </div>
                        <div class="group">
                            <?php if(is_array($defaultset[2]['w_6'])): $r = 0; $__LIST__ = $defaultset[2]['w_6'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vos): $mod = ($r % 2 );++$r;?><div class="group_items">
                                    <?php if(is_array($vos)): $i = 0; $__LIST__ = $vos;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><div class="group_item">
                                            <p>
                                                <?php if(!empty($vo["off_time"])): ?><input type="text" class="time" id="w_6_<?php echo ($r); ?>_<?php echo ($i); ?>_on" name="w_6_<?php echo ($r); ?>_<?php echo ($i); ?>_on" readonly="readonly" value="<?php echo ($vo["on_time"]); ?>" /><?php endif; ?>
                                            </p>
                                            <p>-</p>
                                            <p>
                                                <?php if(!empty($vo["off_time"])): ?><input type="text" class="time" id="w_6_<?php echo ($r); ?>_<?php echo ($i); ?>_of" name="w_6_<?php echo ($r); ?>_<?php echo ($i); ?>_of" readonly="readonly" value="<?php echo ($vo["off_time"]); ?>" /><?php endif; ?>
                                            </p>
                                        </div><?php endforeach; endif; else: echo "" ;endif; ?>
                                </div><?php endforeach; endif; else: echo "" ;endif; ?>
                        </div>
                    </div>
                    <h4>星期日</h4>
                    <div class="road_group">
                        <div class="road">
                            <p>植物补光</p>
                            <p>植物灌溉</p>
                            <p>鱼缸补光</p>
                        </div>
                        <div class="group">
                            <?php if(is_array($defaultset[2]['w_7'])): $r = 0; $__LIST__ = $defaultset[2]['w_7'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vos): $mod = ($r % 2 );++$r;?><div class="group_items">
                                    <?php if(is_array($vos)): $i = 0; $__LIST__ = $vos;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><div class="group_item">
                                            <p>
                                                <?php if(!empty($vo["off_time"])): ?><input type="text" class="time" id="w_7_<?php echo ($r); ?>_<?php echo ($i); ?>_on" name="w_7_<?php echo ($r); ?>_<?php echo ($i); ?>_on" readonly="readonly" value="<?php echo ($vo["on_time"]); ?>" /><?php endif; ?>
                                            </p>
                                            <p>-</p>
                                            <p>
                                                <?php if(!empty($vo["off_time"])): ?><input type="text" class="time" id="w_7_<?php echo ($r); ?>_<?php echo ($i); ?>_of" name="w_7_<?php echo ($r); ?>_<?php echo ($i); ?>_of" readonly="readonly" value="<?php echo ($vo["off_time"]); ?>" /><?php endif; ?>
                                            </p>
                                        </div><?php endforeach; endif; else: echo "" ;endif; ?>
                                </div><?php endforeach; endif; else: echo "" ;endif; ?>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="datetime">
            <div class="time_tip">
                <h4>时</h4>
                <h3>选择时间</h3>
                <h4>分</h4></div>
            <div class="time_items">
                <div class="time_item" id="hscroll">
                    <div class="select">
                        <?php $__FOR_START_23771__=0;$__FOR_END_23771__=24;for($i=$__FOR_START_23771__;$i < $__FOR_END_23771__;$i+=1){ if($i < 10): ?><option id="h0<?php echo ($i); ?>" value="0<?php echo ($i); ?>">0<?php echo ($i); ?></option>
                                <?php else: ?>
                                <option id="h<?php echo ($i); ?>" value="<?php echo ($i); ?>"><?php echo ($i); ?></option><?php endif; } ?>
                    </div>
                </div>
                <div class="time_item" id="mscroll">
                    <div class="select">
                        <?php $__FOR_START_29560__=0;$__FOR_END_29560__=60;for($i=$__FOR_START_29560__;$i < $__FOR_END_29560__;$i+=1){ if($i < 10): ?><option id="m0<?php echo ($i); ?>" value="0<?php echo ($i); ?>">0<?php echo ($i); ?></option>
                                <?php else: ?>
                                <option id="m<?php echo ($i); ?>" value="<?php echo ($i); ?>"><?php echo ($i); ?></option><?php endif; } ?>
                    </div>
                </div>
            </div>
            <div id="confirm">保存</div>
        </div>
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
    //导航高亮
    highlight_subnav('<?php echo U('
        Device / scene ');?>');
    var time;
    var position;
    var arr;
    var scene = '<?php echo isset($_GET["scene"])?I("scene"):"home";?>';
    var home = <?php echo json_encode($defaultset[0]);?>;
    var clas = <?php echo json_encode($defaultset[1]);?>;
    var h;
    var m;
    console.log(clas)
    var com = <?php echo json_encode($defaultset[2]);?>;
    $("#" + scene).attr("class", "active")
    $("#" + scene + "_box").show();

    $(".model_menu ul li").click(function(e) {
        console.log(e)
        $("#home").attr("class", "")
        $("#clas").attr("class", "")
        $("#com").attr("class", "")
        $("#home_box").hide()
        $("#clas_box").hide()
        $("#com_box").hide()

        scene = e.currentTarget.dataset.scene;
        console.log("该现实的模式是：" + scene);
        $("#" + scene).attr("class", "active")
        $("#" + scene + "_box").show()
    })
    $(document).click(function() {
        $(".datetime").hide();
    })

    $(".time").click(function(e) {
        position = e.currentTarget.id;
        $(".time").css("color","#000")
        $("#"+scene+"_box #"+position).css("color","red")

        time = $(this).val();
        console.log("此时的时间是：",time)
        $(".datetime").show();
        split(time)
        e.stopPropagation()
        console.log(time)
        console.log(position)
    })

    $(".datetime").click(function(e) {
        $(".datetime").show();
        e.stopPropagation()
    })

    $("#hscroll .select option").click(function(e) {
        var optionid = e.currentTarget.id;
        h = e.currentTarget.value;
        var hscroll = $("#hscroll .select").children();
        for (var i = hscroll.length - 1; i >= 0; i--) {
            $(hscroll[i]).attr("class", "");
        }
        $("#" + optionid).attr("class", "active");

        // 判断是否符合既定规则
        var compareres = compare();
        console.log("比较的结果：",compareres)
        if (compareres == false) {
            $(".diymodel").show(100);
            $(".diymodel").html("总左至右时间依次递增");
            setTimeout(function() {
                $(".diymodel").hide(100);
            }, 2000)
            return false;
        }else if(compareres == "over"){
            $(".diymodel").show(100);
            $(".diymodel").html("植物灌溉时间在1-3分钟之间");
            setTimeout(function() {
                $(".diymodel").hide(100);
            }, 2000)
            return false;
        }

        arr[0] = h;
        $("#" + scene + "_box #" + position).val(h + ":" + arr[1]);
        var $week = getweek();
        var $road = getroad();
        var $group = getgroup();
        var $switch = getswitch();
        switch (scene) {
            case "home":
                home[$week][$road][$group][$switch] = h + ":" + arr[1];
                console.log(home);
                break;
            case "clas":
                clas[$week][$road][$group][$switch] = h + ":" + arr[1];
                console.log(clas);
                break;
            case "com":
                com[$week][$road][$group][$switch] = h + ":" + arr[1];
                console.log(com);
                break;
        }
        console.log()
    })

    $("#mscroll .select option").click(function(e) {
        var optionid = e.currentTarget.id;
        m = e.currentTarget.value;
        var hscroll = $("#mscroll .select").children();
        for (var i = hscroll.length - 1; i >= 0; i--) {
            $(hscroll[i]).attr("class", "");
        }
        $("#" + optionid).attr("class", "active")

        // 判断是否符合既定规则
        var compareres = compare();
        console.log("比较的结果：",compareres)

        if (compareres == false) {
            $(".diymodel").show(100);
            $(".diymodel").html("总左至右时间依次递增");
            setTimeout(function() {
                $(".diymodel").hide(100);
            }, 2000)
            return false;
        }else if(compareres == "over"){
            $(".diymodel").show(100);
            $(".diymodel").html("植物灌溉时间在1-3分钟之间");
            setTimeout(function() {
                $(".diymodel").hide(100);
            }, 2000)
            return false;
        }


        arr[1] = m;
        $("#" + scene + "_box #" + position).val(arr[0] + ":" + m);
        var $week = getweek();
        var $road = getroad();
        var $group = getgroup();
        var $switch = getswitch();
        switch (scene) {
            case "home":
                home[$week][$road][$group][$switch] = arr[0] + ":" + m;
                console.log(home);
                break;
            case "clas":
                clas[$week][$road][$group][$switch] = arr[0] + ":" + m;
                console.log(clas);
                break;
            case "com":
                com[$week][$road][$group][$switch] = arr[0] + ":" + m;
                console.log(com);
                break;
        }
    })

    $("#confirm").click(function(event) {

        switch (scene) {
            case "home":
                var data = home;
                break;
            case "clas":
                var data = clas;
                break;
            case "com":
                var data = com;
                break;
        }

        $.post("/index.php?s=/Admin/Device/saveSet", "data=" + JSON.stringify(data), function(res) {
            var res = JSON.parse(res);
            if (res.status == 0) {
                $(".diymodel").show(100);
                $(".diymodel").html(res.msg);
                setTimeout(function() {
                    $(".diymodel").hide(100);
                }, 2000)
            } else {
                $(".diymodel").show(100);
                $(".diymodel").html(res.msg);
                setTimeout(function() {
                    $(".diymodel").hide(100);
                    window.location.href = '/index.php?s=/Admin/Device/scene.html&scene=' + scene;
                }, 2000)
            }
        })
    });

    function getweek() {
        return position.substr(0, 3);
    }

    function getroad() {
        var $r = position.substr(4, 1);
        switch ($r) {
            case "1":
                $r = "a";
                break;
            case "2":
                $r = "b";
                break;
            case "3":
                $r = "c";
                break;
        }
        return $r;
    }

    function getgroup() {
        var $group = position.substr(6, 1);
        switch ($group) {
            case "1":
                $group = "group_1";
                break;
            case "2":
                $group = "group_2";
                break;
            case "3":
                $group = "group_3";
                break;
        }
        return $group;
    }

    function getswitch() {
        var $switch = position.substr(8, 2);
        switch ($switch) {
            case "on":
                $switch = "on_time";
                break;
            case "of":
                $switch = "off_time";
                break;
        }
        return $switch;
    }

    function split(time = '') {
        var hscroll = $(".datetime .select").children();
        for (var i = hscroll.length - 1; i >= 0; i--) {
            $(hscroll[i]).attr("class", "");
        }
        arr = time.split(":");
        $("#h" + arr[0]).attr("class", "active")
        $("#m" + arr[1]).attr("class", "active")
        h = arr[0];
        m = arr[1];
    }

    function compare() {
        var $week = getweek();
        var $road = getroad();
        var $group = getgroup();
        var $switch = getswitch();

        // 拿到该路所有时间
        switch (scene) {
            case "home":
                var r_time = home[$week][$road];
                break;
            case "clas":
                var r_time = clas[$week][$road];
                break;
            case "com":
                var r_time = com[$week][$road];
                break;
        }
        var comparearr = new Array();

        if ($road != "b") {
            for (var i = 1; i <= 3; i++) {
                comparearr.push(r_time['group_' + i]['on_time']);
                comparearr.push(r_time['group_' + i]['off_time']);
            }
        }else if($road == "b"){
            comparearr.push(r_time['group_1']['on_time']);
            comparearr.push(r_time['group_1']['off_time']);
        }

        console.log(comparearr)
        var p = position.substr(6, 1);
        if (position.substr(8, 2) == "of") {
            p = (p - 1) * 2 + 1
        } else if (position.substr(8, 2) == "on") {
            p = (p - 1) * 2
        }
        var compare_time = h + ":" + m;
        console.log("当前操作位置：", p)
        console.log("用作比较的值：", compare_time)
        console.log($road)
        // 设定1,3路
        if ($road != "b") {
            // 判断奇偶性
            // 1.位置为奇，正常比较
            if (p % 2 == 1) {
                for (var i = comparearr.length - 1; i >= 0; i--) {
                    if (p > i) {
                        if (comparearr[i] >= compare_time) { console.log(comparearr[i], "----", compare_time); return false; }
                    } else if (p < i) {
                        if (comparearr[i] <= compare_time) { console.log(comparearr[i], "----", compare_time); return false; }
                    }
                }
                return true;

            } else if (p % 2 == 0) {
                //2.位置为偶数
                switch (p) {
                    case 0:
                        if (compare_time >= comparearr[2]) {
                            console.log("为0")
                            return false;
                        }
                        break;
                    case 2:
                        if (compare_time <= comparearr[1] || compare_time >= comparearr[4]) {
                            console.log("为2")

                            return false;
                        }
                        break;
                    case 4:
                        if (compare_time <= comparearr[3]) {
                            console.log("为4")

                            return false;
                        }
                        break;
                }

                var off_time = position.substr(0, 8) + "of";
                $("#" + off_time).val(compare_time);
                switch (scene) {
                    case "home":
                        home[$week][$road][$group]['off_time'] = compare_time;
                        break;
                    case "clas":
                        clas[$week][$road][$group]['off_time'] = compare_time;
                        break;
                    case "com":
                        com[$week][$road][$group]['off_time'] = compare_time;
                        break;
                }

                return true;
            }
        }

        if($road=="b"){
            console.log("此时的列表",comparearr);
            if(p%2 == 0){
                var off_time = position.substr(0, 8) + "of";
                $("#" + off_time).val(compare_time);
                switch (scene) {
                    case "home":
                        home[$week][$road][$group]['off_time'] = compare_time;
                        break;
                    case "clas":
                        clas[$week][$road][$group]['off_time'] = compare_time;
                        break;
                    case "com":
                        com[$week][$road][$group]['off_time'] = compare_time;
                        break;
                }
                return true;
            }else if(p%2 ==1){
                console.log("进来了");
                if(compare_time<=comparearr[0]){
                    return "over";
                }else{
                    time1 = Date.parse(new Date("2012-12-12 " + comparearr[0]));
                    time2 = Date.parse(new Date("2012-12-12 " + compare_time));
                    if(time2-time1>180000){
                        return "over";
                    }
                }
            }
            return true;
        }
    }
    </script>

</body>
</html>