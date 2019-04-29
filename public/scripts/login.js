$(function(){
    /*登录页面事件以及数据*/ 
    /*注册登录切换 */
   $(".qiehuan>span:first-child").click(function(){
       $(this).addClass("dian").removeClass("weidian").next().removeClass("dian").addClass("weidian");
       $(".login").removeClass("hid");
       $(".zhuce").addClass("hid");
       //修改背景颜色
    //    $("body").css("background-image","url('./images/login/timg3.jpg')");
   }).next().click(function(){
       $(this).addClass("dian").removeClass("weidian").prev().removeClass("dian").addClass("weidian");
       $(".zhuce").removeClass("hid");
       $(".login").addClass("hid");
       //修改背景颜色
    //    $("body").css("background-image","url('./images/login/timg1.jpg')");
   })
    /*快速清除，获取焦点时显示，点击清除文本框内容 */
    $(":input:not(:checkbox)").focus(function(){
        $(this).next().removeClass("hid");
    }).next().click(function(){
        $(this).prev().val("");
        $(this).addClass("hid");
    })


    /*登录时用户验证 */
    $(".login .name [name=uname]").blur(function(){
        if(!($(this).val())){
            return $(".login>p:first-child>span").text("请输入用户名！");
        }else{
            return $(".login>p:first-child>span").text("");
        }
    })
    $("#denglu").click(function(){
            var uname=$(".login .name [name=uname]").val();
            var upwd=$(".login .upwd [name=upwd]").val();
            if(!upwd){
                return $(".login>p:first-child>span").text("请输入密码！");
            }
            //console.log(uname,upwd);
            $.ajax({
                url:"http://127.0.0.1:3000/user/login",
                type:"get",
                data:{uname,upwd},
                dataType:"json",
                success:function(res){
                    //console.log(res);
                    //如果等于-1，用户名或密码不正确
                    if(res.code==1){
                        //1.获取当前的用户名，保存到sessionStorage，共用下面所有的页面
                        sessionStorage.setItem("uname",uname)
                        //1.1 3s以后跳转
                        //alert("点击确认后，3s后跳转")
                        //1.2增加一个动画效果
                        $("div.continer").css("animation","turn 2s 1 linear")
                        setTimeout(function(){
                            //2.跳转到打开的上一个页面,否则跳转到首页
                            if(history.length>2){
                                //2.1重新加载数据
                                //history.go(-1);//只是跳转，不刷新
                                //window.history.back(-1);
                                // location.replace(this.href);
                                // event.returnValue=false;
                                //document.parentWindow.location.reload()
                                self.location=document.referrer;//重新加载数据
                                //location.replace(this.href);event.returnValue=false;
                            }else{
                                location.replace("http://127.0.0.1:3000/index.html")
                            }
                        },1500);
                    }else{
                        //改变报错信息
                       $(".login>p:first-child>span").text(res.msg);
                    } 
                }
            })
    })


    /*注册用户判断 */
    //1.封装验证函数
    function vail(value,txt,tent){
        if(!txt.test(value.val())){
            value.parent().children(":last-child").text(tent);
            return false;
        }else{
            value.parent().children(":last-child").text("格式正确").css("color","blue");
            return true;
        }
    }
    //2.用户名验证
     $(".zhuce [name=uname]").blur(function(){
         var uname=$(this);
         if(!uname.val()){
             return $(this).parent().children(":last-child").text("用户名不能为空！")
         }
        //2.1先在数据库中验证是否有此用户
        $.ajax({
            url:"http://127.0.0.1:3000/user/isname",
            type:"get",
            data:{uname:uname.val()},
            dataType:"json",
            success:function(data){
                if(data.code==1){
                    $(".zhuce [name=uname]").parent().children(":last-child").text("已有此用户，请直接登录！").css("color","blue")
                }else{
                    vail(uname,/^.{3,}$/,"格式不正确！");
                }
            }
        })
        
     })
     //3.密码验证
     $(".zhuce [name=upwd]").blur(function(){
         if(!$(this).val()){
             return $(this).parent().children(":last-child").text("密码不能为空！");
         }
        vail($(this),/^\w{6,32}$/,"格式不正确！");
     })

    //4.注册用户
    $("#zhuce").click(function(e){
        //5.密码确认
        var isUpwd=false;
        if($(".zhuce [name=upwd]").val()===$("#isUpwd").val()){
           $("#isUpwd").parent().children(":last-child").text("密码一致").css("color","blue");
           isUpwd=true;
        }else{
           $("#isUpwd").parent().children(":last-child").text("密码不一致，请重新填写").css("color","red");
        }
        //6.重新验证用户名和密码
        var rName=vail($(".zhuce [name=uname]"),/^.{3,}$/,"格式不正确");
        var rPwd=vail($(".zhuce [name=upwd]"),/^\w{6,32}$/,"格式不正确");
        //7.如果验证通过，添加到数据库
        if(rName==true && rPwd==true && isUpwd==true){
            var uname=$(".zhuce [name=uname]").val();
            var upwd=$(".zhuce [name=upwd]").val();
            //7.1将数据提交到数据库
            $.ajax({
                url:"http://127.0.0.1:3000/user/zhuce",
                type:"get",
                data:{uname,upwd},
                dataType:"json",
                success:function(data){
                    // console.log(data)
                    if(data.code==1){
                        //alert(data.msg);
                        //7.2.1注册成功，跳转到登录
                        $(".qiehuan>span:first-child").addClass("dian").removeClass("weidian").next().removeClass("dian").addClass("weidian");
                        $(".login").removeClass("hid");
                        $(".zhuce").addClass("hid");
                    }else{
                        alert("注册失败，请您重新填写！")
                    }
                }
            })
        }else{
            //7.2阻止提交
            e.preventDefault();
        }
    })
    /*注册按钮的禁用和解除 */
    $("#chx").click(function(){
        $("#zhuce").prop("disabled",!$(this).is(":checked"));
    })























})