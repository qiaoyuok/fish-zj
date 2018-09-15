<?php

/**
 * --------------------------------------------------------------------------------------------------
 * *****						@Author: sunqiaoyu												*****
 * *****						@Date:   2018-03-23 14:57:36									*****
 * *****						@Last Modified by:   gl003										*****
 * *****						@Last Modified time: 2018-04-28 09:54:22						*****
 * --------------------------------------------------------------------------------------------------
 */

namespace Admin\Controller;


/**
* 小程序api
*/
class XcxapiController extends XcxbaseapiController{
		
	private $APPID = "wxade8d5a399daefd7";
	private $SECRET = "ac201cf455823ba4c598d70e4efc4057";
	const WXAPPID = "wx13bc32b11f37ebb5";
	const WXSECRET = "e48f393f73e5c46fb5700a094496587f";
	/**
	 * @Author   孙乔雨
	 * @DateTime 2018-03-23
	 * @param    uid   获取指定用户的设备列表
	 * @param    page   分页的第几页
	 * @param    limit   分页的每页数据量
	 * @return   [type]     [description]
	 */
	public function getDveviceLists($uid = '',$page = '',$limit = ''){

		$page = !empty($page)?$page:1;
		$limit = !empty($limit)?$limit:6;

		$device = M("device");
		$deviceLists = $device->field("device_id,owner,device_name")->where("uid = ".$uid)->order("owner desc")->page($page)->limit($limit)->select();
		// $deviceLists = $device->where("uid = 6")->page($page)->limit($limit)->select();
		
		if(!empty($deviceLists)){

			foreach ($deviceLists as $k => $v) {
				$deviceLists[$k]["isonline"] = 0;
				$deviceLists[$k]["time"] = 0;

				$deviceLists[$k]['temp_device_name'] = $v['device_name']."(".substr($v['device_id'], 9).")";
			}
		}
		// $deviceLists[2] = array("isonline"=>0);
		echo '{"status":1,"msg":"获取成功","data":'.json_encode($deviceLists).'}';
		// echo '{"status":1,"msg":"获取成功","data":"[]"}';
		return ;
	}

	/**
	 * 获取当前微信openid为$openid的用户的涉笔
	 * @Author   孙乔雨
	 * @DateTime 2018-04-03
	 * @param    string     $Wxopenid [description]
	 * @return   [type]               [description]
	 */
	public function getWxDevice($Wxopenid=''){
		
	$get_bind_device_url = 'https://api.weixin.qq.com/device/get_bind_device?access_token='.$access_token.'&openid='.$Wxopenid;
	//echo $get_bind_device_url;
	$ch = curl_init();
	curl_setopt($ch,CURLOPT_URL,$get_bind_device_url); 
	curl_setopt($ch,CURLOPT_HEADER,0); 
	curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1 ); 
	curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 10); 
	$res = curl_exec($ch); 
	curl_close($ch); 
	$json_obj = json_decode($res,true); 
	$device_list = $json_obj['device_list'];

	}

	/**
	 * @Author   孙乔雨
	 * @DateTime 2018-03-23
	 * @param    int     $uid         [用户ID号]
	 * @param    string     $device_id   [设备ID号]
	 * @param    string     $device_name [设备名称]
	 * @return   [type]                  [description]
	 */
	public function editDevice($uid = '',$device_id = '',$device_name = ''){
		
		if (empty($device_id)) {
			echo '{"status":0,"msg":"设备ID号不能为空"}';
			return ;
		}

		if (empty($device_name)) {
			echo '{"status":0,"msg":"设备名称不能为空"}';
			return ;
		}

		$device = M("device");

		$devicinfo = $device->where("device_id = '".$device_id."' and uid = ".$uid)->find();

		if (!$devicinfo) {
			echo '{"status":0,"msg":"设备ID号不存在"}';
			return ;
		}

		$date = [
			"device_name"=>$device_name,
			"update_time"=>time()
		];

		$devicedit = $device->where("device_id = '".$device_id."' and uid = ".$uid)->save($date);

		if ($devicedit) {
			echo '{"status":1,"msg":"编辑成功"}';
			return ;
		}else{
			echo '{"status":0,"msg":"编辑失败"}';
			return ;
		}
	}

	/**
	 * 用户删除设备操作
	 * @Author   孙乔雨
	 * @DateTime 2018-04-04
	 * @param    string     $uid         [用户ID号]
	 * @param    string     $device_id   [设备ID号]
	 * @param    string     $formid      [表单ID号]
	 * @param    string     $device_name [设备名称]
	 * @return   [type]                  [description]
	 */
	public function deleteDevice($uid = '',$device_id = '',$formid='',$device_name=''){
		// var_dump($device_name);
		if (empty($device_id)) {
			
			echo '{"status":0,"msg":"设备ID号不能为空"}';
			return ;
		}
		
		$user = M("user");
		$userinfo = $user->where("uid = ".$uid)->find();
		if(!empty($userinfo)){
			$wxopenid = $userinfo['wxopenid'];
		}

		// 获取微信公众号的access_token
		$access_token_info = $this->getWxAccessToken();

		$url = "https://api.weixin.qq.com/device/compel_unbind?access_token=".$access_token_info['access_token'];
		$data = [
			"device_id"=>$device_id, 
    		"openid"=>$wxopenid
		];
		$res = $this->curlRequest($url,json_encode($data));
		$time = date("Y-m-d H:i:s",time());

		$path = "./device_log/".date("Y-m",time()).".txt";

		file_put_contents($path,"操作时间：".$time."\r\n操作人：".$userinfo['nickname']."\r\n设备ID号：".$device_id."\r\n解绑返回结果：".$res."\r\n--------------------------------------\r\n",FILE_APPEND);

		$res = json_decode($res,true);
		// 设备解绑成功
		if($res['base_resp']['errmsg'] == "ok"){

			$device = M("device");
			$time = date("Y-m-d H:i:s",time());

            $path = "./device_log/delete".date("Y-m",time()).".txt";

            file_put_contents($path,"操作时间：".$time."\r\n操作人uid：".$uid."\r\n事件：删除设备\r\n设备ID号：".$device_id."\r\n---------------------------------------------\r\n",FILE_APPEND);
			$res = $device->where("device_id = '".$device_id."'")->delete();
			if($res){
				echo '{"status":1,"msg":"删除成功"}';

				$get_access_token_info = $this->getAccessToken();
				// var_dump($get_access_token_info);
				// 发送删除设备模板通知
				if($get_access_token_info){
					// 可以发送消息
					// $this->sengMsg($get_access_token_info['access_token'],$uid,$formid,$device_id,$device_name);
				}
			}else{
				echo '{"status":0,"msg":"删除失败"}';
				return ;
			}
			return;
		}else{
			// 设备解绑失败
			echo '{"status":0,"msg":"删除失败"}';
			return ;
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

	public function getDeviceInfo($uid='',$device_id=''){
		
		if (empty($device_id)) {
			
			echo '{"status":0,"msg":"设备ID号为空"}';
			return ;
		}

		$device = M("device");

		$deviceinfo = $device->table("xcx_base_device as b , xcx_device as d")->field("d.*,b.scene")->where("d.uid = ".$uid." and d.device_id = '".$device_id."' and d.device_id = b.device_id")->find();
		if ($deviceinfo) {
			echo '{"status":1,"msg":"获取成功","data":'.json_encode($deviceinfo).'}';
			return;
		}else{
			echo '{"status":0,"msg":"设备不存在"}';
			return;
		}
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
		$access_token_info = $access_token->where("flag = 0")->order("id desc")->limit(1)->find();
		$time = time();
		if (empty($access_token_info) || $access_token_info['out_time']<$time) {
			
			// 需要获取access_token
			$url = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=".$this->APPID."&secret=".$this->SECRET;

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
				$id = $access_token->add(array("access_token"=>$get_access_token_info['access_token'],"create_time"=>time(),"out_time"=>time()+7150));
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
	 * 发送模板消息
	 * @Author   孙乔雨
	 * @DateTime 2018-03-27
	 * @param    string     $access_token [获取到的access_]
	 * @return   [type]                   [description]
	 */
	public function sengMsg($access_token='',$uid = "",$formid='',$device_id='',$device_name=''){
		// echo $device_name;
		// echo "进入发送操作";
		if (empty($uid)) {
			
			return false;
		}

		if (empty($access_token)) {
			
			return false;
		}

		if (empty($formid)) {
			
			return false;
		}

		if (empty($device_id)) {
			
			return false;
		}

		// 获取用户openid
		$openid = $this->getOpenid($uid);
		// var_dump($openid);
		$url = "https://api.weixin.qq.com/cgi-bin/message/wxopen/template/send?access_token=".$access_token;

		$data = array(
	        "touser" => $openid,
	        "template_id" => "M5mSupKqRloQqwrAxpfweOwkd77bDx9vtkNZfsOUFT8",
	        "form_id" => $formid,
	        "data"=>array(
		        	"keyword1"=>array(
		        		"value"=>$device_name,
		        		"color"=>"#515151"
		        	),
		        	"keyword2"=>array(
		        		"value"=>$device_id,
		        		"color"=>"#ff0000"
		        	),
		        	"keyword3"=>array(
		        		"value"=>date("Y-m-d H:i:s",time()),
		        		"color"=>"#0000ff"
		        	),
	        	)
	        );
		$data = json_encode($data);
		//初始化
	   $curl = curl_init(); // 启动一个CURL会话
	    curl_setopt($curl, CURLOPT_URL, $url); // 要访问的地址
	    curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, 0); // 对认证证书来源的检查
	    curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, 1); // 从证书中检查SSL加密算法是否存在
	    curl_setopt($curl, CURLOPT_USERAGENT, $_SERVER['HTTP_USER_AGENT']); // 模拟用户使用的浏览器
	    curl_setopt($curl, CURLOPT_FOLLOWLOCATION, 1); // 使用自动跳转
	    curl_setopt($curl, CURLOPT_AUTOREFERER, 1); // 自动设置Referer
	    curl_setopt($curl, CURLOPT_POST, 1); // 发送一个常规的Post请求
	    curl_setopt($curl, CURLOPT_POSTFIELDS, $data); // Post提交的数据包
	    curl_setopt($curl, CURLOPT_TIMEOUT, 30); // 设置超时限制防止死循环
	    curl_setopt($curl, CURLOPT_HEADER, 0); // 显示返回的Header区域内容
	    curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1); // 获取的信息以文件流的形式返回
	    $res = curl_exec($curl); // 执行操作
	    if (curl_errno($curl)) {
	        echo 'Errno'.curl_error($curl);//捕抓异常
	    }
	    // var_dump("发送结果",$res);
	    curl_close($curl); // 关闭CURL会话
	}

	/**
	 * 获取用户openid
	 * @Author   孙乔雨
	 * @DateTime 2018-03-27
	 * @param    string     $uid [description]
	 * @return   [type]          [description]
	 */
	public function getOpenid($uid=''){
		
		$user = M("user");
		$userinfo = $user->where("uid = ".$uid)->find();
		if ($userinfo['openid']) {
			
			return $userinfo['openid'];
		}else{

			return false;
		}
	}

	/**
	 * 获取当前设备在特定场景下的配置
	 * @Author   孙乔雨
	 * @DateTime 2018-03-28
	 * @param    string     $device_id [设备ID号]
	 * @param    string     $scene     [场景值]
	 * @return   [type]                [description]
	 */
	public function getSet($device_id='',$scene='',$flag=false){
		
		if (empty($device_id)) {
			echo '{"status":0,"msg":"设备ID号不能为空"}';
			return ;
		}

		if (empty($scene)) {
			echo '{"status":0,"msg":"场景值为空"}';
			return ;
		}

		$set = M("set");
		$setinfo = $set->where("device_id = '".$device_id."' and scene = ".$scene)->find();
		if ($setinfo) {
			if($flag){
				return $setinfo;
			}
			echo '{"w_1":'.$setinfo['w_1'].',"w_2":'.$setinfo['w_2'].',"w_3":'.$setinfo['w_3'].',"w_4":'.$setinfo['w_4'].',"w_5":'.$setinfo['w_5'].',"w_6":'.$setinfo['w_6'].',"w_7":'.$setinfo['w_7'].',"isupload":'.$setinfo['isupload'].'}';
			return ;
		}else{
			$setinfo = $set->where("scene = ".$scene)->find();
			if ($setinfo) {
				if($flag){
					return $setinfo;
				}
				echo '{"w_1":'.$setinfo['w_1'].',"w_2":'.$setinfo['w_2'].',"w_3":'.$setinfo['w_3'].',"w_4":'.$setinfo['w_4'].',"w_5":'.$setinfo['w_5'].',"w_6":'.$setinfo['w_6'].',"w_7":'.$setinfo['w_7'].',"isupload":'.$setinfo['isupload'].'}';
				
				return ;
			}else{
				echo '{"status":0,"msg":"不存在默认配置"}';
				return ;
			}
		}
	}
	/**
	 * 保存场景时间设置参数
	 * @Author   孙乔雨
	 * @DateTime 2018-03-29
	 * @param    string     $data      [设置的时间]
	 * @param    string     $device_id [设备ID号]
	 * @param    string     $scene     [场景值]
	 * @return   [type]                [description]
	 */
	public function saveSet($data='',$device_id='',$scene=''){
			
		$data = json_decode($data,true);

		if (empty($data)) {
			
			echo '{"status":0,"msg":"数据项为空"}';
			return ;
		}

		if (empty($device_id)) {
			
			echo '{"status":0,"msg":"设备ID号为空"}';
			return ;
		}

		if (empty($scene)) {
			
			echo '{"status":0,"msg":"场景值为空"}';
			return ;
		}

		$set = M("set");
		$setinfo = $set->where("device_id = '".$device_id."' and scene = ".$scene)->find();

		if ($setinfo) {
			
			$data = array(
				"w_1"=>json_encode($data["w_1"]),
				"w_2"=>json_encode($data["w_2"]),
				"w_3"=>json_encode($data["w_3"]),
				"w_4"=>json_encode($data["w_4"]),
				"w_5"=>json_encode($data["w_5"]),
				"w_6"=>json_encode($data["w_6"]),
				"w_7"=>json_encode($data["w_7"]),
				"scene"=>$scene,
				"device_id"=>$device_id,
				"update_time"=>time(),
				"isupload"=>0
			);

			$saveres = $set->where("set_id = ".$setinfo['set_id'])->save($data);
			if ($saveres) {
				
				echo '{"status":1,"msg":"编辑成功"}';
				return ;
			}else{
				echo '{"status":0,"msg":"编辑失败1"}';
				return ;
			}
		}else{
			$data = array(
				"w_1"=>json_encode($data["w_1"]),
				"w_2"=>json_encode($data["w_2"]),
				"w_3"=>json_encode($data["w_3"]),
				"w_4"=>json_encode($data["w_4"]),
				"w_5"=>json_encode($data["w_5"]),
				"w_6"=>json_encode($data["w_6"]),
				"w_7"=>json_encode($data["w_7"]),
				"scene"=>$scene,
				"device_id"=>$device_id,
				"create_time"=>time(),
			);

			$set->create($data);
			$addres = $set->add($data);
			if ($addres) {
				echo '{"status":1,"msg":"编辑成功"}';
				return ;
			}else{
				echo '{"status":0,"msg":"编辑失败2"}';
				return ;
			}
		}
	}

	/**
	 * 保存当前设备的场景值
	 * @Author   孙乔雨
	 * @DateTime 2018-03-29
	 * @param    string     $device_id [设备ID号]
	 * @param    string     $scene     [场景值]
	 * @return   [type]                [description]
	 */
	public function saveScene($device_id='',$scene=''){
		
		if (empty($device_id)) {
			echo '{"status":0,"msg":"设备ID号为空"}';
			return ;
		}

		$base_device = M("base_device");
		$saveres = $base_device->where("device_id = '".$device_id."'")->save(array("scene"=>$scene));
		// var_dump($saveres);
		// echo $scene;
		$set = M("set");
		// 取得当前设备当前场景当前配置
		if($scene == "4"){
			$setinfo = $this->getSet($device_id,4,true);
			// var_dump($setinfo);
			if($setinfo['set_id'] == 1){
				// echo "进来了";
				$data = '{"w_1":'.$setinfo['w_1'].',"w_2":'.$setinfo['w_2'].',"w_3":'.$setinfo['w_3'].',"w_4":'.$setinfo['w_4'].',"w_5":'.$setinfo['w_5'].',"w_6":'.$setinfo['w_6'].',"w_7":'.$setinfo['w_7'].'}';
				$res = $this->saveSet($data,$device_id,4);
				// var_dump($res);
			}

			$saveset = $set->where("device_id = '".$device_id."' and scene = 4")->save(array("isupload"=>1));
			if ($saveres&&$saveset) {
			
				echo '{"status":1,"msg":"场景设置成功"}';
				return ;
			}else{

				echo '{"status":0,"msg":"场景设置失败"}';
				return ;
			}
		}
		
		if ($saveres) {
			
			echo '{"status":1,"msg":"场景设置成功"}';
			return ;
		}else{

			echo '{"status":0,"msg":"场景设置失败"}';
			return ;
		}
	}

	/**
	 * 生成二维码
	 * @Author   孙乔雨
	 * @DateTime 2018-04-04
	 * @param    string     $device_id [设备ID号]
	 * @param    string     $uid 		[用户ID号]
	 * @return   [type]                [description]
	 */
	public function getQr($device_id='',$uid=''){
		
		if(empty($device_id)){
			echo '{"status":0,"msg":"设备ID号为空"}';
			return ;
		}

		$device = M("device");
		// 判断该设备是否属于当前操作人员
		$ownerinfo = $device->where("device_id = '".$device_id."' and owner = 1")->find();

		if($ownerinfo['uid']!=$uid){
			echo '{"status":0,"msg":"你无权操作！"}';
			return ;
		}

		$device_token = $this->getDeviceToken(5,$device_id);
		if(!$device_token){
			echo '{"status":0,"msg":"获取device_token失败"}';
			return ;
		}

		$access_token_info = $this->getAccessToken();
		if($access_token_info){
			// var_dump($openid);
			// $url = "https://api.weixin.qq.com/wxa/getwxacode?access_token=".$access_token_info['access_token'];
			$url = "https://api.weixin.qq.com/wxa/getwxacodeunlimit?access_token=".$access_token_info['access_token'];

			$data = array(
		        	"scene"=>$device_id.",".$device_token,
		        	"page"=>"pages/add_share/add_share",
		        	"width"=>500
		        );
			$data = json_encode($data);
			//初始化
		   $curl = curl_init(); // 启动一个CURL会话
		    curl_setopt($curl, CURLOPT_URL, $url); // 要访问的地址
		    curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, 0); // 对认证证书来源的检查
		    curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, 1); // 从证书中检查SSL加密算法是否存在
		    curl_setopt($curl, CURLOPT_USERAGENT, $_SERVER['HTTP_USER_AGENT']); // 模拟用户使用的浏览器
		    curl_setopt($curl, CURLOPT_FOLLOWLOCATION, 1); // 使用自动跳转
		    curl_setopt($curl, CURLOPT_AUTOREFERER, 1); // 自动设置Referer
		    curl_setopt($curl, CURLOPT_POST, 1); // 发送一个常规的Post请求
		    curl_setopt($curl, CURLOPT_POSTFIELDS, $data); // Post提交的数据包
		    curl_setopt($curl, CURLOPT_TIMEOUT, 30); // 设置超时限制防止死循环
		    curl_setopt($curl, CURLOPT_HEADER, 0); // 显示返回的Header区域内容
		    curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1); // 获取的信息以文件流的形式返回
		    $res = curl_exec($curl); // 执行操作
		    if (curl_errno($curl)) {
		        echo 'Errno'.curl_error($curl);//捕抓异常
		    }
		    // var_dump("获取结果：",$res);
		    if(isset($res['errcode'])){
		    	echo '{"status":0,"msg":"生成二维码出错"}';
		    	return ;
		    }else{
		    	$size = file_put_contents("./qr/".$device_id.".png",$res);
		    	if($size>0){
		    		echo '{"status":1,"url":"https://'.$_SERVER['HTTP_HOST'].'/qr/'.$device_id.'.png?device_token='.$device_token.'"}';
		    		return ;
		    	}
		    }
		    curl_close($curl); // 关闭CURL会话
		}
	}

	/**
	 * 获取设备分享时的校验码
	 * @Author   孙乔雨
	 * @DateTime 2018-04-04
	 * @param    string     $device_id [设备ID号]
	 * @return   [type]                [设备分享的校验码]
	 */
	public function getDeviceToken($length = 5,$device_id=''){
	    $device_token = null;
	    $strPol = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789abcdefghijklmnopqrstuvwxyz";
	    $max = strlen($strPol)-1;
	 
	    for($i=0;$i<$length;$i++){
	        $device_token.=$strPol[rand(0,$max)]; //rand($min,$max)生成介于min和max两个数之间的一个随机整数
	    }

	    $base_device = M("base_device");
		$saveres = $base_device->where("device_id = '".$device_id."'")->save(array("device_token"=>$device_token));
		if ($saveres) {
			
			return $device_token;
		}else{
			return false;
		}
	}

	/**
	 * 获取设备分享时的校验码
	 * @Author   孙乔雨
	 * @DateTime 2018-04-04
	 * @param    string     $device_id [设备ID号]
	 * @return   [type]                [设备分享的校验码]
	 */
	// public function getDeviceToken($device_id=''){
		
	// 	if(empty($device_id)){
	// 		return false;
	// 	}

	// 	$base_device = M("base_device");
	// 	$device_token = md5(time()."wahaha");
	// 	$saveres = $base_device->where("device_id = '".$device_id."'")->save(array("device_token"=>$device_token));
	// 	if ($saveres) {
			
	// 		return $device_token;
	// 	}else{
	// 		return false;
	// 	}
	// }

	/**
	 * 添加被分享的设备到该用户下
	 * @Author   孙乔雨
	 * @DateTime 2018-04-04
	 * @param    string     $device_id    [设备ID号]
	 * @param    string     $device_token [设备分享校验码]
	 */
	public function addShare($uid='',$device_id='',$device_token=''){
		
		if(empty($device_id)){
			echo '{"status":0,"msg":"设备ID号为空"}';
			return ;
		}

		if (empty($device_token)) {
			echo '{"status":0,"msg":"设备分享校验码为空"}';
			return ;
		}

		// 检测设备分享校验码是否正确
		$base_device = M("base_device");
		$base_device_device_token = $base_device->where("device_id = '".$device_id."'")->find()['device_token'];
		if($base_device_device_token != $device_token){

			echo '{"status":0,"msg":"分享二维码过期"}';
			return ;
		}

		// 把该设备添加到当前用户下，先检测是否已存在该设备，不存在再添加，存在的话，直接返回提示信息
		$device = M("device");
		$isexist = $device->where("uid = ".$uid." and device_id = '".$device_id."'")->find();
		if ($isexist) {
			
			echo '{"status":0,"msg":"请不要重复添加该设备"}';
			return ;
		}else{

			$deviceinfo = $device->where("device_id = '".$device_id."' and owner = 1")->find();
			$device_name = empty($deviceinfo['device_name'])?"新加设备":$deviceinfo['device_name'];
			$data = array(
				"uid"=>$uid,
				"device_id"=>$device_id,
				"device_name"=>$device_name,
				"create_time"=>time()
			);
			$addres = $device->add($data);
			if($addres>0){
				echo '{"status":1,"msg":"添加分享设备成功"}';
				return;
			}else{
				echo '{"status":0,"msg":"添加分享设备失败"}';
				return;
			}
		}
	}

	/**
	 * 获取该设备已被分享的用户
	 * @Author   孙乔雨
	 * @DateTime 2018-04-04
	 * @param    string     $uid       [设备主人ID号]
	 * @param    string     $device_id [设备ID号]
	 * @return   [type]                [description]
	 */
	public function getShareUsers($uid='',$device_id=''){
		
		if (empty($device_id)) {
			
			echo '{"status":0,"msg":"设备ID号为空"}';
			return ;
		}

		$device = M("device");

		// 判断该设备是否属于当前操作人员
		$ownerinfo = $device->where("device_id = '".$device_id."' and owner = 1")->find();
		// var_dump($ownerinfo);
		if($ownerinfo['uid']!=$uid){
			echo '{"status":0,"msg":"你无权操作！"}';
			return ;
		}

		$shareusers = $device->table("xcx_device as d,xcx_user as u")->field("d.device_id,d.uid,u.nickName,u.avatarUrl")->where("d.device_id = '".$device_id."' and d.owner = 0 and d.uid = u.uid")->select();

		if(!empty($shareusers)){
			foreach ($shareusers as $k => $v) {
				$len = mb_strlen($v['nickName'],"utf-8");
				if($len>4){
					$shareusers[$k]["cutname"] = mb_substr($v['nickName'],0,4,"utf-8")."..";
				}else{
					$shareusers[$k]["cutname"] = $v['nickName'];
				}
			}
		}

		echo '{"status":1,"data":'.json_encode($shareusers).'}';
		return ;
	}

	/**
	 * 取消对用户的设备分享
	 * @Author   孙乔雨
	 * @DateTime 2018-04-04
	 * @param    string     $canceluid [即将被取消分享的用户ID号]
	 * @param    string     $uid 	   [设备主人ID号]
	 * @param    string     $device_id [设备ID号]
	 * @return   [type]                [description]
	 */
	public function cancelShare($canceluid='',$uid='',$device_id=''){
		
		if(empty($device_id)){
			echo '{"status":0,"msg":"设备ID号不能为空"}';
			return ;
		}

		if(empty($canceluid)){
			echo '{"status":0,"msg":"用户ID号不能为空"}';
			return ;
		}

		$device = M("device");

		// 判断该设备是否属于当前操作人员
		$ownerinfo = $device->where("device_id = '".$device_id."' and owner = 1")->find();

		if($ownerinfo['uid']!=$uid){
			echo '{"status":0,"msg":"你无权操作！"}';
			return ;
		}
		$time = date("Y-m-d H:i:s",time());

        $path = "./device_log/update".date("Y-m",time()).".txt";

        file_put_contents($path,"操作时间：".$time."\r\n操作人uid：".$uid."\r\n事件：取消分享设备\r\n设备ID号：".$device_id."\r\n---------------------------------------------\r\n",FILE_APPEND);
		$cancelshare = $device->where("uid = ".$canceluid." and device_id = '".$device_id."'")->delete();
		if($cancelshare){
			echo '{"status":1,"msg":"取消分享成功"}';
			return ;
		}else{
			echo '{"status":0,"msg":"取消分享失败"}';
			return ;
		}
	}

	/**
	 * 获取控制页设定定的背景图
	 * @Author   孙乔雨
	 * @DateTime 2018-04-25
	 * @return   [type]     [description]
	 */
	public function getBg(){
		
		$bgpic = M("bg_pic");
		$bgpicinfo = $bgpic->select();
		if(!empty($bgpicinfo)){
			echo '{"status":1,"msg":"获取成功","filename":"'.$bgpicinfo[0]['bg_filename'].'"}';
			return ;
		}else{
			echo '{"status":0,"msg":"获取失败"}';
			return ;
		}
	}



	//删除设备
	public function del_device($uid = '',$device_id = '',$formid='',$device_name=''){
		// var_dump($device_name);
		if (empty($device_id)) {
			
			echo '{"status":0,"msg":"设备ID号不能为空"}';
			return ;
		}
		
		$user = M("user");
		$userinfo = $user->where("uid = ".$uid)->find();
		if(!empty($userinfo)){
			$wxopenid = $userinfo['wxopenid'];
		}


		$device = M("Device");
		$time = date("Y-m-d H:i:s",time());

		$res = $device->where("device_id = '".$device_id."'")->delete();
		if($res){
			echo '{"status":1,"msg":"删除成功"}';
			return ;
		}else{
			echo '{"status":0,"msg":"删除失败"}';
			return ;
		}
	}

}
