<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "{{%option}}".
 *
 * @property integer $id
 * @property integer $store_id
 * @property string $group
 * @property string $key
 * @property string $value
 */
class Option extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%option}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['store_id'], 'integer'],
            [['value'], 'string'],
            [['group', 'key'], 'string', 'max' => 255],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'store_id' => 'Store ID',
            'group' => 'Group',
            'key' => 'Key',
            'value' => 'Value',
        ];
    }

    /**
     * @param $name string Name
     * @param $value mixed Value
     */
    public static function set($name, $value, $store_id = 0, $group = '')
    {
        if (empty($name))
            return false;
        $model = Option::findOne([
            'key' => $name,
            'store_id' => $store_id,
            'group' => $group,
        ]);
        if (!$model) {
            $model = new Option();
            $model->key = $name;
            $model->store_id = $store_id;
            $model->group = $group;
        }
        $model->value = serialize($value);
        return $model->save();
    }

    /**
     * @param $name string Name
     */
    public static function get($name, $store_id = 0, $group = '', $default = null)
    {
        $model = Option::findOne([
            'key' => $name,
            'store_id' => $store_id,
            'group' => $group,
        ]);
        if (!$model)
            return $default;
        return unserialize($model->value);
    }

    /**
     * @param $list array [ ['name'=>'nameA','value'=>'valueA','store_id'=>'store_id','group'=>'group'], ... ]
     * @return boolean
     */
    public static function setList($list, $store_id = 0, $group = '')
    {
        if (!is_array($list))
            return false;
        foreach ($list as $item) {
            self::set($item['name'], $item['value'], (isset($item['store_id']) ? $item['store_id'] : $store_id), (isset($item['group']) ? $item['group'] : $group));
        }
        return true;
    }

    /**
     * @param $names array|string ['nameA','nameB'] or 'nameA,nameB'
     * @return array ['nameA'=>valueA,'nameB'=>valueB]
     */
    public static function getList($names, $store_id = 0, $group = '', $default = null)
    {
        if (is_string($names)) {
            $names = explode(',', $names);
        }
        if (!is_array($names))
            return [];
        $list = [];
        foreach ($names as $name) {
            if (empty($name))
                continue;
            $value = self::get($name, $store_id, $group, $default);
            $list[$name] = $value;
        }
        return $list;
    }


    public static function remove($name, $store_id = 0, $group = '')
    {
        $model = Option::findOne([
            'key' => $name,
            'store_id' => $store_id,
            'group' => $group,
        ]);
        if ($model) {
            return $model->delete();
        }
        return false;
    }

    public static function getGroup($store_id = 0,$group = null)
    {
        if(!$group){
            return [];
        }
        $group_list = Option::findAll(['store_id'=>$store_id,'group'=>$group]);
        $list = [];
        foreach($group_list as $k=>$v){
            $list[$v->key] = unserialize($v->value);
        }
        return $list;
    }
}
