/**************连接池-pool.js**********/
// 引入mysql模块
const mysql = require("mysql");
// 创建连接池-设置连接池属性
var pool = mysql.createPool({
  host: 'localhost',  //主机名
  sort: 8080,         //端口号
  user: 'root',       //数据库用户
  password: '',       //密码
  database: 'xiaomi', //数据库名
  connectionLimit: 15 //连接池大小
});
// 导出pool连接池
module.exports = pool;