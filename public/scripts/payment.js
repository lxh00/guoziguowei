$(function(){
    //1.从购物车中查询需要购买的商品信息
    var seach=location.search;
    if(seach!==""){
        //1.1遍历字符串中是否存在&符号
        var arrSe=seach.match(/&/i);
        //console.log(arrSe)
        if(arrSe!=null){
            //1.2如果地址栏中含有&符号，则是单件商品购买
            //查询对应的商品规格的id号，以及保存当前商品的购买数量 
            var sid=seach.split("&")[0].split("=")[1];
            var num=seach.split("&")[1].split("=")[1];
            console.log(sid,num);
            //1.3去后台规格表中查询对应的商品信息
            $.ajax({
                url:"http://127.0.0.1:3000/user/settle",
                type:"get",
                data:{sid},
                dataType:"json",
                success:function(data){
                    console.log(data)
                    if(data.code==1){
                        var paym=data.msg[0];
                        //1.4将获取到的商品信息添加到订单表中
                        $("#table>tbody").html(`<tr align="center" data-itemId="${sid}" data-cid="">
                        <td style="width:100px;">
                            <img style="width:70px;" src="${paym.img}">
                        </td>
                        <td style="width:380px;text-align: left"><h6>${paym.title}</h6><span>${paym.specificatin}</span></td>
                        <td style="color:red;">￥${parseFloat(paym.price).toFixed(2)}</td>
                        <td>${parseFloat(num)}</td>
                        <td style="color:red;font-size:20px;">￥${(paym.price*num).toFixed(2)}</td>
                        <td>有货</td>
                        </tr>`);
                        //1.5计算购买的商品价格
                        $("#dingdan+div.tijiao>p>span:nth-child(2)").text(`￥${(paym.price*num).toFixed(2)}`);
                    }else if(data.code==-2){
                        alert(data.msg);
                    }
                }
            })
        }else{
            //1.3否则就是从购物车查询的商品
            var ids=seach.split("=")[1];
            $.ajax({
                url:"http://127.0.0.1:3000/user/settles",
                type:"get",
                data:{ids},
                dataType:"json",
                success:function(data){
                    //console.log(data);
                    //2.将商品信息添加到订单页中
                    var payment="";
                    var yingfu=0;
                    if(data.code==1){
                        for(var paym of data.msg){
                            payment+=`
                            <tr align="center" data-itemId="${paym.item_id}" data-cid="${paym.id}">
                                <td style="width:100px;">
                                    <img style="width:70px;" src="${paym.img}">
                                </td>
                                <td style="width:380px;text-align: left"><h6>${paym.cart_title}</h6><span>${paym.p_zhonglei}</span></td>
                                <td style="color:red;">￥${parseFloat(paym.price).toFixed(2)}</td>
                                <td>${parseFloat(paym.num)}</td>
                                <td style="color:red;font-size:20px;">￥${(paym.price*paym.num).toFixed(2)}</td>
                                <td>有货</td>
                            </tr>`;
                            yingfu=`${yingfu}+${(paym.price*paym.num).toFixed(2)}`;
                        yingfu=eval(yingfu).toFixed(2);
                        }
                        //3.将商品,总计插入到页面中
                        $("#table>tbody").html(payment);
                        $("#dingdan+div.tijiao>p>span:nth-child(2)").text(`￥${yingfu}`);   
                    }else if(data.code==-2){
                        alert(data.msg);
                    }
                }  
            })
        }
        
    }else{
        alert("您查询的商品号不存在！")
    }
    
    //0.2将用户地址显示当前
    $.ajax({
        url:"http://127.0.0.1:3000/user/city",
        type:"get",
        dataType:"json",
        success:function(data){
            //console.log(data)
            if(data.code==1){
                //0.3显示前默认地址，状态为1
                for(var CTY of data.msg){
                    if(CTY.zt==1){
                        $("div.city-one>div:nth-child(2)").html(`
                        <ul class="dz-active" data-cid="${CTY.id}">
                            <li>
                                <b>收货人：</b><span>${CTY.name}</span>
                                <b>联系电话：</b>
                                <span>${CTY.mobile}</span>
                            </li>
                            <li>
                                <b>收货地址：</b><span>${CTY.provinceId}${CTY.cityId}${CTY.districtId}${CTY.remark}</span>
                                <a href="#">设置为默认地址</a> 
                            </li>
                        </ul>
                        `);
                    }else{//如果没有默认地址，显示第一条地址
                        var dz=data.msg[0];
                        $("div.city-one>div:nth-child(2)").html(`
                        <ul class="dz-active" data-cid="${dz.id}">
                            <li>
                                <b>收货人：</b><span>${dz.name}</span>
                                <b>联系电话：</b>
                                <span>${dz.mobile}</span>
                            </li>
                            <li>
                                <b>收货地址：</b><span>${dz.provinceId}${dz.cityId}${dz.districtId}${dz.remark}</span>
                                <a href="#">设置为默认地址</a> 
                            </li>
                        </ul>
                        `);
                    }  
                    //5.3设置为默认地址
                    $("div.city-one>div:nth-child(2)>ul>li:last-child>a:last-child").click(function(e){
                        e.preventDefault();
                        var ctyId=$(this).parent().parent().attr("data-cid");
                        moRen(ctyId);
                    })
                }
            }else{
                setTimeout(function(){
                   alert(data.msg); 
                },1500)
            }
            
        }
        
    })
    
    

    //6.0取消收货地址的管理页面
    $("div.city-update>p:first-child>span").click(function(){
        $(this).parent().parent().hide();
    })

    //1.5定时器启动
    var fen=30;
    var miao=0;
    var dd= setInterval(function(){
        
        if(miao==0){
            if(fen==0 && miao==0){
                clearInterval(dd);
               open("http://127.0.0.1:3000/index.html","_self")
            }
            fen--;
            miao=59;
        }
        //修改值
        $("div.pay-section>p:first-child>span").html(`订单已生成，${fen}分${miao}秒后跳转到<a href="http://127.0.0.1:3000/index.html">首页</a>!`)
       miao-- 
    }, 1000);
    //1.6生成订单号
    var sd="";
    var s;
    for(var i=0;i<17;i++){
        s=Math.ceil(Math.random()*10);
        sd+=s;
    }
    $("#ddhao>span>span").text(sd);
    //2.选择支付方式
    $("#select").change(function(){
        var sel=$(this).val();
        console.log(sel)
        $(this).parent().prev().attr("src",`./images/tuijian/zhifu-${sel}.jpg`).css({"width":"119px","height":"34px"});
    })

    //3.管理收货地址
    $("#btnGuan").click(function(){
        $(this).parent().parent().next().toggle().css("zIndex","10");
        city();
    })
    
    //3.3封装一个查询用户地址列表的函数
     function city(){
        $.ajax({
            url:"http://127.0.0.1:3000/user/city",
            type:"get",
            dataType:"json",
            success:function(data){
                if(data.code==1){
                    var CTYS="";
                    for(var CTY of data.msg){
                        //3.0将所有信息添加到列表管理
                        CTYS+=`<li data-cid="${CTY.id}">
                        <b>${CTY.name}</b><span>${CTY.mobile}</span><span>${CTY.provinceId}${CTY.cityId}${CTY.districtId}${CTY.remark}</span><button class="btn2">删除</button><button class="btn1">编辑</button><button class="btn3">使用</button>
                        </li>`;  
                    }
                    //3.1加入到收货列表
                    $("div.pay-city>div:nth-child(2)>ul").html("");
                    $("div.pay-city>div:nth-child(2)>ul").append(CTYS);
                }
                

                //0.0新增收货地址
                $("div.city-list>p:last-child>button").click(function(){
                    $("div.city-list").hide();
                    $("div.city-update").show();
                    $("div.city-update>table").html(`<tbody>
                        <tr>
                            <td>收货人：</td>
                            <td><input type="text" name="cname" id="" placeholder="请输入收件人姓名"></td>
                        </tr>
                        <tr>
                            <td>电  话：</td>
                            <td><input type="phone" name="mobile" placeholder="请输入联系人电话"></td>
                        </tr>
                        <tr>
                            <td>省  份：</td>
                            <td><input type="text" name="sheng" placeholder="请输入所在省份"></td>
                        </tr>
                        <tr>
                            <td>城  市：</td>
                            <td><input type="text" name="city" placeholder="请输入所在城市"></td>
                        </tr>
                        <tr>
                            <td>县/区：</td>
                            <td><input type="text" name="xianqu" placeholder="请输入所在的县或区"></td>
                        </tr>
                        <tr>
                            <td>街  道：</td>
                            <td><input type="text" name="jiedao" placeholder="请输入详细的街道信息"></td>
                        </tr>
                        <tr >
                            <td></td>
                            <td><input type="button" style="position:relative;left:-30px;width:50px;" value="增加"></input></td>
                        </tr>
                    </tbody>`);
                    //0.1点击增加，发送ajax请求，添加数据
                    $("#city-update>table>tbody>tr:last-child>td:last-child>input").click(function(){
                        //0.2获取当前的地址信息
                        var provinceId=$("#city-update>table>tbody [name=sheng]").val();//当前的省份
                        var cityId=$("#city-update>table>tbody [name=city]").val();//当前城市
                        var districtId =$("#city-update>table>tbody [name=xianqu]").val();//当前县区
                        var name=$("#city-update>table>tbody [name=cname]").val();//当前收货人
                        var mobile=$("#city-update>table>tbody [name=mobile]").val();//当前电话
                        var remark=$("#city-update>table>tbody [name=jiedao]").val();//详细地址
                        $.ajax({
                            url:"http://127.0.0.1:3000/user/insertCity",
                            type:"get",
                            data:{provinceId,cityId,districtId,name,mobile,remark},
                            dataType:"json",
                            success:function(data){
                                if(data.code==1){
                                    city();//重新调用列表
                                    $("div.city-list").show();
                                    $("div.city-update").hide();
                                }else{
                                    alert(data.msg)
                                }
                            }
                        })
                    })
                    
                })
                //1.点击编辑该地址
                $("div.pay-city>div:nth-child(2)>ul>li").on("click",".btn1",function(){
                    //1.1获取当前的地址id
                    var ctyId=$(this).parent().attr("data-cid");
                    $.ajax({
                        url:"http://127.0.0.1:3000/user/bianJi",
                        type:"get",
                        data:{ctyId},
                        dataType:"json",
                        success:function(data){
                            //console.log(data)
                            $("div.city-list").hide();
                            $("div.city-update").show();
                            if(data.code==1){
                                var city=data.msg[0];
                                $("div.city-update>table").html(`<tbody>
                                    <tr>
                                        <td>收货人：</td>
                                        <td><input type="text" name="cname" id="" placeholder="请输入收件人姓名" value="${city.name}"></td>
                                    </tr>
                                    <tr>
                                        <td>电  话：</td>
                                        <td><input type="phone" name="mobile" placeholder="请输入联系人电话" value="${city.mobile}"></td>
                                    </tr>
                                    <tr>
                                        <td>省  份：</td>
                                        <td><input type="text" name="sheng" placeholder="请输入所在省份" value="${city.provinceId}"></td>
                                    </tr>
                                    <tr>
                                        <td>城  市：</td>
                                        <td><input type="text" name="city" placeholder="请输入所在城市" value="${city.cityId}"></td>
                                    </tr>
                                    <tr>
                                        <td>县/区：</td>
                                        <td><input type="text" name="xianqu" placeholder="请输入所在的县或区"  value="${city.districtId}"></td>
                                    </tr>
                                    <tr>
                                        <td>街  道：</td>
                                        <td><input type="text" name="jiedao" placeholder="请输入详细的街道信息"  value="${city.remark}"></td>
                                    </tr>
                                    <tr >
                                        <td></td>
                                        <td><button style="position:relative;left:-30px;"  data-cid="${city.id}">提交</button></td>
                                    </tr>
                                </tbody>`);
                                //2.点击提交，提交当前修改的内容
                                $("#city-update>table>tbody>tr:last-child>td:last-child>button").click(function(){
                                    //2.1获取当前用户的信息
                                    var id=$(this).attr("data-cid");//当前地址的id
                                    var provinceId=$("#city-update>table>tbody [name=sheng]").val();//当前的省份
                                    var cityId=$("#city-update>table>tbody [name=city]").val();//当前城市
                                    var districtId =$("#city-update>table>tbody [name=xianqu]").val();//当前县区
                                    var name=$("#city-update>table>tbody [name=cname]").val();//当前收货人
                                    var mobile=$("#city-update>table>tbody [name=mobile]").val();//当前电话
                                    var remark=$("#city-update>table>tbody [name=jiedao]").val();//详细地址
                                    $.ajax({
                                        url:"http://127.0.0.1:3000/user/updateCity",
                                        type:"get",
                                        data:{id,provinceId,cityId,districtId,name,mobile,remark},
                                        dataType:"json",
                                        success:function(data){
                                            //console.log(data);
                                            if(data.code==1){
                                                alert(data.msg)
                                                //2.2修改相应的ID的地址
                                                $("div.pay-city>div:nth-child(2)>ul>li").each(function(){
                                                    if($(this).attr("data-cid")==id){
                                                        $(this).children(":first").text(name).next().text(mobile).next().text(provinceId+cityId+districtId+remark)
                                                        //隐藏当前的修改页面，显示用户地址的列表页
                                                        $("div.city-list").show();
                                                        $("div.city-update").hide();
                                                    }
                                                })
                                            }else{
                                                alert(data.msg);
                                            }
                                        }
                                    })
                                })
                            }else{
                                alert(data.msg);
                            }
                        }
                    })
                })

                //3.点击删除
                $("div.pay-city>div:nth-child(2)>ul>li").on("click",".btn2",function(){
                    var ctyId=$(this).parent().attr("data-cid");
                    var $liPar=$(this);
                    $.ajax({
                        url:"http://127.0.0.1:3000/user/deleteCity",
                        type:"get",
                        data:{ctyId},
                        dataType:"json",
                        success:function(data){
                            //console.log(data)
                            if(data.code==1){
                                //3.1删除成功，清除当前的地址
                            $liPar.parent().remove();
                            alert(data.msg);
                            }else{
                                alert(data.msg)
                            }
                        }
                    }) 
                })
                //4.0使用当前地址
                $("div.pay-city>div:nth-child(2)>ul>li").on("click",".btn3",function(){
                    var ctyId=$(this).parent().attr("data-cid");
                    $.ajax({
                        url:"http://127.0.0.1:3000/user/shiyongCity",
                        type:"get",
                        data:{ctyId},
                        dataType:"json",
                        success:function(data){
                            //console.log(data)
                            if(data.code==1){
                                $("div.city-list").hide();
                                var shiCity=data.msg[0];
                                //4.1修改使用的地址项
                                $("div.city-one>div:nth-child(2)").html(`
                                <ul class="dz-active" data-cid="${shiCity.id}">
                                    <li>
                                        <b>收货人：</b><span>${shiCity.name}</span>
                                        <b>联系电话：</b>
                                        <span>${shiCity.mobile}</span>
                                    </li>
                                    <li>
                                        <b>收货地址：</b><span>${shiCity.provinceId}${shiCity.cityId}${shiCity.districtId}${shiCity.remark}</span>
                                        <a href="#">设置为默认地址</a> 
                                    </li>
                                </ul>
                                `);
                                //5.2设置为默认地址
                                $("div.city-one>div:nth-child(2)>ul>li:last-child>a:last-child").click(function(e){
                                    e.preventDefault();
                                    var ctyId=$(this).parent().parent().attr("data-cid");
                                    moRen(ctyId);
                                })
                            }else{
                                alert(data.msg)
                            }
                        }
                    }) 
                })
            }
        })
     }
    //5.0封装一个修改默认地址的函数
    function moRen(ctyId){
        //5.1发送请求修改当前地址的状态为1，其他的为0；
        $.ajax({
            url:"http://127.0.0.1:3000/user/updateMoren",
            type:"get",
            data:{ctyId},
            dataType:"json",
            success:function(data){
                if(data.code==1){
                    alert(data.msg);
                }else{
                    alert(data.msg);
                }
            }
        })
    
    }


    //4.去支付
    var d=0;
    $("div.tijiao>p:only-child>button").click(function(){
        //4.2.点击提交订单，生成订单表，状态为0，表示待付款
            //获取当前商品的信息，以及使用的地址，保存到订单表
            var arrDing=[];//创建数组保存所有参数
            var arrItem=[];//1.保存商品的对应规格id
            var arrImg=[];//2.保存商品的图片
            var arrTitle=[];//3.保存商品的标题
            var arrGui=[];//4.所有商品的规格
            var arrPrice=[];//5.所有商品的价格
            var arrShu=[];//6.所有商品的对应数量
            var arrSum=[];//7.所有商品对应的总价
            var arrCity=[];//8.保存商品所对应的地址编号
            var arrDhao=[];//9.保存订单号
            $("#dingdan>table>tbody>tr").each(function(){
                var dItem=$(this).attr("data-itemId");//1.对应规格id
                arrItem.push(dItem);
                var dImg=$(this).children(":first-child").children(":first-child").attr("src");//2.商品图片
                arrImg.push(dImg);
                var dTitle=$(this).children("td:nth-child(2)").children("h6:first-child").text();//3.商品的标题
                arrTitle.push(dTitle);
                var dGui=$(this).children("td:nth-child(2)").children("span:last-child").text();//4.商品的规格
                arrGui.push(dGui);
                var dPrice=$(this).children("td:nth-child(3)").text().slice(1);//5.商品的价格
                arrPrice.push(dPrice);
                var dShu=$(this).children("td:nth-child(4)").text();//6.商品数量
                arrShu.push(dShu);
                var dSum=$(this).children("td:nth-child(5)").text().slice(1);//7.当前商品购买的总价
                arrSum.push(dSum);
                var cityId=$("div.dizhi>ul.dz-active").attr("data-cid"); //8,商品的地址编号
                
                arrCity.push(cityId);
                var dDhao=$("#ddhao>span>span").text();
                arrDhao.push(dDhao);
            })
            if(!arrItem[0]){
                return alert("订单中没有商品信息！")
            }
            if(!arrCity[0]){
                return alert("收货地址不能为空！");
            }
            d++;
        if(d==1){
            arrDing[0]=arrItem;
            arrDing[1]=arrImg;
            arrDing[2]=arrTitle;
            arrDing[3]=arrGui;
            arrDing[4]=arrPrice;
            arrDing[5]=arrShu;
            arrDing[6]=arrSum;
            arrDing[7]=arrCity;
            arrDing[8]=arrDhao;
            var jsonDing=JSON.stringify(arrDing);
            //console.log(jsonDing);
            $("#beijing").show();
            $("#fukuan").show();
            //4.1获取当前选择的支付方式
            var img=$("#select").val();
            $("#fukuan").css("backgroundImage",` url("./images/tuijian/zf-${img}.png")`);
            var price=$("div.tijiao>p:only-child>span:nth-child(2)").html();
            $("#fukuan>p:last-child>span:last-child").html(price);
            //发送ajax把数据添加到订单表中
            $.ajax({
                url:"http://127.0.0.1:3000/user/insertDingDan",
                data:{jsonDing},
                type:"post",
                dataType:"json",
                success:function(data){
                    //console.log(data);
                    if(data.code==1){
                        //如果是当前购物车提交的订单，就从购物车清除
                        var cids="";
                        $("#dingdan>table>tbody>tr").each(function(){
                            cids+=$(this).attr("data-cid")+",";
                        })
                        //获得当前商品在购物车中的id,直接用之前的路由
                        id=cids.slice(0,cids.length-1);
                        //如果当前的商品存储的购物车id不等于空，就删除
                        if($("#dingdan>table>tbody>tr").attr("data-cid")!=""){
                            $.ajax({
                                url:"http://127.0.0.1:3000/user/deleteCart",
                                type:"get",
                                data:{id},
                                dataType:"json",
                                success:function(data){

                                    alert("已生成订单表！")
                                }
                            })
                        }else{
                            alert("已生成订单表！")
                        }
                    }else{
                        alert(data.msg);
                    }
                }
            })
        }else{
            alert("订单重复！请去订单页支付！将跳转到首页。");
            //跳转到首页
            location.replace("http://127.0.0.1:3000/index.html")
        }
        
        
        
    })

    //5.0取消支付
    $("#fukuan>p:first-child>span").click(function(){
        $("#fukuan").hide();
        $("#beijing").hide();
    })

   
    














})