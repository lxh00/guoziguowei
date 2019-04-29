/*倒计时*/

function task(){
    var end=new Date("2019/3/15 00:00:00");
    var now=new Date();
    var s=parseInt((end-now)/1000);
    if(s==0){
        clearInterval(n);//
        var span=document.getElementById("time")
    }else{
        //天数
        var d=parseInt(s/3600/24);
        if(d<10) d="0"+d;
        //s/3600/24,再下取整
        var h=parseInt(s%(3600*24)/3600);
        if(h<10) h="0"+h;
        //s/(3600*24)的余数,再/3600,再下去整
        var m=parseInt(s%3600/60);
        if(m<10) m="0"+m;
        //s/3600的余数,再/60，再下取整
        s%=60;//s/60的余数
        if(s<10) s="0"+s;
        var span=document.getElementById("time");
        span.innerHTML=d+"天"+h+"小时"+m+"分"+s+"秒"; 
    }
}
var n=setInterval(task,1000);


/*数量变化*/

//1.查找触发事件的元素count
var count=document.querySelector(".count");  //按选择器查找
//查找count下的所有button
var btns=count.getElementsByClassName("my-btn");   //按class属性查找
//console.log(btns); 
//2.绑定事件处理函数
for(var btn of btns){//遍历btns中的每一个btn,每遍历到一个btn，就给当前btn绑定单击事件处理函数：当 当前按钮被单击时自动执行一项任务
    btn.onclick=function(){  //绑定事件处理函数：元素.on事件名=处理函数；
    var bt1=this;//因为不能用全局变量获得当前按钮本身,所以在处理函数中应该用this关键字获得将来触发事件的当前元素本身.    btn->是全局变量，找到的是最后一个按钮    this->当前按钮          
    //3.查找元素
    //查找当前按钮的父元素的第3个子元素
    var span=bt1.parentNode.children[2];
    //4.修改元素
    //获得span的内容，转为整数
    var n=parseInt(span.innerHTML);
    if(bt1.innerHTML=="+")  //如果当前按钮是+
        n++;  //数量就+1
    else if(bt1.innerHTML=="-"&&n>1)  //否则如果当前按钮是-，且n>1
        n--;
        //将修改后的n,再放回span中
    span.innerHTML=n;
    }
}


/*在一个Div内存放两个相同内容（使用一行多列表格）作为一个滚动对象，并将超出的宽度的内容隐藏，在JS脚本中定义Div向移动的方法（水平坐标加1）。当第一个内容完全消失（即Div向左移动的距离达到该Div的宽度，此时第二个内容完全显示)时，将滚动条的坐标复位，开始新的一轮。 */

/*看了又看：图片向上滚动*/

say2.innerHTML=say1.innerHTML;
function Marquee(){  //scrollTop() 方法返回或设置匹配元素的滚动条的垂直位置
    //当滚动至say1与say2交界时,直接跳回初始位置，
    if(say2.offsetTop-say.scrollTop<=0) //offsetTop 指的是滚动条相对于其顶部的偏移。
    //say跳到最顶端(初始位置) 
        say.scrollTop-=say1.offsetHeight
    else{
        say.scrollTop++
    }
}
var t0=setInterval(Marquee,20);
//鼠标移入时清除定时器达到,停止滚动
say.onmouseover=function() {
    clearInterval(t0);
}
//鼠标移开时重设定时器，继续滚动
say.onmouseout=function() {
    t0=setInterval(Marquee,20);
}




/*店长推荐:一组图片循环且首尾相连的滚动*/

Pic2.innerHTML=Pic1.innerHTML;//复制一组图片，但被隐藏
//sm   滚动对象
function scrolltoleft(){//定义向左移动的方法
    sm.scrollLeft++;//改变层的水平坐标，实现向左移动
    //当滚动至Pic与Pic2交界时,直接跳回初始位置，
    if(sm.scrollLeft>=Pic1.scrollWidth)//scrollWidth:获取对象的滚动宽度
        sm.scrollLeft=0;//层的位置复位
}

var t=setInterval(scrolltoleft,20); //定时器
//鼠标移入时清除定时器达到,停止滚动
sm.onmouseover=function(){//匿名方法（函数）
    clearInterval(t);
}
//鼠标移开时重设定时器，继续滚动
sm.onmouseout=function(){
    t = setInterval(scrolltoleft,20);
}
