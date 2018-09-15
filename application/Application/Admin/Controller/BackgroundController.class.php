<?php

/**
 * --------------------------------------------------------------------------------------------------
 * *****						@Author: sunqiaoyu												*****
 * *****						@Date:   2018-04-24 17:11:16									*****
 * *****						@Last Modified by:   gl003										*****
 * *****						@Last Modified time: 2018-04-25 14:52:33						*****
 * --------------------------------------------------------------------------------------------------
 */
namespace Admin\Controller;

/**
 * 设备控制器
 */
class BackgroundController extends AdminController {

	public function index(){
		
		$pics = [];
		//打开当前目录下的目录pic下的子目录common。
		$handler = opendir('./qr/bg/');
		$i = 1;
		while( ($filename = readdir($handler)) !== false ){

		 //略过linux目录的名字为'.'和‘..'的文件
		 if($filename != "." && $filename != ".."){  
			$ext = strtolower(substr(strrchr($filename, '.'), 1));
			if($ext=="png"||$ext=="jpg"||$ext=="png"||$ext=="jpeg"||$ext=="gif"){
				if($filename!="default.png"){
					$pics[$i]["complete"] = $_SERVER["REQUEST_SCHEME"]."://".$_SERVER['HTTP_HOST']."/qr/bg/".$filename;
					$pics[$i]["filename"] = $filename;			
				}
			}
		  }
		  $i++;
		}

		// 获取当前已设定的背景图
		$bgpic = M("bg_pic");
		$bgpicinfo = $bgpic->select();
		if(!empty($bgpicinfo)){
			$bgpicname = $bgpicinfo[0]['bg_filename'];
			$this->assign("bgpicname",$bgpicname);
			// exit;
		}
		// var_dump($pics);
		$this->assign("pics",$pics);
		$this->display();
	}

    	/**
	 * 图片上传
	 * @Author   孙乔雨
	 * @DateTime 2018-04-25
	 * @return   [type]     [description]
	 */
    public function upload(){
        $config = array( 'maxSize' => 1048576, 'rootPath' => './qr/', 'savePath' => './bg/', 'saveName' => array('uniqid',''), 'exts' => array('jpg', 'gif', 'png', 'jpeg'), 'autoSub' => true, 'subName' => ""); 
        $upload = new \Think\Upload($config);
        $info = $upload->upload();
        if(!$info) {
        	echo '{"status":0,"msg":"'.$upload->getError().'"}';
            
        }else{
            echo '{"status":1,"msg":"上传成功"}';
        }
    }

    /**
     * 删除图片、文件
     * @Author   孙乔雨
     * @DateTime 2018-04-25
     * @param    string     $filename [图片名]
     * @return   [type]               [description]
     */
    public function delete($filename=''){
    	if(empty($filename)){
    		echo "空的";
    		return ;
    	}

    	$bgpic = M("bg_pic");
		$bgpicinfo = $bgpic->select();
		if(!empty($bgpicinfo)&&$bgpicinfo[0]['bg_filename']==$filename){
			echo '{"status":0,"msg":"删除失败！背景图使用中"}';
			return ;
		}
    	if (!unlink("./qr/bg/".$filename)){
		  echo '{"status":0,"msg":"删除失败！"}';
		} else {
		  echo '{"status":1,"msg":"删除成功！"}';
		}
    }

    /**
     * 设定背景图
     * @Author   孙乔雨
     * @DateTime 2018-04-25
     * @param    string     $filename [description]
     */
    public function setBg($filename=''){
    	
    	if(empty($filename)){
    		echo "空的";
    		return ;
    	}

    	$bgpic = M("bg_pic");
    	$bgpicinfo = $bgpic->select();
    	if(empty($bgpicinfo)){
    		
    		if($bgpic->add(array("bg_filename"=>$filename))){
    			echo '{"status":1,"msg":"设定背景图成功"}';
    		}else{
    			echo '{"status":0,"msg":"设定背景图失败"}';

    		}
    	}else{

    		if($bgpic->where("id = ".$bgpicinfo[0]['id'])->save(array("bg_filename"=>$filename))){
    			echo '{"status":1,"msg":"设定背景图成功"}';

    		}else{
    			echo '{"status":0,"msg":"设定背景图失败"}';

    		}
    	}

    }
}