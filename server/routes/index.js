// 商城首页路由 index.js
// 引入express模块
const express = require("express");
// 引入pool连接池模块
const pool = require("../pool");
// 创建路由器
var router = express.Router();

// 获取首页轮播图数据路由--get
router.get("/banner", function(req, res){
  var sql = "SELECT banner, bid FROM xm_index_banner";
  pool.query(sql, (err, result) => {
    if(err) throw err;
    res.send(result);
  })
});

// 获取首页轮播图下三张中图片数据路由--get
router.get("/md_show", (req, res) => {
  var sql = 'SELECT mdMap, wid FROM xm_index_md_show';
  pool.query(sql, (err, result) => {
    if(err) throw err;
    res.send(result);
  })
});

// 获取首页展示图片数据路由--get
router.get("/lg_show", (req, res) => {
  var sql = 'SELECT lgMap, gid FROM xm_index_lg_show';
  pool.query(sql, (err, result) => {
    if(err) throw err;
    res.send(result);
  })
});

// 获取首页商品手机数据路由--get
router.get("/product_phone", (req, res) => {
  var sql = 'SELECT pid, label, picture, title, intro, price FROM xm_index_product_phone';
  pool.query(sql, (err, result) => {
    if(err) throw err;
    res.send(result);
  })
});
// 获取首页商品家电数据路由--get
router.get("/product_homeApp", (req, res) => {
  var sql = 'SELECT hid, label, picture, title, intro, price FROM xm_index_product_homeApp';
  pool.query(sql, (err, result) => {
    if(err) throw err;
    res.send(result);
  })
});
// 获取首页商品智能数据路由--get
router.get("/product_capacity", (req, res) => {
  var sql = 'SELECT aid, label, picture, title, intro, price FROM xm_index_product_capacity';
  pool.query(sql, (err, result) => {
    if(err) throw err;
    res.send(result);
  })
});

// 获取首页为你推荐商品数据路由 -- get
router.get("/recommend", (req, res) => {
  var sql = 'SELECT rid, image, title, price, good_reputation FROM xm_index_recommend';
  pool.query(sql, (err, result) => {
    if(err) throw err;
    res.send(result);
  })
});

// 获取首页热评产品数据路由 -- get
router.get("/buzz", (req, res) => {
  var sql = 'SELECT bid, image, appraisal, userSource, product, price FROM xm_index_buzz';
  pool.query(sql, (err, result) => {
    if(err) throw err;
    res.send(result);
  })
});

// 获取首页内容数据路由 -- get
router.get("/content", (req, res) => {
  var sql = 'SELECT cid, theme, title, intro, price, picture FROM xm_index_content';
  pool.query(sql, (err, result) => {
    if(err) throw err;
    res.send(result);
  })
});

// 导出路由器
module.exports = router;