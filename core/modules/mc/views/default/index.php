<?php
$urlManager = Yii::$app->urlManager;
?>
<header class="mui-bar mui-bar-nav">
    <a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
    <h1 class="mui-title">首页</h1>
</header>
<div class="mui-content" style="background-color:#fff">
    <ul class="mui-table-view mui-grid-view">
        <?php
        foreach($list as $k=>$v){
            ?>
            <li class="mui-table-view-cell mui-media mui-col-xs-6">
                <a href="<?= $urlManager->createUrl(['mc/movie','id'=>$v['id']]) ?>">
                    <img class="mui-media-object" src="<?= $v['pic_url']?>">
                    <div class="mui-media-body"><?= $v['title']?></div>
                </a>
            </li>
            <?php } ?>
    </ul>
</div>