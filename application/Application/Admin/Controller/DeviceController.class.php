<?php
/**
 * --------------------------------------------------------------------------------------------------
 * *****                        @Author: sunqiaoyu                                              *****
 * *****                        @Date:   2018-03-23 11:55:48                                    *****
 * *****                        @Last Modified by:   gl003                                      *****
 * *****                        @Last Modified time: 2018-03-23 12:42:02                        *****
 * --------------------------------------------------------------------------------------------------
 */
namespace Admin\Controller;

/**
 * 设备控制器
 */
class DeviceController extends AdminController {

    /**
     * @Author   孙乔雨
     * @DateTime 2018-03-23
     * @param    param1
     * @param    param2
     * @return   [type]     [description]
     */
    public function index($device_id=''){
        $where = "b.unionid = u.unionid";
        if (!empty($device_id)||$device_id==0) {
            $where    .=   " and b.device_id like '%".$device_id."%'";
        }

        $base_device = M("base_device");

        $page = new \Think\Page($base_device->table('xcx_base_device b,xcx_user u')->where($where)->count(),10);
        $list = $base_device->table('xcx_base_device b,xcx_user u')
                        ->field('b.*,u.nickname')
                        ->where($where)
                        ->order('b.create_time desc')
                        ->limit($page->firstRow.','.$page->listRows)
                        ->select();
        scene_int_to_string($list);
        // var_dump($list);

        // 循环结果获取被分享用户列表及当前设备对应的地区（通过高德ip定位接口）
        foreach ($list as $k => $v) {
            $list[$k]['shareusers'] = $this->getShareUsers($v['device_id']);
            $statusres = $this->getStatus($v['device_id']);
            if($statusres){
                $list[$k]['status'] = $statusres["is_online"];
            }
            $address = $this->curl_request($v['ip']);
            if(gettype($address['province'])=="string")
            $list[$k]['address'] = (string)$address['province']." , ".(string)$address['city'];
            else
            $list[$k]['address'] = "暂无位置信息";

        }

        // var_dump($list);exit;

        //设置分页主题
        $page->setConfig('theme','%FIRST% %UP_PAGE% %LINK_PAGE% %DOWN_PAGE% %END% %HEADER%');
        $p =$page->show();
        $this->assign('_page', $p? $p: '');
        // 记录当前列表页的cookie
        Cookie('__forward__',$_SERVER['REQUEST_URI']);

        $this->assign('_list', $list);
        $this->meta_title = '设备列表';
        $this->display();
    }

    /**
     * 给用户添加设备
     * @Author   孙乔雨
     * @DateTime 2018-04-27
     * @param    string     $device_id [description]
     * @param    string     $uid       [description]
     */
    public function addDevice($device_id='',$uid=''){
        $device_id = trim($device_id);
        if(empty($device_id)||empty($uid)){
            echo '{"status":0,"msg":"添加失败"}';
            return ;
        }

        $device = M("device");
        $deviceinfo = $device->where("device_id = '".$device_id."' and uid = ".$uid)->find();
        if($deviceinfo){
            echo '{"status":0,"msg":"用户已拥有该设备"}';
            return ;
        }

        $addres = $device->add(array("device_id"=>$device_id,"uid"=>$uid,"create_time"=>time(),"device_name"=>"新加设备"));

        if($addres){
            echo '{"status":1,"msg":"添加成功"}';
            return;
        }else{
            echo '{"status":0,"msg":"添加失败"}';
            return;
        }
    }

    /**
     * 设备换绑
     * @Author   孙乔雨
     * @DateTime 2018-07-11
     * @param    string     $device_id [设备ID号]
     * @param    string     $uid       [用户ID号]
     * @return   [type]                [description]
     */
    public function change($device_id='',$uid=''){
      
      !empty($uid) or die($this->error("缺少参数"));
      !empty($device_id) or die($this->error("缺少参数"));

      $user = M("user");
      $device_id = trim($device_id);
      $unionid = $user->where("uid = $uid")->find()['unionid'];
      $base_device = M("base_device");
      if ($base_device->where("device_id='".$device_id."'")->save(array("unionid"=>$unionid))) {
        $device = M("device");
        $device->where("uid = $uid and device_id = '".$device_id."'")->delete();
        $device->where("device_id = '".$device_id."'")->save(array("owner"=>0));
        if ($device->add(array("uid"=>$uid,"device_name"=>"新加设备","device_id"=>$device_id,"create_time"=>time(),"owner"=>1))) {
          echo '{"status":1,"msg":"换绑成功"}';
        }else{
          echo '{"status":0,"msg":"换绑失败"}';
        }
      }else{
        echo '{"status":0,"msg":"换绑失败1"}';
      }
    }

    /**
     * 获取设备状态
     * @Author   孙乔雨
     * @DateTime 2018-04-27
     * @param    string     $value [description]
     * @return   [type]            [description]
     */
    public function getStatus($device_id=''){
        
        if(empty($device_id)){
            return false;
        }
        $url = "http://zjso.yhqq.top/get_device_online/?net_id=20&device_no=".$device_id;
        $ch = curl_init();
        curl_setopt($ch,CURLOPT_URL,$url); 
        curl_setopt($ch,CURLOPT_HEADER,0); 
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1 ); 
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 10); 
        $res = curl_exec($ch); 
        curl_close($ch);
        return json_decode($res,true);
    }

    /**
     * 通过设备ID号获取被分享的用户列表
     * @Author   孙乔雨
     * @DateTime 2018-04-24
     * @param    string     $device_id [设备ID号]
     * @return   [type]                [description]
     */
    public function getShareUsers($device_id=''){
        
        if (empty($device_id)) {
            return false;
        }

        $device = M("device");
        return $device->table("xcx_user u , xcx_device d")->where("d.device_id = '".$device_id."' and d.uid = u.uid and owner = 0")->select();
    }

    /**
     * 取消对用户的设备分享
     * @Author   孙乔雨
     * @DateTime 2018-04-27
     * @param    string     $device_id [设备ID号]
     * @param    string     $uid       [用户ID号]
     * @return   [type]                [description]
     */
    public function cancelShare($device_id='',$uid=''){
        
        if(empty($device_id)||empty($uid)){
            echo '{"status":0,"msg":"取消分享失败"}';
            return ;
        }

        $device = M("device");
        $delres = $device->where("device_id = '".$device_id."' and uid = ".$uid)->delete();
        if($delres){
            echo '{"status":1,"msg":"取消分享成功"}';
            return;
        }else{
            echo '{"status":0,"msg":"取消分享失败"}';
            return ;
        }
    }

    /**
     * 删除设备
     * @Author   孙乔雨
     * @DateTime 2018-04-27
     * @param    string     $device_id [description]
     * @return   [type]                [description]
     */
    public function delDevice($device_id=''){
        if(empty($device_id)){
            $this->error('删除出错');
        }

        $deldevice = M("device")->where("device_id = '".$device_id."'")->delete();

        // 获取设备拥有者用户信息
        $userinfo = M("base_device")->table("xcx _base_device b,xcx_user u")->field("u.wxopenid")->where("u.unionid = b.unionid")->find();

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

        $delbasedevice = M("base_device")->where("device_id = '".$device_id."'")->delete();

        if($deldevice||$delbasedevice){
            $this->success('删除成功', U('index'));
        }else{
            $this->error('删除出错');
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
     * 设备地图操作
     * @Author   孙乔雨
     * @DateTime 2018-04-09
     * @return   [type]     [description]
     */
    public function map(){
        // 通过设备的ip地址获取所有设备对应的经纬度
        $base_device = M("base_device");
        $base_device_list = $base_device->select();
        $arr = [];
        $num = 0;
        $provinces = "[";
        $count = count($base_device_list);
        if (!empty($base_device_list)) {
            foreach ($base_device_list as $k => $v) {
                $num++;
                if(!empty($v['ip'])){
                    $res= $this->curl_request($v['ip']);
                    // 计算折中经纬度
                    if(!empty($res['rectangle'])){

                        $arr[$k]["center"] = $this->getJW($res['rectangle']);
                        $arr[$k]["city"] = $res['city'];
                        $arr[$k]["province"] = $res['province'];
                        $arr[$k]["device_id"] = $v['device_id'];
                        if($num>=$count){
                            $provinces .= json_encode($arr[$k]);
                        }else{
                            $provinces .= json_encode($arr[$k]).",";
                        }
                    }
                }
            }
            $provinces .= "]";
            $this->assign("provinces",$provinces);
        }
        $this->meta_title = '设备地图分布';
        $this->display();
    }

    /**
     * 通过IP地址获取经纬度范围
     * @Author   孙乔雨
     * @DateTime 2018-04-09
     * @param    string     $ip [IP地址]
     * @return   [type]         [description]
     */
    public function curl_request($ip=''){
        
        $url = "http://restapi.amap.com/v3/ip?key=008cb9779fd8de3538618a81f9d520a4&ip=".$ip;
        $ch = curl_init();
        curl_setopt($ch,CURLOPT_URL,$url); 
        curl_setopt($ch,CURLOPT_HEADER,0); 
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1 ); 
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 10); 
        $res = curl_exec($ch); 
        curl_close($ch);
        return json_decode($res,true);
    }

    /**
     * 通过经纬度范围获取折中经纬度
     * @Author   孙乔雨
     * @DateTime 2018-04-09
     * @param    string     $rectangle [经纬度范围]
     * @return   [type]                [description]
     */
    public function getJW($rectangle=''){
        
        $arr = explode(";",$rectangle);
        $bottomleft = explode(",",$arr[0]);
        $topright   = explode(",",$arr[1]);
        
        return (($bottomleft[0]+$topright[0])/2+rand(1000,9999)/100000).",".(($bottomleft[1]+$topright[1])/2+rand(1000,9999)/100000);
    }

    /**
     * 场景模式时间设置
     * @Author   孙乔雨
     * @DateTime 2018-04-25
     * @return   [type]     [description]
     */
    public function scene(){
        
        // 获取默认场景下的数据，包括（家庭模式，办公模式，公共场所模式）
        
        $set = M("set");
        $defaultset = $set->field("w_1,w_2,w_3,w_4,w_5,w_6,w_7,scene")->where("scene != 4")->select();
        foreach ($defaultset as $k => $v) {
            
            $defaultset[$k]['w_1'] = json_decode($v['w_1'],true);
            $defaultset[$k]['w_2'] = json_decode($v['w_2'],true);
            $defaultset[$k]['w_3'] = json_decode($v['w_3'],true);
            $defaultset[$k]['w_4'] = json_decode($v['w_4'],true);
            $defaultset[$k]['w_5'] = json_decode($v['w_5'],true);
            $defaultset[$k]['w_6'] = json_decode($v['w_6'],true);
            $defaultset[$k]['w_7'] = json_decode($v['w_7'],true);
        }
        // var_dump($defaultset);exit;
        $this->assign("defaultset",$defaultset);
        $this->display();
    }

    /**
     * 保存场景设置
     * @Author   孙乔雨
     * @DateTime 2018-04-26
     * @return   [type]     [description]
     */
    public function saveSet(){
        if(IS_POST){

            if(empty($_POST)){
                echo '{"status":0,"msg":"出错了！"}';
                return ;
            }   

            $data = json_decode($_POST['data'],true);

            $scene = $data['scene'];
            unset($data['scene']);
            foreach ($data as $k => $v) {
                $data[$k] = json_encode($v);
            }
            $set = M("set");
            $data['isupload'] = "0";
            $saveres = $set->where("scene = ".$scene)->save($data);
            if($saveres){
                echo '{"status":1,"msg":"保存成功"}';
                return;
            }else{
                echo '{"status":0,"msg":"保存失败"}';
                return;
            }
        }
    }
}
