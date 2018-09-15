<?php

namespace Admin\Controller;
use Think\Controller;

/**
* 小程序接口公共类文件
*/
class ComapiController extends Controller{
	
	const APPID = "wx7ad7b161d1cf29a7";
	const SECRET = "8c2f7a848d11176f3b03466b9318dd0f";
	function __construct(){
		
	}

	/**
	*
	*获取用户openid或者unionid
	*/
	public function getopenid($code=''){
		
		if (empty($code)) {
			echo '{"status":0,"msg":"没有传来code"}';
			exit;
		}

		// 获取用户openid或者unionid(此接口和微信公众号接口不同)
		$url = "https://api.weixin.qq.com/sns/jscode2session?appid=".self::APPID."&secret=".self::SECRET."&js_code=".$code."&grant_type=authorization_code";

		// 采用curl抓取内容
		$ch = curl_init();
        curl_setopt($ch,CURLOPT_URL,$url); 
        curl_setopt($ch,CURLOPT_HEADER,0); 
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1 ); 
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 10); 
        $res = curl_exec($ch); 
        curl_close($ch);
        // $res = json_decode($res,true);
        echo $res;
        exit;
	}
}


















?>