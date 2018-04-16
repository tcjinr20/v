<?php
/**
 *=============================
 * Created by polly
 * Date: 2018/4/13
 * QQ: 1532755310
 *=============================
 */

defined('YII_RUN') or exit('Access Denied');
$urlManager = Yii::$app->urlManager;
?>
<form action="<?=$urlManager->createUrl('admin/passport/log') ?>" method="post">
    <div class="form-group">
        <label for="exampleInputEmail1">Email address</label>
        <input type="text" name="name" class="form-control" placeholder="Email">
    </div>
    <div class="form-group">
        <label for="exampleInputPassword1">Password</label>
        <input type="password" name="password" class="form-control"  placeholder="Password">
    </div>
    <button type="submit" class="btn btn-default">Submit</button>
</form>

