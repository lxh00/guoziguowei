$(document).ready(function(){
 // lift商品电梯
	function getTotalTop(elem){
	  var sum=0;
	  do{
	    sum+=elem.offsetTop;
	    elem=elem.offsetParent;
	  }while(elem);
	  return sum;
	}
	$(window).on("scroll",function(){
		var scrollTop=document.body.scrollTop||
		document.documentElement.scrollTop;  //获取浏览器滚动条的滚动距离
		var seckillTop=getTotalTop($(".seckill")[0]);
		var f1Top=getTotalTop($(".f1")[0]);
		var f2Top=getTotalTop($(".f2")[0]);
		var $search=$(".fixed-search");
		var f3Top=getTotalTop($(".f3")[0]);
		var guessTop=getTotalTop($(".guessYouLink")[0]);
		if (scrollTop>=seckillTop-50){
			$search.show();
			$(".fiexd-user-fun").show();
		}else{
			$search.hide();
		}
		var wHeight=innerHeight;
		var $lift=$(".fixed-lift");
		if(scrollTop+wHeight/2>=f1Top)
			$lift.show();
		else
			$lift.hide();
		if($lift.css("display")=="block"){
			if(scrollTop+wHeight/2>=guessTop)
				$("[data-toggle=tab]:eq(3)").addClass("lift-active")
			.siblings().removeClass("lift-active");
			else if(scrollTop+wHeight/2>=f3Top)
				$("[data-toggle=tab]:eq(2)").addClass("lift-active")
			.siblings().removeClass("lift-active");
			else if(scrollTop+wHeight/2>=f2Top)
				$("[data-toggle=tab]:eq(1)").addClass("lift-active")
			.siblings().removeClass("lift-active");
			else if(scrollTop+wHeight/2>=f1Top)
				$("[data-toggle=tab]:eq(0)").addClass("lift-active")
			.siblings().removeClass("lift-active");
		}
	})
	// 点击楼层滚动
	$("[data-toggle=tab]").on("click",function(){
		let wHeight=innerHeight;
		let $this=$(this);
		let i=$this.index()+1;
		var $body=$(document.documentElement);
		var $body2=$(document.body);
		if($this.index()<3){
			let fiTop=getTotalTop($(".f"+i)[0]);
			$body.animate({scrollTop:fiTop-50},800);
			$body2.animate({scrollTop:fiTop-50},800);
		}else{
			let guessTop=getTotalTop($(".guessYouLink")[0]);
			$body.animate({scrollTop:guessTop-50},800);
			$body2.animate({scrollTop:guessTop-50},800);
		}
	})
	//返回顶部
	$("[data-toggle=top]").click(function(){
		var $body=$(document.documentElement);
		var $body2=$(document.body);
		$body.animate({scrollTop:0},800);
		$body2.animate({scrollTop:0},800);
	});
	//nav商品分类鼠标进入事件
	$(".nav-box>ul").on("mouseenter","li",function(){
		var $this=$(this);
		$this.children(".nav-left").css({"background":"#fff","color":"#2b2b2b"});
		$this.children(".nav-right").show();
	})
	$(".nav-box>ul").on("mouseleave","li",function(){
		var $this=$(this);
		$this.children(".nav-left").css({"background":"#2b2b2b","color":"#fff"});
		$this.children(".nav-right").hide();
	})
	//轮播图
	function slider(){
		var $ul=$(".slider>ul:first");
		var len=5;
		var a=0;
		var timer=0;
		function play(){
			timer=setTimeout(()=>{
				if(a<len-1){
					a++;
					$ul.css("transition","all .5s linear");
					$ul.css("left",-a*100+"%");
					if(a<len-1)
					$ul.next().children(":eq("+a+")")
					.addClass("active").siblings()
					.removeClass("active");
					else
					$ul.next().children(":eq(0)")
					.addClass("active").siblings()
					.removeClass("active");
					play();
				}else{
					$ul.css("transition","");
					$ul.css("left",0);
					setTimeout(()=>{
						a=1;
						$ul.css("transition","all .5s linear");
						$ul.css("left",-a*100+"%");
						$ul.next().children(":eq("+a+")")
						.addClass("active").siblings()
						.removeClass("active");
					},50);
					$ul.next().children(":eq("+a+")")
						.addClass("active").siblings()
						.removeClass("active");
					play();
				}
			},3000);
		}
		play();
		$("#list").hover(
			()=>clearTimeout(timer),
			()=>play()
			);
		$("#list").on("mouseover","li",function(){
			var $this=$(this);
			if(!$this.hasClass("active")){
				a=$this.index();
				$ul.css("left",-a*100+"%");
				$this.addClass("active").siblings().removeClass("active");
			}
		})
	}
	slider();

	//秒杀专场自动轮播
	var a=0;
	function yidong(){
		a+=5;
		//console.log(a)
		if(a==1000){			
			$(".seckill>div.kill-shop>ul").append($(".seckill>div.kill-shop>ul").slice(0,1));
			a=0;
		}
		$(".seckill>div.kill-shop>ul").css("margin-left",-a+"px");
	}
	 //启动定时器，鼠标进入停止，移出启动
	 var t=setInterval(function(){
		yidong();	
	},100);
	$(".seckill>div.kill-shop>ul").mouseenter(function(){
		clearInterval(t);
	});
	$(".seckill>div.kill-shop>ul").mouseleave(function(){
		t=setInterval(yidong,100);
	})
	
    
	//f2 特色推荐鼠标点击切换
	$(".f2-content2>ul").on("click","li",function(){
		var $this=$(this);
		var index=$this.index();
		//console.log(index);
		$this.addClass("show-list").siblings().removeClass("show-list");
		$(".f2-content2>.f2-content2-1:eq("+index+")").addClass("show")
		.siblings(".f2-content2-1").removeClass("show");
	})
	//秒杀专场计时器
	setInterval(()=>{
		var oldTime=new Date("2017/12/30 23:00");
		var newtime=new Date();
		var s=(oldTime-newtime)/1000;
		var h=parseInt(s%(3600*24)/3600);
		var m=parseInt(s%3600/60);
		var s=parseInt(s%60);
		var $parent=$(".kill-top>.top-r");
		h>=10?h:h="0"+h;
		m>=10?m:m="0"+m;
		s>=10?s:s="0"+s;
		$parent.children("strong:eq(0)").html(h);
		$parent.children("strong:eq(1)").html(m);
		$parent.children("strong:eq(2)").html(s);
	},1000);
	
});


// 首页获取数据
$(function(){
	$.ajax({
		url:"http://localhost:3000/index/retrieval",
		type:"get",
		dataType:"json",
		success:function(data){
			var p=data;
			//console.log(p);
			var pr=p.slice(0,4);
             //console.log(pr);
			 var html="";
			 var proListOne=$(".proOne");
			 for(var pro of pr){
				 html+=`
				<li>
                    <a href="${pro.href}">
                        <img src="${pro.pic}" alt="">
                        <p>${pro.title}</p>
                    </a>
                </li>`
			 }
			 proListOne.html(html);
			 var pr=p.slice(4,7);
			 //console.log(p);
			 var html="";
			 var proListTwo=$(".proTwo");
			 for(var pro of pr){
				 html+=`<li>
				 <a href="${pro.href}">
					 <img src="${pro.pic}" alt="">
				 </a>
			 </li>`;
			 }
			 proListTwo.html(html);
			 var pr=p.slice(7,11);
			 console.log(pr);
			 var html="";
			 var proListThree=$(".proThree");
			 for(var pro of pr){
				 html+=`<li>
				 <a href="${pro.href}">
					 <img src="${pro.pic}" alt="">
					 <p>${pro.title}</p>
				 </a>
			 </li>`;
			 }
			 proListThree.html(html);
			 var pr=p.slice(11,14);
			 console.log(pr);
			 var html="";
			 var porListFour=$(".proFour");
			 for(var pro of pr){
				 html+=`<li>
				 <a href="${pro.href}">
					 <img src="${pro.pic}" alt="">
				 </a>
			 </li>`;
			 }
			 porListFour.html(html);
		}
	})
})