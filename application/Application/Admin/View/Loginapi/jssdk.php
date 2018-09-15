<?php
// var_dump("jssdk");exit;
class JSSDK {
  private $appId;
  private $appSecret;
  const WXAPPID = "wx13bc32b11f37ebb5";
  const WXSECRET = "e48f393f73e5c46fb5700a094496587f";
  
  public function __construct($appId, $appSecret) {
    $this->appId = $appId;
    $this->appSecret = $appSecret;
  }

  public function getSignPackage() {
    $jsapiTicket = $this->getJsApiTicket();

    // 注意 URL 一定要动态获取，不能 hardcode.
    $protocol = (!empty($_SERVER['HTTPS']) && $_SERVER['HTTPS'] !== 'off' || $_SERVER['SERVER_PORT'] == 443) ? "https://" : "http://";
    $url = "$protocol$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]";

    $timestamp = time();
    $nonceStr = $this->createNonceStr();

    // 这里参数的顺序要按照 key 值 ASCII 码升序排序
    $string = "jsapi_ticket=$jsapiTicket&noncestr=$nonceStr&timestamp=$timestamp&url=$url";

    $signature = sha1($string);

    $signPackage = array(
      "appId"     => $this->appId,
      "nonceStr"  => $nonceStr,
      "timestamp" => $timestamp,
      "url"       => $url,
      "signature" => $signature,
      "rawString" => $string
    );
    return $signPackage; 
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

      // 获取access_token 
      $ch = curl_init();
      curl_setopt($ch,CURLOPT_URL,$url); 
      curl_setopt($ch,CURLOPT_HEADER,0); 
      curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1 ); 
      curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
      curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 10); 
      $tokenres = curl_exec($ch); 
      curl_close($ch);
      // $res = json_decode($res,true);
      $get_access_token_info = json_decode($tokenres,true);

      // 获取ticket
      $url = "https://api.weixin.qq.com/cgi-bin/ticket/getticket?access_token=".$get_access_token_info['access_token']."&type=jsapi";
      $ch = curl_init();
      curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false); // 跳过证书检查  
      curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, true);  // 从证书中检查SSL加密算法是否存在  
      curl_setopt($ch,CURLOPT_URL,$url); 
      curl_setopt($ch,CURLOPT_HEADER,0); 
      curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1 ); 
      curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 10); 
      $ticketres = curl_exec($ch); //echo $res;
      curl_close($ch); 
      $ticket_info = json_decode($ticketres,true);


      if ($ticket_info) {
        //添加access_token日志
        $id = $access_token->add(array("access_token"=>$get_access_token_info['access_token'],"create_time"=>time(),"out_time"=>time()+7150,"flag"=>1,"ticket"=>$ticket_info['ticket']));
        if ($id) {

          return $ticket_info;
        }else{
        return false;
        }
      }else{
        return false;
      }
    }else{
      if(empty($access_token_info['ticket'])){
        // echo "重置";
        $access_token->where("id = ".$access_token_info['id'])->save(array("flag"=>0));
        $this->getAccessToken();
      }
      return $access_token_info;
    }
  }

  public function getSignPackageRemote($net_id) {
    $time = time();
    $access_token_info = $this->getWxAccessToken();
    // var_dump($access_token_info);
    // 注意 URL 一定要动态获取，不能 hardcode.
    $protocol = (!empty($_SERVER['HTTPS']) && $_SERVER['HTTPS'] !== 'off' || $_SERVER['SERVER_PORT'] == 443) ? "https://" : "http://";
    $url = "$protocol$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]";
    // echo $url;
    $timestamp = time();
    $nonceStr = $this->createNonceStr();

    // 这里参数的顺序要按照 key 值 ASCII 码升序排序
    $string = "jsapi_ticket=".$access_token_info['ticket']."&noncestr=$nonceStr&timestamp=$timestamp&url=$url";
    // echo $string;
    $signature = sha1($string);

    $signPackage = array(
      "appId"     => $this->appId,
      "nonceStr"  => $nonceStr,
      "timestamp" => $timestamp,
      "url"       => $url,
      "signature" => $signature,
      "rawString" => $string
    );
    return $signPackage; 
  }

  private function createNonceStr($length = 16) {
    $chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    $str = "";
    for ($i = 0; $i < $length; $i++) {
      $str .= substr($chars, mt_rand(0, strlen($chars) - 1), 1);
    }
    return $str;
  }

  private function getJsApiTicket() {
    // jsapi_ticket 应该全局存储与更新，以下代码以写入到文件中做示例
    $data = json_decode($this->get_php_file("jsapi_ticket.php"));
    if ($data->expire_time < time()) {
      $accessToken = $this->getAccessToken();
      // 如果是企业号用以下 URL 获取 ticket
      // $url = "https://qyapi.weixin.qq.com/cgi-bin/get_jsapi_ticket?access_token=$accessToken";
      $url = "https://api.weixin.qq.com/cgi-bin/ticket/getticket?type=jsapi&access_token=$accessToken";
      $res = json_decode($this->httpGet($url));
      $ticket = $res->ticket;
      if ($ticket) {
        $data->expire_time = time() + 7000;
        $data->jsapi_ticket = $ticket;
        $this->set_php_file("jsapi_ticket.php", json_encode($data));
      }
    } else {
      $ticket = $data->jsapi_ticket;
    }

    return $ticket;
  }

  private function getAccessToken() {
    // access_token 应该全局存储与更新，以下代码以写入到文件中做示例
    $data = json_decode($this->get_php_file("access_token.php"));
    if ($data->expire_time < time()) {
      // 如果是企业号用以下URL获取access_token
      // $url = "https://qyapi.weixin.qq.com/cgi-bin/gettoken?corpid=$this->appId&corpsecret=$this->appSecret";
      $url = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=$this->appId&secret=$this->appSecret";
      $res = json_decode($this->httpGet($url));
      $access_token = $res->access_token;
      if ($access_token) {
        $data->expire_time = time() + 7000;
        $data->access_token = $access_token;
        $this->set_php_file("access_token.php", json_encode($data));
      }
    } else {
      $access_token = $data->access_token;
    }
    return $access_token;
  }

  private function httpGet($url) {
    $curl = curl_init();
    curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($curl, CURLOPT_TIMEOUT, 500);
    // 为保证第三方服务器与微信服务器之间数据传输的安全性，所有微信接口采用https方式调用，必须使用下面2行代码打开ssl安全校验。
    // 如果在部署过程中代码在此处验证失败，请到 http://curl.haxx.se/ca/cacert.pem 下载新的证书判别文件。
    curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, true);
    curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, true);
    curl_setopt($curl, CURLOPT_URL, $url);

    $res = curl_exec($curl);
    curl_close($curl);

    return $res;
  }

  private function get_php_file($filename) {
    return trim(substr(file_get_contents($filename), 15));
  }
  private function set_php_file($filename, $content) {
    $fp = fopen($filename, "w");
    fwrite($fp, "<?php exit();?>" . $content);
    fclose($fp);
  }
}

