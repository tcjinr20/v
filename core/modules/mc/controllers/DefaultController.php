<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/4/9 0009
 * Time: 11:26
 */
namespace app\modules\mc\controllers;

use app\modules\mc\models\VideoForm;

class DefaultController extends Controller{

    public function actionIndex(){
        $form = new VideoForm();
        $form->store_id = $this->store_id;
        $form->attributes = \Yii::$app->request->get();
        $back=$form->pagelist();
        if (\Yii::$app->request->get('is_ajax'))
            $this->renderJson($back);
        else{
            return $this->render('index',['list'=>$back['data']['list']]);
        }
    }
}