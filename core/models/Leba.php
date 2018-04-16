<?php
/**
 *=============================
 * Created by polly
 * Date: 2018/4/15
 * QQ: 1532755310
 *=============================
 */
namespace app\models;
class Leba extends \yii\db\ActiveRecord
{

    public static function tableName()
    {
        return '{{%leba}}';
    }
    public function rules()
    {
        return [
            [['date'], 'string'],
            [['state'],'number']
        ];
    }
}