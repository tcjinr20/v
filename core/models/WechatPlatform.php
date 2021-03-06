<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "{{%wechat_platform}}".
 *
 * @property integer $id
 * @property integer $acid
 * @property integer $user_id
 * @property string $name
 * @property string $app_id
 * @property string $app_secret
 * @property string $desc
 * @property string $mch_id
 * @property string $key
 * @property string $cert_pem
 * @property string $key_pem
 * @property integer $addtime
 * @property integer $is_delete
 */
class WechatPlatform extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%wechat_platform}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['acid', 'user_id', 'addtime', 'is_delete'], 'integer'],
            [['user_id', 'name', 'app_id', 'app_secret'], 'required'],
            [['cert_pem', 'key_pem'], 'string'],
            [['name', 'app_id', 'app_secret', 'desc', 'mch_id', 'key'], 'string', 'max' => 255],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'acid' => 'Acid',
            'user_id' => 'User ID',
            'name' => 'Name',
            'app_id' => 'App ID',
            'app_secret' => 'App Secret',
            'desc' => 'Desc',
            'mch_id' => 'Mch ID',
            'key' => 'Key',
            'cert_pem' => 'Cert Pem',
            'key_pem' => 'Key Pem',
            'addtime' => 'Addtime',
            'is_delete' => 'Is Delete',
        ];
    }
}
