/*后台用户路由*/

const express=require('express');
//引入连接池
const pool=require('../pool.js');
//创建空路由器
var router=express.Router();

/*******后台登录用户和密码验证***********/
router.post("/user",(req,res)=>{
    var obj=req.body;
    var $backname=obj.backname;
    var $backpwd=obj.backpwd;
    //console.log(obj)
    var sql=`select * from backstage_user_item where backname=? and backPwd=?`;
    pool.query(sql,[$backname,$backpwd],(err,result)=>{
        if(err) throw err;
        if(result.length>0)
           res.send("1");
        else
           res.send("0");
    })
})

//1.后台查询用户列表
router.get("/userlist",(req,res)=>{
    var obj=req.query;
    //开始查询编号
    var start=parseInt(obj.start);
    var $count=parseInt(obj.count);
    var $start=(start-1)*$count;
    var sql=`select uid as 编号,avatar as 用户图像,username as 用户名,gender as 性别,age as 年龄,phone as 电话号码,email as 邮箱,birthday as 生日,created as 注册时间 from fruit_user limit ?,?`;
    pool.query(sql,[$start,$count],(err,result)=>{
        if(err) console.log(err);
        res.send(result);
    })
})
//1.1快速查找用户
router.get("/kuaisuuser",(req,res)=>{
    var obj=req.query;
    var $kuaisu=obj.kuaisu;
    //console.log($kuaisu)
    var sql=`select uid as 编号,avatar as 用户图像,username as 用户名,gender as 性别,age as 年龄,phone as 电话号码,email as 邮箱,birthday as 生日,created as 注册时间 from fruit_user where username=?`;
    pool.query(sql,[$kuaisu],(err,result)=>{
        if(err) console.log(err);
        if(result.length>0)
          res.send(result);
        else
          res.send("0")
    })
})
//1.2删除用户
router.get("/deleteuser",(req,res)=>{
    var obj=req.query;
    var $uid=parseInt(obj.uid);
    var sql=`delete from fruit_user where uid=?`;
    pool.query(sql,[$uid],(err,result)=>{
        if(err) console.log(err);
        if(result.affectedRows>0)
          res.send("1");
        else
          res.send("0")
    })
})
//1.3修改用户
router.get("/updateuser",(req,res)=>{
    var obj=req.query;
    //console.log(obj)
    var $id=parseInt(obj.id);
    var $avatar=obj.avatar;
    var $username=obj.username;
    var $gender= obj.gender=="男"?1:obj.gender=="女"?0:2;
    var $age= obj.age;
    var $phone=obj.phone;
    var $email=obj.email;
    var $birthday=obj.birthday;
    var $created=obj.created;
    var sql=`update fruit_user set avatar=?,username=?,gender=?,age=?,phone=?,email=?,birthday=?,created=? where uid=?`;
    pool.query(sql,[$avatar,$username,$gender,$age,$phone,$email,$birthday,$created,$id],(err,result)=>{
        if(err) console.log(err);
        if(result.affectedRows>0)
          res.send("1");
        else
          res.send("0")
    })
})

//1.4显示用户数
router.get("/countuser",(req,res)=>{
    var sql=`select count(*) as c from fruit_user`;
    pool.query(sql,[],(err,result)=>{
        if(err) console.log(err);
          res.send(result);
          //console.log(result)
    })
})


//2.查询主页轮播图表
router.get("/carousellist",(req,res)=>{
    var sql=`select * from fruit_index_carousel`;
    pool.query(sql,[],(err,result)=>{
        if(err) console.log(err);
        res.send(result);
    })
})


//导出路由器
module.exports=router;