/*首页路由*/
const express=require('express');
//引入连接池
const pool=require('../pool.js');
//创建空路由器
var router=express.Router();

router.get("/retrieval",(req,res)=>{
    var sql=`select * from fruit_index_product where floor=1`;
    pool.query(sql,(err,result)=>{
        if(err) throw err;
        res.writeHead(200,{
            "Access-Control-Allow-Origin":"*"
        });
        res.write(JSON.stringify(result))
        res.end();
    })
})



//导出路由器
module.exports=router;