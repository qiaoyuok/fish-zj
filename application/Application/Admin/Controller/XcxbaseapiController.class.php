<?php

/**
 * --------------------------------------------------------------------------------------------------
 * *****						@Author: sunqiaoyu												*****
 * *****						@Date:   2018-03-23 14:30:30									*****
 * *****						@Last Modified by:   gl003										*****
 * *****						@Last Modified time: 2018-03-23 19:01:49						*****
 * --------------------------------------------------------------------------------------------------
 */
namespace Admin\Controller;
use Think\Controller;

/**
* 小程序接口入口基础类文件
* 检验用户是否登录
*/
class XcxbaseapiController extends Controller{
	
	/**
	 * @Author   孙乔雨
	 * @DateTime 2018-03-23
	 * @param    uid 用户唯一标志
	 * @param    token 用户登录状态校验码
	 * @return   [type]     [description]
	 */
	public function _initialize(){
		
		$uid = I("uid");
		$token = I("token");
		if (empty($uid)||empty($token)) {
			
			echo '{"status":0,"msg":"uid和token均不能为空！"}';
			exit;
		}

		/**
		 * 检验用户是否存在
		 * 用户校验码是否正确
		 */
		
		$login_log = M("login_log");

		$u_login_log = $login_log->where("uid = ".$uid)->find();

		if ($u_login_log) {

			if ($token !== $u_login_log['token']) {
				
				echo '{"status":0,"msg":"用户登录凭证失效！"}';
				exit;
			}	
		}else{
			echo '{"status":0,"msg":"请先登录！"}';
			exit;
		}
	}
}