$(function(){
    var search=location.search;
    //1.对URL中获取的中文进行解码
    var kname=decodeURI(search.split("=")[1]);
    if(kname!==""){
        //console.log(kname);
        //2.发送ajax请求
        $.ajax({
            url:"http://127.0.0.1:3000/product/listItem",
            type:"get",
            data:{kname},
            dataType:"json",
            success:function(data){
                //console.log(data);
                if(data.code==1){
                    //3.将获取的数据放到对应的位置,先清空
                    $(".list-right>div.proList").html("");
                    var items=""
                    for(var item of data.msg){
                        items+=`
                        <div class="list-item">
                        <div class="texiao">
                            <div></div>
                            <div></div>
                            <div></div>
                            <div></div>
                            <div></div>
                            <div></div>
                        </div>
                        <div class="item-img">
                            <a href="http://127.0.0.1:3000/product_retrieval.html?lid=${item.lid}">
                                <img src="${item.list_img}">
                            </a>
                        </div>
                        <p class="price">￥${item.price}</p>
                        <p class="pname">${item.fruit_title}</p>
                        <p>
                            <a href="#">${item.dianpu}</a>
                        </p>
                        <p class="item-bottom">
                            <span>评论${item.monthly_count}+</span>
                            <span>月销量${item.monthly_profit}</span>
                            <a href="#"><img src="">联系</a>
                        </p>
                    </div>`; 
                    }
                    $(".list-right>div.proList").html(items);
                }else{
                    //4.没有商品的时候放入推荐
                    $.ajax({
                        url:"http://127.0.0.1:3000/product/tuijian",
                        type:"get",
                        dataType:"json",
                        success:function(data){
                            //console.log(data)
                            if(data.code==1){
                                //4.1将获取的数据放到对应的位置,先清空
                                $(".list-right>div.proList").html("");
                                var tj=`<p style="width:1860px;height:40px;text-align:center;font-size:30px;color:rgb(206, 50, 180);">-------很抱歉!暂无此类商品信息,为您推荐-----</p>`;
                                var items=""
                                for(var item of data.msg){
                                    items+=`
                                    <div class="list-item">
                                    <div class="texiao">
                                        <div></div>
                                        <div></div>
                                        <div></div>
                                        <div></div>
                                        <div></div>
                                        <div></div>
                                    </div>
                                    <div class="item-img">
                                        <a href="http://127.0.0.1:3000/product_retrieval.html?lid=${item.lid}">
                                            <img src="${item.list_img}">
                                        </a>
                                    </div>
                                    <p class="price">￥${item.price}</p>
                                    <p class="pname">${item.fruit_title}</p>
                                    <p>
                                        <a href="#">${item.dianpu}</a>
                                    </p>
                                    <p class="item-bottom">
                                        <span>评论${item.monthly_count}+</span>
                                        <span>月销量${item.monthly_profit}</span>
                                        <a href="#"><img src="">联系</a>
                                    </p>
                                </div>`; 
                                }
                                $(".list-right>div.proList").html(tj+items);
                            }
                        }
                    })
                }
                
            }
        })
    }else{
        $(".list-right>div.proList").html(`<p style="width:1860px;height:50px;text-align:center;font-size:30px;"><b>-------您好!请输入需要查找的商品名称,或返回<a style="color:rgb(206, 50, 180);" href="http://127.0.0.1:3000/index.html">首页</a>-----<b></p>`);
    }
    

    // 看了又看：图片向上滚动
    say2.innerHTML=say1.innerHTML
    function Marquee(){
        if(say2.offsetTop-say.scrollTop<=0)
        say.scrollTop-=say1.offsetHeight
        else{
            say.scrollTop++
        }
    }
    var MyMar=setInterval(Marquee,20)
    say.onmouseover=function() {clearInterval(MyMar)}
    say.onmouseout=function() {MyMar=setInterval(Marquee,20)}
















})