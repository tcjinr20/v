<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/4/9 0009
 * Time: 11:26
 */
namespace app\modules\leba\controllers;

use app\models\Leba;

class DefaultController extends Controller{

    public function init(){
        header("Access-Control-Allow-Origin: *");
    }
    public function actionIndex(){
       $leba= new Leba();
        $leba->date=date('Y-m-d',time());
        $leba->isNewRecord =true;
        $leba->save();
        $id=Leba::getDb()->getLastInsertID();
//        return $this->renderContent("<h1 style='margin: 0 auto'>$id</h1>");
        return $this->render('index',['index'=>$id]);
    }

    public function actionQueue(){
        header("Access-Control-Allow-Origin: *");
        $d= Leba::find()->where(['date'=>date('Y-m-d',time())])->asArray()->all();
        $this->renderJson(['data'=>$d]);
    }

    public function actionCur(){
        $r=Leba::findOne(['state'=>1]);
        if(!empty($r)){
            $r->state=2;
            $r->save();
        }
        $r=Leba::find()->where(['state'=>0])->orderBy('id')->limit(1)->all();

        if(empty($r)){
            $this->renderJson(['data'=>[]]);
        }else{
            $r[0]->state=1;
            $r[0]->save();
            $d['time']=$r[0]['time'];
            $d['id']=$r[0]['id'];
            $this->renderJson(['data'=>$d]);
        }
    }
}