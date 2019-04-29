$(function(){
    //var uid=1;
    var pno=1;
    var pageSize=6;
    $.ajax({
        url:"http://127.0.0.1:3000/user/selectCart",
        type:"get",
        data:{pno,pageSize},
        dataType:"json",
        success:function(data){
            //console.log(data);
            //默认将返回的购物车数据动态生成到页面中
            if(data.code==-1){
                var html=`<p class="kong"><img src="./images/index/header/2.png">${data.msg}<a href="http://127.0.0.1:3000/index.html">去购物</a></p>`;
                $("div.content").append(html);
            }else if(data.code==0){//未登录
                //alert(data.msg);
                var html=`<p class="kong"><img src="./images/index/header/2.png">您还未登录，请<a href="http://127.0.0.1:3000/user_login.html">登录</a></p>`;
                $("div.content").append(html);
                
                //修改头信息
                $("#myHeader #header div.container>ul:first-child>li:first-child").html(`你好,请<a href="http://127.0.0.1:3000/user_login.html">登录&nbsp;</a>`);
            }else{
                var carts="";
                for(var cart of data.msg){
                    carts+=`<div class="g-item">
                    <p class="check-box">
                        <input type="checkbox" name="check">
                        <img src="${cart.img}">
                    </p>
                    <p class="goods">
                        ${cart.cart_title}<br><br>
                        <span>${cart.p_zhonglei}</span>
                    </p>
                    <p class="price">&yen;${cart.price.toFixed(2)}</p>
                    <p class="count">
                        <a href="javascript:void(0)" class="minus">-</a>
                        <input type="text" value="${cart.num}">
                        <a href="javascript:void(0)" class="add">+</a>
                    </p>
                    <p class="sum">
                        <b>&yen;${(cart.price*cart.num).toFixed(2)}</b>
                    </p>
                    <p class="action" data-id="${cart.id}">移除</p>
                        </div>`;
                }
                //插入到父元素下
                $("div.content").html(carts);
            }
            
            //绑定事件，计算小计
            countItem();
            //1. 全选和取消全选
            var isChecked =false;//标识选中和非选中状态
            $("#checkAll").click(function (){
                isChecked=!isChecked
                //点击事件修改按钮的选中状态
                var checked = $(this).prop("checked");
                console.log(checked);
                $("[name=check]").prop("checked",checked);
                countItem();
            })
            //2. 反选
            //change()对应onchange事件监听按钮的选中状态,每次状态的切换都会触发
            $("[name=check]").change(function (){
                /*
                条件 :未被选中的商品数量 == 0 对应全选
                    not()表示否定筛选;
                    size()用于获取元素数量  (length)
                    input:checked用于匹配被选中的元素
                */
                if($("[name=check]:not(:checked)").length>0){
                    //修改全选按钮的选中状态
                    $("#checkAll").prop("checked",false);
                    //修改全选标记
                    isChecked = true;
                }else{
                    $("#checkAll").prop("checked",true);;
                    isChecked = false;
                }
                countItem();
            
            })

            //3.数量增减
            $(".add").click(function (){
                //获取前一个兄弟元素的文本内容
                var value = $(this).prev().val();
                //修改文本框的值
                $(this).prev().val(++value);
                //价格联动 : 单价 * 数量
                var priceStr = $(this).parent().prev().html();//"$188"
                var price = priceStr.substring(1);//"188"
                var sum = (price * value).toFixed(2);
                //修改小计
                $(this).parent().next().html("<b>&yen;"+sum+"</b>");
                countItem();
            })
            $(".minus").click(function (){
                //获取下一个兄弟元素
                var value = $(this).next().val();
                if(value > 1){
                    $(this).next().val(--value);
                }
                //价格联动 : 单价 * 数量
                var priceStr = $(this).parent().prev().html();//"$188"
                var price = priceStr.substring(1);//"188"
                var sum =(price * value).toFixed(2);
                //修改小计
                $(this).parent().next().html("<b>&yen;"+sum+"</b>");
                countItem();
            })
            //4. 价格联动(输入框失去焦点)
            $(".count input").blur(function (){
                //数量
                var value = $(this).val();
                //单价字符串
                var priceStr = $(this).parent().prev().html();
                //截取数值
                var price = priceStr.substring(1);//"188"
                var sum = price * value;
                //修改小计
                $(this).parent().next().html("<b>&yen;"+sum+"</b>");
                countItem();
            })
            //5. 移除操作
            //5.1 封装一个移除商品的函数
            function deleteCart($btn,id){
                if(id){
                    $.ajax({
                        url:"http://127.0.0.1:3000/user/deleteCart",
                        type:"get",
                        data:{id},
                        dataType:"json",
                        success:function(data){
                            //console.log(data.code);
                            if(data.code==1){
                                // 获取父元素g-item,移除当前的父元素 //删除多个商品
                                $btn.parent().remove();
                                countItem();
                                console.log("成功删除")
                                // history.go(0);
                                if($("div.content").html()==""){
                                    $("div.content").html(`<p class="kong"><img src="./images/index/header/2.png">您的购物车还是空的<a href="http://127.0.0.1:3000/index.html">去购物</a></p>`);
                                }
                            }else{
                                alert("删除失败！");
                            }
                        }
                    })  
                }else{
                    alert("没有选中需要删除的商品！")
                }
                
            }
            //5.2 单个商品移除操作
            $(".g-item .action").click(function (){
                var $btny=$(this);
                //获取当前商品在购物车中的id
                var id=$btny.attr("data-id");
                //console.log($btny,id);
                deleteCart($btny,id);//调用删除函数
            })
            //5.3多个商品删除
            $("#xuanxiang>p:first-child").click(function(){
                var ids="";
                //找到状态为flase对应的商品下的ID
                var $btns=$("div.content p.check-box>input:checked").parent().parent().children(":last-child");
                //遍历需要删除的商品id
                $("div.content p.check-box>input:checked").each(function(){
                     ids+=$(this).parent().parent().children(":last-child").attr("data-id")+",";
                })
                ids=ids.slice(0,ids.length-1);
                //console.log(ids);
                deleteCart($btns,ids);
            })









            //6. 工具栏价格和数量统计
            function countItem(){
                var count = 0; //保存总数量
                var price = 0; //保存总价格
                //获取被选中的商品数量/价格,做累加
                $("[name=check]:checked").each(function (){
                    //each()用于遍历数组或集合,每取到一个元素,自动调用相关函数 $(this)取到选择框
                    count += Number($(this).parents(".g-item").find(".count input").val());
                    //获取价格
                    var priceStr = $(this).parents(".g-item").find(".sum b").html(); //"$188"
                    //截取和转换
                    var priceNum = Number(priceStr.substring(1));
                    price += priceNum;	
                })
                //累加结束显示在工具栏
                $(".submit-count span").html(count);
                $(".submit-price span").html("&yen;"+price.toFixed(2));
            }


           //清空失效宝贝
           $("#cart-toolbar>div:nth-child(1)>p:last-child").click(function(){
               alert("购物车中暂时没有失效宝贝！您可以放心购买。")
           })





            //去结算
            $("#cart-toolbar>div:nth-child(2)>p:last-child").click(function(){
                //遍历需要购买的商品id
                var ids="";
                $("div.content p.check-box>input:checked").each(function(){
                    ids+=$(this).parent().parent().children(":last-child").attr("data-id")+",";
                })
                ids=ids.slice(0,ids.length-1);
                console.log(ids);
                //如果ids不等于空，跳转到结算页面
                if(ids!=""){
                    open("http://127.0.0.1:3000/payment.html?ids="+ids,"_self");
                }else{
                    alert("请选择您所需要购买的商品");
                }
                
            })







        }
    })







})