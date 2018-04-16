<?php
$urlManager = Yii::$app->urlManager;
?>
<header class="mui-bar mui-bar-nav">
    <a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
    <h1 class="mui-title"><?=$movie['title']?></h1>
</header>
<div class="mui-content" id="news">
    <!--顶部banner图 开始-->
    <div class="banner">
        <a href="javascript:;">
            <div id="video" style="width: 100%;height: 100%;max-height: 300px"></div>
        </a>
    </div>
    <!--顶部banner图 结束-->

    <!--列表信息流 开始-->
    <ul class="mui-table-view">
        <?php foreach($list as $k=>$v){
            if($k%2==0){
                ?>
                <li class="mui-table-view-cell mui-media">
                    <a href="<?= $urlManager->createUrl(['mc/movie','id'=>$v['id']]) ?>">
                        <img class="mui-media-object mui-pull-left" src="<?=$v['pic_url']?>">
                        <div class="mui-media-body">
                            <?=$v['title']?>
                            <p class='mui-ellipsis'><?=$v['content']?></p>
                        </div>
                    </a>
                </li>
                <?php
            }else{
                ?>
                <li class="mui-table-view-cell mui-media">
                    <a href="javascript:;">
                        <img class="mui-media-object mui-pull-right" src="<?=$v['pic_url']?>">
                        <div class="mui-media-body">
                            <?=$v['title']?>
                            <p class='mui-ellipsis'><?=$v['content']?></p>
                        </div>
                    </a>
                </li>
                <?php
            }
        } ?>
    </ul>
    <!--列表信息流 结束-->
</div>
<script src="js/ckplayer/ckplayer.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
    var videoObject = {
        container: '#video',
        cktrack: 'images/srt.srt', //字幕文件
        poster: '<?=$v['pic_url']?>', //封面图片
        mobileCkControls:false,
    }
    var player = new ckplayer(videoObject);
    function changeVideo(videoUrl) {
        if(player == null) {
            return;
        }

        var newVideoObject = {
            container: '#video', //容器的ID
            variable: 'player',
            autoplay: false, //是否自动播放
            video: videoUrl
        }
        //判断是需要重新加载播放器还是直接换新地址

        if(player.playerType == 'html5video') {
            if(player.getFileExt(videoUrl) == '.flv' || player.getFileExt(videoUrl) == '.m3u8' || player.getFileExt(videoUrl) == '.f4v' || videoUrl.substr(0, 4) == 'rtmp') {
                player.removeChild();
                player = null;
                player = new ckplayer();
                player.embed(newVideoObject);
            } else {
                player.newVideo(newVideoObject);
            }
        } else {
            if(player.getFileExt(videoUrl) == '.mp4' || player.getFileExt(videoUrl) == '.webm' || player.getFileExt(videoUrl) == '.ogg') {
                player = null;
                player = new ckplayer();
                player.embed(newVideoObject);
            } else {
                player.newVideo(newVideoObject);
            }
        }
    }

    changeVideo('<?=$movie['video_url']?>')
</script>