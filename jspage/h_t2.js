/**
 * Created by admin on 2016/12/18.
 */
$(function () {

    var data=encodeURIComponent('<div class="top" id="top"> <div class="t_cen" > <div class="he_img"><p class="Yimi">Yimi</p>  </div> <ul> <li><a href="aboutme.html" id="four">关于我</a></li> <li><a href="xile.html" id="three">习乐园</a></li> <li><a href="demo.html" id="two">蚂蚁园</a></li> <li><a href="index.html" id="one">首页</a></li> </ul> </div> </div>');
    document.getElementById("head").innerHTML=decodeURIComponent(data);

})

