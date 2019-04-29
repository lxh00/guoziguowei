/*商品路由*/
const express=require('express');
//引入连接池
const pool=require('../pool.js');
//创建空路由器
var router=express.Router();

//1.查询商品详情
router.get("/retrieval",(req,res)=>{
  var output={
    product:{/*title,subtitle,..*/},//商品
    pics:[/*{sm,md,lg},{sm,md,lg},...*/], //图库
    specs:[/*{lid,spec},{lid,spec},...*/], //详情规格
    param:[]//介绍
  }
  res.writeHead(200,{
    "Access-Control-Allow-Origin":"*"
  });
  var lid=req.query.lid;
  //console.log(lid);
  if(lid!==undefined){
    //1.查询一个商品类型
    var sql="select * from fruit_list where lid=?";
    pool.query(sql,[lid],(err,result)=>{
      if(err) console.log(err);
      if(result.length!=0){
        //result:[{product}]
        output.product=result[0];
        //console.log(output.product);
        //2.查询图片列表
        var sql="select * from fruit_standard_pic where list_sid=?";
        pool.query(sql,[lid],(err,result)=>{
          if(err) console.log(err);
          //result:[{sm,md,lg},{sm,md,lg},...]
          output.pics=result;
          //3.查询规格列表
          //   var kind_id=output.pics.kind_sid;
          var sql="select * from fruit_standard where list_id=?";
          //console.log(lid);
          pool.query(
            sql,[lid],(err,result)=>{
              if(err) console.log(err);
              output.specs=result;
              //4.查询介绍表
              var sql="select * from fruit_param_item where xq_id=?"
              pool.query(sql,[lid],(err,result)=>{
                if(err) throw err;
                output.param=result;
                //5.将完整结果回发客户端
                res.write(JSON.stringify(output));
                //   console.log(JSON.stringify(output))
                res.end();
              })
            }
          )
        })
      }else{
        res.write(JSON.stringify(output));
        res.end();
      }
    });
    
  }else{
    res.write(JSON.stringify(output));
    res.end();
  }
})

//2.查询单个商品信息
router.get("/spec",(req,res)=>{
  var sid=req.query.sid;
  var sql="SELECT title,subtitle,price,inventory,weight,promotion FROM fruit_standard WHERE sid=?";
  pool.query(sql,[sid],(err,result)=>{
    if(err) throw err;
    if(result.length>0){
      res.send(result);
    }
  })
})

//3.搜索商品名称,利用表单提交
router.get("/list",(req,res)=>{
  var kname=req.query.kname;
    console.log(kname)
    //在node中实现页面跳转
    res.redirect("http://127.0.0.1:3000/list.html?kname="+kname);
})

//3.1查询商品列表
router.get("/listItem",(req,res)=>{
  var kname=req.query.kname;
  console.log(kname)
  if(kname){
    //查询是否存在此类商品
    sql="SELECT kid FROM fruit_kind WHERE kname=?";
    pool.query(sql,[kname],(err,result)=>{
      if(err) throw err;
      if(result.length>0){
        var kid=result[0].kid;
        var sql="SELECT * FROM fruit_list WHERE kind_id=?";
        //查询属于此类商品的所有商品
        pool.query(sql,[kid],(err,result)=>{
          if(err) throw err;
          if(result.length>0){
            res.send({code:1,msg:result})
          }else{
            res.send({code:0,msg:"商品还没有上架"})
          }
        })
      }else{
        res.send({code:-1,msg:"没有此类商品"});
        res.end();
      }
    })
  }
})
//4.查询推荐商品
router.get("/tuijian",(req,res)=>{
  var sql="SELECT * FROM fruit_list WHERE lid<=16";
  pool.query(sql,(err,result)=>{
    if(err) throw err;
    if(result.length>0){
       res.send({code:1,msg:result})
    }else{
      res.send({code:-1,msg:"暂无商品"})
    }
  })
})
//导出路由器
module.exports=router;