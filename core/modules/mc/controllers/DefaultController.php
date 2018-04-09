<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/4/9 0009
 * Time: 11:26
 */
namespace app\modules\mc\controllers;



class DefaultController extends Controller{

    public function actionIndex(){
        return $this->render('index');
    }
}