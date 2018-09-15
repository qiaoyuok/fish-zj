<?php

namespace Admin\Controller;
use Think\Controller;

/**
* 小程序登录接口
*/
class LoginapiController extends Controller{
	
	const APPID = "wxade8d5a399daefd7";
	const SECRET = "ac201cf455823ba4c598d70e4efc4057";
	const WXAPPID = "wx13bc32b11f37ebb5";
	const WXSECRET = "e48f393f73e5c46fb5700a094496587f";
	/**
	 * 获取用户的openid
	 * @Author   孙乔雨
	 * @DateTime 2018-03-23
	 * @param    string     $code [code用户换取openid]
	 * @return   [type]           [description]
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

	/**
	 * 实现用户登录操作
	 * @Author   孙乔雨
	 * @DateTime 2018-03-23
	 * @param    string     $encryptedData [description]
	 * @param    string     $iv            [description]
	 * @param    string     $sessionKey    [description]
	 * @return   [type]                    [description]
	 */
	public function login($encryptedData='', $iv='',$sessionKey=''){

		if (empty($encryptedData)) {
			
			echo '{"status":0,"msg":"密文为空"}';
			exit;
		}

		if (empty($iv)) {
			echo '{"status":0,"msg":"向量为空"}';
			exit;
		}

		if (empty($sessionKey)) {
			echo '{"status":0,"msg":"sessionkey为空"}';
			exit;
		}

		$data = $this->getUserInfo($encryptedData,$iv,$sessionKey);
		// echo $data;
		// 拿到解密数据，进行入库操作
		if (!empty($data)) {
			$data = json_decode($data,true);
			$user = M("user");
			$userinfo = $user->where("unionid = '".$data['unionId']."'")->find();

			$userdata['avatarurl'] = $data['avatarUrl'];
			$userdata['gender'] = $data['gender'];
			$userdata['city'] = $data['city'];
			$userdata['nickname'] = $data['nickName'];
			$userdata['openid'] = $data['openId'];
			$userdata['province'] = $data['province'];
			$userdata['create_time'] = time();

			// var_dump($userinfo);return ;
			if (empty($userinfo)) {
				$userdata['unionid'] = $data['unionId'];

				$user->create($userdata);
				$time = date("Y-m-d H:i:s",time());

		        $path = "./device_log/insert".date("Y-m",time()).".txt";

		        file_put_contents($path,"操作时间：".$time."\r\n添加数据详情：".json_encode($data)."\r\n---------------------------------------------\r\n",FILE_APPEND);
				$uid = $user->add($userdata);
				if ($uid>0) {
					
					echo $this->getLoginLog($uid);
					return;
				}else{
					echo '{"status":0,"msg":"登录出错"}';
					return ;
				}

			}else{
				// if(empty($userinfo['openid'])){
				// 	$saveres = $user->where("unionid = '".$data['unionId']."'")->save($userdata);
				// }
				file_put_contents("./device_log/resert.txt",json_encode($data));
				$user->where("unionid = '".$data['unionId']."'")->save($userdata);
				$uid = $userinfo['uid'];
				echo $this->getLoginLog($uid);
				return ;
			}
		}
	}

	/**
	 * 添加用户登录日志
	 * @Author   孙乔雨
	 * @DateTime 2018-03-23
	 * @param    string     $uid [description]
	 * @return   [type]          [description]
	 */
	public function getLoginLog($uid=''){

		$login_log = M("login_log");

		// 获取token
		$token = $this->gettoken();

		$login_log_info = $login_log->where("uid = ".$uid)->find();
		if ($login_log_info) {
			
			$login_log_info_edit = $login_log->where("uid = ".$uid)->save(array("token"=>$token,"update_time"=>time()));
			if ($login_log_info_edit) {
				return '{"status":1,"msg":"登陆成功","uid":'.$uid.',"token":"'.$token.'"}';
			}else{
				return '{"status":1,"msg":"登陆失败"}';
			}
		}else{
			$login_log_add = $login_log->add(array("uid"=>$uid,"token"=>$token,"create_time"=>time()));
			if ($login_log_add) {
				return '{"status":1,"msg":"登陆成功","uid":'.$uid.',"token":"'.$token.'"}';

			}else{
				return '{"status":1,"msg":"登陆失败"}';
			}
		}
	}

	/**
	 * 获取用户信息，包括unionID，openid，头像，昵称等
	 * @Author   孙乔雨
	 * @DateTime 2018-03-23
	 * @param    string     $encryptedData [加密的用户数据]
	 * @param    string     $iv            [向量]
	 * @param    string     $sessionKey    [钥匙]
	 * @return   [type]                    [description]
	 */
	public function getUserInfo($encryptedData='', $iv='',$sessionKey=''){
		
		if (strlen($sessionKey) != 24) {
			return false;
		}

		$aesKey=base64_decode($sessionKey);

        
		if (strlen($iv) != 24) {
			return false;
		}

		$aesIV=base64_decode($iv);

		$aesCipher=base64_decode($encryptedData);

		$result=openssl_decrypt( $aesCipher, "AES-128-CBC", $aesKey, 1, $aesIV);

		$dataObj=json_decode( $result );

		if( $dataObj  == NULL ){

			return false;
		}

		if( $dataObj->watermark->appid != self::APPID ){
			return false;
		}

		return $result;
	}

	/**
	 * 获取token
	 * @Author   孙乔雨
	 * @DateTime 2018-03-23
	 * @return   [type]     [description]
	 */
	public function gettoken(){
		
		return md5(base64_encode(time()));
	}

	/**
	 * 小程序web-view测试用
	 * @Author   孙乔雨
	 * @DateTime 2018-03-26
	 * @return   [type]     [description]
	 */
	public function scan(){
		
		$this->display();
	}

	public function config(){
		//$wx_open_id = $this->get_openid();
		$device_id = I("device_id");
		if($device_id){
			$this->assign("device_id",$device_id);
		}
		$this->display();
	}

	private function checkSignature(){
        $signature = $_GET["signature"];
        $timestamp = $_GET["timestamp"];
        $nonce = $_GET["nonce"];    
             
        $token = "qiaoyuok";
        $tmpArr = array($token, $timestamp, $nonce);
        sort($tmpArr, SORT_STRING);
        $tmpStr = implode( $tmpArr );
        $tmpStr = sha1( $tmpStr );
        
        if( $tmpStr == $signature ){
            return true;
        }else{
            return false;
        }
    }

    //Xml转数组
	public function XmlToArr($xml){	
		if($xml == '') return '';
		libxml_disable_entity_loader(true);
		$arr = json_decode(json_encode(simplexml_load_string($xml, 'SimpleXMLElement', LIBXML_NOCDATA)), true);		
		return $arr;
	}

// {"ToUserName":"gh_683e2ee9ad48","FromUserName":"og1D2w7S-YhPQj0QO6Kw4gCBWwjY","CreateTime":"1523155108","MsgType":"device_event","Event":"bind","DeviceType":"gh_683e2ee9ad48","DeviceID":"DC4F22C2F34C","Content":[],"SessionID":"0","OpenID":"og1D2w7S-YhPQj0QO6Kw4gCBWwjY"}
// {"ToUserName":"gh_683e2ee9ad48","FromUserName":"og1D2w7S-YhPQj0QO6Kw4gCBWwjY","CreateTime":"1523155874","MsgType":"device_event","Event":"unsubscribe_status","DeviceType":"gh_683e2ee9ad48","DeviceID":"DC4F22C2F34C","OpType":"0","OpenID":"og1D2w7S-YhPQj0QO6Kw4gCBWwjY"}
	/**
	 * 接收微信绑定设备通知
	 * @Author   孙乔雨
	 * @DateTime 2018-04-04
	 * @return   [type]     [description]
	 */
	public function wxAnnounce(){

		$xmldata = $this->getPostXml();
		$time = date("Y-m-d H:i:s",time());
		$data = $this->XmlToArr($xmldata);
		file_put_contents("/device_log/wxAnnounce".$time.".txt",json_encode($data)."\r\t",FILE_APPEND);

		$access_token_info = $this->getAccessToken();

		// file_put_contents("./bindOrUnbind.txt",$access_token_info."\r\t",FILE_APPEND);

		$Wxuserinfo = $this->getUnionId($access_token_info['access_token'],$data['OpenID']);

		$time = date("Y-m-d H:i:s",time());

		$path = "./device_log/".date("Y-m",time()).".txt";

		$Wxuserinfo = json_decode($Wxuserinfo,true);

		file_put_contents($path,"操作时间：".$time."\r\n事件：".$data['Event']."\r\n操作人：".$Wxuserinfo['nickname']."　　unionid：".$Wxuserinfo['unionid']."\r\n设备ID号：".$data['DeviceID']."\r\n---------------------------------------------\r\n",FILE_APPEND);


		// 一：绑定事件处理
		// 更改用户信息，把该用户微信的openid和小程序的openid通过unionID对应起来
		if ($data['Event'] == "bind") {
			$user = M("user");

			$userinfo = $user->where("unionid = '".$Wxuserinfo['unionid']."'")->find();
			if($userinfo){
				$uid = $userinfo['uid'];
				$saveuser = $user->where("unionid = '".$Wxuserinfo['unionid']."'")->save(array("wxopenid"=>$data['OpenID']));
			}else{
				$adduser  = $user->add(array("unionid"=>$Wxuserinfo['unionid'],"nickname"=>$Wxuserinfo['nickname'],"wxopenid"=>$data['OpenID'],"avatarurl"=>$Wxuserinfo['headimgurl']));
				$uid = $adduser;
			}

			//判断设备是否在基表中存在
			$base_device = M("base_device");
			$base_device_info = $base_device->where("device_id = '".$data['DeviceID']."'")->find();
			
			if(empty($base_device_info)){
				$base_device->add(array("device_id"=>$data['DeviceID'],"create_time"=>time(),"update_time"=>time(),"unionid"=>$Wxuserinfo['unionid']));
			}else{

				$userinfo = $user->where("unionid = '".$base_device_info['unionid']."'")->find();
				if(!empty($userinfo)){
					$wxopenid = $userinfo['wxopenid'];
					// 获取微信公众号的access_token
					$access_token_info = $this->getWxAccessToken();

					$url = "https://api.weixin.qq.com/device/compel_unbind?access_token=".$access_token_info['access_token'];
					$data = [
						"device_id"=>$data['DeviceID'], 
			    		"openid"=>$wxopenid
					];
					$res = $this->curlRequest($url,json_encode($data));
				}

				$base_device->where("device_id = '".$data['DeviceID']."'")->save(array("update_time"=>time(),"unionid"=>$Wxuserinfo['unionid']));
			}

			//检查用户设备表中是否已存在该设备，存在的话，全部删掉，新加该设备到当前用户
			$device = M("device");
			$device->where("device_id = '".$data['DeviceID']."'")->delete();

			$device->add(array("device_id"=>$data['DeviceID'],"uid"=>$uid,"device_name"=>"新加设备","create_time"=>time(),"owner"=>1));

		}elseif ($data['Event'] == "unbind") {

		// 二：解绑事件处理
			//检查用户设备表中是否已存在该设备，存在的话，全部删掉
			$device = M("device");
			$device->where("device_id = '".$data['DeviceID']."'")->delete();

		}

		if($this->checkSignature()){
            echo $_GET['echostr'];
       }
	}

	/**
	  使用curl方式实现get或post请求
	  @param $url 请求的url地址
	  @param $data 发送的post数据 如果为空则为get方式请求
	  return 请求后获取到的数据
	*/
	function curlRequest($url,$data = ''){
        $ch = curl_init();
        $params[CURLOPT_URL] = $url;    //请求url地址
        $params[CURLOPT_HEADER] = false; //是否返回响应头信息
        $params[CURLOPT_RETURNTRANSFER] = true; //是否将结果返回
		$params[CURLOPT_TIMEOUT] = 30; //超时时间
		if(!empty($data)){
			$params[CURLOPT_POST] = true;
			$params[CURLOPT_POSTFIELDS] = $data;
        }
		$params[CURLOPT_SSL_VERIFYPEER] = false;//请求https时设置,还有其他解决方案
		$params[CURLOPT_SSL_VERIFYHOST] = false;//请求https时,其他方案查看其他博文
        curl_setopt_array($ch, $params); //传入curl参数
        $content = curl_exec($ch); //执行
        curl_close($ch); //关闭连接
		return $content;
	}

		/**
	 * 获取access_token
	 * @Author   孙乔雨
	 * @DateTime 2018-03-27
	 * @return   [type]     [description]
	 */
	public function getWxAccessToken(){
			
		/**
		 * 第一步：获取access_token
		 */
		$access_token = M("access_token");
		$access_token_info = $access_token->where("flag = 1")->order("id desc")->limit(1)->find();
		$time = time();
		if (empty($access_token_info) || $access_token_info['out_time']<$time) {
			
			// 需要获取access_token
			$url = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=".self::WXAPPID."&secret=".self::WXSECRET;

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
	        $get_access_token_info = json_decode($res,true);

			if ($get_access_token_info) {
				//添加access_token日志
				$id = $access_token->add(array("access_token"=>$get_access_token_info['access_token'],"create_time"=>time(),"out_time"=>time()+7150,"flag"=>1));
				if ($id) {

					return $get_access_token_info;
				}else{
				return false;
				}
			}else{
				return false;
			}
		}else{

			return $access_token_info;
		}
	}

	/**
	 * 接收post过来的Xml数据
	 * @Author   孙乔雨
	 * @DateTime 2018-04-08
	 * @param    string     $value [description]
	 * @return   [type]            [description]
	 */
	public function getPostXml(){
		
		return file_get_contents('php://input'); 
	}

		/**
	 * 获取access_token
	 * @Author   孙乔雨
	 * @DateTime 2018-03-27
	 * @return   [type]     [description]
	 */
	public function getAccessToken(){
			
		/**
		 * 第一步：获取access_token
		 */
		$access_token = M("access_token");
		$access_token_info = $access_token->where("flag = 1")->order("id desc")->limit(1)->find();
		$time = time();
		if (empty($access_token_info) || $access_token_info['out_time']<$time) {
			
			// 需要获取access_token
			$url = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=".self::WXAPPID."&secret=".self::WXSECRET;

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
	        $get_access_token_info = json_decode($res,true);

			if ($get_access_token_info) {
				//添加access_token日志
				$id = $access_token->add(array("access_token"=>$get_access_token_info['access_token'],"create_time"=>time(),"out_time"=>time()+7150,"flag"=>1));
				if ($id) {

					return $get_access_token_info;
				}else{
				return false;
				}
			}else{
				return false;
			}
		}else{

			return $access_token_info;
		}
	}

	/**
	 * 获取用户unionID
	 * @Author   孙乔雨
	 * @DateTime 2018-04-08
	 * @return   [type]     [description]
	 */
	public function getUnionId($access_token='',$openid=''){
		
		$url = "https://api.weixin.qq.com/cgi-bin/user/info?access_token=".$access_token."&openid=".$openid."&lang=zh_CN";
		// 采用curl抓取内容
		$ch = curl_init();
        curl_setopt($ch,CURLOPT_URL,$url); 
        curl_setopt($ch,CURLOPT_HEADER,0); 
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1 ); 
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 10); 
        $res = curl_exec($ch); 
        curl_close($ch);
        return $res;
	}

	/**
	 * 获取设备状态操作
	 * @Author   孙乔雨
	 * @DateTime 2018-04-09
	 * @return   [type]     [description]
	 */
	public function getDeviceStatus(){
		
		$device_id = I("device_id");
		if(empty($device_id)){
			echo '{"status":0,"msg":"设备ID号为空"}';
			return ;
		}

		$ip = I("ip");

		$base_device = M("base_device");
		$base_device_info = $base_device->where("device_id = '".$device_id."'")->find();
		if(!empty($base_device_info)){
			$savebasedevice = $base_device->where("device_id = '".$device_id."'")->save(array("ip"=>$ip));
			if($savebasedevice){
				echo '{"status":1,"msg":"更新成功"}';
				return;
			}else{
				echo '{"status":0,"msg":"更新失败"}';
				return;
			}
		}
	}


//小程序绑定设备
	public function bind_device(){
		$device_id = I("device_id");
		$uid = I('uid');

		$now_time = time();
		$find_bindtime = M('Bindtime')->where("device_id='".$device_id."'")->order("id desc")->limit(1)->find();
		$info_time = $find_bindtime['info_time'];
		if($now_time-$info_time>600){
			echo '{"status":2,"msg":"未在设备按wifi按钮"}';
			return;
		}

		$user = M('User');
		if($uid>0){
			$find_unionid = $user->where("uid =".uid)->find();
			$unionid = $find_unionid['unionid'];
		}
		//判断设备是否在基表中存在
		$base_device = M("base_device");
		$base_device_info = $base_device->where("device_id = '".$device_id."'")->find();
		
		if(empty($base_device_info)){
			$new_basedc_id = $base_device->add(array("device_id"=>$device_id,"create_time"=>time(),"update_time"=>time(),"unionid"=>$unionid));
			if($new_basedc_id>0){
				//检查用户设备表中是否已存在该设备，存在的话，全部删掉，新加该设备到当前用户
				$device = M("Device");
				$device->where("device_id = '".$device_id."'")->delete();
				$new_basedc_id = $device->add(array("device_id"=>$device_id,"uid"=>$uid,"device_name"=>"新加设备","create_time"=>time(),"owner"=>1));
				echo '{"status":1,"msg":"绑定成功"}';
				return;
			}else{
				echo '{"status":0,"msg":"绑定失败"}';
				return;
			}
		}else{

			$userinfo = $user->where("unionid = '".$unionid."'")->find();
			if(!empty($userinfo)){
				$wxopenid = $userinfo['wxopenid'];
				// 获取微信公众号的access_token
				$access_token_info = $this->getWxAccessToken();

				$url = "https://api.weixin.qq.com/device/compel_unbind?access_token=".$access_token_info['access_token'];
				$data = [
					"device_id"=>$device_id, 
					"openid"=>$wxopenid
				];
				$res = $this->curlRequest($url,json_encode($data));
				$time = date("Y-m-d H:i:s",time());
			}

			$base_device->where("device_id = '".$device_id."'")->save(array("update_time"=>time(),"unionid"=>$unionid));

			//检查用户设备表中是否已存在该设备，存在的话，全部删掉，新加该设备到当前用户
			$device = M("Device");
			$device->where("device_id = '".$device_id."'")->delete();
			$new_basedc_id = $device->add(array("device_id"=>$device_id,"uid"=>$uid,"device_name"=>"新加设备","create_time"=>time(),"owner"=>1));
			if($new_basedc_id>0){
				echo '{"status":1,"msg":"绑定成功"}';
				return;
			}else{
				echo '{"status":0,"msg":"绑定失败"}';
				return;
			}	
		}	
	}


	//规定时间接收绑定信息
	public function get_bindinfo(){
		$device_id=$_REQUEST["device_id"];
		$content_base64 = $_REQUEST["content"];

		$content = base64_decode($content_base64);
		$json_obj = json_decode($content,true);

		$reset = $json_obj['reset'];
		$Bindtime = M('Bindtime');
		$now_time = time();
		if($reset==1){
			$arr = array('device_id'=>$device_id,'info_time'=>$now_time);
			$add_bindtime = $Bindtime->add($arr);
			if($add_bindtime){
				echo '{"status":1,"msg":"绑定指示插入数据库"}';
				return;
			}else{
				echo '{"status":0,"msg":"绑定指示未插入数据库"}';
				return;
			}
		}else{
				echo '{"status":0,"msg":"未收到绑定指示"}';
				return;
		}
	}

}

?>