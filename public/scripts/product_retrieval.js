$(function(){
    //1.获得地址栏中的search部分
    //1.1将search按=切割，取第2部分
    var search=location.search;
    if(search!==""){
    var lid=search//?lid=9
            .split("=")//[?lid, 9]
            [1];//9
    $.ajax({
      url:"http://127.0.0.1:3000/product/retrieval",
      type:"get",
      data:{lid},
      dataType:"json",
      success:function(output){
      //1.2从output大对象中解构出三个小部分分别使用
        var {product,pics,specs,param}=output;
        if(specs==""){//如果商品不存在
          $("div.pic>img").prop("src","./images/details/xiangqing/zanwu.jpg").css({"width":"350px","height":"350px"});
          console.log(123);
          return;
        }
        //console.log(specs[0].title)
      //1. 3将商品基本信息显示到右上方的对应元素中
        $(".ret-name>h5:first-child").html(specs[0].title).next().children("div:nth-child(2)").children("h4").html(`${specs[0].price.toFixed(2)}`);
        $(".ret-name>div:nth-child(3)>h5").html(`${specs[0].weight}kg`);
        //更换副标题
        $("div.d-flex>a.a-xg").html(specs[0].subtitle);
        /*1.4优惠劵部分,放入到指定区域 */
        //console.log(specs[0])
        var promotion=specs[0].promotion.split(",");
        var youhui="";
        for(var yh of promotion){
          youhui+=`<a href="#" class="a-name">${yh}</a>`
        }
        $(".ret-name>div:nth-child(2)>div:nth-child(3)>span").after(youhui);
        //2.放入商品规格
        /*将规格种类放入指定区域 */
        var guige="";
        for(var g=0;g<specs.length;g++){
          var sid=specs[g].sid;//放入当前商品信息
          var img=specs[g].img;
          var speci=specs[g].specificatin;
          guige+=`<li class="float-left m-1" data-sid="${sid}">
          <img class="float-left" src="${img}" alt=""/>
          <p  class="float-left">${speci}</p></li>`;
        }
        $(".select>div:nth-child(2)>ul:first-child").append(guige);
        //3.图片详情，大图，中图，小图
       /*将小图片动态生成到小图列表底部 自定义属性放入对应的中图和大图*/
        var smList=""
        for(var t=0;t<pics.length;t++){
          var sm=pics[t].sm;
          var md=pics[t].md;
          var lg=pics[t].lg;
          smList+=`<li><img src = "${sm}" data-md="${md}" data-lg="${lg}" alt = ""></li>`;
        }
        $(".Lis>div>ul:only-child").append(smList)
        .css("width",54*pics.length);//计算小图中ul的宽度
        //4.放入商品介绍
        //详情页底部数据图片
        //console.log(param)
        var par=param[0];
        //console.log(par);
        $("#d1>div:first-child>ul:nth-child(2)").html(`
          <li class="mr-5 ml-5">
              <ul>
                  <li>厂名：${par.manufacturer}</li>
                  <li>配料：${par.dosing}</li>
                  <li>食品添加剂：无</li>
                  <li>产地：${par.field}</li>
              </ul>
          </li>
          <li class="mr-5 ml-5">
              <ul>
                  <li>厂址：${par.factory}</li>
                  <li>品牌：${par.trademark}</li>
                  <li>省份：${par.proince}</li>
                  <li>服务：${par.server}</li>
              </ul>
          </li>
          <li>
              <ul>
                  <li>厂家联系方式：${par.vender_phone}</li>
                  <li>特产品类: ${par.spaecial_kid}</li>
                  <li>城市: ${par.city}</li>
                  <li>商品毛重：2.0kg</li>
              </ul>
          </li>
          `).next().html(`<img src="${par.lgimg}">`)
        


       /*将第一张中图放入指定中图区域 */
       var md=pics[0].md;
        $("div.pic>img").prop("src",md);
       /*将第一张大图放入指定大图区域 */
       var lg=pics[0].lg;
       $("div.detail").css("backgroundImage","url('"+lg+"')");
       //5.放大镜效果
       /* 鼠标进入小图标，切换中图和大图*/
       //5.1保存中图片元素,大图片元素
       var $mImg=$("div.pic>img");
       var $lgDiv=$("div.detail");
       $(".Lis>div>ul:only-child").on("mouseenter","img",function(){
         //获得当前图片的data-md和data-lg,分别给中图和大图
         var $img=$(this);
         $mImg.attr("src",$img.attr("data-md"));
         $lgDiv.css("background-image",`url(${$img.attr("data-lg")})`
         );
       });
       //5.2鼠标进入中图，控制遮罩层和大图的显示
        $(".itemarea .pic").hover(
          function(){
            $(".cover").css("display","block");
            $(".detail").css("display","block");
          },
          function(){
            $(".cover").css("display","none");
            $(".detail").css("display","none");
          }
        )
        /*5.3鼠标移动，放大镜事件 */
        $(".itemarea .pic").on("mousemove","div",function(e){
            var x=e.offsetX,y=e.offsetY;
            //console.log(x,y);
            var tx=x-200/2,ty=y-200/2;
            if(tx<0){tx=0;}
            if(ty<0){ty=0;}
            if(tx>150){tx=150;}
            if(ty>150){ty=150;}
            $(".cover").css({left:tx,top:ty});
            $("div.detail").css("backgroundPosition",`${-tx*2}px ${-ty*2}px`);
        })

       /*小图列表的左右移动*/
       //6.0如果pics的图片张数<=5，就要禁用右边按钮
       $(".Lis>a:first-child").addClass("disabled");
        if(pics.length<=5){
          $(".Lis>a:last-child").addClass("disabled");
          
        }
        //查找要修改的ul
        var $ulImgs=$(".Lis>div>ul:only-child");
        //定义moved保存已经左移的个数
        var moved=0;
        //单价右边按钮向左移动
        $(".Lis>a:last-child").click(function(e){
          e.preventDefault();
          var $btnRight=$(this);
          //如果当前不是禁用的
          if(!$btnRight.is(".disabled")){
            moved++;
            $ulImgs.css("margin-left",-54*moved);
            //如果多余的li移动完，就禁用
            if(pics.length-moved==5){
              $btnRight.addClass("disabled");
            }
            //只要右边按钮点击一下，左边按钮一定启用
            $btnRight.prevAll("a").removeClass("disabled")
          }
        })
        //6.1点击左边的按钮，向右移动
        $(".Lis>a:first-child").click(function(e){
          e.preventDefault();
          var $btnLeft=$(this);
          if(!$btnLeft.is(".disabled")){
            moved--;//左移的个数
            //点击一下左边距加54
            $ulImgs.css("margin-left",-54*moved);
            //如果左移的li个数为0，就禁用当前按钮
            if(moved==0){
              $btnLeft.addClass("disabled");
            }
            //只要左边点击一下，右边按钮一定启用
            $btnLeft
            .nextAll("a").removeClass("disabled");
          }
        })
        
        //7.0点击图片规格，更换信息
        $("ul.spec>li").click(function(e){
            $(this).addClass("click").siblings().removeClass("click");
            //获取当前商品sid
            var sid=$(this).attr("data-sid");
            //查询单个商品信息
            $.ajax({
              url:"http://127.0.0.1:3000/product/spec",
              type:"get",
              data:{sid},
              dataType:"json",
              success:function(data){
                //console.log(data[0].promotion);
                var spec=data[0];
                //更换商品基本信息
                $(".ret-name>h5:first-child").html(spec.title).next().children("div:nth-child(2)").children("h4").html(`${spec.price.toFixed(2)}`);
                //更换副标题
                $(".ret-name>div:nth-child(3)>h5").html(`${spec.weight}kg`);
                $("div.d-flex>a.a-xg").html(spec.subtitle);
                //更换优惠信息
                var promotion=data[0].promotion.split(",");
                //console.log(promotion)
                var youhui="<span>优 惠 券</span>";
                for(var yh of promotion){
                  youhui+=`<a href="#" class="a-name">${yh}</a>`
                }
                //先清除div已有的子元素
                $(".ret-name>div:nth-child(2)>div:nth-child(3)").children().remove();
                //重新在末尾追加元素
                $(".ret-name>div:nth-child(2)>div:nth-child(3)").append(youhui);
              }
            })
        })



        //8.0加入购物车
        $("div.car>a:nth-child(2)").click(function(e){
          e.preventDefault();
          //8.1获取当前商品的所有数据
          var sid=$("div.select>div>ul.spec>li.click").attr("data-sid");
          //var uid=1;//测试用户
          var img=$("div.select>div>ul.spec>li.click>img").attr("src");
          var cart_title=$("div.ret-name>h5:first-child").html();
          var p_zhonglei=$("div.select>div>ul.spec>li.click>p").html();
          var price=$("div.ret-name>div:nth-child(2)>div:nth-child(2)>h4").html();
          var num=$("div.count>span:nth-child(3)").html();
          if(!sid){return alert("请您选择商品种类！")}
          //8.2通过商品id和用户ID添加商品至购物车
          $.ajax({
            url:"http://127.0.0.1:3000/user/addcart",
            type:"get",
            data:{sid,img,p_zhonglei,cart_title,price,num},
            dataType:"json",
            success:function(data){
              //console.log(data)
              if(data.code==0){
                alert(data.msg);
              }else if(data.code==1){
                alert(data.msg);
              }else{
                alert(data.msg);
              }
            }
          })
        })
        
        //9.0立即购买，跳转到确认订单页面
        $("div.ret-name>div:last-child>a:first-child").click(function(e){
           e.preventDefault()
          //9.1 先判断用户是否登录
          $.ajax({
            url:"http://127.0.0.1:3000/user/isLogin",
            type:"get",
            dataType:"json",
            success:function(data){
                //console.log(data);
                if(data.code==1){
                  return  alert("用户未登录！")
                }else{
                  //9.1获得当前商品购买数量和规格id，以及当前的用户ID后台
                  var num=$("div.count>span:nth-child(3)").html();
                  var sid=$("div.ret-name>div.select>div>ul>li.click").attr("data-sid");
                  console.log(sid,num);
                  if(sid&&num){
                    open("http://127.0.0.1:3000/payment.html?sid="+sid+"&num="+num,"_self");
                  }else{
                    alert("请选择商品的规格！")
                  }
                }
            }
          })  
        })





















        

      }
    }) 
  }
})       



   