/*************web服务器-app.js************/
// 引入express框架
const express = require("express");
// 引入bodyParser第三方中间件——将post请求格式化为对象
const bodyParser = require("body-parser");
// 引入商城登录路由器模块-login.js
const loginRouter = require("./routes/login");
// 引入商城注册路由器模块-reg.js
const regRouter = require("./routes/reg");
// 引入商城首页路由器模块-index.js
const indexRouter = require("./routes/index");
// 引入商城商品列表路由器模块-product_list.js
const product_listRouter = require("./routes/product_list");
// 引入商城商品详情路由器模块-product_details.js
const product_detailsRouter = require("./routes/product_details");

// 创建web服务器，设置监听端口
var server = express();
server.listen(8080);

// 使用中间件-设置核心模块为querystring
server.use(bodyParser.urlencoded({
  extended: false
}));

// 托管静态资源
server.use(express.static('../public'));

// 挂载商城登录路由器，挂载到  /login 
server.use("/login", loginRouter);
// 挂载商城注册路由器，挂载到  /reg
server.use("/reg", regRouter);
// 挂载商城首页路由器，挂载到  /index 
server.use("/index", indexRouter);
// 挂载商城商品列表路由器，挂载到  /product_list 
server.use("/product_list", product_listRouter);
// 挂载商城商品详情路由器，挂载到  /product_details 
server.use("/product_details", product_detailsRouter);