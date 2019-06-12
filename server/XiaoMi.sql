SET NAMES UTF8;
DROP DATABASE IF EXISTS xiaomi;
CREATE DATABASE xiaomi CHARSET=UTF8;
USE xiaomi;
/*****************************用户信息**********************************/
/*****************************用户信息**********************************/
CREATE TABLE xm_user(
  uid INT PRIMARY KEY AUTO_INCREMENT,     #用户编号
  uname VARCHAR(128),                     #用户登录账号
  upwd VARCHAR(128),                      #用户登录密码
  email VARCHAR(128),                     #用户邮箱
  phone VARCHAR(11),                      #用户联系电话
  sex BOOL,                               #用户性别   1-男  0-女
  headPortrait VARCHAR(128)               #用户头像图片地址
);
INSERT INTO xm_user VALUES
(null, "dingding", "123456", "123345@sina.com", "12312312312", 1, "image/headPortrait/dingding.jpg"),
(null, "dangdang", "123456", "112345@sina.com", "12312312312", 1, "image/headPortrait/dangdang.jpg"),
(null, "huahua", "123456", "11234475@sina.com", "12312312312", 0, "image/headPortrait/huahua.png");

/******************************收货地址***********************************/
/******************************收货地址***********************************/
CREATE TABLE xm_shippingAddress(
  sid INT PRIMARY KEY AUTO_INCREMENT,      #收货地址编号
  userId INT,                              #下单人编号 于用户编号关联
  FOREIGN KEY(userID) REFERENCES xm_user(uid),  #外键约束
  receiver VARCHAR(128),                   #收货人姓名
  cellphone VARCHAR(11),                   #收货人联系电话
  province VARCHAR(32),                    #省
  city VARCHAR(32),                        #市
  region VARCHAR(32),                      #区
  street VARCHAR(64),                      #街道
  detaileAaddress VARCHAR(128),            #详细地址
  postalCode VARCHAR(32),                  #邮政编号
  addressLabel VARCHAR(32),                #地址标签  如公司名
  isDefault BOOL                           #是否为默认收货地址  1-是 0-否
);

/**********************************购物车****************************************/
/**********************************购物车****************************************/
CREATE TABLE xm_shoppingCart(
  cid INT PRIMARY KEY AUTO_INCREMENT,      #购物车编号
  userId INT,                              #下单人编号 于用户ID关联
  FOREIGN KEY(userID) REFERENCES xm_user(uid),  #外键约束
  productID INT,                           #商品编号 和商品列表编号关联
  productName VARCHAR(128),                #商品名称
  productPrice DECIMAL(10, 2),             #商品价格
  productCount SMALLINT                    #商品数量
);

/************************************我的订单******************************************/
/************************************我的订单******************************************/
CREATE TABLE xm_order(
  oid INT PRIMARY KEY AUTO_INCREMENT,      #订单编号
  userId INT,                              #下单人编号 于用户ID关联
  FOREIGN KEY(userID) REFERENCES xm_user(uid),  #外键约束
  addressID INT,                           #地址编号
  status SMALLINT,                         #订单状态
  orderTime BIGINT,                        #下单时间
  paymentTime BIGINT,                      #付款时间
  shipmentsTime BIGINT,                    #发货时间
  signTime BIGINT                          #签收时间
);

/************************************商品种类*********************************************/
/************************************商品种类*********************************************/
CREATE TABLE xm_productFamily(
  fid INT PRIMARY KEY AUTO_INCREMENT,  #种类编号
  family VARCHAR(128)                  #种类名称
);
INSERT INTO xm_productFamily VALUES(null, "手机"), (null, "电脑"), (null, "家电"), (null, "智能"), (null, "搭配"), (null, "配件"), (null, "周边");

/************************************商品详情表***********************************************/
/************************************商品详情表***********************************************/
CREATE TABLE xm_product(
  pid INT PRIMARY KEY AUTO_INCREMENT,     #商品编号
  fid INT,                                #商品所属种类
  productName VARCHAR(128),               #商品名称
  welfare VARCHAR(128),                   #商品福利
  productIntro VARCHAR(128),              #商品简介
  flatMap VARCHAR(128),                   #商品图片地址
  source VARCHAR(128),                    #商品来源
  price DECIMAL(10, 2),                   #商品价格
  complimentary  VARCHAR(128),            #商品赠品
  edition VARCHAR(128),                   #商品版本
  color VARCHAR(128),                     #商品颜色
  processor VARCHAR(128),                 #处理器
  OS VARCHAR(362),                        #操作系统
  RAM_ROM VARCHAR(128),                   #内存和闪存
  raster VARCHAR(128),                    #屏幕
  aspect VARCHAR(128),                    #外观尺寸
  cell VARCHAR(128),                      #电池
  camera VARCHAR(128),                    #相机
  video VARCHAR(128),                     #视频音频
  mesh VARCHAR(128),                      #网络
  navigation VARCHAR(128),                #导航
  sensor VARCHAR(128),                    #传感器
  multimedia VARCHAR(128),                #多媒体
  pack VARCHAR(128)                       #包装清单 ayj0  q0u7
);

INSERT INTO xm_product VALUES
(null, 1, "小米9 SE", "6GB+64GB/6GB+128GB，限时赠价值99元圈铁耳机", "索尼4800万超广角三摄 / 骁龙712全球首发 / 全息幻彩机身 / 三星AMOLED屏幕 / 5.97”水滴屏 / 第五代屏幕指纹识别 / 多功能NFC / 红外遥控", "image/product/pms_1550646283.22955781.jpg&image/product/pms_1550646283.24414368.jpg&image/product/pms_1550646283.31579902.jpg&image/product/pms_1550646283.43099171.jpg", "小米自营", 1999.00, "赠小米圈铁耳机2 黑色&赠米粉卡", "6GB+64GB&1999元", "全息幻彩紫", "骁龙 855 旗舰处理器&CPU 名称：骁龙855 高通年度旗舰处理器&CPU 架构工艺：全新Kryo 485 架构，7nm 工艺制程&CPU 主频：八核处理器，最高主频可达：2.84GHz&高通首款三丛集设计：1 x 2.84GHz 超级大核 + 3 x 2.42GHz 大核 + 4 x 1.80GHz 小核&CPU 性能提升：CPU 单核性能提升：45%，能效提升：40%&GPU 名称：Adreno 640 图形处理器&GPU 性能：性能提升20%，能效提升：25%+&AIE ：第四代AI引擎，3 倍 AI 性能", "MIUI 10&首次支持 MI Turbo&首次支持碎片整理 I/O性能优化 | 支持应用启动速度优化&模拟 18 个月使用，降低老化卡顿35%&首次支持 Game Turbo&支持感知游戏复杂场景 ，智能调度系统资源 | 支持自定义游戏触控参数丨支持自定义游戏显示增强&枪战类游戏4D触感 | 支持显示CPU占用、GPU占用、FPS | 游戏工具箱支持一键切换上网卡，支持息屏挂机等功能&支持游戏性能增强、优化触控响应丨支持自定义边缘抑制范围 | 支持关闭自动亮度、三指截屏、护眼模式&动态壁纸及显示&彩色AOD息屏显示 | 支持随当地日出日落时间变化的动态壁纸&首次支持深色模式（Dark mode）", "8GB+128GB&小米9 最高可选&内存：6GB / 8GB LPDDR4x 2133MHz 双通道大内存&闪存：可选 128GB 机身存储 UFS2.1&8GB + 256GB&小米9 透明版标配&内存：8GB LPDDR4x 2133MHz 双通道大内存&闪存：可选 256GB 机身存储 UFS2.1&8GB+128GB&小米9 王源限量版&内存：8GB LPDDR4x 2133MHz 双通道大内存&闪存：128GB 机身存储 UFS2.1&12GB+256GB&小米9 透明尊享版&内存：12GB LPDDR4x 2133MHz 双通道大内存&闪存：256GB 机身存储 UFS2.1", "6.39英寸(对角线)&三星 AMOLED 全面屏&分辨率 2340 x 1080 FHD+ 403 PPI&屏幕亮度 600nit (HBM) / 430nit(Typ)&高对比度 60000:1(Min) | 广色域显示 NTSC 103.8%(Typ)&标准模式 | 阳光屏2.0 | 夜光屏 | 无级色温调节&256阶护眼模式 德国电气工程师协会 VDE 低蓝光护眼认证&康宁第六代大猩猩玻璃&采用防油渍防指纹涂层&支持HDR显示", "高度：157.5mm&宽度：74.67mm&厚度：7.61mm *&重量：173g", "小米9 | 小米9 透明尊享版 | 小米9 王源限量版&3300mAh(typ) / 3200mAh (min)&内置锂离子聚合物电池，不可拆卸&USB Type-C 双面充电接口&通过德国莱茵TÜV安全快充认证", "索尼 4800 万超广角微距三摄&4800万 索尼主摄像头&SONY IMX586, 48MP, 0.8μm, 1/2“感光面积, FOV 79°&f/1.75光圈 , 6P镜头, AF, 闭环马达, 支持4 in 1 (12MP, 1.6μm)&2000万美颜相机&2000万 前置相机 0.9μm f/2.0 光圈", "支持 第一代视频编解码技术/HEVC、H.264、MPEG4、VC-1、VP8、VP9等视频格式；&播放HDR10视频内容时支持高动态范围显示", "全网通 5.0&支持双卡不限运营商，均可4G驻网①&双nano-SIM卡槽，任意卡槽均可设置为主卡&支持移动/联通/电信 4G+/4G/3G/2G&支持双卡VoLTE高清语音②", "双频双天线GPS&同时接收L1 / L5 双频双路GPS信号&定位系统：&GPS:L1+L5 | Galileo:E1+E5a | GLONASS:G1 | 北斗:B1&A-GPS辅助定位 | 电子罗盘 | 无线网络 | 数据网络", "超声波距离传感器 | 屏下环境光传感器 | 加速度传感器 | 陀螺仪 | 电子罗盘&线性马达 | 红外线遥控器 | 摄像头激光对焦传感器", "MP4 | M4V | MKV | XVID | WAV | AAC | MP3 | AMR | FLAC | APE", "手机主机&极简手机保护壳&电源适配器&USB Type-C 数据线&Type-C转3.5mm耳机转接线&插针&入门指南&三包凭证"),
(null, 1, "小米8 SE", "6GB+64GB/6GB+128GB，限时赠价值99元圈铁耳机", "索尼4800万超广角三摄 / 骁龙712全球首发 / 全息幻彩机身 / 三星AMOLED屏幕 / 5.97”水滴屏 / 第五代屏幕指纹识别 / 多功能NFC / 红外遥控", "image/product/pms_1550646283.22955781.jpg&image/product/pms_1550646283.24414368.jpg&image/product/pms_1550646283.31579902.jpg&image/product/pms_1550646283.43099171.jpg", "小米自营", 1999.00, "赠小米圈铁耳机2 黑色&赠米粉卡", "6GB+64GB&1999元", "全息幻彩紫", "骁龙 855 旗舰处理器&CPU 名称：骁龙855 高通年度旗舰处理器&CPU 架构工艺：全新Kryo 485 架构，7nm 工艺制程&CPU 主频：八核处理器，最高主频可达：2.84GHz&高通首款三丛集设计：1 x 2.84GHz 超级大核 + 3 x 2.42GHz 大核 + 4 x 1.80GHz 小核&CPU 性能提升：CPU 单核性能提升：45%，能效提升：40%&GPU 名称：Adreno 640 图形处理器&GPU 性能：性能提升20%，能效提升：25%+&AIE ：第四代AI引擎，3 倍 AI 性能", "MIUI 10&首次支持 MI Turbo&首次支持碎片整理 I/O性能优化 | 支持应用启动速度优化&模拟 18 个月使用，降低老化卡顿35%&首次支持 Game Turbo&支持感知游戏复杂场景 ，智能调度系统资源 | 支持自定义游戏触控参数丨支持自定义游戏显示增强&枪战类游戏4D触感 | 支持显示CPU占用、GPU占用、FPS | 游戏工具箱支持一键切换上网卡，支持息屏挂机等功能&支持游戏性能增强、优化触控响应丨支持自定义边缘抑制范围 | 支持关闭自动亮度、三指截屏、护眼模式&动态壁纸及显示&彩色AOD息屏显示 | 支持随当地日出日落时间变化的动态壁纸&首次支持深色模式（Dark mode）", "8GB+128GB&小米9 最高可选&内存：6GB / 8GB LPDDR4x 2133MHz 双通道大内存&闪存：可选 128GB 机身存储 UFS2.1&8GB + 256GB&小米9 透明版标配&内存：8GB LPDDR4x 2133MHz 双通道大内存&闪存：可选 256GB 机身存储 UFS2.1&8GB+128GB&小米9 王源限量版&内存：8GB LPDDR4x 2133MHz 双通道大内存&闪存：128GB 机身存储 UFS2.1&12GB+256GB&小米9 透明尊享版&内存：12GB LPDDR4x 2133MHz 双通道大内存&闪存：256GB 机身存储 UFS2.1", "6.39英寸(对角线)&三星 AMOLED 全面屏&分辨率 2340 x 1080 FHD+ 403 PPI&屏幕亮度 600nit (HBM) / 430nit(Typ)&高对比度 60000:1(Min) | 广色域显示 NTSC 103.8%(Typ)&标准模式 | 阳光屏2.0 | 夜光屏 | 无级色温调节&256阶护眼模式 德国电气工程师协会 VDE 低蓝光护眼认证&康宁第六代大猩猩玻璃&采用防油渍防指纹涂层&支持HDR显示", "高度：157.5mm&宽度：74.67mm&厚度：7.61mm *&重量：173g", "小米9 | 小米9 透明尊享版 | 小米9 王源限量版&3300mAh(typ) / 3200mAh (min)&内置锂离子聚合物电池，不可拆卸&USB Type-C 双面充电接口&通过德国莱茵TÜV安全快充认证", "索尼 4800 万超广角微距三摄&4800万 索尼主摄像头&SONY IMX586, 48MP, 0.8μm, 1/2“感光面积, FOV 79°&f/1.75光圈 , 6P镜头, AF, 闭环马达, 支持4 in 1 (12MP, 1.6μm)&2000万美颜相机&2000万 前置相机 0.9μm f/2.0 光圈", "支持 第一代视频编解码技术/HEVC、H.264、MPEG4、VC-1、VP8、VP9等视频格式；&播放HDR10视频内容时支持高动态范围显示", "全网通 5.0&支持双卡不限运营商，均可4G驻网①&双nano-SIM卡槽，任意卡槽均可设置为主卡&支持移动/联通/电信 4G+/4G/3G/2G&支持双卡VoLTE高清语音②", "双频双天线GPS&同时接收L1 / L5 双频双路GPS信号&定位系统：&GPS:L1+L5 | Galileo:E1+E5a | GLONASS:G1 | 北斗:B1&A-GPS辅助定位 | 电子罗盘 | 无线网络 | 数据网络", "超声波距离传感器 | 屏下环境光传感器 | 加速度传感器 | 陀螺仪 | 电子罗盘&线性马达 | 红外线遥控器 | 摄像头激光对焦传感器", "MP4 | M4V | MKV | XVID | WAV | AAC | MP3 | AMR | FLAC | APE", "手机主机&极简手机保护壳&电源适配器&USB Type-C 数据线&Type-C转3.5mm耳机转接线&插针&入门指南&三包凭证"),
(null, 1, "小米10 SE", "6GB+64GB/6GB+128GB，限时赠价值99元圈铁耳机", "索尼4800万超广角三摄 / 骁龙712全球首发 / 全息幻彩机身 / 三星AMOLED屏幕 / 5.97”水滴屏 / 第五代屏幕指纹识别 / 多功能NFC / 红外遥控", "image/product/pms_1550646283.22955781.jpg&image/product/pms_1550646283.24414368.jpg&image/product/pms_1550646283.31579902.jpg&image/product/pms_1550646283.43099171.jpg", "小米自营", 1999.00, "赠小米圈铁耳机2 黑色&赠米粉卡", "6GB+64GB&1999元", "全息幻彩紫", "骁龙 855 旗舰处理器&CPU 名称：骁龙855 高通年度旗舰处理器&CPU 架构工艺：全新Kryo 485 架构，7nm 工艺制程&CPU 主频：八核处理器，最高主频可达：2.84GHz&高通首款三丛集设计：1 x 2.84GHz 超级大核 + 3 x 2.42GHz 大核 + 4 x 1.80GHz 小核&CPU 性能提升：CPU 单核性能提升：45%，能效提升：40%&GPU 名称：Adreno 640 图形处理器&GPU 性能：性能提升20%，能效提升：25%+&AIE ：第四代AI引擎，3 倍 AI 性能", "MIUI 10&首次支持 MI Turbo&首次支持碎片整理 I/O性能优化 | 支持应用启动速度优化&模拟 18 个月使用，降低老化卡顿35%&首次支持 Game Turbo&支持感知游戏复杂场景 ，智能调度系统资源 | 支持自定义游戏触控参数丨支持自定义游戏显示增强&枪战类游戏4D触感 | 支持显示CPU占用、GPU占用、FPS | 游戏工具箱支持一键切换上网卡，支持息屏挂机等功能&支持游戏性能增强、优化触控响应丨支持自定义边缘抑制范围 | 支持关闭自动亮度、三指截屏、护眼模式&动态壁纸及显示&彩色AOD息屏显示 | 支持随当地日出日落时间变化的动态壁纸&首次支持深色模式（Dark mode）", "8GB+128GB&小米9 最高可选&内存：6GB / 8GB LPDDR4x 2133MHz 双通道大内存&闪存：可选 128GB 机身存储 UFS2.1&8GB + 256GB&小米9 透明版标配&内存：8GB LPDDR4x 2133MHz 双通道大内存&闪存：可选 256GB 机身存储 UFS2.1&8GB+128GB&小米9 王源限量版&内存：8GB LPDDR4x 2133MHz 双通道大内存&闪存：128GB 机身存储 UFS2.1&12GB+256GB&小米9 透明尊享版&内存：12GB LPDDR4x 2133MHz 双通道大内存&闪存：256GB 机身存储 UFS2.1", "6.39英寸(对角线)&三星 AMOLED 全面屏&分辨率 2340 x 1080 FHD+ 403 PPI&屏幕亮度 600nit (HBM) / 430nit(Typ)&高对比度 60000:1(Min) | 广色域显示 NTSC 103.8%(Typ)&标准模式 | 阳光屏2.0 | 夜光屏 | 无级色温调节&256阶护眼模式 德国电气工程师协会 VDE 低蓝光护眼认证&康宁第六代大猩猩玻璃&采用防油渍防指纹涂层&支持HDR显示", "高度：157.5mm&宽度：74.67mm&厚度：7.61mm *&重量：173g", "小米9 | 小米9 透明尊享版 | 小米9 王源限量版&3300mAh(typ) / 3200mAh (min)&内置锂离子聚合物电池，不可拆卸&USB Type-C 双面充电接口&通过德国莱茵TÜV安全快充认证", "索尼 4800 万超广角微距三摄&4800万 索尼主摄像头&SONY IMX586, 48MP, 0.8μm, 1/2“感光面积, FOV 79°&f/1.75光圈 , 6P镜头, AF, 闭环马达, 支持4 in 1 (12MP, 1.6μm)&2000万美颜相机&2000万 前置相机 0.9μm f/2.0 光圈", "支持 第一代视频编解码技术/HEVC、H.264、MPEG4、VC-1、VP8、VP9等视频格式；&播放HDR10视频内容时支持高动态范围显示", "全网通 5.0&支持双卡不限运营商，均可4G驻网①&双nano-SIM卡槽，任意卡槽均可设置为主卡&支持移动/联通/电信 4G+/4G/3G/2G&支持双卡VoLTE高清语音②", "双频双天线GPS&同时接收L1 / L5 双频双路GPS信号&定位系统：&GPS:L1+L5 | Galileo:E1+E5a | GLONASS:G1 | 北斗:B1&A-GPS辅助定位 | 电子罗盘 | 无线网络 | 数据网络", "超声波距离传感器 | 屏下环境光传感器 | 加速度传感器 | 陀螺仪 | 电子罗盘&线性马达 | 红外线遥控器 | 摄像头激光对焦传感器", "MP4 | M4V | MKV | XVID | WAV | AAC | MP3 | AMR | FLAC | APE", "手机主机&极简手机保护壳&电源适配器&USB Type-C 数据线&Type-C转3.5mm耳机转接线&插针&入门指南&三包凭证");

/***************************************商品列表********************************************/
/***************************************商品列表********************************************/
CREATE TABLE xm_product_list(
  lid INT PRIMARY KEY AUTO_INCREMENT,            #商品列表编号
  pid INT,                                       #商品和商品详情编号关联
  bigMap VARCHAR(362),                           #商品大图地址
  referral VARCHAR(128),                         #商品介绍
  price DECIMAL(10, 2),                          #商品价格
  smMap VARCHAR(362)                             #商品小图地址
);

INSERT INTO xm_product_list VALUES
(null, 1, "image/product_list/pms_1550646262.14555118!200x200.jpg&image/product_list/pms_1550646283.24414368!200x200.jpg&image/product_list/pms_1550646297.53454858!200x200.jpg", "小米9 SE 6GB+64GB", 1999, "image/product_list/pms_1550646262.14555118!34x34.jpg&image/product_list/pms_1550646283.24414368!34x34.jpg&image/product_list/pms_1550646297.53454858!34x34.jpg"),
(null, 2, "image/product_list/pms_1550642365.51219884!200x200.jpg", "小米9透明尊享版12GB+256GB", 3999, "image/product_list/pms_1550642365.51219884!34x34.jpg"),
(null, 3, "image/product_list/pms_1555463256.83068270!200x200.jpg&image/product_list/pms_1555463268.15014482!200x200.jpg&image/product_list/pms_1555463310.35763741!200x200.jpg&image/product_list/pms_1555463323.27041375!200x200.jpg&image/product_list/pms_1555463330.42251408!200x200.jpg", "小米9 SE 6GB+64GB", 1999, "image/product_list/pms_1555463256.83068270!34x34.jpg&image/product_list/pms_1555463268.15014482!34x34.jpg&image/product_list/pms_1555463310.35763741!34x34.jpg&image/product_list/pms_1555463323.27041375!34x34.jpg&image/product_list/pms_1555463330.42251408!34x34.jpg"),
(null, 4, "image/product_list/pms_1553941707.91222835!200x200.jpg", "小米9 SE 布朗熊限量套装 6GB+128GB", 2499, "image/product_list/pms_1553941707.91222835!34x34.jpg");

/*******************************************首页轮播图***************************************************/
/*******************************************首页轮播图***************************************************/
CREATE TABLE xm_index_banner(
  bid INT PRIMARY KEY AUTO_INCREMENT,            #首页轮播图编号
  banner VARCHAR(128)                            #首页轮播图图片地址
);
INSERT INTO xm_index_banner VALUES
(null, "image/index/banner1.jpg"),
(null, "image/index/banner2.jpg"),
(null, "image/index/banner3.jpg"),
(null, "image/index/banner4.jpg"),
(null, "image/index/banner5.jpg");

/**********************************************首页展示图三个中图*******************************************************/
/**********************************************首页展示图三个中图*******************************************************/

CREATE TABLE xm_index_md_show(
  wid INT PRIMARY KEY AUTO_INCREMENT,              #首页展示图编号
  mdMap VARCHAR(128)                               #首页展示图三个中图图片地址
);

INSERT INTO xm_index_md_show VALUES
(null, "image/index/xmad_15513348763999_sTLBm.jpg"),
(null, "image/index/xmad_15553261995553_hjAqy.jpg"),
(null, "image/index/xmad_15566163158698_gwoiA.jpg");
/**********************************************首页展示图大图片*******************************************************/
/**********************************************首页展示图大图片*******************************************************/
CREATE TABLE xm_index_lg_show(
  wid INT PRIMARY KEY AUTO_INCREMENT,              #首页展示图编号
  lgMap VARCHAR(128)                               #首页展示图大图图片地址
);
INSERT INTO xm_index_lg_show VALUES
(null, "image/index/xmad_15573897133137_JtYCB.jpg"),
(null, "image/index/xmad_15598284638071_regcA.jpg"),
(null, "image/index/xmad_15566150564326_nUZAQ.jpg"),
(null, "image/index/xmad_15562499146276_ZVsYu.jpg"),
(null, "image/index/xmad_15517943282724_lhogK.jpg"),
(null, "image/index/xmad_15597025927594_cfXxF.jpg");

/*********************************************首页商品展示************************************************************/
/*********************************************首页商品展示************************************************************/
CREATE TABLE xm_index_product(
  tid INT PRIMARY KEY AUTO_INCREMENT,               #首页商品编号
  label VARCHAR(128),                               #首页商品头部小标签
  picture VARCHAR(128),                             #首页商品图片地址
  title VARCHAR(128),                               #首页商品标题
  intro VARCHAR(128),                               #首页商品简介
  price DECIMAL(10, 2)                              #首页商品价格
);

INSERT INTO xm_index_product VALUES
(null, "新品", "image/index/product_show/pms_1550642182.7527088!220x220.jpg", "小米9 6GB+128GB", "骁龙855，索尼4800万超广角微距三摄", 2999),
(null, "新品", "image/index/product_show/pms_1550642182.7527088!220x220.jpg", "小米9 6GB+128GB", "骁龙855，索尼4800万超广角微距三摄", 2999),
(null, "新品", "image/index/product_show/pms_1550642182.7527088!220x220.jpg", "小米9 6GB+128GB", "骁龙855，索尼4800万超广角微距三摄", 2999),
(null, "新品", "image/index/product_show/pms_1550642182.7527088!220x220.jpg", "小米9 6GB+128GB", "骁龙855，索尼4800万超广角微距三摄", 2999),
(null, "新品", "image/index/product_show/pms_1550642182.7527088!220x220.jpg", "小米9 6GB+128GB", "骁龙855，索尼4800万超广角微距三摄", 2999),
(null, "新品", "image/index/product_show/pms_1550642182.7527088!220x220.jpg", "小米9 6GB+128GB", "骁龙855，索尼4800万超广角微距三摄", 2999),
(null, "新品", "image/index/product_show/pms_1550642182.7527088!220x220.jpg", "小米9 6GB+128GB", "骁龙855，索尼4800万超广角微距三摄", 2999),
(null, "新品", "image/index/product_show/pms_1550642182.7527088!220x220.jpg", "小米9 6GB+128GB", "骁龙855，索尼4800万超广角微距三摄", 2999);