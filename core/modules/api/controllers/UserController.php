<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/10/10
 * Time: 14:26
 */

namespace app\modules\api\controllers;


use app\models\User;
use app\modules\api\behaviors\LoginBehavior;
use app\modules\api\models\BuyVideoForm;
use app\modules\api\models\CollectForm;
use app\modules\api\models\CollectVideoForm;
use app\modules\api\models\CommentForm;
use app\modules\api\models\CommentListForm;
use app\modules\api\models\ListForm;
use app\modules\api\models\PrewForm;
use app\modules\api\models\ThumpForm;
use app\modules\api\models\UserCommentForm;
use app\modules\api\models\VideoForm;

class UserController extends Controller
{
    public function behaviors()
    {
        return array_merge(parent::behaviors(), [
            'login' => [
                'class' => LoginBehavior::className(),
            ],
        ]);
    }

    /**
     * 收藏&取消收藏
     */
    public function actionCollect()
    {
        $form = new CollectForm();
        $form->store_id = $this->store->id;
        $form->user_id = \Yii::$app->user->identity->id;
        $form->attributes = \Yii::$app->request->get();
        $this->renderJson($form->save());
    }

    /**
     * 视频详情
     */
    public function actionVideo()
    {
        $form = new VideoForm();
        $form->store_id = $this->store->id;
        $form->user_id = \Yii::$app->user->identity->id;
        $form->attributes = \Yii::$app->request->get();
        $this->renderJson($form->search());
    }

    /**
     * 收藏的视频列表
     */
    public function actionCollectVideo()
    {
        $form = new CollectVideoForm();
        $form->store_id = $this->store->id;
        $form->user_id = \Yii::$app->user->identity->id;
        $form->attributes = \Yii::$app->request->get();
        $this->renderJson($form->search());
    }

    /**
     * 首页视频列表
     */
    public function actionVideoList()
    {
        $form = new ListForm();
        $form->store_id = $this->store->id;
        $form->user_id = \Yii::$app->user->identity->id;
        $form->attributes = \Yii::$app->request->get();
        $this->renderJson($form->getList());
    }

    /**
     * 评论发布
     */
    public function actionComment()
    {
        $post = \Yii::$app->request->post();
        $form = new CommentForm();
        $form->store_id = $this->store->id;
        $form->user_id = \Yii::$app->user->identity->id;
        $form->attributes = $post;
        $this->renderJson($form->save());
    }

    /**
     * 评论列表
     */
    public function actionCommentList()
    {
        $form = new CommentListForm();
        $form->store_id = $this->store->id;
        $form->user_id = \Yii::$app->user->identity->id;
        $form->attributes = \Yii::$app->request->get();
        $this->renderJson($form->search());
    }

    /**
     * 未评论点赞
     */
    public function actionThump()
    {
        $form = new ThumpForm();
        $form->store_id = $this->store->id;
        $form->user_id = \Yii::$app->user->identity->id;
        $form->attributes = \Yii::$app->request->get();
        $this->renderJson($form->save());
    }

    /**
     * 评论过我的
     */
    public function actionUserComment()
    {
        $form = new UserCommentForm();
        $form->store_id = $this->store->id;
        $form->user_id = \Yii::$app->user->identity->id;
        $form->attributes = \Yii::$app->request->get();
        $this->renderJson($form->search());
    }

    /**
     * 用户状态
     */
    public function actionIndex()
    {
        $user = User::findOne(['id' => \Yii::$app->user->identity->id, 'store_id' => $this->store->id]);
        if (!$user) {
            $this->renderJson([
                'code' => -1,
                'msg' => ''
            ]);
        }
        $due_time = date('Y-m-d', $user->due_time);
        $this->renderJson([
            'code' => 0,
            'msg' => '',
            'data' => [
                'user_info' => (object)[
                    'access_token' => $user->access_token,
                    'nickname' => $user->nickname,
                    'avatar_url' => $user->avatar_url,
                    'id' => $user->id,
                    'is_comment' => $user->is_comment,
                    'is_clerk' => $user->is_clerk,
                    'is_member' => $user->is_member,
                    'due_time' => $user->due_time ? $due_time : 0,
                ]
            ]
        ]);
    }

    /**
     * 已购买过的视频
     */
    public function actionBuyVideo()
    {
        $form = new BuyVideoForm();
        $form->store_id = $this->store->id;
        $form->user = \Yii::$app->user->identity;
        $form->attributes = \Yii::$app->request->get();
        $this->renderJson($form->search());
    }
}