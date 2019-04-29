/*用户gg路由*/
const express=require('express');
//引入连接池
const pool=require('../pool.js');
//创建空路由器
var router=express.Router();
//1.用户登录验证
router.get("/login",(req,res)=>{
    var username=req.query.uname;
    var upwd=req.query.upwd;
    //console.log(username,upwd)
    var sql="SELECT uid FROM fruit_user WHERE username=? AND upwd=?";
    pool.query(sql,[username,upwd],(err,result)=>{
        if(err) throw err;
        if(result.length>0){
            //如果有此用户，将用户id保存到session对象中
            var id=result[0].uid;
            req.session.uid=id;
            //console.log(id);
            res.send({code:1,msg:result});
        }else{
            res.send({code:-1,msg:"用户名或密码有误！"})
        }
    })
})

//1.1用户ID清除操作
router.get("/delSession",(req,res)=>{
    var uid=null;
    //1.1.1清除uid
    req.session.uid=uid;
    if(uid==null){
        res.send({code:1,msg:"退出成功"})
    }else{
        res.send({code:-1,msg:"退出失败"})
    }
})

//1.2每次加载时判断用户是否登录
router.get("/isLogin",(req,res)=>{
    var uid=req.session.uid;
    if(!uid){
       return res.send({code:1,msg:"用户未登录"})
    }
    var sql="SELECT username FROM fruit_user WHERE uid="+uid;
    pool.query(sql,(err,result)=>{
        if(err) throw err;
        if(result.length>0){
            res.send({code:2,msg:result})
        }
    })
})

//2.用户注册
//2.1用户名验证是否存在
router.get("/isname",(req,res)=>{
    var username=req.query.uname;
    sql="SELECT uid FROM fruit_user WHERE username=?";
    pool.query(sql,[username],(err,result)=>{
        if(err) throw err;
        if(result.length>0){
            res.send({code:1});
        }else{
            res.send({code:-1});
        }
    })
})
//2.2注册新用户
router.get("/zhuce",(req,res)=>{
    var username=req.query.uname;
    var upwd=req.query.upwd;
    var sql="INSERT INTO fruit_user VALUES(null,?,?,'','','','','','','')";
    pool.query(sql,[username,upwd],(err,result)=>{
        if(err) throw err;
        if(result.affectedRows>0){
            res.send({code:1,msg:"注册成功"})
        }else{
            res.send({code:-1,msg:"注册失败"})
        }
    })
})

//3.用户添加商品至购物车
router.get("/addcart",(req,res)=>{
    //console.log(req.query);
    var uid=parseInt(req.session.uid);
    if(!uid){
       return res.send({code:0,msg:"用户未登录!"});
    }
    var sid=parseInt(req.query.sid);
    var img=req.query.img;
    var cart_title=req.query.cart_title;
    var p_zhonglei=req.query.p_zhonglei;
    var price=parseFloat(req.query.price);
    var num=parseInt(req.query.num);
    var sql="SELECT id FROM fruit_cart_item WHERE user_id=? AND item_id=?";
    pool.query(sql,[uid,sid],(err,result)=>{
        if(err) throw err;
        //如果当前没有商品
        if(result.length==0){
            //模板字符串中字符串需要加引号
            var sql=`INSERT INTO fruit_cart_item VALUES(null,${uid},${sid},'${img}','${cart_title}','${p_zhonglei}',${price},${num},1,now(),2)`;
        }else{
            var sql=`UPDATE fruit_cart_item SET num=num+${num} WHERE user_id=${uid} AND item_id=${sid}`;
        }
        //返回结果统一处理
        pool.query(sql,(err,result)=>{
            if(err) throw err;
            if(result.affectedRows>0){
                res.send({code:1,msg:"添加成功"});
            }else{
                res.send({code:-1,msg:"添加失败"});
            }
        })
    })
})

//4.查询用户购物车信息(多表查询)
router.get("/selectCart",(req,res)=>{
    // 1.uid 用户ID   pno 页码 pageSize 每页显示数量
    var uid=parseInt(req.session.uid);
    //console.log(uid);
    // uid=parseInt(req.session.uid);
    //2.判断用户是否登录
    if(!uid){
       return res.send({code:0,msg:"用户未登录!"});
    }
    var pno=req.query.pno;
    var pageSize=req.query.pageSize;
    //3.默认值
    if(!pno){pno=1};
    if(!pageSize){pageSize=6};
    //4.从第几条数据查询
    var offset=(pno-1)*pageSize;
    pageSize=parseInt(pageSize);
    var sql="SELECT * FROM fruit_cart_item WHERE  user_id=? LIMIT ?,?";
    pool.query(sql,[uid,offset,pageSize],(err,result)=>{
        if(err) throw err;
        if(result.length>0){
            res.send({code:1,msg:result});
        }else{
            res.send({code:-1,msg:"您的购物车还是空的"})
        }
    })
})

//5.删除购物车的商品(可删除多个或者一个)
router.get("/deleteCart",(req,res)=>{
    //1.参数 id
    var ids=req.query.id
    //2.sql
    var sql="DELETE FROM fruit_cart_item WHERE id IN ("+ids+")";
    pool.query(sql,(err,result)=>{
        if(err) throw err;
        if(result.affectedRows>0){
            res.send({code:1,msg:"删除成功"})
        }else{
            res.send({code:-1,msg:"删除失败"})
        }
    }) 
})

//6.1结算订单查询，购买多件商品，在购物车当中查
router.get("/settles",(req,res)=>{
    var uid=parseInt(req.session.uid);
    if(!uid){
        return res.send({code:0,msg:"用户未登录！"})
    }
    var ids=req.query.ids;
    if(!ids){
        return res.send({code:-2,msg:"您没有选择需要购买的商品！"})
    }
    //console.log(ids)
    var sql="SELECT id,item_id,img,cart_title,p_zhonglei,price,num FROM fruit_cart_item WHERE id IN ("+ids+")";
    pool.query(sql,(err,result)=>{
        if(err) throw err;
        if(result.length>0){
            res.send({code:1,msg:result})
        }else{
            res.send({code:-1,msg:"没有查询到商品！"})
        }
    })
})

//6.2购买单件商品时，信息在商品规格表中查询，首先要获得对应的规格的id号；
router.get("/settle",(req,res)=>{
    var uid=parseInt(req.session.uid);
    if(!uid){
        return res.send({code:0,msg:"用户未登录！"})
    }
    var sid=req.query.sid;
    if(!sid){
        return res.send({code:-2,msg:"您没有选择需要购买的商品！"})
    }
    var sql="SELECT sid,img,title,specificatin,price FROM fruit_standard WHERE sid=?";
    pool.query(sql,[sid],(err,result)=>{
        if(err) throw err;
        if(result.length>0){
            res.send({code:1,msg:result})
        }else{
            res.send({code:-1,msg:"没有查询到商品！"})
        }
    })
})

//7.0添加商品值订单表
router.post("/insertDingDan",(req,res)=>{
    var uid=parseInt(req.session.uid);
    if(!uid){
        return res.send({code:0,msg:"用户未登录！"})
    }
    var arrDing=JSON.parse(req.body.jsonDing);
    //console.log(arrDing);
    var vals="";
    for(var i=0;i<arrDing[0].length;i++){
       vals+=`(null,${arrDing[0][i]},${uid},'${arrDing[1][i]}','${arrDing[2][i]}','${arrDing[3][i]}',${arrDing[4][i]},${arrDing[5][i]},${arrDing[6][i]},0,now(),${arrDing[7][i]},'${arrDing[8][i]}'),`;
    }
    vals=vals.slice(0,vals.length-1)+";";
    //console.log(vals);
    //插入到数据库中
    var sql="INSERT INTO fruit_order_item VALUES"+vals;
    pool.query(sql,(err,result)=>{
        if(err) throw err;
        if(result.affectedRows>0){
            res.send({code:1,msg:"放入订单表"});
        }else{
            res.send({code:-1,msg:"没有数据，或插入失败！"})
        }
    })
})

//8.0查询订单表的信息
router.get("/selectOrder",(req,res)=>{
    var uid=parseInt(req.session.uid);
    if(!uid){
        return res.send({code:0,msg:"用户未登录！"})
    }
    var sql="SELECT * FROM fruit_order_item WHERE uid=?";
    pool.query(sql,(err,result)=>{
        if(err) throw err;
        if(result>0){
            res.send({code:1,msg:result})
        }else{
            res.send({code:-1,msg:"没有查询到订单信息！"})
        }
    })
})


//9.0查询用户地址表
router.get("/city",(req,res)=>{
    var uid=parseInt(req.session.uid);
    if(!uid){
        return res.send({code:0,msg:"用户未登录！"})
    }
    var sql="SELECT * FROM fruit_shipping WHERE uid="+uid;
    pool.query(sql,(err,result)=>{
        if(err) throw err;
        if(result.length>0){
            res.send({code:1,msg:result});
        }else{
            res.send({code:-1,msg:"暂无地址信息！"})
        }
    })
})

//10..查询当前地址
router.get("/bianJi",(req,res)=>{
    var uid=parseInt(req.session.uid);
    if(!uid){
        return res.send({code:0,msg:"用户未登录！"})
    }
    var id=req.query.ctyId;
    if(!id){
        return res.send({code:2,msg:"地址ID号为空！"})
    }
    var sql="SELECT * FROM fruit_shipping WHERE id=? AND uid="+uid;
    pool.query(sql,[id],(err,result)=>{
        if(err) throw err;
        if(result.length>0){
            res.send({code:1,msg:result})
        }else{
            res.send({code:-1,msg:"暂无此地址！"})
        }
    })
})

//11.0修改当前地址信息
router.get("/updateCity",(req,res)=>{
    var uid=parseInt(req.session.uid);
    if(!uid){
        return res.send({code:0,msg:"用户未登录！"})
    }
    var id=req.query.id;
    if(!id){
        return res.send({code:2,msg:"地址ID号为空！"})
    }
    //id,provinceId,cityId,districtId,name,mobile,remark}
    var provinceId=req.query.provinceId;
    var cityId=req.query.cityId;
    var districtId=req.query.districtId;
    var name=req.query.name;
    var mobile=req.query.mobile;
    var remark=req.query.remark;
    var sql ="UPDATE fruit_shipping SET provinceId=?,cityId=?,districtId=?,name=?,mobile=?,remark=? WHERE id="+id+" AND uid="+uid;
    pool.query(sql,[provinceId,cityId,districtId,name,mobile,remark],(err,result)=>{
        if(err) throw err;
        if(result.affectedRows>0){
            res.send({code:1,msg:"修改成功！"})
        }else{
            res.send({code:-1,msg:"修改失败！"})
        }
    })
})

//12.0删除当前用户的地址
router.get("/deleteCity",(req,res)=>{
    var uid=parseInt(req.session.uid);
    if(!uid){
        return res.send({code:0,msg:"用户未登录！"})
    }
    var id=req.query.ctyId;
    if(!id){
        return res.send({code:2,msg:"地址ID号为空！"})
    }
    var sql="DELETE FROM fruit_shipping WHERE id="+id+" AND uid="+uid;
    pool.query(sql,(err,result)=>{
        if(err) throw err;
        if(result.affectedRows>0){
            res.send({code:1,msg:"删除成功！"})
        }else{
            res.send({code:-1,msg:"删除失败！"})
        }
    })
})

//13.0使用当前地址
router.get("/shiyongCity",(req,res)=>{
    var uid=parseInt(req.session.uid);
    if(!uid){
        return res.send({code:0,msg:"用户未登录！"})
    }
    var id=req.query.ctyId;
    if(!id){
        return res.send({code:2,msg:"地址ID号为空！"})
    }
    var sql="SELECT * FROM fruit_shipping WHERE id="+id+" AND uid="+uid;
    pool.query(sql,(err,result)=>{
        if(err) throw err;
        if(result.length>0){
            res.send({code:1,msg:result})
        }else{
            res.send({code:-1,msg:"没有该地址！"})
        }
    })
})

//14.0修改默认地址
router.get("/updateMoren",(req,res)=>{
    var uid=parseInt(req.session.uid);
    if(!uid){
        return res.send({code:0,msg:"用户未登录！"})
    }
    var id=req.query.ctyId;
    if(!id){
        return res.send({code:2,msg:"地址ID号为空！"})
    }
    var sql="UPDATE fruit_shipping SET zt=1 WHERE id="+id+" AND uid="+uid;
    pool.query(sql,(err,result)=>{
        if(err) throw err;
        if(result.affectedRows>0){
            //如果修改成功，将其他的状态改为0
            var sql="UPDATE fruit_shipping SET zt=0 WHERE id!="+id+" AND uid="+uid;
            pool.query(sql,(err,result)=>{
                if(err) throw err;
                res.send({code:1,msg:"默认地址设置成功！"})
            })
        }else{
            res.send({code:-1,msg:"默认地址设置失败！"})
        }
    })
})

//15.0新增收货地址
router.get("/insertCity",(req,res)=>{
    var uid=parseInt(req.session.uid);
    if(!uid){
        return res.send({code:0,msg:"用户未登录！"})
    }
    //遍历不能为空
    for(var key in req.query){
        if(req.query[key]==""){
            return res.send({code:2,msg:"信息不能为空！"})
        }
    }
    var provinceId=req.query.provinceId;
    var cityId=req.query.cityId;
    var districtId=req.query.districtId;
    var name=req.query.name;
    var mobile=req.query.mobile;
    var remark=req.query.remark;
    var sql ="INSERT INTO fruit_shipping VALUES(null,"+uid+",?,?,?,?,?,?,0)";
    pool.query(sql,[provinceId,cityId,districtId,name,mobile,remark],(err,result)=>{
        if(err) throw err;
        if(result.affectedRows>0){
            res.send({code:1,msg:"添加成功！"})
        }else{
            res.send({code:-1,msg:"添加失败！"})
        }
    })
})
//导出路由器
module.exports=router;