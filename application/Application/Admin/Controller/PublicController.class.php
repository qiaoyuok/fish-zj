<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: 麦当苗儿 <zuojiazi@vip.qq.com> <http://www.zjzit.cn>
// +----------------------------------------------------------------------

namespace Admin\Controller;
use User\Api\UserApi;

/**
 * 后台首页控制器
 * @author 麦当苗儿 <zuojiazi@vip.qq.com>
 */
class PublicController extends \Think\Controller {

    /**
     * 后台用户登录
     * @author 麦当苗儿 <zuojiazi@vip.qq.com>
     */
    public function login($username = null, $password = null, $verify = null){
        if(IS_POST){
            /* 检测验证码 TODO: */
            if(!check_verify($verify)){
                $this->error('验证码输入错误！');
            }

            /* 调用UC登录接口登录 */
            $User = new UserApi;
            $uid = $User->login($username, $password,2);
            if(0 < $uid){ //UC登录成功
                /* 登录用户 */
                $Member = D('Member');
                if($Member->login($uid)){ //登录用户
                    //TODO:跳转到登录前页面
                    $this->success('登录成功！', U('Index/index'));
                } else {
                    $this->error($Member->getError());
                }

            } else { //登录失败
                switch($uid) {
                    case -1: $error = '用户不存在或被禁用！'; break; //系统级别禁用
                    case -2: $error = '密码错误！'; break;
                    default: $error = '未知错误！'; break; // 0-接口参数错误（调试阶段使用）
                }
                $this->error($error);
            }
        } else {
            if(is_login()){
                $this->redirect('Index/index');
            }else{
                /* 读取数据库中的配置 */
                $config	=	S('DB_CONFIG_DATA');
                if(!$config){
                    $config	=	D('Config')->lists();
                    S('DB_CONFIG_DATA',$config);
                }
                C($config); //添加配置
                
                $this->display();
            }
        }
    }

    /* 退出登录 */
    public function logout(){
        if(is_login()){
            D('Member')->logout();
            session('[destroy]');
            $this->success('退出成功！', U('login'));
        } else {
            $this->redirect('login');
        }
    }

    public function verify(){
        $verify = new \Think\Verify();
        $verify->entry(1);
    }

    public function forgetpw(){
        $this->display();
    }

    /**
     * 发送验证码
     * @Author   孙乔雨
     * @DateTime 2018-04-28
     * @param    string     $email [邮箱号]
     * @return   [type]            [description]
     */
    public function sendEmail($email=''){
        if(empty($email)){
            $this->error("邮箱不能为空！");
        }
        $pattern = "/^([0-9A-Za-z\\-_\\.]+)@([0-9a-z]+\\.[a-z]{2,3}(\\.[a-z]{2})?)$/i";
        if (preg_match($pattern, $email)){

            //判断邮箱是否存在
            $user = M("ucenter_member");
            $res = $user->where("email = '".$email."'")->find();
            if (!$res) {
                echo '{"status":0,"msg":"邮箱不存在！"}';
                return ;
            }
            
            // 随机生成16位校验码
            $token = $this->getForgetTOken(16,$res['id']);

            if(!$token){
                echo '{"status":0,"msg":"发送失败，请稍后重试"}';
                return;
            }

            $smtpserver = "ssl://smtp.163.com";//SMTP服务器
            $smtpserverport =465;//SMTP服务器端口
            $smtpusermail = "m17678328512@163.com";//SMTP服务器的用户邮箱
            $smtpemailto = $email;//发送给谁
            $smtpuser = "m17678328512@163.com";//SMTP服务器的用户帐号，注：部分邮箱只需@前面的用户名
            $smtppass = "suibian666";//SMTP服务器的用户密码
            $mailtitle = "一方植己用户密码找回";//邮件主题
            
            $mailcontent = "
            <p style='line-height:30px'>尊敬的".$email."用户:</p>
            <p style='line-height:36px;'>您正在进行<span style='font-size:20px;color:red;'>找回密码</span>操作</p>
            <p style='width:100%;'>点击链接修改密码：".dirname($_SERVER["REQUEST_SCHEME"]."://".$_SERVER['HTTP_HOST'].$_SERVER['PHP_SELF']."?".$_SERVER["QUERY_STRING"])."/editPassword/token/$token/uid/".$res['id']."</p>"."
            <p style='margin-top:15px;'>连接有效期30分钟，请妥善保管</p>
            ";//邮件内容
            $mailtype = "HTML";//邮件格式（HTML/TXT）,TXT为文本邮件
            //************************ 配置信息 ****************************
            $smtp = new \My\Smtp($smtpserver,$smtpserverport,true,$smtpuser,$smtppass);//这里面的一个true是表示使用身份验证,否则不使用身份验证.

            $smtp->debug = true;//是否显示发送的调试信息
            $state = $smtp->sendmail($smtpemailto, $smtpusermail, $mailtitle, $mailcontent, $mailtype);
            if(!$state){
                
                echo '{"status":0,"msg":"发送邮件失败！"}';
                return;
            }else{
                echo '{"status":1,"msg":"发送邮件成功！"}';
                return;
            }
        }else{
            echo '{"status":0,"msg":"邮箱格式不正确！"}';
                return;
           
        }
        return;
    }

    public function editPassword($token='',$uid='',$password='',$repassword=''){

        if(IS_POST){

            if(empty($token)||empty($uid)){
                echo '{"status":0,"msg":"缺少参数"}';
                exit;
            }

            if(empty($password)||empty($repassword)){
                echo '{"status":0,"msg":"密码不能为空"}';
                exit;
            }

            if($password!=$repassword){
                echo '{"status":0,"msg":"两次输入的密码不同"}';
                exit;
            }

            $forget_token = M("forget_token");
            $res = $forget_token->where("token = '".$token."' and uid =".$uid." and is_use = 0")->order("id desc")->find();
            if(!$res){
                echo '{"status":0,"msg":"修改出错,请重试或重新发送邮箱"}';
                exit;
            }else{
                $outtime = $res['create_time']+1800;
                if($outtime<time()){
                    echo '{"status":0,"msg":"链接过期，请重新发送邮箱！"}';
                    exit;
                }
                
                $ucenter_member = M("ucenter_member");
                $password = think_ucenter_md5($password, 'NK1-F2+x%_S!Yq"H75vzj64W`L|&dUe0wsP?aVuA');
                $saveres = $ucenter_member->where("id = ".$uid)->save(array("password"=>$password));
                $forget_token->where("id = ".$res['id'])->save(array("is_use"=>1));
                if($saveres){
                    echo '{"status":1,"msg":"修改密码成功"}';
                    exit;
                }else{
                    echo '{"status":0,"msg":"修改密码失败"}';
                    exit;
                }
            }
        }

        $this->display();
    }

    /**
     * 获取修改密码的校验码
     * @Author   孙乔雨
     * @DateTime 2018-04-04
     */
    public function getForgetTOken($length = 16,$uid=''){
        $token = null;
        $strPol = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789abcdefghijklmnopqrstuvwxyz";
        $max = strlen($strPol)-1;
     
        for($i=0;$i<$length;$i++){
            $token.=$strPol[rand(0,$max)]; //rand($min,$max)生成介于min和max两个数之间的一个随机整数
        }

        $forget_token = M("forget_token");
        $addres = $forget_token->where("uid = '".$uid."'")->add(array("token"=>$token,"uid"=>$uid,"create_time"=>time()));
        if ($addres) {
            return $token;
        }else{
            return false;
        }
    }
}
