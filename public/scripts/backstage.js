//进入网页时，主页显示
(function(){
    div=document.getElementById("homepage");
    div.addClass=".visi";
})();





/****************主页面************/
var ul=document.getElementById("kp1");
var a=ul.firstElementChild.firstElementChild;
a.onclick=function(){
    //其他页面隐藏
    var div=document.getElementById("userTable");
    div.style.display="none";
    //让主页显示
    var div=document.getElementById("homepage");
    div.style.display="block"; 
};

//1.查询用户数据
var ab=document.getElementById("ulist");
ab.onclick=function(){
    //查询用户数据
    (function(){
    ajax({
        url:"http://127.0.0.1:3000/backstage/userlist",
        type:"get",
        data:"count="+5+"&start="+1,
        dataType:"json",//自动解析
    })
    .then(function(data){
        //console.log(data);
        var div=document.getElementById("userTable").children[1].children[2].firstElementChild;
        var table=div.firstElementChild;
        var span=document.getElementById("tab");
        span.innerHTML="用户表信息";
        //先清空当前的数据
        table.innerHTML="";
        //console.log(table);
        var thead=table.createTHead();
        var th=thead.insertRow();
        th.style.backgroundColor="green";
        var thName=data[0];
        //添加表头行
        for(var key in thName){
            var td=th.insertCell();
            td.innerHTML+=key;
        }
        var td=th.insertCell();
            td.innerHTML+="操作";
        //添加主体内容
        var tbody=table.createTBody();
        for(var i=0;i<data.length;i++){
            var tr=tbody.insertRow();
            for(var key in data[i]){
                var td=tr.insertCell(); 
                td.innerHTML+=data[i][key];
            }
            //如果tr下面的第四个子元素1为男，0为女
            var td=tr.cells[3];
            if(td.innerHTML==1){
                td.innerHTML="男";
            }else if(td.innerHTML==0){
                td.innerHTML="女";
            }    
            //在最后加一个按钮    
            var td=tr.insertCell();
            td.innerHTML=`<button>修改</button> <button>删除</button>`;
        }
    })
    })()
    //其他显示的页面隐藏
    var div=document.getElementById("homepage");
    div.style.display="none";
    //当前显示
    var div=document.getElementById("userTable");
    div.style.display="block";
    //1.4显示几项，共多少项
    (function(){
        ajax({
            url:"http://127.0.0.1:3000/backstage/countuser",
            type:"get",
            dataType:"json",//自动解析
            })
            .then(function(data){
                //console.log(data)
                var d=data[0];
                //console.log(d)
                var xs=count.value;
                var span=document.querySelector(".datatable+div>p:first-child>span:nth-child(2)")
                span.textContent=`显示${xs}项,共${d.c}项`;
                //添加分页查询列表
                //获取总共显示的页码数
                var ye=Math.ceil(d.c/xs)
                var ul=document.querySelector("#userTable .pagination");
                //查找所有的li，删除除了第一个和最后一个的所有
                var liChild=document.querySelectorAll("#userTable .pagination>li");;
                //console.log(liChild.length)
                for(var a=0;a<liChild.length-1;a++){
                    if(a!=0&&a!=liChild.length-1){
                        ul.removeChild(liChild[a]);
                    }
                }
                var liLast=ul.lastElementChild;
                //console.log(liLast,ye)
                //创建新元素li
                for(var i=1;i<=ye;i++){
                    var li=document.createElement("li")
                    li.innerHTML=`<a>${i}</a>`;
                    ul.insertBefore(li,liLast);
                    //添加样式
                    if(i==1){
                        li.className="border text-center active"
                    }else{
                        if(i<9){
                            li.className="border text-center"
                        }else{
                            li.className="border text-center"
                            li.style.display="none";
                        }
                    }
                }
        })
    })()
};

//1.1按页查询
var count=document.getElementById("count");
count.onchange=function(e){
    if(tab.innerHTML=="用户表信息"){
    //查询用户数据
        (function(){
            ajax({
                url:"http://127.0.0.1:3000/backstage/userlist",
                type:"get",
                data:"count="+count.value+"&start="+1,
                dataType:"json",//自动解析
            })
            .then(function(data){
                //console.log(data);
                var div=document.getElementById("userTable").children[1].children[2].firstElementChild;
                var table=div.firstElementChild;
                //先清空当前的数据
                table.innerHTML="";
                //console.log(table);
                var thead=table.createTHead();
                var th=thead.insertRow();
                th.style.backgroundColor="green";
                var thName=data[0];
            //添加表头行
                for(var key in thName){
                    var td=th.insertCell();
                    td.innerHTML+=key;
                }
                var td=th.insertCell();
                    td.innerHTML+="操作";
                //添加主体内容
                var tbody=table.createTBody();
                for(var i=0;i<data.length;i++){
                    var tr=tbody.insertRow();
                    for(var key in data[i]){
                        var td=tr.insertCell(); 
                        td.innerHTML+=data[i][key];
                    }
                    //如果tr下面的第三个子元素1为男，0为女
                    var td=tr.cells[3];
                    if(td.innerHTML==1){
                        td.innerHTML="男";
                    }else if(td.innerHTML==0){
                        td.innerHTML="女";
                    }    
                    //在最后加一个按钮    
                    var td=tr.insertCell();
                    td.innerHTML=`<button>修改</button> <button>删除    </button>`;
                }
            })
            //1.4显示几项，共多少项
            ajax({
                url:"http://127.0.0.1:3000/backstage/countuser",
                type:"get",
                dataType:"json",//自动解析
                })
                .then(function(data){
                //console.log(data)
                var d=data[0];
                //console.log(d)
                var xs=count.value;
                var span=document.querySelector(".datatable+div>p:first-child>span:nth-child(2)")
                span.textContent=`显示${xs}项,共${d.c}项`;
                //添加分页查询列表
                //获取总共显示的页码数
                var ye=Math.ceil(d.c/xs)
                var ul=document.querySelector("#userTable .pagination");
                //查找所有的li，删除除了第一个和最后一个的所有
                var liChild=document.querySelectorAll("#userTable .pagination>li");;
                //console.log(liChild.length)
                for(var a=0;a<liChild.length-1;a++){
                    if(a!=0&&a!=liChild.length-1){
                        ul.removeChild(liChild[a]);
                        //console.log(liChild[a])
                    }
                }
                var liLast=ul.lastElementChild;
                //创建新元素li
                for(var i=1;i<=ye;i++){
                    var li=document.createElement("li")
                    li.innerHTML=`<a>${i}</a>`;
                    ul.insertBefore(li,liLast);
                    //添加样式
                    if(i==1){
                        li.className="border text-center active"
                    }else{
                        if(i<9){
                            li.className="border text-center"
                        }else{
                            li.className="border text-center"
                            li.style.display="none";
                        }
                    }
                    
                }
            })
        })()
    }
};

//1.2快速查询
var kuaisu=document.getElementById("kuaisu");
kuaisu.onblur=function(){
    if(tab.innerHTML=="用户表信息" && $(this).val()!=""){
    //查询用户数据
   (function(){
    ajax({
        url:"http://127.0.0.1:3000/backstage/kuaisuuser",
        type:"get",
        data:"kuaisu="+kuaisu.value,
        dataType:"json",//自动解析
    })
    .then(function(data){
        //console.log(data);
        var div=document.getElementById("userTable").children[1].children[2].firstElementChild;
        var table=div.firstElementChild;
        //先清空当前的数据
        table.innerHTML="";
        var thead=table.createTHead();
        var th=thead.insertRow();
        if(data==0){
            th.innerHTML="查无此人";
            th.style.fontSize="24px";
        }else{
            th.style.backgroundColor="green";
        var thName=data[0];
        //添加表头行
        for(var key in thName){
            var td=th.insertCell();
            td.innerHTML+=key;
        }
        var td=th.insertCell();
            td.innerHTML+="操作";
        //添加主体内容
        var tbody=table.createTBody();
        for(var i=0;i<data.length;i++){
            var tr=tbody.insertRow();
            for(var key in data[i]){
                var td=tr.insertCell(); 
                td.innerHTML+=data[i][key];
            }
            //如果tr下面的第三个子元素1为男，0为女
            var td=tr.cells[3];
            if(td.innerHTML==1){
                td.innerHTML="男";
            }else if(td.innerHTML==0){
                td.innerHTML="女";
            }    
            //在最后加一个按钮    
            var td=tr.insertCell();
            td.innerHTML=`<button>修改</button> <button>删除</button>`;
        }
    }
    })
    })()
    }
};

//1.3修改、删除用户信息
var table=document.querySelector(".datatable>table.table");
    table.onclick=function(e){
      //获得button内容为修改的按钮
        if(e.target.innerHTML=="修改"){
            if(tab.innerHTML=="用户表信息"){
               var trs=e.target.parentElement.parentElement.children;
               for(var i in trs){
                   if(i>0 && i<trs.length-2){
                       var tr=trs[i].innerHTML
                       trs[i].innerHTML=`<input class="input_up" type="text" value="${tr}">`;
                       e.target.innerHTML="提交";
                   }
               }
            }
        }else if(e.target.innerHTML=="提交"){//修改完以后提交
            if(tab.innerHTML=="用户表信息"){
                var values=e.target.parentElement.parentElement.children;
                var id=values[0].innerHTML;
                var arrUpdate=[id];//保存修改后的值，一个数组
                for(var i in values){
                    if(i>0 && i<values.length-2){
                        arrUpdate.push(values[i].firstElementChild.value)
                    }
                }
                //console.log(arrUpdate)
                //console.log(values)
                var id=arrUpdate[0];
                var avatar=arrUpdate[1];
                var username=arrUpdate[2];
                var gender= arrUpdate[3];
                var age=arrUpdate[4];
                var phone=arrUpdate[5];
                var email=arrUpdate[6];
                var birthday=arrUpdate[7];
                var created=arrUpdate[8];
                ajax({
                    url:"http://127.0.0.1:3000/backstage/updateuser",
                    type:"get",
                    data:"id="+id+"&avatar="+avatar+"&username="+username+"&gender="+gender+"&age="+age+"&phone="+phone+"&email="+email+"&birthday="+birthday+"&created="+created,
                    dataType:"json",//自动解析
                })
                .then(function(data){
                    //console.log(data);
                    if(data==1){
                        alert("修改成功！")
                        //改变网页中的值
                        for(var i in values){
                            if(i>0 && i<values.length-2){
                                values[i].innerHTML=values[i].firstElementChild.value;
                            }
                        }
                        e.target.innerHTML="修改";
                    }else{
                        alert("修改失败！")
                    };
                })();
             };
        }else if(e.target.innerHTML=="删除"){
            //判断是否确认删除
            var msg="您确定删除此用户？"
            if(confirm(msg)){
                if(tab.innerHTML=="用户表信息"){
                    (function(){
                         //console.log(e.target)
                         //获得当前行的id号
                         var uid=e.target.parentElement.parentElement.firstElementChild;
                         //console.log(uid);
                         ajax({
                             url:"http://127.0.0.1:3000/backstage/deleteuser",
                             type:"get",
                             data:"uid="+uid.innerHTML,
                             dataType:"json",//自动解析
                         })
                         .then(function(data){
                             //console.log(data);
                             if(data==1){
                                 alert("删除成功！")
                                 //清除其父元素
                                 uid.parentElement.innerHTML=""
                             }else{
                                 alert("删除失败！")
                             }
                         })   
                     })()
                 }
            }else{
                return false;
            }
            
        }
    };

//1.5上一页，下一页
//上一页
var aPrev=document.querySelector("#userTable .pagination>li:first-child");
aPrev.onclick=function(e){
    if(tab.textContent=="用户表信息"){
        //获取当前页码
        var li=document.querySelector("#userTable .pagination>li.active");
        var a=li.firstElementChild;
        var pno=a.textContent;
        if(pno>1){
            pno--;
            //移除当前页码的active属性，放在上一个
            li.className="border text-center";
            var liPrev=li.previousElementSibling
            liPrev.className+=" active";
        }else if(pno==1){
            pno=1;
            alert("已经是第一页！")
        }
        var start=pno;
        //获取当前页码
            if(pno>1){
                start=pno--;
            }else{
                start=1
            }
        //查询用户数据
        (function(){
            ajax({
                url:"http://127.0.0.1:3000/backstage/userlist",
                type:"get",
                data:"count="+count.value+"&start="+start,
                dataType:"json",//自动解析
            })
            .then(function(data){
                //console.log(data);
                var div=document.getElementById("userTable").children[1].children[2].firstElementChild;
                var table=div.firstElementChild;
                //先清空当前的数据
                table.innerHTML="";
                //console.log(table);
                var thead=table.createTHead();
                var th=thead.insertRow();
                th.style.backgroundColor="green";
                var thName=data[0];
                //添加表头行
                for(var key in thName){
                    var td=th.insertCell();
                    td.innerHTML+=key;
                }
                var td=th.insertCell();
                    td.innerHTML+="操作";
                //添加主体内容
                var tbody=table.createTBody();
                for(var i=0;i<data.length;i++){
                    var tr=tbody.insertRow();
                    for(var key in data[i]){
                        var td=tr.insertCell(); 
                        td.innerHTML+=data[i][key];
                    }
                    //如果tr下面的第三个子元素1为男，0为女
                    var td=tr.cells[3];
                    if(td.innerHTML==1){
                        td.innerHTML="男";
                    }else if(td.innerHTML==0){
                        td.innerHTML="女";
                    }    
                    //在最后加一个按钮    
                    var td=tr.insertCell();
                    td.innerHTML=`<button>修改</button> <button>删除    </button>`;
                }
            })
        })()
    }
}

//下一页
var aNext=document.querySelector("#userTable .pagination>li:last-child");
//console.log(aNext)
aNext.onclick=function(){
    if(tab.textContent=="用户表信息"){
        //获取当前页码
        var li=document.querySelector("#userTable .pagination>li.active");
        var a=li.firstElementChild;
        var pno=a.textContent;
        pno++;
        //获取最后一个页码
        var aZui=document.querySelector("#userTable .pagination>li:last-child").previousElementSibling.firstElementChild;
        //console.log(aZui.innerHTML)
        //如果为最后一页，则保持不变
        if(pno%6==0){
            var liXia=li.nextElementSibling();
            liXia.style.display="block";
        }
        if(pno>aZui.innerHTML){
            pno=aZui.innerHTML;
            alert("已经是最后一页！")
        }else{
            //移除当前页码的active属性，放在下一个
            li.className="border text-center";
            var liNext=li.nextElementSibling
            liNext.className+=" active";
        }
        var start=pno;
        //console.log(pno,start)
        //分页查询
            (function(){
                ajax({
                    url:"http://127.0.0.1:3000/backstage/userlist",
                    type:"get",
                    data:"count="+count.value+"&start="+start,
                    dataType:"json",//自动解析
                })
                .then(function(data){
                    //console.log(data);
                    var div=document.getElementById("userTable").children[1].children[2].firstElementChild;
                    var table=div.firstElementChild;
                    //先清空当前的数据
                    table.innerHTML="";
                    //console.log(table);
                    var thead=table.createTHead();
                    var th=thead.insertRow();
                    th.style.backgroundColor="green";
                    var thName=data[0];
                //添加表头行
                    for(var key in thName){
                        var td=th.insertCell();
                        td.innerHTML+=key;
                    }
                    var td=th.insertCell();
                        td.innerHTML+="操作";
                    //添加主体内容
                    var tbody=table.createTBody();
                    for(var i=0;i<data.length;i++){
                        var tr=tbody.insertRow();
                        for(var key in data[i]){
                            var td=tr.insertCell(); 
                            td.innerHTML+=data[i][key];
                        }
                        //如果tr下面的第三个子元素1为男，0为女
                        var td=tr.cells[3];
                        if(td.innerHTML==1){
                            td.innerHTML="男";
                        }else if(td.innerHTML==0){
                            td.innerHTML="女";
                        }    
                        //在最后加一个按钮    
                        var td=tr.insertCell();
                        td.innerHTML=`<button>修改</button> <button>删除    </button>`;
                    }
                })
            })()
    }
    
}






















//2.查询主页轮播图信息
var cartTable=document.getElementById("carlist");
cartTable.onclick=function(){
//查询购物车信息
(function(){
    ajax({
        url:"http://127.0.0.1:3000/backstage/carousellist",
        type:"get",
        dataType:"json",//自动解析
    })
    .then(function(data){
        //console.log(data);
        var div=document.getElementById("userTable").children[1].children[2].firstElementChild;
        var table=div.firstElementChild;
        //先清空当前的数据
        table.innerHTML="";
        var span=document.getElementById("tab");
        span.innerHTML="主页轮播图信息";
        //console.log(table);
        var thead=table.createTHead();
        var th=thead.insertRow();
        th.style.backgroundColor="green";
        var thName=data[0];
        //console.log(thName);
        //添加表头行
        for(var key in thName){
            var td=th.insertCell();
            td.innerHTML+=key;
        }
        var td=th.insertCell();
            td.innerHTML+="操作";
        //添加主体内容
        var tbody=table.createTBody();
        for(var i=0;i<data.length;i++){
            var tr=tbody.insertRow();
            for(var key in data[i]){
                var td=tr.insertCell(); 
                td.innerHTML+=data[i][key];
            }
            //在最后加一个按钮    
            var td=tr.insertCell();
            td.innerHTML=`<button>修改</button> <button>删除</button>`;
       }
    })
})()
    //其他显示的页面隐藏
    var div=document.getElementById("homepage");
    div.style.display="none";
    //当前显示
    var div=document.getElementById("userTable");
    div.style.display="block";
};






