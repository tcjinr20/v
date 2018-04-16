<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/4/9 0009
 * Time: 11:26
 */
namespace app\modules\cc\controllers;

use app\modules\cc\models\VideoForm;
use app\models\Cat;

class DefaultController extends Controller{

    public function actionIndex(){
        $form = new VideoForm();
        $form->store_id = $this->store_id;
        $form->attributes = \Yii::$app->request->get();
        $back=$form->pagelist();
        $cat=Cat::findAll(['store_id'=>1]);

        if (\Yii::$app->request->get('is_ajax'))
            $this->renderJson($back);
        else{
            return $this->render('index',['list'=>$back['data']['list'],'cat'=>$cat]);
        }
    }
}