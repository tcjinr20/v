<div class="head">
    <div class="head_inner">
        <div class="head00">
            <form id="formsearch" method="get" action='/s.php' method="get" autocomplete="off" class="searchform">
                <input class="searchinput lf" type="text" id="keyword" name="word" class="input"
                       placeholder="请输入关键词" value=""/><input id="searchbtn" type="submit" value="想看"
                                                             class="searchbtn lf"/></form>

        </div>
    </div>
    <div class="head_inner2" style="display: none">
        <div class="head02 lf">
            <ul>
                <?php foreach($cat as $c ){?>
                    <li><a href="#"><?php echo $c['name']?></a></li>
                <?php } ?>
            </ul>
        </div>
    </div>
</div>

<div class="index_ui">
    <div class="index_ui_2">
        <div class="cts">
            <div class="cts_a02 bd">
                <ul class="cts_list list_lis">
                    <?php foreach ($list as $l){?>
                        <li>
                                <div class="liimg">
                                    <a class="pic_link" href="javascript:void" title="<?=$l['title']?>">
                                        <i></i>
                                        <img src="<?=$l['pic_url']?>" alt="头号玩家"/>
                                        <span><?=$l['cat_two']?></span>
                                    </a>
                                </div>
                                <div class="cts_ms">
                                    <p class="title">
                                        <a href="javascript:void" title="头号玩家"><?=$l['title']?></a>
                                        <span>9.2</span>
                                    </p>
                                    <p class="des"><?=$l['content']?></p>
                                </div>
                                <input type="hidden" class="torrenturl" value="<?=$l['video_url']?>">

                        </li>
                    <?php } ?>
                </ul>
            </div>
        </div>
        <div class="side rt" style="display: none;"><h2><a href="/new/" target="_blank">最近更新</a></h2>　
            <ul>
                <li>

                    <div class="img"><a href="/btdy/dy12636.html" class="preview"
                                        rel="http://gif-china.cc/uploads/allimg/201803/02bd8262a4636dbe.jpg?h=250"
                                        title="经常请吃饭的漂亮姐姐"><img width="30" height="42"
                                                                src="http://gif-china.cc/uploads/allimg/201803/02bd8262a4636dbe.jpg?h=35"
                                                                alt="经常请吃饭的漂亮姐姐"></a></div>
                    <div class="title"><a href="/btdy/dy12636.html" title="经常请吃饭的漂亮姐姐"><p style="color:red;">
                                经常请吃饭的漂亮姐姐</p>

                            <p class="star"><span class="star0"></span>0.0</p></a></div>

                </li>
            </ul>
        </div>
    </div>
</div>
<script type="text/javascript">
    //新建socket
    var socket = io('http://localhost:4324');
    socket.on('connect', function(){
        console.log(socket.id);
    });
    socket.on('news', function (data) {
        console.log(data);
//        window.document.write(JSON.stringify(data))

    });
    socket.on('disconnect', function (){
//        document.write('disconnect')
        socket.close()
    });

    socket.on('connect_error', function (){
//        document.write('connect_error')
        socket.close()
    });

    function send(turl){
        socket.emit('addtorrent', { url: turl });
    }

    $('.cts_list>li').click(function(){
        send($(this).find('.torrenturl').val());
    })
</script>
