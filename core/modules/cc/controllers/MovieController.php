<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/4/9 0009
 * Time: 16:24
 */

namespace app\modules\cc\controllers;


use app\modules\cc\models\VideoForm;

class MovieController extends Controller
{
    public function actionIndex(){
        $id=\Yii::$app->request->get('id');
        if(empty($id)){
            throw new \Exception('wrong');
        }
        $list=VideoForm::randomVideo();
        $v=new VideoForm();
        $v->video_id=$id;
        $v->store_id=$this->store_id;
        $b=$v->getMovie();
//        var_dump($b);
        return $this->render('index',['list'=>$list,'movie'=>$b]);
    }
}