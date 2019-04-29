$(function(){
    $.ajax({
        url:"http://127.0.0.1:3000/user/selectOrder",
        type:"post",
        dataType:"json",
        success:function(data){
            console.log(data);
            if(data.code==1){
                for(var dingDan of data.msg){
                    //1.如果订单状态为0，待付款
                     var daifu="";
                    if(dingDan.status==0){
                       daifu+=``;

                    }
                }
            }
        }
    })































})