<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/10/10
 * Time: 19:07
 */

namespace app\modules\mc\models;


use app\extensions\getInfo;
use app\extensions\TimeToDay;
use app\models\Collect;
use app\models\Form;
use app\models\Order;
use app\models\User;
use app\models\Video;
use app\models\VideoPay;
use yii\data\Pagination;

class VideoForm extends Model
{
    public $store_id;
    public $limit=10;
    public $page=0;
    public $video_id=0;

    public function rules()
    {
        return [];
    }

    public function pagelist(){
        if (!$this->validate())
            return $this->getModelError();
        $query = Video::find()->where(['is_delete' => 0, 'store_id' => $this->store_id]);
        $count = $query->count();
        $p = new Pagination(['totalCount' => $count, 'pageSize' => $this->limit, 'page' => $this->page]);
        $list = $query->select([
            'id', 'pic_url', 'title', 'video_time','status','style'
        ])->orderBy(['addtime' => SORT_DESC])->limit($p->limit)->offset($p->offset)->asArray()->all();

        foreach ($list as $index => $value) {
            $list[$index]['video_time'] = TimeToDay::time($value['video_time']);
        }
        return [
            'code' => 0,
            'msg' => 'success',
            'data' => [
                'list' => $list
            ]
        ];
    }

    public static function randomVideo(){
        $query = Video::find()->where(['is_delete' => 0]);
        $count=$query->count();
        if($count>7){
            $cou =[];
            while(count($cou)<5){
                $r=rand(1,$count);
                if(!in_array($r,$cou))
                    $cou[]=rand(1,$count);
            }

            Video::findAll(['id'=>$cou,'is_delete' => 0]);
        }else{
            return Video::findAll(['is_delete' => 0]);
        }
    }

    public function getMovie(){
        if (!$this->validate())
            return $this->getModelError();
        $old_video = Video::findOne([
            'store_id' => $this->store_id,
            'is_delete' => 0,
            'id' => $this->video_id,
        ]);
        return $old_video;
    }

    public function search()
    {
        if (!$this->validate())
            return $this->getModelError();
        $old_video = Video::findOne([
            'store_id' => $this->store_id,
            'is_delete' => 0,
            'id' => $this->video_id,
        ]);
        $old_video->page_view += 1;
        $old_video->save();
        $video = Video::find()->alias('v')->where([
            'v.store_id' => $this->store_id,
            'v.is_delete' => 0,
            'v.id' => $this->video_id,
        ])->select([
            'v.*'
        ])->asArray()->one();
        $video['video_time'] = TimeToDay::time($video['video_time']);
        $video['page_view'] = TimeToDay::getPageView($video['page_view']);
        if($video['type'] == 1){//��Ѷ��Ƶ����
            $res = getInfo::getVideoInfo($video['video_url']);
            $video['video_url'] = $res['url'];
        }
        $collect = Collect::find()->where(['store_id' => $this->store_id, 'video_id' => $this->video_id, 'user_id' => $this->user_id])->one();
        if (!$collect) {
            $video['collect'] = 1;
        } else {
            $video['collect'] = $collect->is_delete;
        }
        $video['collect_count'] = Collect::find()->where(['store_id' => $this->store_id, 'video_id' => $this->video_id, 'is_delete' => 0])->count();

        $form_list = Form::find()->select([
            'name', 'type', 'required', 'default', 'tip'
        ])->where(['store_id' => $this->store_id, 'video_id' => $video['id'], 'is_delete' => 0])->orderBy(['sort' => SORT_ASC])->asArray()->all();
        $form_name = null;
        foreach ($form_list as $index => $value) {
            $form_list[$index]['value'] = $value['default'];
            if($value['type'] == 'form_name'){
                $form_name = $value['name'];
            }
        }
        $video['form_list'] = $form_list;
        $video['form_name'] = $form_name;
        $video_list = $this->getGroom($this->store_id,$this->video_id);
        $video_pay = VideoPay::find()->where(['store_id'=>$this->store_id,'video_id'=>$video['id']])->asArray()->orderBy(['id'=>SORT_DESC])->one();
        $video_pay['d_time'] = TimeToDay::date($video_pay['time']);
        $order = Order::find()->where([
            'store_id'=>$this->store_id,'type'=>1,'is_pay'=>1, 'video_id'=>$video['id'],
            'user_id'=>$this->user_id,'is_delete'=>0
        ])->exists();
        if($order){
            $video['is_pay'] = 0;
        }
        $user = User::findOne(['id'=>$this->user_id]);
        if($user->is_member == 1){
            $video['is_pay'] = 0;
        }
        return [
            'code' => 0,
            'msg' => 'success',
            'data' => [
                'video' => $video,
                'video_list' => $video_list,
                'video_pay'=>$video_pay
            ]
        ];
    }

    /**
     * @param $store_id
     * @param $video_id
     * @return array|\yii\db\ActiveRecord[]
     */
    public static function getGroom($store_id,$video_id)
    {
        $video = Video::findOne(['id'=>$video_id,'store_id'=>$store_id]);
        $video_list = Video::find()->select([
            'id', 'pic_url', 'title', 'video_time','style'
        ])->where([
            'store_id' => $store_id,
            'is_delete' => 0,
            'cat_id' => $video['cat_id'],
            'status'=>0
        ])->andWhere(['!=', 'id', $video_id])->orderBy(['sort' => SORT_ASC])->limit(10)->asArray()->all();
        if (!$video_list) {
            $video_list = Video::find()->select([
                'id', 'pic_url', 'title', 'video_time'
            ])->where([
                'store_id' => $store_id,
                'is_delete' => 0,
                'status' => 0
            ])->andWhere(['!=', 'id', $video_id])->orderBy(['sort' => SORT_ASC])->limit(10)->asArray()->all();
        }
        foreach ($video_list as $index => $value) {
            $video_list[$index]['video_time'] = TimeToDay::time($value['video_time']);
        }
        return $video_list;
    }
}