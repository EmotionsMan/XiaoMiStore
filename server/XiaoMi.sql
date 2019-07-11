/*******************************小米商城数据库*************************************************/
/*******************************小米商城数据库*************************************************/
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
  family VARCHAR(128),                 #种类名称
   familyID INT                        #种类名称编号
);
INSERT INTO xm_productFamily VALUES(null, "手机", 10), (null, "电脑", 20), (null, "家电", 30), (null, "智能", 40), (null, "搭配", 50), (null, "配件", 60), (null, "周边", 70),(null, "红米", 80);

/************************************商品详情表***********************************************/
/************************************商品详情表***********************************************/
CREATE TABLE xm_product(
  pid INT PRIMARY KEY AUTO_INCREMENT,     #商品编号
  familyid INT,                           #商品所属种类和种类名称编号关联
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
(null, 10, "小米9 SE", "6GB+64GB/6GB+128GB，限时赠价值99元圈铁耳机", "索尼4800万超广角三摄 / 骁龙712全球首发 / 全息幻彩机身 / 三星AMOLED屏幕 / 5.97”水滴屏 / 第五代屏幕指纹识别 / 多功能NFC / 红外遥控", "image/product/pms_1550646283.22955781.jpg&image/product/pms_1550646283.24414368.jpg&image/product/pms_1550646283.31579902.jpg&image/product/pms_1550646283.43099171.jpg", "小米自营", 1999.00, "赠小米圈铁耳机2 黑色&赠米粉卡", "6GB+64GB&1999元", "全息幻彩紫", "骁龙 855 旗舰处理器&CPU 名称：骁龙855 高通年度旗舰处理器&CPU 架构工艺：全新Kryo 485 架构，7nm 工艺制程&CPU 主频：八核处理器，最高主频可达：2.84GHz&高通首款三丛集设计：1 x 2.84GHz 超级大核 + 3 x 2.42GHz 大核 + 4 x 1.80GHz 小核&CPU 性能提升：CPU 单核性能提升：45%，能效提升：40%&GPU 名称：Adreno 640 图形处理器&GPU 性能：性能提升20%，能效提升：25%+&AIE ：第四代AI引擎，3 倍 AI 性能", "MIUI 10&首次支持 MI Turbo&首次支持碎片整理 I/O性能优化 | 支持应用启动速度优化&模拟 18 个月使用，降低老化卡顿35%&首次支持 Game Turbo&支持感知游戏复杂场景 ，智能调度系统资源 | 支持自定义游戏触控参数丨支持自定义游戏显示增强&枪战类游戏4D触感 | 支持显示CPU占用、GPU占用、FPS | 游戏工具箱支持一键切换上网卡，支持息屏挂机等功能&支持游戏性能增强、优化触控响应丨支持自定义边缘抑制范围 | 支持关闭自动亮度、三指截屏、护眼模式&动态壁纸及显示&彩色AOD息屏显示 | 支持随当地日出日落时间变化的动态壁纸&首次支持深色模式（Dark mode）", "8GB+128GB&小米9 最高可选&内存：6GB / 8GB LPDDR4x 2133MHz 双通道大内存&闪存：可选 128GB 机身存储 UFS2.1&8GB + 256GB&小米9 透明版标配&内存：8GB LPDDR4x 2133MHz 双通道大内存&闪存：可选 256GB 机身存储 UFS2.1&8GB+128GB&小米9 王源限量版&内存：8GB LPDDR4x 2133MHz 双通道大内存&闪存：128GB 机身存储 UFS2.1&12GB+256GB&小米9 透明尊享版&内存：12GB LPDDR4x 2133MHz 双通道大内存&闪存：256GB 机身存储 UFS2.1", "6.39英寸(对角线)&三星 AMOLED 全面屏&分辨率 2340 x 1080 FHD+ 403 PPI&屏幕亮度 600nit (HBM) / 430nit(Typ)&高对比度 60000:1(Min) | 广色域显示 NTSC 103.8%(Typ)&标准模式 | 阳光屏2.0 | 夜光屏 | 无级色温调节&256阶护眼模式 德国电气工程师协会 VDE 低蓝光护眼认证&康宁第六代大猩猩玻璃&采用防油渍防指纹涂层&支持HDR显示", "高度：157.5mm&宽度：74.67mm&厚度：7.61mm *&重量：173g", "小米9 | 小米9 透明尊享版 | 小米9 王源限量版&3300mAh(typ) / 3200mAh (min)&内置锂离子聚合物电池，不可拆卸&USB Type-C 双面充电接口&通过德国莱茵TÜV安全快充认证", "索尼 4800 万超广角微距三摄&4800万 索尼主摄像头&SONY IMX586, 48MP, 0.8μm, 1/2“感光面积, FOV 79°&f/1.75光圈 , 6P镜头, AF, 闭环马达, 支持4 in 1 (12MP, 1.6μm)&2000万美颜相机&2000万 前置相机 0.9μm f/2.0 光圈", "支持 第一代视频编解码技术/HEVC、H.264、MPEG4、VC-1、VP8、VP9等视频格式；&播放HDR10视频内容时支持高动态范围显示", "全网通 5.0&支持双卡不限运营商，均可4G驻网①&双nano-SIM卡槽，任意卡槽均可设置为主卡&支持移动/联通/电信 4G+/4G/3G/2G&支持双卡VoLTE高清语音②", "双频双天线GPS&同时接收L1 / L5 双频双路GPS信号&定位系统：&GPS:L1+L5 | Galileo:E1+E5a | GLONASS:G1 | 北斗:B1&A-GPS辅助定位 | 电子罗盘 | 无线网络 | 数据网络", "超声波距离传感器 | 屏下环境光传感器 | 加速度传感器 | 陀螺仪 | 电子罗盘&线性马达 | 红外线遥控器 | 摄像头激光对焦传感器", "MP4 | M4V | MKV | XVID | WAV | AAC | MP3 | AMR | FLAC | APE", "手机主机&极简手机保护壳&电源适配器&USB Type-C 数据线&Type-C转3.5mm耳机转接线&插针&入门指南&三包凭证"),
(null, 10, "小米8 SE", "6GB+64GB/6GB+128GB，限时赠价值99元圈铁耳机", "索尼4800万超广角三摄 / 骁龙712全球首发 / 全息幻彩机身 / 三星AMOLED屏幕 / 5.97”水滴屏 / 第五代屏幕指纹识别 / 多功能NFC / 红外遥控", "image/product/pms_1550646283.22955781.jpg&image/product/pms_1550646283.24414368.jpg&image/product/pms_1550646283.31579902.jpg&image/product/pms_1550646283.43099171.jpg", "小米自营", 1999.00, "赠小米圈铁耳机2 黑色&赠米粉卡", "6GB+64GB&1999元", "全息幻彩紫", "骁龙 855 旗舰处理器&CPU 名称：骁龙855 高通年度旗舰处理器&CPU 架构工艺：全新Kryo 485 架构，7nm 工艺制程&CPU 主频：八核处理器，最高主频可达：2.84GHz&高通首款三丛集设计：1 x 2.84GHz 超级大核 + 3 x 2.42GHz 大核 + 4 x 1.80GHz 小核&CPU 性能提升：CPU 单核性能提升：45%，能效提升：40%&GPU 名称：Adreno 640 图形处理器&GPU 性能：性能提升20%，能效提升：25%+&AIE ：第四代AI引擎，3 倍 AI 性能", "MIUI 10&首次支持 MI Turbo&首次支持碎片整理 I/O性能优化 | 支持应用启动速度优化&模拟 18 个月使用，降低老化卡顿35%&首次支持 Game Turbo&支持感知游戏复杂场景 ，智能调度系统资源 | 支持自定义游戏触控参数丨支持自定义游戏显示增强&枪战类游戏4D触感 | 支持显示CPU占用、GPU占用、FPS | 游戏工具箱支持一键切换上网卡，支持息屏挂机等功能&支持游戏性能增强、优化触控响应丨支持自定义边缘抑制范围 | 支持关闭自动亮度、三指截屏、护眼模式&动态壁纸及显示&彩色AOD息屏显示 | 支持随当地日出日落时间变化的动态壁纸&首次支持深色模式（Dark mode）", "8GB+128GB&小米9 最高可选&内存：6GB / 8GB LPDDR4x 2133MHz 双通道大内存&闪存：可选 128GB 机身存储 UFS2.1&8GB + 256GB&小米9 透明版标配&内存：8GB LPDDR4x 2133MHz 双通道大内存&闪存：可选 256GB 机身存储 UFS2.1&8GB+128GB&小米9 王源限量版&内存：8GB LPDDR4x 2133MHz 双通道大内存&闪存：128GB 机身存储 UFS2.1&12GB+256GB&小米9 透明尊享版&内存：12GB LPDDR4x 2133MHz 双通道大内存&闪存：256GB 机身存储 UFS2.1", "6.39英寸(对角线)&三星 AMOLED 全面屏&分辨率 2340 x 1080 FHD+ 403 PPI&屏幕亮度 600nit (HBM) / 430nit(Typ)&高对比度 60000:1(Min) | 广色域显示 NTSC 103.8%(Typ)&标准模式 | 阳光屏2.0 | 夜光屏 | 无级色温调节&256阶护眼模式 德国电气工程师协会 VDE 低蓝光护眼认证&康宁第六代大猩猩玻璃&采用防油渍防指纹涂层&支持HDR显示", "高度：157.5mm&宽度：74.67mm&厚度：7.61mm *&重量：173g", "小米9 | 小米9 透明尊享版 | 小米9 王源限量版&3300mAh(typ) / 3200mAh (min)&内置锂离子聚合物电池，不可拆卸&USB Type-C 双面充电接口&通过德国莱茵TÜV安全快充认证", "索尼 4800 万超广角微距三摄&4800万 索尼主摄像头&SONY IMX586, 48MP, 0.8μm, 1/2“感光面积, FOV 79°&f/1.75光圈 , 6P镜头, AF, 闭环马达, 支持4 in 1 (12MP, 1.6μm)&2000万美颜相机&2000万 前置相机 0.9μm f/2.0 光圈", "支持 第一代视频编解码技术/HEVC、H.264、MPEG4、VC-1、VP8、VP9等视频格式；&播放HDR10视频内容时支持高动态范围显示", "全网通 5.0&支持双卡不限运营商，均可4G驻网①&双nano-SIM卡槽，任意卡槽均可设置为主卡&支持移动/联通/电信 4G+/4G/3G/2G&支持双卡VoLTE高清语音②", "双频双天线GPS&同时接收L1 / L5 双频双路GPS信号&定位系统：&GPS:L1+L5 | Galileo:E1+E5a | GLONASS:G1 | 北斗:B1&A-GPS辅助定位 | 电子罗盘 | 无线网络 | 数据网络", "超声波距离传感器 | 屏下环境光传感器 | 加速度传感器 | 陀螺仪 | 电子罗盘&线性马达 | 红外线遥控器 | 摄像头激光对焦传感器", "MP4 | M4V | MKV | XVID | WAV | AAC | MP3 | AMR | FLAC | APE", "手机主机&极简手机保护壳&电源适配器&USB Type-C 数据线&Type-C转3.5mm耳机转接线&插针&入门指南&三包凭证"),
(null, 10, "小米10 SE", "6GB+64GB/6GB+128GB，限时赠价值99元圈铁耳机", "索尼4800万超广角三摄 / 骁龙712全球首发 / 全息幻彩机身 / 三星AMOLED屏幕 / 5.97”水滴屏 / 第五代屏幕指纹识别 / 多功能NFC / 红外遥控", "image/product/pms_1550646283.22955781.jpg&image/product/pms_1550646283.24414368.jpg&image/product/pms_1550646283.31579902.jpg&image/product/pms_1550646283.43099171.jpg", "小米自营", 1999.00, "赠小米圈铁耳机2 黑色&赠米粉卡", "6GB+64GB&1999元", "全息幻彩紫", "骁龙 855 旗舰处理器&CPU 名称：骁龙855 高通年度旗舰处理器&CPU 架构工艺：全新Kryo 485 架构，7nm 工艺制程&CPU 主频：八核处理器，最高主频可达：2.84GHz&高通首款三丛集设计：1 x 2.84GHz 超级大核 + 3 x 2.42GHz 大核 + 4 x 1.80GHz 小核&CPU 性能提升：CPU 单核性能提升：45%，能效提升：40%&GPU 名称：Adreno 640 图形处理器&GPU 性能：性能提升20%，能效提升：25%+&AIE ：第四代AI引擎，3 倍 AI 性能", "MIUI 10&首次支持 MI Turbo&首次支持碎片整理 I/O性能优化 | 支持应用启动速度优化&模拟 18 个月使用，降低老化卡顿35%&首次支持 Game Turbo&支持感知游戏复杂场景 ，智能调度系统资源 | 支持自定义游戏触控参数丨支持自定义游戏显示增强&枪战类游戏4D触感 | 支持显示CPU占用、GPU占用、FPS | 游戏工具箱支持一键切换上网卡，支持息屏挂机等功能&支持游戏性能增强、优化触控响应丨支持自定义边缘抑制范围 | 支持关闭自动亮度、三指截屏、护眼模式&动态壁纸及显示&彩色AOD息屏显示 | 支持随当地日出日落时间变化的动态壁纸&首次支持深色模式（Dark mode）", "8GB+128GB&小米9 最高可选&内存：6GB / 8GB LPDDR4x 2133MHz 双通道大内存&闪存：可选 128GB 机身存储 UFS2.1&8GB + 256GB&小米9 透明版标配&内存：8GB LPDDR4x 2133MHz 双通道大内存&闪存：可选 256GB 机身存储 UFS2.1&8GB+128GB&小米9 王源限量版&内存：8GB LPDDR4x 2133MHz 双通道大内存&闪存：128GB 机身存储 UFS2.1&12GB+256GB&小米9 透明尊享版&内存：12GB LPDDR4x 2133MHz 双通道大内存&闪存：256GB 机身存储 UFS2.1", "6.39英寸(对角线)&三星 AMOLED 全面屏&分辨率 2340 x 1080 FHD+ 403 PPI&屏幕亮度 600nit (HBM) / 430nit(Typ)&高对比度 60000:1(Min) | 广色域显示 NTSC 103.8%(Typ)&标准模式 | 阳光屏2.0 | 夜光屏 | 无级色温调节&256阶护眼模式 德国电气工程师协会 VDE 低蓝光护眼认证&康宁第六代大猩猩玻璃&采用防油渍防指纹涂层&支持HDR显示", "高度：157.5mm&宽度：74.67mm&厚度：7.61mm *&重量：173g", "小米9 | 小米9 透明尊享版 | 小米9 王源限量版&3300mAh(typ) / 3200mAh (min)&内置锂离子聚合物电池，不可拆卸&USB Type-C 双面充电接口&通过德国莱茵TÜV安全快充认证", "索尼 4800 万超广角微距三摄&4800万 索尼主摄像头&SONY IMX586, 48MP, 0.8μm, 1/2“感光面积, FOV 79°&f/1.75光圈 , 6P镜头, AF, 闭环马达, 支持4 in 1 (12MP, 1.6μm)&2000万美颜相机&2000万 前置相机 0.9μm f/2.0 光圈", "支持 第一代视频编解码技术/HEVC、H.264、MPEG4、VC-1、VP8、VP9等视频格式；&播放HDR10视频内容时支持高动态范围显示", "全网通 5.0&支持双卡不限运营商，均可4G驻网①&双nano-SIM卡槽，任意卡槽均可设置为主卡&支持移动/联通/电信 4G+/4G/3G/2G&支持双卡VoLTE高清语音②", "双频双天线GPS&同时接收L1 / L5 双频双路GPS信号&定位系统：&GPS:L1+L5 | Galileo:E1+E5a | GLONASS:G1 | 北斗:B1&A-GPS辅助定位 | 电子罗盘 | 无线网络 | 数据网络", "超声波距离传感器 | 屏下环境光传感器 | 加速度传感器 | 陀螺仪 | 电子罗盘&线性马达 | 红外线遥控器 | 摄像头激光对焦传感器", "MP4 | M4V | MKV | XVID | WAV | AAC | MP3 | AMR | FLAC | APE", "手机主机&极简手机保护壳&电源适配器&USB Type-C 数据线&Type-C转3.5mm耳机转接线&插针&入门指南&三包凭证");

/***************************************商品列表********************************************/
/***************************************商品列表********************************************/
CREATE TABLE xm_product_list(
  lid INT PRIMARY KEY AUTO_INCREMENT,            #商品列表编号
  pid INT,                                       #商品和商品详情编号关联
  bigMap VARCHAR(362),                           #商品大图地址
  referral VARCHAR(128),                         #商品介绍
  price DECIMAL(10, 2),                          #商品价格
  smMap VARCHAR(362),                            #商品小图地址
  familyid INT                                   #商品所属种类和种类名称编号关联
);

INSERT INTO xm_product_list VALUES
(null, 1, "image/product_list/pms_1550646262.14555118!200x200.jpg&image/product_list/pms_1550646283.24414368!200x200.jpg&image/product_list/pms_1550646297.53454858!200x200.jpg", "小米9 SE 6GB+64GB", 1999, "image/product_list/pms_1550646262.14555118!34x34.jpg&image/product_list/pms_1550646283.24414368!34x34.jpg&image/product_list/pms_1550646297.53454858!34x34.jpg", 10),
(null, 2, "image/product_list/pms_1550642365.51219884!200x200.jpg", "小米9透明尊享版12GB+256GB", 3999, "image/product_list/pms_1550642365.51219884!34x34.jpg", 10),
(null, 3, "image/product_list/pms_1555463256.83068270!200x200.jpg&image/product_list/pms_1555463268.15014482!200x200.jpg&image/product_list/pms_1555463310.35763741!200x200.jpg&image/product_list/pms_1555463323.27041375!200x200.jpg&image/product_list/pms_1555463330.42251408!200x200.jpg", "小米9 SE 6GB+64GB", 1999, "image/product_list/pms_1555463256.83068270!34x34.jpg&image/product_list/pms_1555463268.15014482!34x34.jpg&image/product_list/pms_1555463310.35763741!34x34.jpg&image/product_list/pms_1555463323.27041375!34x34.jpg&image/product_list/pms_1555463330.42251408!34x34.jpg", 10),
(null, 4, "image/product_list/pms_1553941707.91222835!200x200.jpg", "小米9 SE 布朗熊限量套装 6GB+128GB", 2499, "image/product_list/pms_1553941707.91222835!34x34.jpg", 10),
(null, 5, "image/product_list/pms_1550646262.14555118!200x200.jpg&image/product_list/pms_1550646283.24414368!200x200.jpg&image/product_list/pms_1550646297.53454858!200x200.jpg", "小米9 SE 6GB+64GB", 1999, "image/product_list/pms_1550646262.14555118!34x34.jpg&image/product_list/pms_1550646283.24414368!34x34.jpg&image/product_list/pms_1550646297.53454858!34x34.jpg", 10),
(null, 6, "image/product_list/pms_1550642365.51219884!200x200.jpg", "小米9透明尊享版12GB+256GB", 3999, "image/product_list/pms_1550642365.51219884!34x34.jpg", 10),
(null, 7, "image/product_list/pms_1555463256.83068270!200x200.jpg&image/product_list/pms_1555463268.15014482!200x200.jpg&image/product_list/pms_1555463310.35763741!200x200.jpg&image/product_list/pms_1555463323.27041375!200x200.jpg&image/product_list/pms_1555463330.42251408!200x200.jpg", "小米9 SE 6GB+64GB", 1999, "image/product_list/pms_1555463256.83068270!34x34.jpg&image/product_list/pms_1555463268.15014482!34x34.jpg&image/product_list/pms_1555463310.35763741!34x34.jpg&image/product_list/pms_1555463323.27041375!34x34.jpg&image/product_list/pms_1555463330.42251408!34x34.jpg", 10),
(null, 8, "image/product_list/pms_1553941707.91222835!200x200.jpg", "小米9 SE 布朗熊限量套装 6GB+128GB", 2499, "image/product_list/pms_1553941707.91222835!34x34.jpg", 10);

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
  gid INT PRIMARY KEY AUTO_INCREMENT,              #首页展示图编号
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
/***********手机商品**********/
CREATE TABLE xm_index_product_phone(
  pid INT PRIMARY KEY AUTO_INCREMENT,               #首页商品编号
  label VARCHAR(128),                               #首页商品头部小标签
  picture VARCHAR(128),                             #首页商品图片地址
  title VARCHAR(128),                               #首页商品标题
  intro VARCHAR(128),                               #首页商品简介
  price DECIMAL(10, 2)                              #首页商品价格
);
INSERT INTO xm_index_product_phone VALUES
(null, null, "image/index/product_show/xmad_15572211624847_jSHgQ.jpg", null, null, null),
(null, "新品", "image/index/product_show/pms_1550642182.7527088!220x220.jpg", "小米9 6GB+128GB", "骁龙855，索尼4800万超广角微距三摄", 2999),
(null, "新品", "image/index/product_show/pms_1547020852.30751177!220x220.jpg", "小米9 SE 6GB+64GB", "索尼4800万超广角三摄，骁龙712", 1999),
(null, "减50", "image/index/product_show/pms_1550642182.7527088!220x220.jpg", "红米6A 2GB+16GB", "12nm高性能处理器，1300万高清相机", 599),
(null, "新品", "image/index/product_show/pms_1545457719.47232999!220x220.png", "小米9 SE 6GB+64GB", "5.84“小水滴全面屏，后置1200万", 1999),
(null, "享8折", "image/index/product_show/pms_1550642182.7527088!220x220.jpg", "小米8 SE 6GB+64GB", "三星 AMOLED 全面屏，骁龙710", 1999),
(null, "减200", "image/index/product_show/pms_1550642182.7527088!220x220.jpg", "小米9 6GB+128GB", "潮流镜面渐变色，2400万自拍旗舰", 1699);
/**************家电商品**************/
CREATE TABLE xm_index_product_homeApp(
  hid INT PRIMARY KEY AUTO_INCREMENT,               #首页商品编号
  label VARCHAR(128),                               #首页商品头部小标签
  picture VARCHAR(128),                             #首页商品图片地址
  title VARCHAR(128),                               #首页商品标题
  intro VARCHAR(128),                               #首页商品简介
  price DECIMAL(10, 2),                             #首页商品价格
  evaluate VARCHAR(128),                            #评价
  source VARCHAR(64),                                #评价来源
  isFamilyId SMALLINT                               #所属家族编号         
);
INSERT INTO xm_index_product_homeApp VALUES
(null, null, "image/index/product_show/xmad_15543882240313_PHKGN.jpg", null, null, null, null, null,  10),
(null, null, "image/index/product_show/xmad_15453810333749_hDsXv.jpg", null, null, null, null, null,  10),
(null, "减200", "image/index/product_show/xmad_15512365381648_yZpKS.jpg", "米家互联网洗烘一体机10kg", null, 2199, "很满意，非常喜欢，开心", "漩涡鸣人", 10),
(null, "减500", "image/index/product_show/pms_1545286017.38639954!220x220.jpg", "米家互联网空调(一级能效)", null, 2699, "空调很好，杠杠滴，颜值杠杠滴，帅呆了", "卡卡罗特", 10),
(null, null, "image/index/product_show/xmad_14972549116226_tZpod.png", "米家空气净化器Pro", "OLED显示屏幕/激光颗粒物传感器", 1499, "很不错，感觉身处大自然", "勇哥", 10),
(null, "新品", "image/index/product_show/xmad_15350951136177_QUuVm.png", "15.6“笔记本 i5 4GMX100", null, 4199, "物流很快的，笔记本很流畅，体验超级棒，显示屏很清晰", "路飞", 10),
(null, null, "image/index/product_show/pms_1504498936.11861982!220x220.jpg", "米家电水壶", "一杯水，是一家人最看重的安心", 99, "水质很不错呦", "胡图图", 10),
(null, null, "image/index/product_show/pms_1521634907.16181074!220x220.jpg", "小米净水器", null, 1599, null, null, 10),
(null, "新品", "image/index/product_show/692a6c3b0a93a24f74a29c0f9d68ec71.png", null, null, null, null, null, 10),
/*电视*/
(null, null, "image/index/product_show/xmad_15543882240313_PHKGN.jpg", null, null, null, null, null, 20),
(null, null, "image/index/product_show/xmad_15453810333749_hDsXv.jpg", null, null, null, null, null, 20),
(null, "减200", "image/index/product_show/pms_1555935546.09711490!220x220.jpg", "小米壁画电视 65英寸", null, 6999, "挺时尚前卫的，电视柜没到，主机先放箱子上。谢谢雷总及勇哥", "佐助", 20),
(null, "减500", "image/index/product_show/pms_1555947485.70419235!220x220.jpg", "小米全面屏电视E55A", null, 2699, "品质好，非常喜欢，够大，够强，够气派 正在看～我爱你", "卡卡罗特", 20),
(null, null, "image/index/product_show/pms_1539315570.63599432!220x220.jpg", "小米电视4X 43英寸", null, 1399, "电视很好，够清晰，这个价格打特价很划算。", "勇哥", 20),
(null, "新品", "image/index/product_show/xmad_15350951136177_QUuVm.png", "小米壁画电视 65英寸", null, 4199, "挺时尚前卫的，电视柜没到，主机先放箱子上。谢谢雷总及勇哥", "路飞", 20),
(null, null, "image/index/product_show/pms_1539315570.63599432!220x220.jpg", "小米电视4X 43英寸", null, 1399, "电视很好，够清晰，这个价格打特价很划算。", "勇哥", 20),
(null, null, "image/index/product_show/pms_1521634907.16181074!220x220.jpg", "小米净水器", null, 1599, null, null, 20),
(null, null, "image/index/product_show/692a6c3b0a93a24f74a29c0f9d68ec71.png", null, null, null, null, null, 20),
/*电脑*/
(null, null, "image/index/product_show/xmad_15543882240313_PHKGN.jpg", null, null, null, null, null, 30),
(null, null, "image/index/product_show/xmad_15453810333749_hDsXv.jpg", null, null, null, null, null, 30),
(null, "减200", "image/index/product_show/pms_1533196142.85059414!220x220.png", "13.3'小米笔记本Air 四核i7 8G", null, 2199, "很满意，非常喜欢，开心", "漩涡鸣人", 30),
(null, "减200", "image/index/product_show/pms_1533196142.85059414!220x220.png", "13.3'小米笔记本Air 四核i7 8G", null, 2199, "很满意，非常喜欢，开心", "漩涡鸣人", 30),
(null, "新品", "image/index/product_show/xmad_15350951136177_QUuVm.png", "15.6“笔记本 i5 4GMX100", null, 4199, "物流很快的，笔记本很流畅，体验超级棒，显示屏很清晰", "路飞", 30),
(null, "新品", "image/index/product_show/xmad_15350951136177_QUuVm.png", "15.6“笔记本 i5 4GMX100", null, 4199, "物流很快的，笔记本很流畅，体验超级棒，显示屏很清晰", "路飞", 30),
(null, null, "image/index/product_show/pms_1490702347.3628109!220x220.png", "悦米机械键盘", "铝合金机身，TTC红轴，87 键", 199, "很喜欢很给力！希望大家支持", "胡图图", 30),
(null, null, "image/index/product_show/pms_1521634907.16181074!220x220.jpg", "小米净水器", null, 1599, null, null, 30),
(null, "新品", "image/index/product_show/692a6c3b0a93a24f74a29c0f9d68ec71.png", null, null, null, null, null, 30),
/*家居*/
(null, null, "image/index/product_show/xmad_15543882240313_PHKGN.jpg", null, null, null, null, null, 40),
(null, null, "image/index/product_show/xmad_15453810333749_hDsXv.jpg", null, null, null, null, null, 40),
(null, "减200", "image/index/product_show/xmad_15512365381648_yZpKS.jpg", "米asdfasdfsad洗烘一体机10kg", null, 2199, "很满意，非常喜欢，开心", "漩涡鸣人", 40),
(null, "减500", "image/index/product_show/pms_1545286017.38639954!220x220.jpg", "米家互联网空调(一级能效)", null, 2699, "空调很好，杠杠滴，颜值杠杠滴，帅呆了", "卡卡罗特", 40),
(null, null, "image/index/product_show/xmad_14972549116226_tZpod.png", "米家空净化器Pro", "OLED显示屏幕/激光颗粒物传感器", 1499, "很不错，感觉身处大自然", "勇哥", 40),
(null, "新品", "image/index/product_show/pms_1465366178.11466342!220x220.jpg", "米家恒温电水壶", "水温智能控制，304 不锈钢内胆", 99, "东西非常不错不错不错不错", "路飞", 40),
(null, null, "image/index/product_show/pms_1504498936.11861982!220x220.jpg", "米家电水壶", "一杯水，是一家人最看重的安心", 99, "水质很不错呦", "胡图图", 40),
(null, null, "image/index/product_show/pms_1521634907.16181074!220x220.jpg", "小米净水器", null, 1599, null, null, 40),
(null, null, "image/index/product_show/692a6c3b0a93a24f74a29c0f9d68ec71.png", null, null, null, null, null, 40);
/****************智能商品*******************/
CREATE TABLE xm_index_product_capacity(
  aid INT PRIMARY KEY AUTO_INCREMENT,               #首页商品编号
  label VARCHAR(128),                               #首页商品头部小标签
  picture VARCHAR(128),                             #首页商品图片地址
  title VARCHAR(128),                               #首页商品标题
  intro VARCHAR(128),                               #首页商品简介
  price DECIMAL(10, 2),                             #首页商品价格
  evaluate VARCHAR(128),                            #评价
  source VARCHAR(64),                               #评价来源 
  isFamilyId SMALLINT                               #所属家族编号
);
INSERT INTO xm_index_product_capacity VALUES
(null, null, "image/index/product_show/xmad_15407955088238_axybK.jpg", null, null, null, null, null,  10),
(null, null, "image/index/product_show/xmad_14950995035103_fhWtH.jpg", null, null, null, null, null,  10),
(null, "减20", "image/index/product_show/cf6660a3-d424-4248-889f-0eed1e99a342.png", "米家飞利浦智睿台灯", "感知环境光，主动优化场景照明", 199, "灯光很不错", "田老大", 10),
(null, null, "image/index/product_show/pms_1506733860.3164711!220x220.jpg", "车载空气净化器(USB车充版)", "高效净化车内空气", 499, "车内车外感觉都一样", "秋名山车神", 10),
(null, "减10", "image/index/product_show/pms_1527754949.17141338!220x220.jpg", "小米手环3", "你身边最好的朋友，时刻关注你", 159, "不错不错不错", "AilLine", 10),
(null, null, "image/index/leftnav4-6.png", "米家IH电饭煲4L", "IH电磁环绕加热，超节能小高手", 599, "到货非常快，外观很漂亮，非常高大上的米米款锅，身外形很好看，我很喜欢", "红太狼", 10),
(null, null, "image/index/leftnav8-3.png", "米家声波电动牙刷", "磁悬浮声波马达，定制多种刷牙模式", 99, "目前挺好的，试用一段时间后才知道质量好不好，买了mi很多的商品，都很不错", "洗刷刷", 10),
(null, null, "image/index/product_show/pms_1528698828.42759625!220x220.jpg", "小米插线板", null, 49, null, null, 10),
(null, "新品", "image/index/product_show/692a6c3b0a93a24f74a29c0f9d68ec71.png", null, null, null, null, null, 10),
/*出行*/
(null, null, "image/index/product_show/xmad_15407955088238_axybK.jpg", null, null, null, null, null,  20),
(null, "享八折", "image/index/product_show/xmad_14950995035103_fhWtH.jpg", null, null, null, null, null,  20),
(null, "减20", "image/index/product_show/31ae6df6-b672-491e-ab95-7b83a965c694.png", "电助力折叠自行车", "力矩传感电助力，折叠便式
", 199, "等了好久，终于本地区有卖，挺好的车，以后汽车放离家远...", "田老大", 20),
(null, null, "image/index/product_show/pms_1488272686.62666302!220x220.jpg", "小米米家电动滑板车", "极简几何设计，1 分钟轻松上手", 499, "非常好，骑着舒服 速度可以，设计完美，安全系数高。值的拥有", "秋名山车神", 20),
(null, "减20", "image/index/product_show/31ae6df6-b672-491e-ab95-7b83a965c694.png", "电助力折叠自行车", "力矩传感电助力，折叠便式
", 199, "等了好久，终于本地区有卖，挺好的车，以后汽车放离家远...", "田老大", 20),
(null, null, "image/index/product_show/pms_1488272686.62666302!220x220.jpg", "小米米家电动滑板车", "极简几何设计，1 分钟轻松上手", 499, "非常好，骑着舒服 速度可以，设计完美，安全系数高。值的拥有", "秋名山车神", 20),
(null, "减20", "image/index/product_show/31ae6df6-b672-491e-ab95-7b83a965c694.png", "电助力折叠自行车", "力矩传感电助力，折叠便式
", 199, "等了好久，终于本地区有卖，挺好的车，以后汽车放离家远...", "田老大", 20),
(null, null, "image/index/product_show/pms_1528698828.42759625!220x220.jpg", "小米插线板", null, 49, null, null, 20),
(null, "新品", "image/index/product_show/692a6c3b0a93a24f74a29c0f9d68ec71.png", null, null, null, null, null, 20),
/*健康*/
(null, "减20", "image/index/product_show/xmad_15407955088238_axybK.jpg", null, null, null, null, null,  30),
(null, null, "image/index/product_show/xmad_14950995035103_fhWtH.jpg", null, null, null, null, null,  30),
(null, "减20", "image/index/product_show/pms_1555659431.52713594!220x220.jpg", "小米体脂秤2", "体脂秤,体脂秤2,秤,体脂,测量体重", 199, "控体重、控体型的首选！4年前买了一个体重秤，现在再来...", "田老大", 30),
(null, null, "image/index/product_show/pms_1477980865.4569720!220x220.jpg", "米家PM2.5检测仪", "一体黑 OLED 屏，智能联动", 399, "东西很棒哒，已加入米家套餐。马上我就快买齐了所有的米..", "秋名山车神", 30),
(null, "减20", "image/index/product_show/pms_1555659431.52713594!220x220.jpg", "小米体脂秤2", "体脂秤,体脂秤2,秤,体脂,测量体重", 199, "控体重、控体型的首选！4年前买了一个体重秤，现在再来...", "田老大", 30),
(null, null, "image/index/product_show/pms_1477980865.4569720!220x220.jpg", "米家PM2.5检测仪", "一体黑 OLED 屏，智能联动", 399, "东西很棒哒，已加入米家套餐。马上我就快买齐了所有的米..", "秋名山车神", 30),
(null, null, "image/index/leftnav8-3.png", "米家声波电动牙刷", "磁悬浮声波马达，定制多种刷牙模式", 99, "目前挺好的，试用一段时间后才知道质量好不好，买了mi很多的商品，都很不错", "洗刷刷", 30),
(null, null, "image/index/product_show/pms_1528698828.42759625!220x220.jpg", "小米插线板", null, 49, null, null, 30),
(null, null, "image/index/product_show/692a6c3b0a93a24f74a29c0f9d68ec71.png", null, null, null, null, null, 30),
/*酷玩*/
(null, null, "image/index/product_show/xmad_15407955088238_axybK.jpg", null, null, null, null, null,  40),
(null, "新品", "image/index/product_show/xmad_14950995035103_fhWtH.jpg", null, null, null, null, null,  40),
(null, "减20", "image/index/product_show/pms_1499048837.78256911!220x220.jpg", "米兔积木机器人 履带机甲", "履带底盘，智能操控", 499, "这款非常棒，能搭机器人也能搭灰熊坦克等等，就是有点小...", "田老大", 40),
(null, null, "image/index/product_show/pms_1515662525.51823819!220x220.jpg", "米兔智能积木", "高效净化车内空气", 199, "动手又动脑，启发孩子创造力", "下午下单，第二天就到了。首先为软件点个赞，无论是界面...", 40),
(null, "减20", "image/index/product_show/pms_1499048837.78256911!220x220.jpg", "米兔积木机器人 履带机甲", "履带底盘，智能操控", 499, "这款非常棒，能搭机器人也能搭灰熊坦克等等，就是有点小...", "田老大", 40),
(null, null, "image/index/product_show/pms_1515662525.51823819!220x220.jpg", "米兔智能积木", "高效净化车内空气", 199, "动手又动脑，启发孩子创造力", "下午下单，第二天就到了。首先为软件点个赞，无论是界面...", 40),
(null, "减20", "image/index/product_show/pms_1499048837.78256911!220x220.jpg", "米兔积木机器人 履带机甲", "履带底盘，智能操控", 499, "这款非常棒，能搭机器人也能搭灰熊坦克等等，就是有点小...", "田老大", 40),
(null, "新品", "image/index/product_show/pms_1528698828.42759625!220x220.jpg", "小米插线板", null, 49, null, null, 40),
(null, null, "image/index/product_show/692a6c3b0a93a24f74a29c0f9d68ec71.png", null, null, null, null, null, 40),
/*路由器*/
(null, null, "image/index/product_show/xmad_15407955088238_axybK.jpg", null, null, null, null, null,  50),
(null, null, "image/index/product_show/xmad_14950995035103_fhWtH.jpg", null, null, null, null, null,  50),
(null, "减20", "image/index/product_show/pms_1488268224.14952632!220x220.jpg", "小米路由器 Pro", "全新金属机身设计，AC2600双频", 199, "上午下单，下午就到了，高颜值，app很好用，跳pin", "田老大", 50),
(null, null, "image/index/product_show/pms_1491009389.88616921!220x220.jpg", "小米WiFi电力猫", "有插座的地方 就有WiFi", 499, "我家是多层楼房，成功从三楼引到车库，相当于信号从四楼...", "秋名山车神", 50),
(null, "减20", "image/index/product_show/pms_1488268224.14952632!220x220.jpg", "小米路由器 Pro", "全新金属机身设计，AC2600双频", 199, "上午下单，下午就到了，高颜值，app很好用，跳pin", "田老大", 50),
(null, null, "image/index/product_show/pms_1491009389.88616921!220x220.jpg", "小米WiFi电力猫", "有插座的地方 就有WiFi", 499, "我家是多层楼房，成功从三楼引到车库，相当于信号从四楼...", "秋名山车神", 50),
(null, "减20", "image/index/product_show/pms_1488268224.14952632!220x220.jpg", "小米路由器 Pro", "全新金属机身设计，AC2600双频", 199, "上午下单，下午就到了，高颜值，app很好用，跳pin", "田老大", 50),
(null, null, "image/index/product_show/pms_1528698828.42759625!220x220.jpg", "小米插线板", null, 49, null, null, 50),
(null, null, "image/index/product_show/692a6c3b0a93a24f74a29c0f9d68ec71.png", null, null, null, null, null, 50);

/******************************************为你推荐商品*******************************************/
/******************************************为你推荐商品*******************************************/
CREATE TABLE xm_index_recommend(
  rid INT PRIMARY KEY AUTO_INCREMENT,               #编号
  image VARCHAR(128),                               #图片地址
  title VARCHAR(128),                               #标题
  price DECIMAL(10, 2),                             #价格
  good_reputation INT                               #好评人数
);
INSERT INTO xm_index_recommend VALUES
(null, "image/index/forYouRecommend/pms_1487579524.92087599!140x140.jpg", "米家空气净化器滤芯", 159, 5000),
(null, "image/index/forYouRecommend/pms_1527475006.84551272!140x140.jpg", "小米头戴式耳机", 259, 5920),
(null, "image/index/forYouRecommend/pms_1526382939.61014552!140x140 (1).jpg", "小米路由4C<", 69, 8600),
(null, "image/index/forYouRecommend/pms_1524207523.33239844!140x140.jpg", "米家五位五控插线板", 59, 56510),
(null, "image/index/forYouRecommend/pms_1556440620.5317961!140x140.jpg", "小米MIX 黑鲨保护壳", 49, 1680),
(null, "image/index/forYouRecommend/pms_1546936483.22246730!140x140.jpg", "小米数据线", 29, 9410),
(null, "image/index/forYouRecommend/pms_1487579524.92087599!140x140.jpg", "米家空气净化器滤芯", 159, 5000),
(null, "image/index/forYouRecommend/pms_1487579524.92087599!140x140.jpg", "米家空气净化器滤芯", 159, 5000),
(null, "image/index/forYouRecommend/pms_1527475006.84551272!140x140.jpg", "小米头戴式耳机", 259, 5920),
(null, "image/index/forYouRecommend/pms_1526382939.61014552!140x140 (1).jpg", "小米路由4C<", 69, 8600),
(null, "image/index/forYouRecommend/pms_1487579524.92087599!140x140.jpg", "米家空气净化器滤芯", 159, 5000),
(null, "image/index/forYouRecommend/pms_1487579524.92087599!140x140.jpg", "米家空气净化器滤芯", 159, 5000),
(null, "image/index/forYouRecommend/pms_1527475006.84551272!140x140.jpg", "小米头戴式耳机", 259, 5920),
(null, "image/index/forYouRecommend/pms_1526382939.61014552!140x140 (1).jpg", "小米路由4C<", 69, 8600),
(null, "image/index/forYouRecommend/pms_1524207523.33239844!140x140.jpg", "米家五位五控插线板", 59, 56510),
(null, "image/index/forYouRecommend/pms_1524207523.33239844!140x140.jpg", "米家五位五控插线板", 59, 56510),
(null, "image/index/forYouRecommend/pms_1556440620.5317961!140x140.jpg", "小米MIX 黑鲨保护壳", 49, 1680),
(null, "image/index/forYouRecommend/pms_1546936483.22246730!140x140.jpg", "小米数据线", 29, 9410),
(null, "image/index/forYouRecommend/pms_1487579524.92087599!140x140.jpg", "米家空气净化器滤芯", 159, 5000),
(null, "image/index/forYouRecommend/pms_1487579524.92087599!140x140.jpg", "米家空气净化器滤芯", 159, 5000),
(null, "image/index/forYouRecommend/pms_1527475006.84551272!140x140.jpg", "小米头戴式耳机", 259, 5920),
(null, "image/index/forYouRecommend/pms_1526382939.61014552!140x140 (1).jpg", "小米路由4C<", 69, 8600),
(null, "image/index/forYouRecommend/pms_1487579524.92087599!140x140.jpg", "米家空气净化器滤芯", 159, 5000),
(null, "image/index/forYouRecommend/pms_1487579524.92087599!140x140.jpg", "米家空气净化器滤芯", 159, 5000);

/********************************************热评产品*********************************************/
/********************************************热评产品*********************************************/
CREATE TABLE xm_index_buzz(
  bid INT PRIMARY KEY AUTO_INCREMENT,            #编号
  image VARCHAR(128),                            #图片地址
  appraisal VARCHAR(128),                        #用户评价
  userSource VARCHAR(128),                       #用户来源名
  product VARCHAR(128),                          #商品介绍
  price DECIMAL(10, 2)                           #价格
);
INSERT INTO xm_index_buzz VALUES
(null, "image/index/forYouRecommend/xmad_15603251497926_xYEgd.jpg", "快递牛，整体不错蓝牙可以说秒连。红米给力", "117384232", "Redmi AirDots真无线蓝号号号爱护哦啊好东方", 99.9),
(null, "image/index/forYouRecommend/xmad_1560324008766_HNafb.jpg", "离我的小米智能之家又近了一步，安装师傅专业细致，原门锁挡片不是很贴合，师傅免费帮忙换了一片。", "柒期七 ", "小米米家智能门锁 碳素黑sdf asdfa sfsdfwe", 1199),
(null, "image/index/forYouRecommend/xmad_15603259571867_NGpLV.jpg", "一到家就忙着安装，太好了，小巧玲珑的，外观精美，洗的照片太好看了", " lhz", "小米米家照片打印机 sdfa dswae sd", 479),
(null, "image/index/forYouRecommend/xmad_15603256677764_hqIlu.jpg", "比想象中还有质感，体验了一下，非常非常满意，支持小米，越来越棒了！！！", "我的六个木", "米家走步机 sdfwa dswae sdsdf ", 1799.9);

/****************************************内容***********************************************/
/****************************************内容***********************************************/
CREATE TABLE xm_index_content(
  cid INT PRIMARY KEY AUTO_INCREMENT,           #编号
  theme VARCHAR(128),                           #主题
  title VARCHAR(128),                           #标题
  intro VARCHAR(128),                           #简介
  price DECIMAL(8, 2),                          #价格
  picture VARCHAR(128)                          #图片路径
);
INSERT INTO xm_index_content VALUES
(null, "图书", "哈利·波特与被诅咒的孩子", "“哈利·波特”第八个故事中文版震撼来袭！<br>&nbsp;", 29.37, "image/index/forYouRecommend/5e5da924-84e3-4959-9e25-5891cdf30757.png"),
(null, "图书", "好吗好的", "畅销作家大冰2016年新书！<br>讲给你听，好吗好的！", 17.37, "image/index/forYouRecommend/61e1385e-54de-48f3-8717-5e4f4b1cdd14.png"),
(null, "MIUI主题", "BROWN & FRIENDS定制", "BROWN & FRIENDS 小米定制主题<br>&nbsp;", null, "image/index/forYouRecommend/xmad_1554795253_HKsNc.png"),
(null, "MIUI主题", "电影版《夏目友人帐》主题", "快下载《夏目友人帐》<br>主题拥有最温柔的少年和最可爱的猫咪老师！", null, "image/index/forYouRecommend/xmad_1551940859025_MrKLP.png"),
(null, "MIUI主题", "《阿丽塔》定制主题", "卡梅隆最新力作，战斗天使机械酷炫来袭！", null, "image/index/forYouRecommend/xmad_1550653044827_BAshe.png"),
(null, "游戏", "非人学园", "脑洞大开的二次元竞技手游<br>&nbsp;", null, "image/index/forYouRecommend/xmad_15299832299419_eIPOw.png"),
(null, "游戏", "小米超神", "实力派，一起团！！<br>&nbsp;", null, "image/index/forYouRecommend/xmad_15120234492499_MNEVo.png"),
(null, "游戏", "米柚手游模拟器", "在电脑上玩遍小米所有手游<br>&nbsp;", null, "image/index/forYouRecommend/T1czW_BXCv1R4cSCrK.png"),
(null, "应用", "2018金米奖", "最优秀的应用和游戏<br>&nbsp;", null, "image/index/forYouRecommend/3332da7d-4056-4694-9548-c83b7b3af7d3.png"),
(null, "应用", "Forest", "帮助您专心于生活中每个重要时刻", null, "image/index/forYouRecommend/T1TkKvBCKv1R4cSCrK.png"),
(null, "应用", "小米应用", "小米出品 必属精品<br>&nbsp;", null, "image/index/forYouRecommend/T15VZvB5Kv1R4cSCrK.png");

/************************************视频***************************************************/
/************************************视频***************************************************/
CREATE TABLE xm_index_video(
  vid INT PRIMARY KEY AUTO_INCREMENT,               #编号
  videoSite VARCHAR(128),                              #视频海报
  video VARCHAR(128),                               #视频地址  
  title VARCHAR(128),                               #标题
  intro VARCHAR(128)                                #简介
);
INSERT INTO xm_index_video VALUES
(null, "image/index/video/xmad_15519428237288_Exonu.jpg", "image/index/video/12e0189c132e21e064c8161d09816de5.mp4", "王源 & 小米9 全新广告大片", "好看又能打！我反正被帅到了，Will You？"),
(null, "image/index/video/xmad_15519291062065_hikIJ.jpg", "image/index/video/895d80d9283cb54da04fdc8c5d46f27a.mp4", "雷军对话王源", "聊了3小时，这9个秘密决定公开"),
(null, "image/index/video/xmad_15519293321746_ChIsr.jpg", "image/index/video/12e0189c132e21e064c8161d09816de5.mp4", "小米MIX 3 磁动力滑盖全面屏", "全新滑盖交互体验，不一样的新感觉"),
(null, "image/index/video/xmad_15519292842527_ujNMV.jpg", "image/index/video/895d80d9283cb54da04fdc8c5d46f27a.mp4", "小米MIX 3 故宫特别版", "传承中华国宝艺术之美");
/******************************首页顶部导航栏下6个商品*******************************************/
/******************************首页顶部导航栏下6个商品*******************************************/
CREATE TABLE xm_index_nav_product(
  nid INT PRIMARY KEY AUTO_INCREMENT,
  intro VARCHAR(128),
  pic VARCHAR(128),
  title VARCHAR(128),
  price DECIMAL(10, 2),
  whenfamily INT 
);
INSERT INTO xm_index_nav_product VALUES
/*小米手机*/
(null,"新品", "image/index/head_nav_product/leftnav3.png", "小米CC9", 1799, 10),
(null,"新品", "image/index/head_nav_product/_320.png", "小米CC9美图定制版", 2599, 10),
(null,"新品", "image/index/head_nav_product/320.png", "小米CC9e", 1299, 10),
(null, null, "image/index/head_nav_product/CC9E-320.png", "小米9", 2999, 10),
(null, null, "image/index/head_nav_product/qingchun-320.png", "小米8 青春版", 1099, 10),
(null, null, "image/index/head_nav_product/mi9-320.png", "小米MIX 3", 3299, 10),
/*红米手机*/
(null,"新品", "image/index/head_nav_product/red.jpg", "Redmi K20 Pro", 2499, 20),
(null,"新品", "image/index/head_nav_product/lanse.jpg", "Redmi K20", 1999, 20),
(null,"新品", "image/index/head_nav_product/black.jpg", "Redmi 7A", 549, 20),
(null, null, "image/index/head_nav_product/redmi.jpg", "Redmi Note 7 Pro", 1499, 20),
(null, null, "image/index/head_nav_product/note7320-220.png", "Redmi Note 7", 999, 20),
(null, null, "image/index/head_nav_product/320-220.png", "Redmi 7", 699, 20),
/**/
(null,"新品", "image/index/head_nav_product/leftnav3.png", "小米CC9", 1799, 30),
(null,"新品", "image/index/head_nav_product/_320.png", "小米CC9美图定制版", 2599, 30),
(null,"新品", "image/index/head_nav_product/320.png", "小米CC9e", 1299, 30),
(null, null, "image/index/head_nav_product/CC9E-320.png", "小米9", 2999, 30),
(null, null, "image/index/head_nav_product/qingchun-320.png", "小米8 青春版", 1099, 30),
(null, null, "image/index/head_nav_product/mi9-320.png", "小米MIX 3", 3299, 30),
/*红米手机*/
(null,"新品", "image/index/head_nav_product/red.jpg", "Redmi K20 Pro", 2499, 40),
(null,"新品", "image/index/head_nav_product/lanse.jpg", "Redmi K20", 1999, 40),
(null,"新品", "image/index/head_nav_product/black.jpg", "Redmi 7A", 549, 40),
(null, null, "image/index/head_nav_product/redmi.jpg", "Redmi Note 7 Pro", 1499, 40),
(null, null, "image/index/head_nav_product/note7320-220.png", "Redmi Note 7", 999, 40),
(null, null, "image/index/head_nav_product/320-220.png", "Redmi 7", 699, 40),
/**/
(null,"新品", "image/index/head_nav_product/leftnav3.png", "小米CC9", 1799, 50),
(null,"新品", "image/index/head_nav_product/_320.png", "小米CC9美图定制版", 2599, 50),
(null,"新品", "image/index/head_nav_product/320.png", "小米CC9e", 1299, 50),
(null, null, "image/index/head_nav_product/CC9E-320.png", "小米9", 2999, 50),
(null, null, "image/index/head_nav_product/qingchun-320.png", "小米8 青春版", 1099, 50),
(null, null, "image/index/head_nav_product/mi9-320.png", "小米MIX 3", 3299, 50),
/*红米手机*/
(null,"新品", "image/index/head_nav_product/red.jpg", "Redmi K20 Pro", 2499, 60),
(null,"新品", "image/index/head_nav_product/lanse.jpg", "Redmi K20", 1999, 60),
(null,"新品", "image/index/head_nav_product/black.jpg", "Redmi 7A", 549, 60),
(null, null, "image/index/head_nav_product/redmi.jpg", "Redmi Note 7 Pro", 1499, 60),
(null, null, "image/index/head_nav_product/note7320-220.png", "Redmi Note 7", 999, 60),
(null, null, "image/index/head_nav_product/320-220.png", "Redmi 7", 699, 60),

(null,"新品", "image/index/head_nav_product/leftnav3.png", "小米CC9", 1799, 70),
(null,"新品", "image/index/head_nav_product/_320.png", "小米CC9美图定制版", 2599, 70),
(null,"新品", "image/index/head_nav_product/320.png", "小米CC9e", 1299, 70),
(null, null, "image/index/head_nav_product/CC9E-320.png", "小米9", 2999, 70),
(null, null, "image/index/head_nav_product/qingchun-320.png", "小米8 青春版", 1099, 70),
(null, null, "image/index/head_nav_product/mi9-320.png", "小米MIX 3", 3299, 70),
/*红米手机*/
(null,"新品", "image/index/head_nav_product/red.jpg", "Redmi K20 Pro", 2499, 80),
(null,"新品", "image/index/head_nav_product/lanse.jpg", "Redmi K20", 1999, 80),
(null,"新品", "image/index/head_nav_product/black.jpg", "Redmi 7A", 549, 80),
(null, null, "image/index/head_nav_product/redmi.jpg", "Redmi Note 7 Pro", 1499, 80),
(null, null, "image/index/head_nav_product/note7320-220.png", "Redmi Note 7", 999, 80),
(null, null, "image/index/head_nav_product/320-220.png", "Redmi 7", 699, 80),
/*红米手机*/
(null,"新品", "image/index/head_nav_product/red.jpg", "Redmi K20 Pro", 2499, 90),
(null,"新品", "image/index/head_nav_product/lanse.jpg", "Redmi K20", 1999, 90),
(null,"新品", "image/index/head_nav_product/black.jpg", "Redmi 7A", 549, 90),
(null, null, "image/index/head_nav_product/redmi.jpg", "Redmi Note 7 Pro", 1499, 90),
(null, null, "image/index/head_nav_product/note7320-220.png", "Redmi Note 7", 999, 90),
(null, null, "image/index/head_nav_product/320-220.png", "Redmi 7", 699, 90);

/*************************************轮播图左边导航中的商品****************************************/
/*************************************轮播图左边导航中的商品****************************************/
CREATE TABLE xm_index_left_nav(
  nid INT PRIMARY KEY AUTO_INCREMENT,
  pic VARCHAR(128),
  title VARCHAR(128),
  ofnumber SMALLINT
);
INSERT INTO xm_index_left_nav VALUES
/*手机  电话卡*/
(null, "image/index/left_nav_product/_80.png", "小米CC9", 10),
(null, "image/index/left_nav_product/_80.png", "小米CC9美图版", 10),
(null, "image/index/left_nav_product/80-80-new.png", "小米CC9e", 10),
(null, "image/index/left_nav_product/mi9-80.png", "小米9", 10),
(null, "image/index/left_nav_product/_80.png", "小米CC9", 10),
(null, "image/index/left_nav_product/_80.png", "小米CC9美图版", 10),
(null, "image/index/left_nav_product/80-80-new.png", "小米CC9e", 10),
(null, "image/index/left_nav_product/mi9-80.png", "小米9", 10),
(null, "image/index/left_nav_product/_80.png", "小米CC9", 10),
(null, "image/index/left_nav_product/_80.png", "小米CC9美图版", 10),
(null, "image/index/left_nav_product/80-80-new.png", "小米CC9e", 10),
(null, "image/index/left_nav_product/mi9-80.png", "小米9", 10),
(null, "image/index/left_nav_product/_80.png", "小米CC9", 10),
(null, "image/index/left_nav_product/_80.png", "小米CC9美图版", 10),
(null, "image/index/left_nav_product/80-80-new.png", "小米CC9e", 10),
(null, "image/index/left_nav_product/mi9-80.png", "小米9", 10),
(null, "image/index/left_nav_product/_80.png", "小米CC9", 10),
(null, "image/index/left_nav_product/_80.png", "小米CC9美图版", 10),
(null, "image/index/left_nav_product/80-80-new.png", "小米CC9e", 10),
(null, "image/index/left_nav_product/mi9-80.png", "小米9", 10),
/*电视  盒子*/
(null, "image/index/left_nav_product/mijiajiguang4k.jpg", "米家激光投影电视", 20),
(null, "image/index/left_nav_product/bihua.jpg", "小米壁画电视 65英寸", 20),
(null, "image/index/left_nav_product/TV4A-32.png", "小米电视4A 32英寸", 20),
(null, "image/index/left_nav_product/mijiajiguang4k.jpg", "米家激光投影电视", 20),
(null, "image/index/left_nav_product/bihua.jpg", "小米壁画电视 65英寸", 20),
(null, "image/index/left_nav_product/TV4A-32.png", "小米电视4A 32英寸", 20),
(null, "image/index/left_nav_product/mijiajiguang4k.jpg", "米家激光投影电视", 20),
(null, "image/index/left_nav_product/bihua.jpg", "小米壁画电视 65英寸", 20),
(null, "image/index/left_nav_product/TV4A-32.png", "小米电视4A 32英寸", 20),
(null, "image/index/left_nav_product/mijiajiguang4k.jpg", "米家激光投影电视", 20),
(null, "image/index/left_nav_product/bihua.jpg", "小米壁画电视 65英寸", 20),
(null, "image/index/left_nav_product/TV4A-32.png", "小米电视4A 32英寸", 20),
/*笔记本  平板*/
(null, "image/index/left_nav_product/bijiben80.jpg", "小米笔记本15.6’", 30),
(null, "image/index/left_nav_product/bijiben80.jpg", "小米笔记本15.6’", 30),
(null, "image/index/left_nav_product/bijiben80.jpg", "小米笔记本15.6’", 30),
(null, "image/index/left_nav_product/bijiben80.jpg", "小米笔记本15.6’", 30),
(null, "image/index/left_nav_product/bijiben80.jpg", "小米笔记本15.6’", 30),
(null, "image/index/left_nav_product/bijiben80.jpg", "小米笔记本15.6’", 30),
(null, "image/index/left_nav_product/bijiben80.jpg", "小米笔记本15.6’", 30),
(null, "image/index/left_nav_product/bijiben80.jpg", "小米笔记本15.6’", 30),
(null, "image/index/left_nav_product/bijiben80.jpg", "小米笔记本15.6’", 30),
(null, "image/index/left_nav_product/bijiben80.jpg", "小米笔记本15.6’", 30),
/*家电  插线板*/
(null, "image/index/left_nav_product/_80.png", "小米CC9", 40),
(null, "image/index/left_nav_product/_80.png", "小米CC9美图版", 40),
(null, "image/index/left_nav_product/80-80-new.png", "小米CC9e", 40),
(null, "image/index/left_nav_product/mi9-80.png", "小米9", 40),
(null, "image/index/left_nav_product/_80.png", "小米CC9", 40),
(null, "image/index/left_nav_product/_80.png", "小米CC9美图版", 40),
(null, "image/index/left_nav_product/80-80-new.png", "小米CC9e", 40),
(null, "image/index/left_nav_product/mi9-80.png", "小米9",40),
(null, "image/index/left_nav_product/_80.png", "小米CC9", 40),
(null, "image/index/left_nav_product/_80.png", "小米CC9美图版", 40),
(null, "image/index/left_nav_product/80-80-new.png", "小米CC9e", 40),
(null, "image/index/left_nav_product/mi9-80.png", "小米9", 40),
(null, "image/index/left_nav_product/_80.png", "小米CC9", 40),
(null, "image/index/left_nav_product/_80.png", "小米CC9美图版", 40),
(null, "image/index/left_nav_product/80-80-new.png", "小米CC9e", 40),
(null, "image/index/left_nav_product/mi9-80.png", "小米9", 40),
(null, "image/index/left_nav_product/_80.png", "小米CC9", 40),
(null, "image/index/left_nav_product/_80.png", "小米CC9美图版", 40),
(null, "image/index/left_nav_product/80-80-new.png", "小米CC9e", 40),
(null, "image/index/left_nav_product/mi9-80.png", "小米9", 40),
/*出行  穿戴*/
(null, "image/index/left_nav_product/mijiajiguang4k.jpg", "米家激光投影电视", 50),
(null, "image/index/left_nav_product/bihua.jpg", "小米壁画电视 65英寸", 50),
(null, "image/index/left_nav_product/TV4A-32.png", "小米电视4A 32英寸", 50),
(null, "image/index/left_nav_product/mijiajiguang4k.jpg", "米家激光投影电视", 50),
(null, "image/index/left_nav_product/bihua.jpg", "小米壁画电视 65英寸", 50),
(null, "image/index/left_nav_product/TV4A-32.png", "小米电视4A 32英寸", 50),
(null, "image/index/left_nav_product/mijiajiguang4k.jpg", "米家激光投影电视", 50),
(null, "image/index/left_nav_product/bihua.jpg", "小米壁画电视 65英寸", 50),
(null, "image/index/left_nav_product/TV4A-32.png", "小米电视4A 32英寸", 50),
(null, "image/index/left_nav_product/mijiajiguang4k.jpg", "米家激光投影电视", 50),
(null, "image/index/left_nav_product/bihua.jpg", "小米壁画电视 65英寸", 50),
(null, "image/index/left_nav_product/TV4A-32.png", "小米电视4A 32英寸", 50),
/*智能  路由器*/
(null, "image/index/left_nav_product/bijiben80.jpg", "小米笔记本15.6’", 60),
(null, "image/index/left_nav_product/bijiben80.jpg", "小米笔记本15.6’", 60),
(null, "image/index/left_nav_product/bijiben80.jpg", "小米笔记本15.6’", 60),
(null, "image/index/left_nav_product/bijiben80.jpg", "小米笔记本15.6’", 60),
(null, "image/index/left_nav_product/bijiben80.jpg", "小米笔记本15.6’", 60),
(null, "image/index/left_nav_product/bijiben80.jpg", "小米笔记本15.6’", 60),
(null, "image/index/left_nav_product/bijiben80.jpg", "小米笔记本15.6’", 60),
(null, "image/index/left_nav_product/bijiben80.jpg", "小米笔记本15.6’", 60),
(null, "image/index/left_nav_product/bijiben80.jpg", "小米笔记本15.6’",60),
(null, "image/index/left_nav_product/bijiben80.jpg", "小米笔记本15.6’",60),
(null, "image/index/left_nav_product/_80.png", "小米CC9", 70),
(null, "image/index/left_nav_product/_80.png", "小米CC9美图版", 70),
(null, "image/index/left_nav_product/80-80-new.png", "小米CC9e", 70),
(null, "image/index/left_nav_product/mi9-80.png", "小米9", 70),
(null, "image/index/left_nav_product/_80.png", "小米CC9", 70),
(null, "image/index/left_nav_product/_80.png", "小米CC9美图版", 70),
(null, "image/index/left_nav_product/80-80-new.png", "小米CC9e", 70),
(null, "image/index/left_nav_product/mi9-80.png", "小米9", 70),
(null, "image/index/left_nav_product/_80.png", "小米CC9", 70),
(null, "image/index/left_nav_product/_80.png", "小米CC9美图版", 70),
(null, "image/index/left_nav_product/80-80-new.png", "小米CC9e", 70),
(null, "image/index/left_nav_product/mi9-80.png", "小米9", 70),
(null, "image/index/left_nav_product/_80.png", "小米CC9", 70),
(null, "image/index/left_nav_product/_80.png", "小米CC9美图版", 70),
(null, "image/index/left_nav_product/80-80-new.png", "小米CC9e", 70),
(null, "image/index/left_nav_product/mi9-80.png", "小米9", 80),
(null, "image/index/left_nav_product/_80.png", "小米CC9", 80),
(null, "image/index/left_nav_product/_80.png", "小米CC9美图版", 80),
(null, "image/index/left_nav_product/80-80-new.png", "小米CC9e", 80),
(null, "image/index/left_nav_product/mi9-80.png", "小米9", 80),
/*电源  配件*/
(null, "image/index/left_nav_product/mijiajiguang4k.jpg", "米家激光投影电视", 80),
(null, "image/index/left_nav_product/bihua.jpg", "小米壁画电视 65英寸", 90),
(null, "image/index/left_nav_product/TV4A-32.png", "小米电视4A 32英寸", 90),
(null, "image/index/left_nav_product/mijiajiguang4k.jpg", "米家激光投影电视", 90),
(null, "image/index/left_nav_product/bihua.jpg", "小米壁画电视 65英寸", 90),
(null, "image/index/left_nav_product/TV4A-32.png", "小米电视4A 32英寸", 90),
(null, "image/index/left_nav_product/mijiajiguang4k.jpg", "米家激光投影电视", 90),
(null, "image/index/left_nav_product/bihua.jpg", "小米壁画电视 65英寸", 90),
(null, "image/index/left_nav_product/TV4A-32.png", "小米电视4A 32英寸", 90),
(null, "image/index/left_nav_product/mijiajiguang4k.jpg", "米家激光投影电视", 90),
(null, "image/index/left_nav_product/bihua.jpg", "小米壁画电视 65英寸", 90),
(null, "image/index/left_nav_product/TV4A-32.png", "小米电视4A 32英寸", 90),
/*健康  儿童*/
(null, "image/index/left_nav_product/bijiben80.jpg", "小米笔记本15.6’", 90),
(null, "image/index/left_nav_product/bijiben80.jpg", "小米笔记本15.6’", 90),
(null, "image/index/left_nav_product/bijiben80.jpg", "小米笔记本15.6’", 100),
(null, "image/index/left_nav_product/bijiben80.jpg", "小米笔记本15.6’", 100),
(null, "image/index/left_nav_product/bijiben80.jpg", "小米笔记本15.6’", 100),
(null, "image/index/left_nav_product/bijiben80.jpg", "小米笔记本15.6’", 100),
(null, "image/index/left_nav_product/bijiben80.jpg", "小米笔记本15.6’", 100),
(null, "image/index/left_nav_product/bijiben80.jpg", "小米笔记本15.6’", 100),
(null, "image/index/left_nav_product/bijiben80.jpg", "小米笔记本15.6’", 100),
(null, "image/index/left_nav_product/bijiben80.jpg", "小米笔记本15.6’", 100),
(null, "image/index/left_nav_product/bijiben80.jpg", "小米笔记本15.6’", 100),
/*生活  箱包*/
(null, "image/index/left_nav_product/bijiben80.jpg", "小米笔记本15.6’", 100),
(null, "image/index/left_nav_product/bijiben80.jpg", "小米笔记本15.6’", 100),
(null, "image/index/left_nav_product/bijiben80.jpg", "小米笔记本15.6’", 100),
(null, "image/index/left_nav_product/bijiben80.jpg", "小米笔记本15.6’", 100),
(null, "image/index/left_nav_product/bijiben80.jpg", "小米笔记本15.6’", 70),
(null, "image/index/left_nav_product/bijiben80.jpg", "小米笔记本15.6’", 70),
(null, "image/index/left_nav_product/bijiben80.jpg", "小米笔记本15.6’", 70),
(null, "image/index/left_nav_product/bijiben80.jpg", "小米笔记本15.6’", 80),
(null, "image/index/left_nav_product/bijiben80.jpg", "小米笔记本15.6’", 80);