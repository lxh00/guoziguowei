#设置编码格式UTF8
SET NAMES UTF8;
#丢弃数据库，如果存在fruit_backstage
DROP DATABASE IF EXISTS fruit_backstage;
#新建数据库fruit_backstage
CREATE DATABASE fruit_backstage CHARSET UTF8;
#进入数据库
USE fruit_backstage;
#1.主页轮播图表fruit_index_carousel
CREATE TABLE fruit_index_carousel(
  cid INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  img VARCHAR(128) NOT NULL,   #轮播图图片
  title VARCHAR(64),           #轮播图标题
  href VARCHAR(128)            #轮播图路径
);
#在轮播图表fruit_index_carousel中插入数据
INSERT INTO fruit_index_carousel VALUES
(1,'','',''),
(NULL,'','','');

#2.主页商品表fruit_index_product
CREATE TABLE fruit_index_product(
  pid INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  title VARCHAR(64) NOT NULL,   #主页商品标题
  details VARCHAR(128),         #详细资料
  pic VARCHAR(128),             #主页商品图片
  price DECIMAL(10,2),          #主页商品价格
  href VARCHAR(128),            #主页商品路径
  floor TINYINT(2)              #所属楼层号
);
#在主页商品表fruit_index_product中插入数据
INSERT INTO fruit_index_product VALUES
(1,'百香果 精品中果12个装','','./images/index/section/baixiangguo.png','','http://127.0.0.1:3000/product_retrieval.html?lid=1',1),
(2,'红颜奶油草莓','','./images/index/section/caomei.png','','http://127.0.0.1:3000/product_retrieval.html?lid=2',1),
(3,'智利原装进口车厘子JJ级','','./images/index/section/chelizi.png','','http://127.0.0.1:3000/product_retrieval.html?lid=3',1),
(4,'杨氏YANG’S 精品脐橙','','./images/index/section/chengzi.png','','http://127.0.0.1:3000/product_retrieval.html?lid=4',1),
(5,'西洲密瓜哈密瓜','','./images/index/section/hmg.png','','http://127.0.0.1:3000/product_retrieval.html?lid=5',1),
(6,'越南进口红心火龙果','','./images/index/section/huolongguo.png','','http://127.0.0.1:3000/product_retrieval.html?lid=6',1),
(7,'泰国进口龙眼','','./images/index/section/longyan.png','','http://127.0.0.1:3000/product_retrieval.html?lid=7',1),
(8,'京东生鲜 陕西眉县 徐香猕猴桃','','./images/index/section/mht.png','','http://127.0.0.1:3000/product_retrieval.html?lid=8',1),
(9,'京东生鲜 四川安岳黄柠檬8颗','','./images/index/section/ningmeng.png','','http://127.0.0.1:3000/product_retrieval.html?lid=9',1),
(10,'进口 mini牛油果','','./images/index/section/niuyouguo.png','','http://127.0.0.1:3000/product_retrieval.html?lid=10',1),
(11,'烟台红富士苹果','','./images/index/section/pingguo.png','','http://127.0.0.1:3000/product_retrieval.html?lid=11',1),
(12,'广西荔浦糖桔 砂糖橘 甜橘子','','./images/index/section/shatangju.png','','http://127.0.0.1:3000/product_retrieval.html?lid=12',1),
(13,'精品国产麒麟大西瓜1粒装','','./images/index/section/xigua.png','','http://127.0.0.1:3000/product_retrieval.html?lid=13',1),
(14,'农夫山泉 17.5°橙 5kg装','','./images/index/section/xiangcheng.png','','http://127.0.0.1:3000/product_retrieval.html?lid=14',1);


#3.水果规格表fruit_standard
CREATE TABLE fruit_standard(
  sid INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  list_id INT(11) NOT NULL,  #所属水果列表id
  title VARCHAR(128),        #主标题
  subtitle VARCHAR(128),     #副标题
  price DECIMAL(10,2),       #价格
  promise VARCHAR(64),       #服务
  img VARCHAR(128),          #规格种类图片
  specificatin VARCHAR(48),  #规格种类
  inventory INT(11),         #库存
  weight DECIMAL(10,2),         #重量
  promotion VARCHAR(64),     #促销内容
  hint VARCHAR(64)           #提示、备注
);
#在水果规格表fruit_standard中插入数据
INSERT INTO fruit_standard VALUES
(NULL,1,'百香果 精品中果12个装 单果50-80g 新鲜水果','抢购中',34.90,'生鲜99元免基础运费(50kg内) 京准达 自提','./images/details/sm/sm-baixiangguo-1.png','12个装 单果50-80g',99,1.52,"满129减30,满159减30,满199减50",'不支持7天无理由退货'),
(NULL,1,'百香果 精品中果20个装 单果50-80g 新鲜水果','抢购中',39.90,'生鲜99元免基础运费(50kg内) 京准达 自提','./images/details/sm/sm-baixiangguo-2.png','20个装 单果50-80g',99,1.52,"满129减30,满159减30,满199减50",'不支持7天无理由退货'),
(NULL,1,'百香果 精品中果30个装 单果50-80g 新鲜水果','抢购中',59.90,'生鲜99元免基础运费(50kg内) 京准达 自提','./images/details/sm/sm-baixiangguo-3.png','30个家庭装 单果50-80g',99,1.52,'满129减30,满159减30,满199减50','不支持7天无理由退货'),
(NULL,1,'百香果 精品中果12个装 单果50-80g 新鲜水果','抢购中',39.90,'生鲜99元免基础运费(50kg内) 京准达 自提','./images/details/sm/sm-baixiangguo-4.png','12个装 单果70-100g',99,1.52,'满129减30,满159减30,满199减50','不支持7天无理由退货'),
(NULL,2,'红颜奶油草莓 约重1kg/30-40颗 年华礼盒 新鲜水果','抢购中',92.90,'生鲜99元免基础运费(50kg内) 京准达 自提','./images/details/sm/sm-caomei-1.png','红奶油草莓 分享装约2斤',99,1.58,'满159减30,满199减50','不支持七天无理由退货'),
(NULL,2,'红颜奶油草莓 约重1kg/30-40颗 年华礼盒 新鲜水果','抢购中',92.90,'生鲜99元免基础运费(50kg内) 京准达 自提','./images/details/sm/sm-caomei-2.png','红奶油草莓 尝鲜装约1斤',99,1.58,'满159减30,满199减50','不支持七天无理由退货'),
(NULL,2,'红颜奶油草莓 约重1kg/30-40颗 年华礼盒 新鲜水果','抢购中',92.90,'生鲜99元免基础运费(50kg内) 京准达 自提','./images/details/sm/sm-caomei-3.png','章姬奶油草莓 尝鲜装约250g',99,1.58,'满159减30,满199减50','不支持七天无理由退货'),
(NULL,2,'红颜奶油草莓 约重1kg/30-40颗 年华礼盒 新鲜水果','抢购中',92.90,'生鲜99元免基础运费(50kg内) 京准达 自提','./images/details/sm/sm-caomei-4.png','章姬奶油草莓 分享装约2斤',99,1.58,'满159减30,满199减50','不支持七天无理由退货'),
(NULL,3,'智利原装进口车厘子JJ级 约2.5kg礼盒装 果径28-30mm 年货礼盒 新鲜水果','抢购中',449.00,'生鲜99元免基础运费(50kg内) 京准达 自提','./images/details/sm/sm-chelizi-1.png','J级1磅 果径约26-28mm',99,2.50,'满159减30,满199减50','不支持七天无理由退货'),
(NULL,3,'智利原装进口车厘子JJ级 约2.5kg礼盒装 果径28-30mm 年货礼盒 新鲜水果','抢购中',449.00,'生鲜99元免基础运费(50kg内) 京准达 自提','./images/details/sm/sm-chelizi-2.png','J级2磅 果径约26-28mm',99,2.50,'满159减30,满199减50','不支持七天无理由退货'),
(NULL,3,'智利原装进口车厘子JJ级 约2.5kg礼盒装 果径28-30mm 年货礼盒 新鲜水果','抢购中',449.00,'生鲜99元免基础运费(50kg内) 京准达 自提','./images/details/sm/sm-chelizi-3.png','J级1磅 果径约28-30mm',99,2.50,'满159减30,满199减50','不支持七天无理由退货'),
(NULL,3,'智利原装进口车厘子JJ级 约2.5kg礼盒装 果径28-30mm 年货礼盒 新鲜水果','抢购中',449.00,'生鲜99元免基础运费(50kg内) 京准达 自提','./images/details/sm/sm-chelizi-4.png','J级1磅 果径约30-32mm',99,2.50,'满159减30,满199减50','不支持七天无理由退货'),
(NULL,3,'智利原装进口车厘子JJ级 约2.5kg礼盒装 果径28-30mm 年货礼盒 新鲜水果','抢购中',449.00,'生鲜99元免基础运费(50kg内) 京准达 自提','./images/details/sm/sm-chelizi-5.png','JJ级原箱2.5kg 果径约26-28mm',99,2.50,'满159减30,满199减50','不支持七天无理由退货'),
(NULL,4,'杨氏YANG’S 精品脐橙 约3kg装 钻石果 年货礼盒 新老包装随机水果','抢购中',49.90,'生鲜99元免基础运费(50kg内) 京准达 自提','./images/details/sm/sm-chengzi-1.png','赣南橙4斤精致礼盒',99,3.00,'满159减30,满199减50','不支持七天无理由退货'),
(NULL,4,'杨氏YANG’S 精品脐橙 约3kg装 钻石果 年货礼盒 新老包装随机水果','抢购中',69.90,'生鲜99元免基础运费(50kg内) 京准达 自提','./images/details/sm/sm-chengzi-2.png','赣南橙6斤猪年定制版礼盒',99,3.00,'满159减30,满199减50','不支持七天无理由退货'),
(NULL,4,'杨氏YANG’S 精品脐橙 约3kg装 钻石果 年货礼盒 新老包装随机水果','抢购中',199.90,'生鲜99元免基础运费(50kg内) 京准达 自提','./images/details/sm/sm-chengzi-3.png','赣南橙10斤高端出口原装礼盒',99,3,'满159减30,满199减50','不支持七天无理由退货'),
(NULL,4,'杨氏YANG’S 精品脐橙 约3kg装 钻石果 年货礼盒 新老包装随机水果','抢购中',59.90,'生鲜99元免基础运费(50kg内) 京准达 自提','./images/details/sm/sm-chengzi-4.png','五丰赣南橙铂金果12粒',99,3.00,'满159减30,满199减50','不支持七天无理由退货'),
(NULL,4,'杨氏YANG’S 精品脐橙 约3kg装 钻石果 年货礼盒 新老包装随机水果','抢购中',49.90,'生鲜99元免基础运费(50kg内) 京准达 自提','./images/details/sm/sm-chengzi-5.png','赣南橙铂金果3斤装',99,3.00,'满159减30,满199减50','不支持七天无理由退货'),
(NULL,5,'西洲密瓜哈密瓜 1粒装 单果1.5kg以上 新鲜水果','抢购中',38.80,'生鲜99元免基础运费(50kg内) 京准达 自提','./images/details/sm/sm-hmg-1.png','哈密瓜 1粒',99,1.82,'满159减30,满199减50','不支持七天无理由退货'),
(NULL,5,'西洲密瓜哈密瓜 1粒装 单果1.5kg以上 新鲜水果','抢购中',68.80,'生鲜99元免基础运费(50kg内) 京准达 自提','./images/details/sm/sm-hmg-2.png','哈密瓜 2粒',99,1.82,'满159减30,满199减50','不支持七天无理由退货'),
(NULL,5,'西洲密瓜哈密瓜 1粒装 单果1.5kg以上 新鲜水果','抢购中',48.80,'生鲜99元免基础运费(50kg内) 京准达 自提','./images/details/sm/sm-hmg-3.png','玫珑瓜 1粒',99,1.82,'满159减30,满199减50','不支持七天无理由退货'),
(NULL,5,'西洲密瓜哈密瓜 1粒装 单果1.5kg以上 新鲜水果','抢购中',38.80,'生鲜99元免基础运费(50kg内) 京准达 自提','./images/details/sm/sm-hmg-4.png','哈密瓜 1粒',99,1.82,'满159减30,满199减50','不支持七天无理由退货'),
(NULL,5,'西洲密瓜哈密瓜 1粒装 单果1.5kg以上 新鲜水果','抢购中',138.80,'生鲜99元免基础运费(50kg内) 京准达 自提','./images/details/sm/sm-hmg-5.png','玫珑瓜礼盒 6粒',99,1.82,'满159减30,满199减50','不支持七天无理由退货'),
(NULL,5,'西洲密瓜哈密瓜 1粒装 单果1.5kg以上 新鲜水果','抢购中',68.80,'生鲜99元免基础运费(50kg内) 京准达 自提','./images/details/sm/sm-hmg-1.png','黄金蜜瓜 1粒',99,1.82,'满159减30,满199减50','不支持七天无理由退货'),
(NULL,6,'越南进口红心火龙果 3个装 单果约330~420g 新鲜水果','抢购中',35.90,'生鲜99元免基础运费(50kg内) 京准达 自提','./images/details/sm/sm-huolongguo-1.png','红心巨无霸果 2个',99,1.20,'满159减30,满199减50','不支持七天无理由退货'),
(NULL,6,'越南进口红心火龙果 3个装 单果约330~420g 新鲜水果','抢购中',55.90,'生鲜99元免基础运费(50kg内) 京准达 自提','./images/details/sm/sm-huolongguo-2.png','红心大果 3个',99,1.20,'满159减30,满199减50','不支持七天无理由退货'),
(NULL,6,'越南进口红心火龙果 3个装 单果约330~420g 新鲜水果','抢购中',99.80,'生鲜99元免基础运费(50kg内) 京准达 自提','./images/details/sm/sm-huolongguo-3.png','红心大果礼盒 6个',99,1.20,'满159减30,满199减50','不支持七天无理由退货'),
(NULL,6,'越南进口红心火龙果 3个装 单果约330~420g 新鲜水果','抢购中',39.90,'生鲜99元免基础运费(50kg内) 京准达 自提','./images/details/sm/sm-huolongguo-4.png','红心中果 3个',99,3.20,'满159减30,满199减50','不支持七天无理由退货'),
(NULL,6,'越南进口红心火龙果 3个装 单果约330~420g 新鲜水果','抢购中',68.90,'生鲜99元免基础运费(50kg内) 京准达 自提','./images/details/sm/sm-huolongguo-5.png','红心中果原装箱',99,1.20,'满159减30,满199减50','不支持七天无理由退货'),
(NULL,6,'越南进口红心火龙果 3个装 单果约330~420g 新鲜水果','抢购中',88.90,'生鲜99元免基础运费(50kg内) 京准达 自提','./images/details/sm/sm-huolongguo-1.png','红心大果原装箱',99,2.20,'满159减30,满199减50','不支持七天无理由退货'),
(NULL,7,'泰国进口龙眼 精选一级果1kg装 新鲜水果','抢购中',24.90,'生鲜99元免基础运费(50kg内) 京准达 自提','./images/details/sm/sm-longyan-2.png','泰国龙眼标准果 500g',99,1.50,'满159减30,满199减50','不支持七天无理由退货'),
(NULL,7,'泰国进口龙眼 精选一级果1kg装 新鲜水果','抢购中',58.90,'生鲜99元免基础运费(50kg内) 京准达 自提','./images/details/sm/sm-longyan-3.png','泰国龙眼标准果 1kg',99,1.50,'满159减30,满199减50','不支持七天无理由退货'),
(NULL,7,'泰国进口龙眼 精选一级果1kg装 新鲜水果','抢购中',38.90,'生鲜99元免基础运费(50kg内) 京准达 自提','./images/details/sm/sm-longyan-4.png','泰国龙眼一级果 1kg',99,1.50,'满159减30,满199减50','不支持七天无理由退货'),
(NULL,7,'泰国进口龙眼 精选一级果1kg装 新鲜水果','抢购中',128.90,'生鲜99元免基础运费(50kg内) 京准达 自提','./images/details/sm/sm-longyan-5.png','泰国龙眼一级果 2.5kg',99,5.50,'满159减30,满199减50','不支持七天无理由退货'),
(NULL,8,'京东生鲜 陕西眉县 徐香绿心猕猴桃 22个饭盒装 单果90~105g 新鲜水果','抢购中',43.60,'生鲜99元免基础运费(50kg内) 京准达 自提','./images/details/sm/sm-mht-1.png','徐香板盒22个90-105g',99,2.00,'满159减30,满199减50','不支持七天无理由退货'),
(NULL,8,'京东生鲜 陕西眉县 徐香绿心猕猴桃 22个饭盒装 单果90~105g 新鲜水果','抢购中',48.60,'生鲜99元免基础运费(50kg内) 京准达 自提','./images/details/sm/sm-mht-2.png','徐香超大果20个115-130g',99,3.00,'满159减30,满199减50','不支持七天无理由退货'),
(NULL,8,'京东生鲜 陕西眉县 徐香绿心猕猴桃 22个饭盒装 单果90~105g 新鲜水果','抢购中',58.60,'生鲜99元免基础运费(50kg内) 京准达 自提','./images/details/sm/sm-mht-3.png','徐香巨无霸18个130g以上',99,3.10,'满159减30,满199减50','不支持七天无理由退货'),
(NULL,8,'京东生鲜 陕西眉县 徐香绿心猕猴桃 22个饭盒装 单果90~105g 新鲜水果','抢购中',68.80,'生鲜99元免基础运费(50kg内) 京准达 自提','./images/details/sm/sm-mht-4.png','手提礼盒徐香30个90-100g',99,2.00,'满159减30,满199减50','不支持七天无理由退货'),
(NULL,8,'京东生鲜 陕西眉县 徐香绿心猕猴桃 22个饭盒装 单果90~105g 新鲜水果','抢购中',55.80,'生鲜99元免基础运费(50kg内) 京准达 自提','./images/details/sm/sm-mht-5.png','有机徐香15个90-105g',99,2.00,'满159减30,满199减50','不支持七天无理由退货'),
(NULL,9,'京东生鲜 四川安岳黄柠檬8颗 一级大果 单果约100-120g 新鲜水果','抢购中',18.80,'生鲜99元免基础运费(50kg内) 京准达 自提','./images/details/sm/sm-ningmeng-2.png','四川安岳黄柠檬中果 4颗',99,0.80,'满159减30,满199减50','不支持七天无理由退货'),
(NULL,9,'京东生鲜 四川安岳黄柠檬8颗 一级大果 单果约100-120g 新鲜水果','抢购中',38.80,'生鲜99元免基础运费(50kg内) 京准达 自提','./images/details/sm/sm-ningmeng-3.png','四川安岳黄柠檬大果 8颗',99,1.80,'满159减30,满199减50','不支持七天无理由退货'),
(NULL,9,'京东生鲜 四川安岳黄柠檬8颗 一级大果 单果约100-120g 新鲜水果','抢购中',58.80,'生鲜99元免基础运费(50kg内) 京准达 自提','./images/details/sm/sm-ningmeng-4.png','海南大青柠 8粒装',99,2.80,'满159减30,满199减50','不支持七天无理由退货'),
(NULL,9,'京东生鲜 四川安岳黄柠檬8颗 一级大果 单果约100-120g 新鲜水果','抢购中',28.80,'生鲜99元免基础运费(50kg内) 京准达 自提','./images/details/sm/sm-ningmeng-5.png','海南青柠+四川黄柠 双享4颗',99,0.80,'满159减30,满199减50','不支持七天无理由退货'),
(NULL,10,'进口 mini牛油果 6个装 单果重约100-130g 新鲜水果','抢购中',19.90,'生鲜99元免基础运费(50kg内) 京准达 自提','./images/details/sm/sm-niuyouguo-1.png','6粒 经典装',99,0.78,'满159减30,满199减50','不支持七天无理由退货'),
(NULL,10,'进口 mini牛油果 6个装 单果重约100-130g 新鲜水果','抢购中',38.90,'生鲜99元免基础运费(50kg内) 京准达 自提','./images/details/sm/sm-niuyouguo-2.png','4粒 巨无霸装',99,1.78,'满159减30,满199减50','不支持七天无理由退货'),
(NULL,10,'进口 mini牛油果 6个装 单果重约100-130g 新鲜水果','抢购中',28.80,'生鲜99元免基础运费(50kg内) 京准达 自提','./images/details/sm/sm-niuyouguo-3.png','4粒 实惠装',99,0.78,'满159减30,满199减50','不支持七天无理由退货'),
(NULL,10,'进口 mini牛油果 6个装 单果重约100-130g 新鲜水果','抢购中',12.80,'生鲜99元免基础运费(50kg内) 京准达 自提','./images/details/sm/sm-niuyouguo-4.png','2粒 即食装',99,0.78,'满159减30,满199减50','不支持七天无理由退货'),
(NULL,10,'进口 mini牛油果 6个装 单果重约100-130g 新鲜水果','抢购中',23.90,'生鲜99元免基础运费(50kg内) 京准达 自提','./images/details/sm/sm-niuyouguo-5.png','6粒 生熟搭配装',99,0.78,'满159减30,满199减50','不支持七天无理由退货'),
(NULL,10,'进口 mini牛油果 6个装 单果重约100-130g 新鲜水果','抢购中',32.80,'生鲜99元免基础运费(50kg内) 京准达 自提','./images/details/sm/sm-niuyouguo-1.png','12粒 家庭装',99,0.78,'满159减30,满199减50','不支持七天无理由退货'),
(NULL,11,'烟台红富士苹果 12个 净重2.6kg以上 单果190-240 一二级混装','抢购中',39.90,'生鲜99元免基础运费(50kg内) 京准达 自提','./images/details/sm/sm-pingguo-2.png','烟台红富士12个（190-240g）',99,3.11,'满159减30,满199减50','不支持七天无理由退货'),
(NULL,11,'烟台红富士苹果 12个 净重2.6kg以上 单果190-240 一二级混装','抢购中',39.90,'生鲜99元免基础运费(50kg内) 京准达 自提','./images/details/sm/sm-pingguo-3.png','烟台红富士10斤（190-240g）',99,3.11,'满159减30,满199减50','不支持七天无理由退货'),
(NULL,11,'烟台红富士苹果 12个 净重2.6kg以上 单果190-240 一二级混装','抢购中',39.90,'生鲜99元免基础运费(50kg内) 京准达 自提','./images/details/sm/sm-pingguo-4.png','新疆阿克苏苹果12个 5斤',99,3.11,'满159减30,满199减50','不支持七天无理由退货'),
(NULL,11,'烟台红富士苹果 12个 净重2.6kg以上 单果190-240 一二级混装','抢购中',28.90,'生鲜99元免基础运费(50kg内) 京准达 自提','./images/details/sm/sm-pingguo-5.png','阿克苏苹果6个大果（85-90mm）',99,3.11,'满159减30,满199减50','不支持七天无理由退货'),
(NULL,11,'烟台红富士苹果 12个 净重2.6kg以上 单果190-240 一二级混装','抢购中',39.90,'生鲜99元免基础运费(50kg内) 京准达 自提','./images/details/sm/sm-pingguo-2.png','甘肃红富士9个铂金果',99,3.61,'满159减30,满199减50','不支持七天无理由退货'),
(NULL,12,'广西荔浦糖桔 砂糖橘 甜橘子 2.5kg礼盒装 年货礼盒 新鲜水果','抢购中',42.90,'生鲜99元免基础运费(50kg内) 京准达 自提','./images/details/sm/sm-shatangju-1.png','荔浦砂糖橘 2.5kg',99,2.72,'满159减30,满199减50','不支持七天无理由退货'),
(NULL,12,'广西荔浦糖桔 砂糖橘 甜橘子 2.5kg礼盒装 年货礼盒 新鲜水果','抢购中',68.90,'生鲜99元免基础运费(50kg内) 京准达 自提','./images/details/sm/sm-shatangju-1.png','不知火丑柑礼盒装',99,2.72,'满159减30,满199减50','不支持七天无理由退货'),
(NULL,12,'广西荔浦糖桔 砂糖橘 甜橘子 2.5kg礼盒装 年货礼盒 新鲜水果','抢购中',60.80,'生鲜99元免基础运费(50kg内) 京准达 自提','./images/details/sm/sm-shatangju-3.png','荔浦砂糖橘 4kg',99,2.72,'满159减30,满199减50','不支持七天无理由退货'),
(NULL,12,'广西荔浦糖桔 砂糖橘 甜橘子 2.5kg礼盒装 年货礼盒 新鲜水果','抢购中',58.90,'生鲜99元免基础运费(50kg内) 京准达 自提','./images/details/sm/sm-shatangju-4.png','春见粑粑柑 5kg',99,2.72,'满159减30,满199减50','不支持七天无理由退货'),
(NULL,12,'广西荔浦糖桔 砂糖橘 甜橘子 2.5kg礼盒装 年货礼盒 新鲜水果','抢购中',88.90,'生鲜99元免基础运费(50kg内) 京准达 自提','./images/details/sm/sm-shatangju-5.png','千堆雪 不知火年货礼盒',99,2.22,'满159减30,满199减50','不支持七天无理由退货'),
(NULL,13,'精品国产麒麟大西瓜1粒装 单果约3.5kg 新鲜水果','抢购中',55.90,'生鲜99元免基础运费(50kg内) 京准达 自提','./images/details/sm/sm-xigua-1.png','麒麟瓜 1粒',99,4.00,'满159减30,满199减50','不支持七天无理由退货'),
(NULL,13,'精品国产麒麟大西瓜1粒装 单果约3.5kg 新鲜水果','抢购中',58.90,'生鲜99元免基础运费(50kg内) 京准达 自提','./images/details/sm/sm-xigua-2.png','黄肉西瓜 1粒',99,5.00,'满159减30,满199减50','不支持七天无理由退货'),
(NULL,13,'精品国产麒麟大西瓜1粒装 单果约3.5kg 新鲜水果','抢购中',65.90,'生鲜99元免基础运费(50kg内) 京准达 自提','./images/details/sm/sm-xigua-5.png','黑美人 1粒',99,4.00,'满159减30,满199减50','不支持七天无理由退货'),
(NULL,13,'精品国产麒麟大西瓜1粒装 单果约3.5kg 新鲜水果','抢购中',55.80,'生鲜99元免基础运费(50kg内) 京准达 自提','./images/details/sm/sm-xigua-3.png','绿宝香瓜 4粒',99,2.00,'满159减30,满199减50','不支持七天无理由退货'),
(NULL,14,'农夫山泉 17.5°橙 5kg装 铂金果 年货礼盒 新鲜水果','抢购中',139.00,'生鲜99元免基础运费(50kg内) 京准达 自提','./images/details/sm/sm-xiangcheng-3.png','6斤装 铂金果',99,5.56,'满159减30,满199减50','不支持七天无理由退货'),
(NULL,14,'农夫山泉 17.5°橙 5kg装 铂金果 年货礼盒 新鲜水果','抢购中',158.00,'生鲜99元免基础运费(50kg内) 京准达 自提','./images/details/sm/sm-xiangcheng-1.png','10斤装 铂金果',99,5.56,'满159减30,满199减50','不支持七天无理由退货'),
(NULL,14,'农夫山泉 17.5°橙 5kg装 铂金果 年货礼盒 新鲜水果','抢购中',148.00,'生鲜99元免基础运费(50kg内) 京准达 自提','./images/details/sm/sm-xiangcheng-4.png','6斤装 钻石果',99,5.56,'满159减30,满199减50','不支持七天无理由退货'),
(NULL,14,'农夫山泉 17.5°橙 5kg装 铂金果 年货礼盒 新鲜水果','抢购中',188.00,'生鲜99元免基础运费(50kg内) 京准达 自提','./images/details/sm/sm-xiangcheng-5.png','10斤装 钻石果',99,5.56,'满159减30,满199减50','不支持七天无理由退货'),
(NULL,15,'果斋园 台湾无籽青柠檬 20个装 总重约480-600g','抢购中',108.00,'生鲜99元免基础运费(50kg内) 京准达 自提','./images/pro_retrieval/lg_image/5acc9f6bN770a3002.jpg','20个装 总重约480-600g',99,5.56,'满159减30,满199减50','不支持七天无理由退货'),
(NULL,15,'果斋园 台湾无籽青柠檬 25个装 总重约500-700g','抢购中',108.00,'生鲜99元免基础运费(50kg内) 京准达 自提','./images/pro_retrieval/lg_image/5acc9f69N69a3158e.jpg','25个装 总重约500-700g',99,5.56,'满159减30,满199减50','不支持七天无理由退货'),
(NULL,15,'果斋园 台湾无籽青柠檬 20个装 总重约480-600g','抢购中',108.00,'生鲜99元免基础运费(50kg内) 京准达 自提','./images/pro_retrieval/lg_image/5acc9f73N4364f5a2.jpg','20个装 总重约480-600g',99,5.56,'满159减30,满199减50','不支持七天无理由退货'),
(NULL,15,'果斋园 台湾无籽青柠檬 30个装 总重约500-700g','抢购中',108.00,'生鲜99元免基础运费(50kg内) 京准达 自提','./images/pro_retrieval/lg_image/5b6e6a6eN2bb52c9f.jpg','30个装 总重约500-700g',99,5.56,'满159减30,满199减50','不支持七天无理由退货'),
(NULL,15,'果斋园 台湾无籽青柠檬 25个装 总重约500-600g','抢购中',108.00,'生鲜99元免基础运费(50kg内) 京准达 自提','./images/pro_retrieval/lg_image/5b6e6a6eN1759db8a.jpg','25个装 总重约500-600g',99,5.56,'满159减30,满199减50','不支持七天无理由退货');

#4.水果种类表fruit_kind
CREATE TABLE fruit_kind(
	kid INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
	kname VARCHAR(16) NOT NULL	#水果名称
);
#在水果种类表fruit_kind中插入数据
INSERT INTO fruit_kind VALUES
(NULL,'百香果'),
(NULL,'草莓'),
(NULL,'车厘子'),
(NULL,'橙子'),
(NULL,'哈密瓜'),
(NULL,'火龙果'),
(NULL,'龙眼'),
(NULL,'猕猴桃'),
(NULL,'柠檬'),
(NULL,'牛油果'),
(NULL,'苹果'),
(NULL,'砂糖橘'),
(NULL,'西瓜'),
(NULL,'香橙'),
(NULL,'青柠檬');

#创建水果分类列表
CREATE TABLE fruit_list(
    lid INT(10) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    kind_id INT(10) NOT NULL,     	#所属水果种类ID
    list_img VARCHAR(200),        	#列表图片
    fruit_title VARCHAR(32),      	#水果品牌标题
    price DECIMAL(10,2),          	#价格
    dianpu  VARCHAR(32),          	#店铺名称
    monthly_count INT(12),    	  	#累计评论量
    monthly_profit DECIMAL(10,2)   	#月收入
);
#在水果分类列表中插入数据 每种商品暂时只有一类
INSERT INTO fruit_list VALUES
(NULL,1,"./images/list/bxg-1.png","寻味君 广西百香果 5斤大果 新鲜水果单果60-100g ",34.90,"米乐果旗舰店",1700,100),
(NULL,2,"./images/list/cm-3.png","依禾农庄 草莓水果小汤山红颜奶油草莓 约300g 情人节年货礼盒装",88.00,"褚氏果品专营店",700,300),
(NULL,3,"./images/list/clz-2.png","美果汇 樱桃水果 现摘大连美早大樱桃 生鲜500g礼盒装 国产车厘子水果",69.90,"阳山蜜语桃缘专卖店",5700,200),
(NULL,4,"./images/list/4.png","杨氏YANG’S 精品脐橙 约3kg装 铂金果 家庭分享装 新老包装随机发货 橙子水果",51.90,"水果自营专区",1820000,400),
(NULL,5,"./images/list/hmg-3.png","郝家记 新疆哈密瓜西州蜜瓜 甜瓜 京东生鲜水果 单个瓜3~4斤",88.00,"褚氏果品专营店",700,300),
(NULL,6,"./images/list/hlg-1.png","越南进口白心火龙果 3个装巨无霸大果 单果约550-650g 新鲜水果",34.90,"米乐果旗舰店",1700,100),
(NULL,7,"./images/list/ly-3.png","聚百果泰国进口新鲜龙眼新鲜桂圆新鲜水果去枝净果 加冰保鲜 4斤",88.00,"褚氏果品专营店",700,300),
(NULL,8,"./images/list/mht-1.png","四川红心猕猴桃 精选果 弥猴桃 京东生鲜 奇异果 单果重60-80g 24粒",34.90,"米乐果旗舰店",1700,100),
(NULL,9,"./images/list/nm-2.png","新奇士Sunkist 美国进口柠檬 4个装 单果约80-100g 新鲜水果",69.90,"阳山蜜语桃缘专卖店",5700,200),
(NULL,10,"./images/list/nyg-3.png","精选牛油果 京东生鲜 新鲜水果 单果重110-150g大果 6个装",88.00,"褚氏果品专营店",700,300),
(NULL,11,"./images/list/pg-2.png","壹农壹果 新疆阿克苏冰糖心苹果 约毛重5kg 80-85mm 新鲜水果",69.90,"阳山蜜语桃缘专卖店",5700,200),
(NULL,12,"./images/list/stj-3.png","广西沃柑非砂糖橘精选5斤装 柑橘 甜橘子 精选砂糖橘5斤装",88.00,"褚氏果品专营店",700,300),
(NULL,13,"./images/list/xg-1.png","黑美人西瓜 1粒装 单果约2.5kg以上 新鲜水果",69.90,"阳山蜜语桃缘专卖店",5700,200),
(NULL,14,"./images/list/xc-4.png","赣南脐橙 江西信丰橙子生鲜 现采新鲜水果 精品果10斤礼盒装(70-85mm)",51.90,"水果自营专区",18200,400),
(NULL,15,"./images/list/cz-3.png","秭归中华红橙10斤装大果三峡特产精品礼盒装 新鲜水果橙子血橙红肉橙子脐橙包邮",88.00,"褚氏果品专营店",700,300),

(NULL,1,"./images/list/bxg-1.png","寻味君 广西百香果 5斤大果 新鲜水果单果60-100g ",34.90,"米乐果旗舰店",1700,100),
(NULL,1,"./images/list/bxg-2.png","真食 广西百香果 5斤大果 单果50-100g 新鲜水果 ",69.90,"阳山蜜语桃缘专卖店",5700,200),
(NULL,1,"./images/list/bxg-3.png","第二件9.8 玖原农珍 广西百香果3斤大果 新鲜水果单果65-100g ",88.00,"褚氏果品专营店",700,300),
(NULL,1,"./images/list/bxg-4.png","京东好店 九家原 广西百香果5斤大果 单果60-100g ",51.90,"水果自营专区",18200,400),
(NULL,1,"./images/list/bxg-1.png","寻味君 广西百香果 5斤大果 新鲜水果单果60-100g ",34.90,"米乐果旗舰店",1700,100),
(NULL,1,"./images/list/bxg-2.png","真食 广西百香果 5斤大果 单果50-100g 新鲜水果 ",69.90,"阳山蜜语桃缘专卖店",5700,200),
(NULL,1,"./images/list/bxg-3.png","第二件9.8 玖原农珍 广西百香果3斤大果 新鲜水果单果65-100g ",88.00,"褚氏果品专营店",700,300),
(NULL,1,"./images/list/bxg-4.png","京东好店 九家原 广西百香果5斤大果 单果60-100g ",51.90,"水果自营专区",18200,400),

(NULL,2,"./images/list/cm-1.png","丹东99红颜草莓奶油草莓新鲜现摘香莓3斤顺丰空运",34.90,"米乐果旗舰店",1700,100),
(NULL,2,"./images/list/cm-2.png","红颜奶油草莓 约重500g/15-20颗 新鲜水果",69.90,"阳山蜜语桃缘专卖店",5700,200),
(NULL,2,"./images/list/cm-3.png","依禾农庄 草莓水果小汤山红颜奶油草莓 约300g 情人节年货礼盒装",88.00,"褚氏果品专营店",700,300),
(NULL,2,"./images/list/cm-4.png","顺丰快递新鲜水果草莓北京红颜奶油草莓新鲜3斤礼盒装",51.90,"水果自营专区",18200,400),
(NULL,2,"./images/list/cm-1.png","丹东99红颜草莓奶油草莓新鲜现摘香莓3斤顺丰空运",34.90,"米乐果旗舰店",1700,100),
(NULL,2,"./images/list/cm-2.png","红颜奶油草莓 约重500g/15-20颗 新鲜水果",69.90,"阳山蜜语桃缘专卖店",5700,200),
(NULL,2,"./images/list/cm-3.png","依禾农庄 草莓水果小汤山红颜奶油草莓 约300g 情人节年货礼盒装",88.00,"褚氏果品专营店",700,300),
(NULL,2,"./images/list/cm-4.png","顺丰快递新鲜水果草莓北京红颜奶油草莓新鲜3斤礼盒装",51.90,"水果自营专区",18200,400),

(NULL,3,"./images/list/clz-1.png","进口车厘子京东新鲜水果1kg 单果约28-30mm 大樱桃 生鲜",34.90,"米乐果旗舰店",1700,100),
(NULL,3,"./images/list/clz-2.png","美果汇 樱桃水果 现摘大连美早大樱桃 生鲜500g礼盒装 国产车厘子水果",69.90,"阳山蜜语桃缘专卖店",5700,200),
(NULL,3,"./images/list/clz-3.png","现货顺丰快递新鲜水果樱桃烟台大樱桃车厘子美早樱桃1kg",88.00,"褚氏果品专营店",700,300),
(NULL,3,"./images/list/clz-4.png","智力进口车厘子大樱桃 1kg 新鲜水果 JJ级果径28-30mm 2斤",51.90,"水果自营专区",18200,400),
(NULL,3,"./images/list/clz-1.png","进口车厘子京东新鲜水果1kg 单果约28-30mm 大樱桃 生鲜",34.90,"米乐果旗舰店",1700,100),
(NULL,3,"./images/list/clz-2.png","美果汇 樱桃水果 现摘大连美早大樱桃 生鲜500g礼盒装 国产车厘子水果",69.90,"阳山蜜语桃缘专卖店",5700,200),
(NULL,3,"./images/list/clz-3.png","现货顺丰快递新鲜水果樱桃烟台大樱桃车厘子美早樱桃1kg",88.00,"褚氏果品专营店",700,300),
(NULL,3,"./images/list/clz-4.png","智力进口车厘子大樱桃 1kg 新鲜水果 JJ级果径28-30mm 2斤",51.90,"水果自营专区",18200,400),

(NULL,4,"./images/list/cz-1.png","米乐果 四川高山金堂脐橙9斤精品装 现摘脐橙 新鲜水果批发包邮 应季高山橙子",34.90,"米乐果旗舰店",1700,100),
(NULL,4,"./images/list/cz-2.png","江西赣南脐橙 新鲜橙子生鲜 水果礼盒甜橙 10斤钻石超大果(80-90mm)",69.90,"阳山蜜语桃缘专卖店",5700,200),
(NULL,4,"./images/list/cz-3.png","秭归中华红橙10斤装大果三峡特产精品礼盒装 新鲜水果橙子血橙红肉橙子脐橙包邮",88.00,"褚氏果品专营店",700,300),
(NULL,4,"./images/list/cz-4.png","杨氏YANG’S 精品脐橙 约3kg装 铂金果 家庭分享装 新老包装随机发货 橙子水果",51.90,"水果自营专区",18200,400),
(NULL,4,"./images/list/cz-1.png","米乐果 四川高山金堂脐橙9斤精品装 现摘脐橙 新鲜水果批发包邮 应季高山橙子",34.90,"米乐果旗舰店",1700,100),
(NULL,4,"./images/list/cz-2.png","江西赣南脐橙 新鲜橙子生鲜 水果礼盒甜橙 10斤钻石超大果(80-90mm)",69.90,"阳山蜜语桃缘专卖店",5700,200),
(NULL,4,"./images/list/cz-3.png","秭归中华红橙10斤装大果三峡特产精品礼盒装 新鲜水果橙子血橙红肉橙子脐橙包邮",88.00,"褚氏果品专营店",700,300),
(NULL,4,"./images/list/cz-4.png","杨氏YANG’S 精品脐橙 约3kg装 铂金果 家庭分享装 新老包装随机发货 橙子水果",51.90,"水果自营专区",18200,400),

(NULL,5,"./images/list/hmg-1.png","西州蜜瓜哈密瓜 2粒装 单果1.5kg以上 新鲜水果",34.90,"米乐果旗舰店",1700,100),
(NULL,5,"./images/list/hmg-2.png","常枫 新疆哈密瓜3-4斤西州蜜网纹瓜新鲜水果",69.90,"阳山蜜语桃缘专卖店",5700,200),
(NULL,5,"./images/list/hmg-3.png","郝家记 新疆哈密瓜西州蜜瓜 甜瓜 京东生鲜水果 单个瓜3~4斤",88.00,"褚氏果品专营店",700,300),
(NULL,5,"./images/list/hmg-4.png","曙光日本进口品种玫珑瓜10斤水果礼盒京东生鲜网纹瓜哈密瓜 5-6个",51.90,"水果自营专区",18200,400),
(NULL,5,"./images/list/hmg-1.png","西州蜜瓜哈密瓜 2粒装 单果1.5kg以上 新鲜水果",34.90,"米乐果旗舰店",1700,100),
(NULL,5,"./images/list/hmg-2.png","常枫 新疆哈密瓜3-4斤西州蜜网纹瓜新鲜水果",69.90,"阳山蜜语桃缘专卖店",5700,200),
(NULL,5,"./images/list/hmg-3.png","郝家记 新疆哈密瓜西州蜜瓜 甜瓜 京东生鲜水果 单个瓜3~4斤",88.00,"褚氏果品专营店",700,300),
(NULL,5,"./images/list/hmg-4.png","曙光日本进口品种玫珑瓜10斤水果礼盒京东生鲜网纹瓜哈密瓜 5-6个",51.90,"水果自营专区",18200,400),

(NULL,6,"./images/list/hlg-1.png","越南进口白心火龙果 3个装巨无霸大果 单果约550-650g 新鲜水果",34.90,"米乐果旗舰店",1700,100),
(NULL,6,"./images/list/hlg-2.png","越南红心火龙果 原箱装 中果 总重6kg以上 单果约300g-460g 新鲜水果",69.90,"阳山蜜语桃缘专卖店",5700,200),
(NULL,6,"./images/list/hlg-3.png","越南红心火龙果6个装大果 手提礼盒 单果约450-500g 新鲜水果",88.00,"褚氏果品专营店",700,300),
(NULL,6,"./images/list/hlg-4.png","果迎鲜 红心火龙果 新鲜水果 越南进口红心蜜宝 3个装 单果约350g",51.90,"水果自营专区",18200,400),
(NULL,6,"./images/list/hlg-1.png","越南进口白心火龙果 3个装巨无霸大果 单果约550-650g 新鲜水果",34.90,"米乐果旗舰店",1700,100),
(NULL,6,"./images/list/hlg-2.png","越南红心火龙果 原箱装 中果 总重6kg以上 单果约300g-460g 新鲜水果",69.90,"阳山蜜语桃缘专卖店",5700,200),
(NULL,6,"./images/list/hlg-3.png","越南红心火龙果6个装大果 手提礼盒 单果约450-500g 新鲜水果",88.00,"褚氏果品专营店",700,300),
(NULL,6,"./images/list/hlg-4.png","果迎鲜 红心火龙果 新鲜水果 越南进口红心蜜宝 3个装 单果约350g",51.90,"水果自营专区",18200,400),

(NULL,7,"./images/list/ly-1.png","泰国进口龙眼 精选一级果1kg装 新鲜水果",34.90,"米乐果旗舰店",1700,100),
(NULL,7,"./images/list/ly-2.png","泰国进口一级龙眼 2.5kg 精致礼篮装 新鲜水果礼篮",69.90,"阳山蜜语桃缘专卖店",5700,200),
(NULL,7,"./images/list/ly-3.png","聚百果泰国进口新鲜龙眼新鲜桂圆新鲜水果去枝净果 加冰保鲜 4斤",88.00,"褚氏果品专营店",700,300),
(NULL,7,"./images/list/ly-4.png","美果汇泰国进口去枝龙眼2kg 新鲜 水果礼盒 桂圆送礼 新鲜水果礼",51.90,"水果自营专区",18200,400),
(NULL,7,"./images/list/ly-1.png","泰国进口龙眼 精选一级果1kg装 新鲜水果",34.90,"米乐果旗舰店",1700,100),
(NULL,7,"./images/list/ly-2.png","泰国进口一级龙眼 2.5kg 精致礼篮装 新鲜水果礼篮",69.90,"阳山蜜语桃缘专卖店",5700,200),
(NULL,7,"./images/list/ly-3.png","聚百果泰国进口新鲜龙眼新鲜桂圆新鲜水果去枝净果 加冰保鲜 4斤",88.00,"褚氏果品专营店",700,300),
(NULL,7,"./images/list/ly-4.png","美果汇泰国进口去枝龙眼2kg 新鲜 水果礼盒 桂圆送礼 新鲜水果礼",51.90,"水果自营专区",18200,400),


(NULL,6,"./images/list/hlg-1.png","越南进口白心火龙果 3个装巨无霸大果 单果约550-650g 新鲜水果",34.90,"米乐果旗舰店",1700,100),
(NULL,6,"./images/list/hlg-2.png","越南红心火龙果 原箱装 中果 总重6kg以上 单果约300g-460g 新鲜水果",69.90,"阳山蜜语桃缘专卖店",5700,200),
(NULL,6,"./images/list/hlg-3.png","越南红心火龙果6个装大果 手提礼盒 单果约450-500g 新鲜水果",88.00,"褚氏果品专营店",700,300),
(NULL,6,"./images/list/hlg-4.png","果迎鲜 红心火龙果 新鲜水果 越南进口红心蜜宝 3个装 单果约350g",51.90,"水果自营专区",18200,400),
(NULL,6,"./images/list/hlg-1.png","越南进口白心火龙果 3个装巨无霸大果 单果约550-650g 新鲜水果",34.90,"米乐果旗舰店",1700,100),
(NULL,6,"./images/list/hlg-2.png","越南红心火龙果 原箱装 中果 总重6kg以上 单果约300g-460g 新鲜水果",69.90,"阳山蜜语桃缘专卖店",5700,200),
(NULL,6,"./images/list/hlg-3.png","越南红心火龙果6个装大果 手提礼盒 单果约450-500g 新鲜水果",88.00,"褚氏果品专营店",700,300),
(NULL,6,"./images/list/hlg-4.png","果迎鲜 红心火龙果 新鲜水果 越南进口红心蜜宝 3个装 单果约350g",51.90,"水果自营专区",18200,400),

(NULL,8,"./images/list/mht-1.png","四川红心猕猴桃 精选果 弥猴桃 京东生鲜 奇异果 单果重60-80g 24粒",34.90,"米乐果旗舰店",1700,100),
(NULL,8,"./images/list/mht-2.png","陕西眉县 徐香绿心猕猴桃 22个板盒装 单果90-105g 新鲜水果",69.90,"阳山蜜语桃缘专卖店",5700,200),
(NULL,8,"./images/list/mht-3.png","新西兰阳光金奇异果 16个礼盒装  单果重约80-100g 新鲜水果礼盒",88.00,"褚氏果品专营店",700,300),
(NULL,8,"./images/list/mht-4.png","陕西眉县 海沃德猕猴桃 30个装 单果约90-110g 新鲜水果",51.90,"水果自营专区",18200,400),
(NULL,8,"./images/list/mht-1.png","四川红心猕猴桃 精选果 弥猴桃 京东生鲜 奇异果 单果重60-80g 24粒",34.90,"米乐果旗舰店",1700,100),
(NULL,8,"./images/list/mht-2.png","陕西眉县 徐香绿心猕猴桃 22个板盒装 单果90-105g 新鲜水果",69.90,"阳山蜜语桃缘专卖店",5700,200),
(NULL,8,"./images/list/mht-3.png","新西兰阳光金奇异果 16个礼盒装  单果重约80-100g 新鲜水果礼盒",88.00,"褚氏果品专营店",700,300),
(NULL,8,"./images/list/mht-4.png","陕西眉县 海沃德猕猴桃 30个装 单果约90-110g 新鲜水果",51.90,"水果自营专区",18200,400),

(NULL,9,"./images/list/nm-1.png","四川安岳黄柠檬4颗 一级中果 单果约90-110g 新鲜水果",34.90,"米乐果旗舰店",1700,100),
(NULL,9,"./images/list/nm-2.png","新奇士Sunkist 美国进口柠檬 4个装 单果约80-100g 新鲜水果",69.90,"阳山蜜语桃缘专卖店",5700,200),
(NULL,9,"./images/list/nm-3.png","一级黄柠檬5斤装一级皮薄香水柠檬单果约125g-150g 新鲜水果 柃檬",88.00,"褚氏果品专营店",700,300),
(NULL,9,"./images/list/nm-4.png","安岳黄柠檬 约8-12个 大果2斤/箱精选果 独立包装 新鲜水果生鲜四川特产",51.90,"水果自营专区",18200,400),
(NULL,9,"./images/list/nm-1.png","四川安岳黄柠檬4颗 一级中果 单果约90-110g 新鲜水果",34.90,"米乐果旗舰店",1700,100),
(NULL,9,"./images/list/nm-2.png","新奇士Sunkist 美国进口柠檬 4个装 单果约80-100g 新鲜水果",69.90,"阳山蜜语桃缘专卖店",5700,200),
(NULL,9,"./images/list/nm-3.png","一级黄柠檬5斤装一级皮薄香水柠檬单果约125g-150g 新鲜水果 柃檬",88.00,"褚氏果品专营店",700,300),
(NULL,9,"./images/list/nm-4.png","安岳黄柠檬 约8-12个 大果2斤/箱精选果 独立包装 新鲜水果生鲜四川特产",51.90,"水果自营专区",18200,400),

(NULL,10,"./images/list/nyg-1.png","牛油果 6个装 单果重约130-180g 新鲜水果",34.90,"米乐果旗舰店",1700,100),
(NULL,10,"./images/list/nyg-2.ng","巨无霸牛油果 2粒 即食装 单果重约170-220g 新鲜水果",69.90,"阳山蜜语桃缘专卖店",5700,200),
(NULL,10,"./images/list/nyg-3.png","精选牛油果 京东生鲜 新鲜水果 单果重110-150g大果 6个装",88.00,"褚氏果品专营店",700,300),
(NULL,10,"./images/list/nyg-4.png","墨西哥进口牛油果 10个装 新鲜水果",51.90,"水果自营专区",18200,400),
(NULL,10,"./images/list/nyg-1.png","牛油果 6个装 单果重约130-180g 新鲜水果",34.90,"米乐果旗舰店",1700,100),
(NULL,10,"./images/list/nyg-2.ng","巨无霸牛油果 2粒 即食装 单果重约170-220g 新鲜水果",69.90,"阳山蜜语桃缘专卖店",5700,200),
(NULL,10,"./images/list/nyg-3.png","精选牛油果 京东生鲜 新鲜水果 单果重110-150g大果 6个装",88.00,"褚氏果品专营店",700,300),
(NULL,10,"./images/list/nyg-4.png","墨西哥进口牛油果 10个装 新鲜水果",51.90,"水果自营专区",18200,400),

(NULL,11,"./images/list/pg-1.png","烟台红富士苹果 12个 净重2.6kg以上 单果190-240g 一二级混装",34.90,"米乐果旗舰店",1700,100),
(NULL,11,"./images/list/pg-2.png","壹农壹果 新疆阿克苏冰糖心苹果 约毛重5kg 80-85mm 新鲜水果",69.90,"阳山蜜语桃缘专卖店",5700,200),
(NULL,11,"./images/list/pg-3.png","潘苹果 花牛苹果/蛇果 12个 单果180-210g 净重4.5斤 自营水果",88.00,"褚氏果品专营店",700,300),
(NULL,11,"./images/list/pg-4.png","佳农 山东烟台红富士苹果 12个装 优质果 单果重约200g 新鲜水果",51.90,"水果自营专区",18200,400),
(NULL,11,"./images/list/pg-1.png","烟台红富士苹果 12个 净重2.6kg以上 单果190-240g 一二级混装",34.90,"米乐果旗舰店",1700,100),
(NULL,11,"./images/list/pg-2.png","壹农壹果 新疆阿克苏冰糖心苹果 约毛重5kg 80-85mm 新鲜水果",69.90,"阳山蜜语桃缘专卖店",5700,200),
(NULL,11,"./images/list/pg-3.png","潘苹果 花牛苹果/蛇果 12个 单果180-210g 净重4.5斤 自营水果",88.00,"褚氏果品专营店",700,300),
(NULL,11,"./images/list/pg-4.png","佳农 山东烟台红富士苹果 12个装 优质果 单果重约200g 新鲜水果",51.90,"水果自营专区",18200,400),

(NULL,12,"./images/list/stj-1.png","广西新鲜水果砂糖桔橘子 柑橘 桔子2.5kg 橙色",34.90,"米乐果旗舰店",1700,100),
(NULL,12,"./images/list/stj-2.png","广西砂糖橘小橘子沙糖桔甜桔京东水果生鲜 9斤",69.90,"阳山蜜语桃缘专卖店",5700,200),
(NULL,12,"./images/list/stj-3.png","广西沃柑非砂糖橘精选5斤装 柑橘 甜橘子 精选砂糖橘5斤装",88.00,"褚氏果品专营店",700,300),
(NULL,12,"./images/list/stj-4.png","砂糖橘整箱装 含箱约3kg 薄皮橘子 新鲜生鲜桔子水果礼盒 ",51.90,"水果自营专区",18200,400),
(NULL,12,"./images/list/stj-1.png","广西新鲜水果砂糖桔橘子 柑橘 桔子2.5kg 橙色",34.90,"米乐果旗舰店",1700,100),
(NULL,12,"./images/list/stj-2.png","广西砂糖橘小橘子沙糖桔甜桔京东水果生鲜 9斤",69.90,"阳山蜜语桃缘专卖店",5700,200),
(NULL,12,"./images/list/stj-3.png","广西沃柑非砂糖橘精选5斤装 柑橘 甜橘子 精选砂糖橘5斤装",88.00,"褚氏果品专营店",700,300),
(NULL,12,"./images/list/stj-4.png","砂糖橘整箱装 含箱约3kg 薄皮橘子 新鲜生鲜桔子水果礼盒 ",51.90,"水果自营专区",18200,400),

(NULL,13,"./images/list/xg-1.png","麒麟西瓜 1粒装 单果2.5kg以上 新鲜水果",34.90,"米乐果旗舰店",1700,100),
(NULL,13,"./images/list/xg-1.png","黑美人西瓜 1粒装 单果约2.5kg以上 新鲜水果",69.90,"阳山蜜语桃缘专卖店",5700,200),
(NULL,13,"./images/list/xg-1.png","国产特小凤西瓜 1个装 单果重1.5kg以上 新鲜水果",88.00,"褚氏果品专营店",700,300),
(NULL,13,"./images/list/xg-1.png","西瓜 新鲜水果 现摘现发 1个装",51.90,"水果自营专区",18200,400),
(NULL,13,"./images/list/xg-1.png","麒麟西瓜 1粒装 单果2.5kg以上 新鲜水果",34.90,"米乐果旗舰店",1700,100),
(NULL,13,"./images/list/xg-1.png","黑美人西瓜 1粒装 单果约2.5kg以上 新鲜水果",69.90,"阳山蜜语桃缘专卖店",5700,200),
(NULL,13,"./images/list/xg-1.png","国产特小凤西瓜 1个装 单果重1.5kg以上 新鲜水果",88.00,"褚氏果品专营店",700,300),
(NULL,13,"./images/list/xg-1.png","西瓜 新鲜水果 现摘现发 1个装",51.90,"水果自营专区",18200,400),

(NULL,14,"./images/list/xc-1.png","华润五丰 赣南脐橙铂金果 12粒装 单果约150g以上 新鲜水果",34.90,"米乐果旗舰店",1700,100),
(NULL,14,"./images/list/xc-2.png","肚子美奉节脐橙 5kg 高端鲜橙 新鲜水果礼盒装",69.90,"阳山蜜语桃缘专卖店",5700,200),
(NULL,14,"./images/list/xc-3.png","美味连连 云南褚柑5kg礼盒装 褚柑沃柑非褚橙新鲜橙子励志橙新鲜水果",88.00,"褚氏果品专营店",700,300),
(NULL,14,"./images/list/xc-4.png","赣南脐橙 江西信丰橙子生鲜 现采新鲜水果 精品果10斤礼盒装(70-85mm)",51.90,"水果自营专区",18200,400),
(NULL,14,"./images/list/xc-1.png","华润五丰 赣南脐橙铂金果 12粒装 单果约150g以上 新鲜水果",34.90,"米乐果旗舰店",1700,100),
(NULL,14,"./images/list/xc-2.png","肚子美奉节脐橙 5kg 高端鲜橙 新鲜水果礼盒装",69.90,"阳山蜜语桃缘专卖店",5700,200),
(NULL,14,"./images/list/xc-3.png","美味连连 云南褚柑5kg礼盒装 褚柑沃柑非褚橙新鲜橙子励志橙新鲜水果",88.00,"褚氏果品专营店",700,300),
(NULL,14,"./images/list/xc-4.png","赣南脐橙 江西信丰橙子生鲜 现采新鲜水果 精品果10斤礼盒装(70-85mm)",51.90,"水果自营专区",18200,400),

(NULL,15,"./images/list/cz-1.png","米乐果 四川高山金堂脐橙9斤精品装 现摘脐橙 新鲜水果批发包邮 应季高山橙子",34.90,"米乐果旗舰店",1700,100),
(NULL,15,"./images/list/cz-2.png","江西赣南脐橙 新鲜橙子生鲜 水果礼盒甜橙 10斤钻石超大果(80-90mm)",69.90,"阳山蜜语桃缘专卖店",5700,200),
(NULL,15,"./images/list/cz-3.png","秭归中华红橙10斤装大果三峡特产精品礼盒装 新鲜水果橙子血橙红肉橙子脐橙包邮",88.00,"褚氏果品专营店",700,300),
(NULL,15,"./images/list/cz-4.png","杨氏YANG’S 精品脐橙 约3kg装 铂金果 家庭分享装 新老包装随机发货 橙子水果",51.90,"水果自营专区",18200,400),
(NULL,15,"./images/list/cz-1.png","米乐果 四川高山金堂脐橙9斤精品装 现摘脐橙 新鲜水果批发包邮 应季高山橙子",34.90,"米乐果旗舰店",1700,100),
(NULL,15,"./images/list/cz-2.png","江西赣南脐橙 新鲜橙子生鲜 水果礼盒甜橙 10斤钻石超大果(80-90mm)",69.90,"阳山蜜语桃缘专卖店",5700,200),
(NULL,15,"./images/list/cz-3.png","秭归中华红橙10斤装大果三峡特产精品礼盒装 新鲜水果橙子血橙红肉橙子脐橙包邮",88.00,"褚氏果品专营店",700,300),
(NULL,15,"./images/list/cz-4.png","杨氏YANG’S 精品脐橙 约3kg装 铂金果 家庭分享装 新老包装随机发货 橙子水果",51.90,"水果自营专区",18200,400);

#5.详情图库表fruit_standard_pic
CREATE TABLE fruit_standard_pic(
	pid INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
	list_sid INT(11) NOT NULL,	#所属水果列表id
	sm VARCHAR(128),			#小图
	md VARCHAR(128),			#中图
	lg VARCHAR(128)				#大图
);


#在详情图库下表fruit_kind中插入数据
INSERT INTO fruit_standard_pic VALUES
(NULL,1,'./images/details/sm/sm-baixiangguo-1.png','./images/details/md/md-baixiangguo-1.png','./images/details/lg/lg-baixiangguo-1.png'),
(NULL,1,'./images/details/sm/sm-baixiangguo-2.png','./images/details/md/md-baixiangguo-2.png','./images/details/lg/lg-baixiangguo-2.png'),
(NULL,1,'./images/details/sm/sm-baixiangguo-3.png','./images/details/md/md-baixiangguo-3.png','./images/details/lg/lg-baixiangguo-3.png'),
(NULL,1,'./images/details/sm/sm-baixiangguo-4.png','./images/details/md/md-baixiangguo-4.png','./images/details/lg/lg-baixiangguo-4.png'),
(NULL,1,'./images/details/sm/sm-baixiangguo-5.png','./images/details/md/md-baixiangguo-5.png','./images/details/lg/lg-baixiangguo-5.png'),
(NULL,1,'./images/details/sm/sm-baixiangguo-1.png','./images/details/md/md-baixiangguo-1.png','./images/details/lg/lg-baixiangguo-1.png'),
(NULL,1,'./images/details/sm/sm-baixiangguo-2.png','./images/details/md/md-baixiangguo-2.png','./images/details/lg/lg-baixiangguo-2.png'),
(NULL,1,'./images/details/sm/sm-baixiangguo-3.png','./images/details/md/md-baixiangguo-3.png','./images/details/lg/lg-baixiangguo-3.png'),
(NULL,1,'./images/details/sm/sm-caomei-1.png','./images/details/md/md-caomei-1.png','./images/details/lg/lg-caomei-1.png'),
(NULL,2,'./images/details/sm/sm-caomei-2.png','./images/details/md/md-caomei-2.png','./images/details/lg/lg-caomei-2.png'),
(NULL,2,'./images/details/sm/sm-caomei-3.png','./images/details/md/md-caomei-3.png','./images/details/lg/lg-caomei-3.png'),
(NULL,2,'./images/details/sm/sm-caomei-4.png','./images/details/md/md-caomei-4.png','./images/details/lg/lg-caomei-4.png'),
(NULL,2,'./images/details/sm/sm-caomei-5.png','./images/details/md/md-caomei-5.png','./images/details/lg/lg-caomei-5.png'),
(NULL,2,'./images/details/sm/sm-caomei-1.png','./images/details/md/md-caomei-1.png','./images/details/lg/lg-caomei-1.png'),
(NULL,2,'./images/details/sm/sm-caomei-2.png','./images/details/md/md-caomei-2.png','./images/details/lg/lg-caomei-2.png'),
(NULL,2,'./images/details/sm/sm-caomei-3.png','./images/details/md/md-caomei-3.png','./images/details/lg/lg-caomei-3.png'),
(NULL,2,'./images/details/sm/sm-caomei-4.png','./images/details/md/md-caomei-4.png','./images/details/lg/lg-caomei-4.png'),
(NULL,3,'./images/details/sm/sm-chelizi-1.png','./images/details/md/md-chelizi-1.png','./images/details/lg/lg-chelizi-1.png'),
(NULL,3,'./images/details/sm/sm-chelizi-2.png','./images/details/md/md-chelizi-2.png','./images/details/lg/lg-chelizi-2.png'),
(NULL,3,'./images/details/sm/sm-chelizi-3.png','./images/details/md/md-chelizi-3.png','./images/details/lg/lg-chelizi-3.png'),
(NULL,3,'./images/details/sm/sm-chelizi-4.png','./images/details/md/md-chelizi-4.png','./images/details/lg/lg-chelizi-4.png'),
(NULL,3,'./images/details/sm/sm-chelizi-5.png','./images/details/md/md-chelizi-5.png','./images/details/lg/lg-chelizi-5.png'),
(NULL,4,'./images/details/sm/sm-chengzi-1.png','./images/details/md/md-chengzi-1.png','./images/details/lg/lg-chengzi-1.png'),
(NULL,4,'./images/details/sm/sm-chengzi-2.png','./images/details/md/md-chengzi-2.png','./images/details/lg/lg-chengzi-2.png'),
(NULL,4,'./images/details/sm/sm-chengzi-3.png','./images/details/md/md-chengzi-3.png','./images/details/lg/lg-chengzi-3.png'),
(NULL,4,'./images/details/sm/sm-chengzi-4.png','./images/details/md/md-chengzi-4.png','./images/details/lg/lg-chengzi-4.png'),
(NULL,4,'./images/details/sm/sm-chengzi-5.png','./images/details/md/md-chengzi-5.png','./images/details/lg/lg-chengzi-5.png'),
(NULL,5,'./images/details/sm/sm-hmg-1.png','./images/details/md/md-hmg-1.png','./images/details/lg/lg-hmg-1.png'),
(NULL,5,'./images/details/sm/sm-hmg-2.png','./images/details/md/md-hmg-2.png','./images/details/lg/lg-hmg-2.png'),
(NULL,5,'./images/details/sm/sm-hmg-3.png','./images/details/md/md-hmg-3.png','./images/details/lg/lg-hmg-3.png'),
(NULL,5,'./images/details/sm/sm-hmg-4.png','./images/details/md/md-hmg-4.png','./images/details/lg/lg-hmg-4.png'),
(NULL,5,'./images/details/sm/sm-hmg-5.png','./images/details/md/md-hmg-5.png','./images/details/lg/lg-hmg-5.png'),
(NULL,5,'./images/details/sm/sm-hmg-3.png','./images/details/md/md-hmg-3.png','./images/details/lg/lg-hmg-3.png'),
(NULL,5,'./images/details/sm/sm-hmg-4.png','./images/details/md/md-hmg-4.png','./images/details/lg/lg-hmg-4.png'),
(NULL,5,'./images/details/sm/sm-hmg-5.png','./images/details/md/md-hmg-5.png','./images/details/lg/lg-hmg-5.png'),
(NULL,6,'./images/details/sm/sm-huolongguo-1.png','./images/details/md/md-huolongguo-1.png','./images/details/lg/lg-huolongguo-1.png'),
(NULL,6,'./images/details/sm/sm-huolongguo-2.png','./images/details/md/md-huolongguo-2.png','./images/details/lg/lg-huolongguo-2.png'),
(NULL,6,'./images/details/sm/sm-huolongguo-3.png','./images/details/md/md-huolongguo-3.png','./images/details/lg/lg-huolongguo-3.png'),
(NULL,6,'./images/details/sm/sm-huolongguo-4.png','./images/details/md/md-huolongguo-4.png','./images/details/lg/lg-huolongguo-4.png'),
(NULL,6,'./images/details/sm/sm-huolongguo-5.png','./images/details/md/md-huolongguo-5.png','./images/details/lg/lg-huolongguo-5.png'),
(NULL,6,'./images/details/sm/sm-huolongguo-3.png','./images/details/md/md-huolongguo-3.png','./images/details/lg/lg-huolongguo-3.png'),
(NULL,6,'./images/details/sm/sm-huolongguo-4.png','./images/details/md/md-huolongguo-4.png','./images/details/lg/lg-huolongguo-4.png'),
(NULL,6,'./images/details/sm/sm-huolongguo-5.png','./images/details/md/md-huolongguo-5.png','./images/details/lg/lg-huolongguo-5.png'),
(NULL,7,'./images/details/sm/sm-longyan-1.png','./images/details/md/md-longyan-1.png','./images/details/lg/lg-longyan-1.png'),
(NULL,7,'./images/details/sm/sm-longyan-2.png','./images/details/md/md-longyan-2.png','./images/details/lg/lg-longyan-2.png'),
(NULL,7,'./images/details/sm/sm-longyan-3.png','./images/details/md/md-longyan-3.png','./images/details/lg/lg-longyan-3.png'),
(NULL,7,'./images/details/sm/sm-longyan-4.png','./images/details/md/md-longyan-4.png','./images/details/lg/lg-longyan-4.png'),
(NULL,7,'./images/details/sm/sm-longyan-5.png','./images/details/md/md-longyan-5.png','./images/details/lg/lg-longyan-5.png'),
(NULL,7,'./images/details/sm/sm-longyan-3.png','./images/details/md/md-longyan-3.png','./images/details/lg/lg-longyan-3.png'),
(NULL,7,'./images/details/sm/sm-longyan-4.png','./images/details/md/md-longyan-4.png','./images/details/lg/lg-longyan-4.png'),
(NULL,7,'./images/details/sm/sm-longyan-5.png','./images/details/md/md-longyan-5.png','./images/details/lg/lg-longyan-5.png'),
(NULL,8,'./images/details/sm/sm-mht-1.png','./images/details/md/md-mht-1.png','./images/details/lg/lg-mht-1.png'),
(NULL,8,'./images/details/sm/sm-mht-2.png','./images/details/md/md-mht-2.png','./images/details/lg/lg-mht-2.png'),
(NULL,8,'./images/details/sm/sm-mht-3.png','./images/details/md/md-mht-3.png','./images/details/lg/lg-mht-3.png'),
(NULL,8,'./images/details/sm/sm-mht-4.png','./images/details/md/md-mht-4.png','./images/details/lg/lg-mht-4.png'),
(NULL,8,'./images/details/sm/sm-mht-2.png','./images/details/md/md-mht-2.png','./images/details/lg/lg-mht-2.png'),
(NULL,8,'./images/details/sm/sm-mht-3.png','./images/details/md/md-mht-3.png','./images/details/lg/lg-mht-3.png'),
(NULL,8,'./images/details/sm/sm-mht-4.png','./images/details/md/md-mht-4.png','./images/details/lg/lg-mht-4.png'),
(NULL,8,'./images/details/sm/sm-mht-5.png','./images/details/md/md-mht-5.png','./images/details/lg/lg-mht-5.png'),
(NULL,8,'./images/details/sm/sm-mht-5.png','./images/details/md/md-mht-5.png','./images/details/lg/lg-mht-5.png'),
(NULL,9,'./images/details/sm/sm-ningmeng-1.png','./images/details/md/md-ningmeng-1.png','./images/details/lg/lg-ningmeng-1.png'),
(NULL,9,'./images/details/sm/sm-ningmeng-2.png','./images/details/md/md-ningmeng-2.png','./images/details/lg/lg-ningmeng-2.png'),
(NULL,9,'./images/details/sm/sm-ningmeng-3.png','./images/details/md/md-ningmeng-3.png','./images/details/lg/lg-ningmeng-3.png'),
(NULL,9,'./images/details/sm/sm-ningmeng-4.png','./images/details/md/md-ningmeng-4.png','./images/details/lg/lg-ningmeng-4.png'),
(NULL,9,'./images/details/sm/sm-ningmeng-5.png','./images/details/md/md-ningmeng-5.png','./images/details/lg/lg-ningmeng-5.png'),
(NULL,9,'./images/details/sm/sm-ningmeng-3.png','./images/details/md/md-ningmeng-3.png','./images/details/lg/lg-ningmeng-3.png'),
(NULL,9,'./images/details/sm/sm-ningmeng-4.png','./images/details/md/md-ningmeng-4.png','./images/details/lg/lg-ningmeng-4.png'),
(NULL,9,'./images/details/sm/sm-ningmeng-5.png','./images/details/md/md-ningmeng-5.png','./images/details/lg/lg-ningmeng-5.png'),
(NULL,10,'./images/details/sm/sm-niuyouguo-1.png','./images/details/md/md-niuyouguo-1.png','./images/details/lg/lg-niuyouguo-1.png'),
(NULL,10,'./images/details/sm/sm-niuyouguo-2.png','./images/details/md/md-niuyouguo-2.png','./images/details/lg/lg-niuyouguo-2.png'),
(NULL,10,'./images/details/sm/sm-niuyouguo-3.png','./images/details/md/md-niuyouguo-3.png','./images/details/lg/lg-niuyouguo-3.png'),
(NULL,10,'./images/details/sm/sm-niuyouguo-4.png','./images/details/md/md-niuyouguo-4.png','./images/details/lg/lg-niuyouguo-4.png'),
(NULL,10,'./images/details/sm/sm-niuyouguo-5.png','./images/details/md/md-niuyouguo-5.png','./images/details/lg/lg-niuyouguo-5.png'),
(NULL,10,'./images/details/sm/sm-niuyouguo-3.png','./images/details/md/md-niuyouguo-3.png','./images/details/lg/lg-niuyouguo-3.png'),
(NULL,10,'./images/details/sm/sm-niuyouguo-4.png','./images/details/md/md-niuyouguo-4.png','./images/details/lg/lg-niuyouguo-4.png'),
(NULL,10,'./images/details/sm/sm-niuyouguo-5.png','./images/details/md/md-niuyouguo-5.png','./images/details/lg/lg-niuyouguo-5.png'),
(NULL,11,'./images/details/sm/sm-pingguo-1.png','./images/details/md/md-pingguo-1.png','./images/details/lg/lg-pingguo-1.png'),
(NULL,11,'./images/details/sm/sm-pingguo-2.png','./images/details/md/md-pingguo-2.png','./images/details/lg/lg-pingguo-2.png'),
(NULL,11,'./images/details/sm/sm-pingguo-3.png','./images/details/md/md-pingguo-3.png','./images/details/lg/lg-pingguo-3.png'),
(NULL,11,'./images/details/sm/sm-pingguo-4.png','./images/details/md/md-pingguo-4.png','./images/details/lg/lg-pingguo-4.png'),
(NULL,11,'./images/details/sm/sm-pingguo-5.png','./images/details/md/md-pingguo-5.png','./images/details/lg/lg-pingguo-5.png'),
(NULL,11,'./images/details/sm/sm-pingguo-2.png','./images/details/md/md-pingguo-2.png','./images/details/lg/lg-pingguo-2.png'),
(NULL,11,'./images/details/sm/sm-pingguo-3.png','./images/details/md/md-pingguo-3.png','./images/details/lg/lg-pingguo-3.png'),
(NULL,11,'./images/details/sm/sm-pingguo-4.png','./images/details/md/md-pingguo-4.png','./images/details/lg/lg-pingguo-4.png'),
(NULL,11,'./images/details/sm/sm-pingguo-5.png','./images/details/md/md-pingguo-5.png','./images/details/lg/lg-pingguo-5.png'),
(NULL,12,'./images/details/sm/sm-shatangju-1.png','./images/details/md/md-shatangju-1.png','./images/details/lg/lg-shatangju-1.png'),
(NULL,12,'./images/details/sm/sm-shatangju-2.png','./images/details/md/md-shatangju-2.png','./images/details/lg/lg-shatangju-2.png'),
(NULL,12,'./images/details/sm/sm-shatangju-3.png','./images/details/md/md-shatangju-3.png','./images/details/lg/lg-shatangju-3.png'),
(NULL,12,'./images/details/sm/sm-shatangju-4.png','./images/details/md/md-shatangju-4.png','./images/details/lg/lg-shatangju-4.png'),
(NULL,12,'./images/details/sm/sm-shatangju-5.png','./images/details/md/md-shatangju-5.png','./images/details/lg/lg-shatangju-5.png'),
(NULL,12,'./images/details/sm/sm-shatangju-3.png','./images/details/md/md-shatangju-3.png','./images/details/lg/lg-shatangju-3.png'),
(NULL,12,'./images/details/sm/sm-shatangju-4.png','./images/details/md/md-shatangju-4.png','./images/details/lg/lg-shatangju-4.png'),
(NULL,12,'./images/details/sm/sm-shatangju-5.png','./images/details/md/md-shatangju-5.png','./images/details/lg/lg-shatangju-5.png'),
(NULL,13,'./images/details/sm/sm-xigua-1.png','./images/details/md/md-xigua-1.png','./images/details/lg/lg-xigua-1.png'),
(NULL,13,'./images/details/sm/sm-xigua-2.png','./images/details/md/md-xigua-2.png','./images/details/lg/lg-xigua-2.png'),
(NULL,13,'./images/details/sm/sm-xigua-3.png','./images/details/md/md-xigua-3.png','./images/details/lg/lg-xigua-3.png'),
(NULL,13,'./images/details/sm/sm-xigua-4.png','./images/details/md/md-xigua-4.png','./images/details/lg/lg-xigua-4.png'),
(NULL,13,'./images/details/sm/sm-xigua-5.png','./images/details/md/md-xigua-5.png','./images/details/lg/lg-xigua-5.png'),
(NULL,13,'./images/details/sm/sm-xigua-3.png','./images/details/md/md-xigua-3.png','./images/details/lg/lg-xigua-3.png'),
(NULL,13,'./images/details/sm/sm-xigua-4.png','./images/details/md/md-xigua-4.png','./images/details/lg/lg-xigua-4.png'),
(NULL,13,'./images/details/sm/sm-xigua-5.png','./images/details/md/md-xigua-5.png','./images/details/lg/lg-xigua-5.png'),
(NULL,14,'./images/details/sm/sm-xiangcheng-1.png','./images/details/md/md-xiangcheng-1.png','./images/details/lg/lg-xiangcheng-1.png'),
(NULL,14,'./images/details/sm/sm-xiangcheng-2.png','./images/details/md/md-xiangcheng-2.png','./images/details/lg/lg-xiangcheng-2.png'),
(NULL,14,'./images/details/sm/sm-xiangcheng-3.png','./images/details/md/md-xiangcheng-3.png','./images/details/lg/lg-xiangcheng-3.png'),
(NULL,14,'./images/details/sm/sm-xiangcheng-4.png','./images/details/md/md-xiangcheng-4.png','./images/details/lg/lg-xiangcheng-4.png'),
(NULL,14,'./images/details/sm/sm-xiangcheng-1.png','./images/details/md/md-xiangcheng-1.png','./images/details/lg/lg-xiangcheng-1.png'),
(NULL,14,'./images/details/sm/sm-xiangcheng-2.png','./images/details/md/md-xiangcheng-2.png','./images/details/lg/lg-xiangcheng-2.png'),
(NULL,14,'./images/details/sm/sm-xiangcheng-3.png','./images/details/md/md-xiangcheng-3.png','./images/details/lg/lg-xiangcheng-3.png'),
(NULL,14,'./images/details/sm/sm-xiangcheng-5.png','./images/details/md/md-xiangcheng-5.png','./images/details/lg/lg-xiangcheng-5.png'),
(NULL,15,'./images/pro_retrieval/lg_image/5b6e6a6eN2bb52c9f (1).jpg','./images/pro_retrieval/lg_image/5b6e6a6eN2bb52c9f (2).jpg','./images/pro_retrieval/lg_image/5b6e6a6eN2bb52c9f.jpg'),
(NULL,15,'./images/pro_retrieval/lg_image/5b6e6a6eN1759db8a (1).jpg','./images/pro_retrieval/lg_image/5b6e6a6eN1759db8a (2).jpg','./images/pro_retrieval/lg_image/5b6e6a6eN1759db8a.jpg'),
(NULL,15,'./images/pro_retrieval/lg_image/5b6e6a6eN786608a6 (1).jpg','./images/pro_retrieval/lg_image/5b6e6a6eN786608a6 (2).jpg','./images/pro_retrieval/lg_image/5b6e6a6eN786608a6.jpg'),
(NULL,15,'./images/pro_retrieval/lg_image/58f81cd0N2ecc78b3 (3).jpg','./images/pro_retrieval/lg_image/58f81cd0N2ecc78b3 (1).jpg','./images/pro_retrieval/lg_image/58f81cd0N2ecc78b3'),
(NULL,15,'./images/pro_retrieval/lg_image/58f81d1eN0a6ebd84 (2).jpg','./images/pro_retrieval/lg_image/58f81d1eN0a6ebd84.jpg','./images/pro_retrieval/lg_image/58f81d1eN0a6ebd84 (1).jpg');
#6.商品介绍表fruit_param_item
CREATE TABLE fruit_param_item(
  pid INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  xq_id INT(12),            #对应商品种类id
  manufacturer VARCHAR(16), #厂名
  factory VARCHAR(16),      #厂址
  vender_phone VARCHAR(11),     #厂家联系方式
  dosing VARCHAR(32),       #配料
  trademark VARCHAR(32),    #品牌
  spaecial_kid VARCHAR(32), #特产品类
  proince VARCHAR(16),      #省份
  city VARCHAR(16),         #城市
  field VARCHAR(16),        #产地
  server VARCHAR(64),       #服务
  lgimg VARCHAR(64)         #详情大图
);
#在商品详情表fruit_param_item中插入数据
INSERT INTO fruit_param_item VALUES
(NULL,1,'果滋果味','陕西省西安市','18791111001','纯天然种植','果滋果味','百香果','陕西001','西安','中国大陆001','同城24小时送货上门','./images/details/xiangqing/xq-baixiangguo.png'),
(NULL,2,'果滋果味','陕西省西安市','18791111002','纯天然种植','果滋果味','草莓','陕西002','西安','中国大陆002','同城24小时送货上门','./images/details/xiangqing/xq-caomei.png'),
(NULL,3,'果滋果味','陕西省西安市','18791111003','纯天然种植','果滋果味','车厘子','陕西003','西安','中国大陆003','同城24小时送货上门','./images/details/xiangqing/xq-chelizi.png'),
(NULL,4,'果滋果味','陕西省西安市','18791111004','纯天然种植','果滋果味','橙子','陕西004','西安','中国大陆004','同城24小时送货上门','./images/details/xiangqing/xq-chengzi.png'),
(NULL,5,'果滋果味','陕西省西安市','18791111005','纯天然种植','果滋果味','哈密瓜','陕西005','西安','中国大陆005','同城24小时送货上门','./images/details/xiangqing/xq-hmg.png'),
(NULL,6,'果滋果味','陕西省西安市','18791111006','纯天然种植','果滋果味','火龙果','陕西006','西安','中国大陆006','同城24小时送货上门','./images/details/xiangqing/xq-huolongguo.png'),
(NULL,7,'果滋果味','陕西省西安市','18791111007','纯天然种植','果滋果味','龙眼','陕西007','西安','中国大陆007','同城24小时送货上门','./images/details/xiangqing/xq-longyan.png'),
(NULL,8,'果滋果味','陕西省西安市','18791111008','纯天然种植','果滋果味','猕猴桃','陕西008','西安','中国大陆008','同城24小时送货上门','./images/details/xiangqing/xq-mht.png'),
(NULL,9,'果滋果味','陕西省西安市','18791111009','纯天然种植','果滋果味','柠檬','陕西009','西安','中国大陆009','同城24小时送货上门','./images/details/xiangqing/xq-ningmeng.png'),
(NULL,10,'果滋果味','陕西省西安市','18791111010','纯天然种植','果滋果味','牛油果','陕西010','西安','中国大陆010','同城24小时送货上门','./images/details/xiangqing/xq-niuyouguo.png'),
(NULL,11,'果滋果味','陕西省西安市','18791111011','纯天然种植','果滋果味','苹果','陕西011','西安','中国大陆011','同城24小时送货上门','./images/details/xiangqing/xq-pingguo.png'),
(NULL,12,'果滋果味','陕西省西安市','18791111012','纯天然种植','果滋果味','砂糖橘','陕西012','西安','中国大陆012','同城24小时送货上门','./images/details/xiangqing/xq-shatangju.png'),
(NULL,13,'果滋果味','陕西省西安市','18791111013','纯天然种植','果滋果味','西瓜','陕西013','西安','中国大陆013','同城24小时送货上门','./images/details/xiangqing/xq-xigua.png'),
(NULL,14,'果滋果味','陕西省西安市','18791111014','纯天然种植','果滋果味','香橙','陕西014','西安','中国大陆014','同城24小时送货上门','./images/details/xiangqing/xq-xiangcheng.png'),
(NULL,15,'果滋果味','陕西省西安市','18791111014','纯天然种植','果滋果味','青柠檬','陕西015','西安','中国大陆015','同城24小时送货上门','./images/pro_retrieval/lg_image/58f81d1eN0a6ebd84 (2).jpg');


#7.创建购物车表fruit_cart_item
CREATE TABLE fruit_cart_item(
  id BIGINT(20) PRIMARY KEY NOT NULL AUTO_INCREMENT,  #购物车编号，主键，非空
  user_id BIGINT(20) NOT NULL,         #用户编号，非空
  item_id BIGINT(20) NOT NULL,         #商品编号，非空 
  img VARCHAR(64),                     #商品图片
  cart_title VARCHAR(256),              #商品标题
  p_zhonglei VARCHAR(256),              #商品种类
  price DECIMAL(10,2),                 #商品价格
  num INT(10),                         #商品数量
  status INT(4),                       #购物车状态1正常，2删除
  created DATE,                        #创建时间
  updated TIMESTAMP                    #修改时间  
);
#在购物车表fruit_cart_item插入数据


#8.收藏夹fruit_collect_item(暂时不建)
CREATE TABLE fruit_collect_item(
  id BIGINT(20) PRIMARY KEY NOT NULL AUTO_INCREMENT,  #编号，主键，非空
  user_id BIGINT(20) NOT NULL,         #用户编号，非空
  item_id BIGINT(20) NOT NULL,         #商品编号，非空 
  title varchar(200),                  #商品标题
  price DECIMAL(10,2),                 #单价
  pic_path VARCHAR(200),               #商品图片
  param_data VARCHAR(500),             #商品参数           
  status INT(4),                       #购物车状态1正常，2删除
  created DATE,                        #创建时间
  updated TIMESTAMP                    #修改时间  
);
#在fruit_collect_item插入数据
INSERT INTO fruit_collect_item VALUES
(1,15,15645,'苹果',25.00,'imagres/pinguo/nj.png','bhubcibicij',1,'2019-2-5',''),
(NULL,15,15645,'苹果',25.00,'imagres/pinguo/nj.png','bhubcibicij',1,'2019-2-5','');

#9.订单表fruit_order_item
CREATE TABLE fruit_order_item(
  oid INT(4) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  sid INT(4),              #商品规格表中的sid
  uid INT(10),             #当前用户id
  goods_img VARCHAR(264),  #商品的小图片
  goods_title VARCHAR(128),#商品标题
  goods_gui VARCHAR(128),  #商品规格
  price DECIMAL(10,2),     #商品单价
  count INT(6),            #购买数量
  pay_price DECIMAL(20,2), #此类商品价格小计
  status TINYINT(4),       #订单页状态0，1，2，3，4，5
  created Datetime,        #创建时间 
  city_id INT(6),          #对应的用户地址编号
  dingdanhao VARCHAR(20)   #订单号
);
#向订单表fruit_order_item插入数据
-- 当前表的id  oid
-- 当前用户的  uid
-- 当前商品的规格id

#10.收货地址表fruit_shipping
CREATE TABLE fruit_shipping(
  id INT(4) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  uid INT(11),          #用户ID
  provinceId  VARCHAR(12),  #省份
  cityId VARCHAR(12),       #城市
  districtId VARCHAR(11),   #县区
  name VARCHAR(50),     # 收货人姓名
  mobile VARCHAR(50),   #手机号
  remark VARCHAR(255),  # 详细地址
  zt TINYINT(4)         #地址状态，0为普通，1为默认
);
#向地址fruit_shipping插入数据
INSERT INTO fruit_shipping VALUES
(NULL,1,'陕西省','安康市','旬阳县','刘贵蒋','18791000000','文艺路街道中铁第一国际',1),
(NULL,1,'陕西省','安康市','旬阳县','刘贵蒋','18791000000','文艺路街道中铁第一国际',0),
(NULL,1,'陕西省','安康市','旬阳县','刘贵蒋','18791000000','文艺路街道中铁第一国际',0),
(NULL,1,'陕西省','安康市','旬阳县','刘贵蒋','18791000000','文艺路街道中铁第一国际',0),
(NULL,1,'陕西省','安康市','旬阳县','刘贵蒋','18791000000','文艺路街道中铁第一国际',0),

(NULL,2,'陕西省','宝鸡市','凤翔县','李晓华','18791000111','文艺路街道中铁第一国际',1),
(NULL,2,'陕西省','宝鸡市','凤翔县','李晓华','18791000111','文艺路街道中铁第一国际',0),
(NULL,2,'陕西省','宝鸡市','凤翔县','李晓华','18791000111','文艺路街道中铁第一国际',0),
(NULL,2,'陕西省','宝鸡市','凤翔县','李晓华','18791000111','文艺路街道中铁第一国际',0),
(NULL,2,'陕西省','宝鸡市','凤翔县','李晓华','18791000111','文艺路街道中铁第一国际',0),

(NULL,3,'陕西省','咸阳市','乾县','王水林','18791000222','文艺路街道中铁第一国际',1),
(NULL,3,'陕西省','咸阳市','乾县','王水林','18791000222','文艺路街道中铁第一国际',0),
(NULL,3,'陕西省','咸阳市','乾县','王水林','18791000222','文艺路街道中铁第一国际',0),
(NULL,3,'陕西省','咸阳市','乾县','王水林','18791000222','文艺路街道中铁第一国际',0),
(NULL,3,'陕西省','咸阳市','乾县','王水林','18791000222','文艺路街道中铁第一国际',0),

(NULL,4,'陕西省','宝鸡市','扶风县','李侃','18791000333','文艺路街道中铁第一国际',1),
(NULL,4,'陕西省','宝鸡市','扶风县','李侃','18791000333','文艺路街道中铁第一国际',0),
(NULL,4,'陕西省','宝鸡市','扶风县','李侃','18791000333','文艺路街道中铁第一国际',0),
(NULL,4,'陕西省','宝鸡市','扶风县','李侃','18791000333','文艺路街道中铁第一国际',0),
(NULL,4,'陕西省','宝鸡市','扶风县','李侃','18791000333','文艺路街道中铁第一国际',0),


(NULL,5,'陕西省','渭南市','合阳县','杨阳','18791000444','文艺路街道中铁第一国际',1),
(NULL,5,'陕西省','渭南市','合阳县','杨阳','18791000444','文艺路街道中铁第一国际',0),
(NULL,5,'陕西省','渭南市','合阳县','杨阳','18791000444','文艺路街道中铁第一国际',0),
(NULL,5,'陕西省','渭南市','合阳县','杨阳','18791000444','文艺路街道中铁第一国际',0),
(NULL,5,'陕西省','渭南市','合阳县','杨阳','18791000444','文艺路街道中铁第一国际',0);


#11.创建商城用户表fruit_user
CREATE TABLE fruit_user(
  uid INT(20) PRIMARY KEY NOT NULL AUTO_INCREMENT,  #用户编号
  username VARCHAR(50) NOT NULL,       #用户名
  upwd VARCHAR(32) NOT NULL,           #用户密码
  gender TINYINT(4),                   #性别
  age TINYINT(4),                      #年龄
  phone VARCHAR(20),                   #注册手机号
  email VARCHAR(32),                   #注册邮箱
  birthday VARCHAR(24),                #生日
  avatar VARCHAR(128),                 #用户图像
  created TIMESTAMP                   #注册时间
);
#在用户表fruit_user中插入数据
INSERT INTO fruit_user VALUES
(null,"lgj","123456",1,26,"18790000111","lgj@163.com","1993-1-1","<img src='./images/backstage/tx-1.png' style='width:50px;height:50px;'>","2019-2-1"),
(null,"lxh","123456",0,26,"18790000222","lxh@163.com","1993-1-2","<img src='./images/backstage/tx-2.png' style='width:50px;height:50px;'>","2019-2-2"),
(null,"wsl","123456",1,21,"18790000333","wsl@163.com","1998-1-3","<img src='./images/backstage/tx-3.png' style='width:50px;height:50px;'>","2019-2-3"),
(null,"lkk","123456",1,22,"18790000444","lkk@163.com","1997-1-4","<img src='./images/backstage/tx-4.png' style='width:50px;height:50px;'>","2019-2-4"),
(null,"yyy","123456",1,19,"18790000555","yyy@163.com","1999-1-5","<img src='./images/backstage/tx-5.png' style='width:50px;height:50px;'>","2019-2-5"),

(null,"lgj000","123456",1,26,"18790000111","lgj@163.com","1993-1-1","<img src='./images/backstage/tx-1.png' style='width:50px;height:50px;'>","2019-2-1"),
(null,"lxh000","123456",0,26,"18790000222","lxh@163.com","1993-1-2","<img src='./images/backstage/tx-2.png' style='width:50px;height:50px;'>","2019-2-2"),
(null,"wsl000","123456",1,21,"18790000333","wsl@163.com","1998-1-3","<img src='./images/backstage/tx-3.png' style='width:50px;height:50px;'>","2019-2-3"),
(null,"lkk000","123456",1,22,"18790000444","lkk@163.com","1997-1-4","<img src='./images/backstage/tx-4.png' style='width:50px;height:50px;'>","2019-2-4"),
(null,"yyy000","123456",1,19,"18790000555","yyy@163.com","1999-1-5","<img src='./images/backstage/tx-5.png' style='width:50px;height:50px;'>","2019-2-5"),

(null,"lgj001","123456",1,26,"18790000111","lgj@163.com","1993-1-1","<img src='./images/backstage/tx-1.png' style='width:50px;height:50px;'>","2019-2-1"),
(null,"lxh001","123456",0,26,"18790000222","lxh@163.com","1993-1-2","<img src='./images/backstage/tx-2.png' style='width:50px;height:50px;'>","2019-2-2"),
(null,"wsl001","123456",1,21,"18790000333","wsl@163.com","1998-1-3","<img src='./images/backstage/tx-3.png' style='width:50px;height:50px;'>","2019-2-3"),
(null,"lkk001","123456",1,22,"18790000444","lkk@163.com","1997-1-4","<img src='./images/backstage/tx-4.png' style='width:50px;height:50px;'>","2019-2-4"),
(null,"yyy001","123456",1,19,"18790000555","yyy@163.com","1999-1-5","<img src='./images/backstage/tx-5.png' style='width:50px;height:50px;'>","2019-2-5"),

(null,"lgj002","123456",1,26,"18790000111","lgj@163.com","1993-1-1","<img src='./images/backstage/tx-1.png' style='width:50px;height:50px;'>","2019-2-1"),
(null,"lxh002","123456",0,26,"18790000222","lxh@163.com","1993-1-2","<img src='./images/backstage/tx-2.png' style='width:50px;height:50px;'>","2019-2-2"),
(null,"wsl002","123456",1,21,"18790000333","wsl@163.com","1998-1-3","<img src='./images/backstage/tx-3.png' style='width:50px;height:50px;'>","2019-2-3"),
(null,"lkk002","123456",1,22,"18790000444","lkk@163.com","1997-1-4","<img src='./images/backstage/tx-4.png' style='width:50px;height:50px;'>","2019-2-4"),
(null,"yyy002","123456",1,19,"18790000555","yyy@163.com","1999-1-5","<img src='./images/backstage/tx-5.png' style='width:50px;height:50px;'>","2019-2-5"),

(null,"lgj003","123456",1,26,"18790000111","lgj@163.com","1993-1-1","<img src='./images/backstage/tx-1.png' style='width:50px;height:50px;'>","2019-2-1"),
(null,"lxh003","123456",0,26,"18790000222","lxh@163.com","1993-1-2","<img src='./images/backstage/tx-2.png' style='width:50px;height:50px;'>","2019-2-2"),
(null,"wsl003","123456",1,21,"18790000333","wsl@163.com","1998-1-3","<img src='./images/backstage/tx-3.png' style='width:50px;height:50px;'>","2019-2-3"),
(null,"lkk003","123456",1,22,"18790000444","lkk@163.com","1997-1-4","<img src='./images/backstage/tx-4.png' style='width:50px;height:50px;'>","2019-2-4"),
(null,"yyy003","123456",1,19,"18790000555","yyy@163.com","1999-1-5","<img src='./images/backstage/tx-5.png' style='width:50px;height:50px;'>","2019-2-5"),

(null,"lgj004","123456",1,26,"18790000111","lgj@163.com","1993-1-1","<img src='./images/backstage/tx-1.png' style='width:50px;height:50px;'>","2019-2-1"),
(null,"lxh004","123456",0,26,"18790000222","lxh@163.com","1993-1-2","<img src='./images/backstage/tx-2.png' style='width:50px;height:50px;'>","2019-2-2"),
(null,"wsl004","123456",1,21,"18790000333","wsl@163.com","1998-1-3","<img src='./images/backstage/tx-3.png' style='width:50px;height:50px;'>","2019-2-3"),
(null,"lkk004","123456",1,22,"18790000444","lkk@163.com","1997-1-4","<img src='./images/backstage/tx-4.png' style='width:50px;height:50px;'>","2019-2-4"),
(null,"yyy004","123456",1,19,"18790000555","yyy@163.com","1999-1-5","<img src='./images/backstage/tx-5.png' style='width:50px;height:50px;'>","2019-2-5"),

(null,"lgj005","123456",1,26,"18790000111","lgj@163.com","1993-1-1","<img src='./images/backstage/tx-1.png' style='width:50px;height:50px;'>","2019-2-1"),
(null,"lxh005","123456",0,26,"18790000222","lxh@163.com","1993-1-2","<img src='./images/backstage/tx-2.png' style='width:50px;height:50px;'>","2019-2-2"),
(null,"wsl005","123456",1,21,"18790000333","wsl@163.com","1998-1-3","<img src='./images/backstage/tx-3.png' style='width:50px;height:50px;'>","2019-2-3"),
(null,"lkk005","123456",1,22,"18790000444","lkk@163.com","1997-1-4","<img src='./images/backstage/tx-4.png' style='width:50px;height:50px;'>","2019-2-4"),
(null,"yyy005","123456",1,19,"18790000555","yyy@163.com","1999-1-5","<img src='./images/backstage/tx-5.png' style='width:50px;height:50px;'>","2019-2-5"),

(null,"lgj006","123456",1,26,"18790000111","lgj@163.com","1993-1-1","<img src='./images/backstage/tx-1.png' style='width:50px;height:50px;'>","2019-2-1"),
(null,"lxh006","123456",0,26,"18790000222","lxh@163.com","1993-1-2","<img src='./images/backstage/tx-2.png' style='width:50px;height:50px;'>","2019-2-2"),
(null,"wsl006","123456",1,21,"18790000333","wsl@163.com","1998-1-3","<img src='./images/backstage/tx-3.png' style='width:50px;height:50px;'>","2019-2-3"),
(null,"lkk006","123456",1,22,"18790000444","lkk@163.com","1997-1-4","<img src='./images/backstage/tx-4.png' style='width:50px;height:50px;'>","2019-2-4"),
(null,"yyy006","123456",1,19,"18790000555","yyy@163.com","1999-1-5","<img src='./images/backstage/tx-5.png' style='width:50px;height:50px;'>","2019-2-5");

#12.后台用户管理表
CREATE TABLE backstage_user_item(
  id BIGINT(20) PRIMARY KEY NOT NULL AUTO_INCREMENT,  #编号
  backname varchar(24) NOT NULL,  #管理员姓名
  backPwd VARCHAR(32) NOT NULL   #管理员密码
);
INSERT INTO backstage_user_item VALUES
(NULL,"liuguijiang","19930909____"),
(NULL,"wangshuilin","123456789"),
(NULL,"likankan","123456789"),
(NULL,"yangyang","123456789"),
(NULL,"lixiaohua","123456789"),
(NULL,"LiuGuiJiang","123456789");

