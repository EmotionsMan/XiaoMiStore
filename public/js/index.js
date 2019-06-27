$(function(){
  // 首页轮播图路由
  $.ajax({
    url: '/index/banner',
    type: 'get',
    dataType: 'json',
    success: function(result) {
      var $parentDiv = $("div.carousel-inner");
      var html = "";
      var childDiv = "";
      for(let item of result){
        childDiv = `
        <div class="carousel-item">
          <a>
            <img src=${item.banner} class="banner">
          </a>
        </div>`;
        html += childDiv;
      }
      $(html).appendTo($parentDiv);
      $parentDiv.children().first().addClass("active");
    }
  });
  // 轮播图下三个中图片路由
  $.ajax({
    url: '/index/md_show',
    type: 'get',
    dataType: 'json',
    success: function(result){
      var $xmads = $("img.xmad");
      $xmads.each(function(index, elem){
        $(this).prop("src", result[index].mdMap)
      });
    }
  });
  // 展示图路由
  $.ajax({
    url: '/index/lg_show',
    type: 'get',
    dataType: 'json',
    success: function(result){
      var $lgShows = $("div.row div.col-12 a img.w-100");
      $lgShows.each(function(index, elem){
        $(this).prop("src", result[index].lgMap);
      });
    }
  });
   // 首页手机商品推荐路由
  $.ajax({
    url: '/index/product_phone',
    type: 'get',
    dataType: 'json',
    success(result){
      // 标签
      var $phoneLabel = $("div.phone div.col-3 div.card span");
      // 图片
      var $phonePicture = $("div.phone img.dataSign");
      // 标题
      var $phoneTitle = $("div.phone div.col-3 div.card a.product-title");
      // 简介
      var $phoneIntro = $("div.phone div.col-3 div.card p.intro");
      // 价格 
      var $phonePrice = $("div.phone div.col-3 div.card p.product-price");
      // 标签路由
      $phoneLabel.each(function(index){
        if(result[index + 1].label !== null){
          $(this).text(result[index + 1].label);
          if(result[index + 1].label.indexOf("减") !== -1){
            $(this).addClass("bg-danger");
          }else{
            $(this).addClass("bg-green");
          }
        }else{
          $(this).html("&nbsp;");
        }
      });
       // 图片路由
      $phonePicture.each(function(index){
        $(this).prop("src", result[index].picture);
      });
       // 标题路由
      $phoneTitle.each(function(index){
        $(this).text(result[index + 1].title);
      });
      // 简介路由
      $phoneIntro.each(function(index){
        if(result[index + 1].intro !== null){
          $(this).text(result[index + 1].intro);
        }else{
          $(this).html("&nbsp;");
        }
      });
      // 价格路由
      $phonePrice.each(function(index){
        $(this).text("¥" + result[index + 1].price);
      });
    }
  });
   // 首页家电商品推荐路由
  $.ajax({
    url: '/index/product_homeApp',
    type: 'get',
    dataType: 'json',
    success(result){
      // 标签
      var $homeAppLabel = $("div.homeApp div.col-3 div.card span");
      // 图片
      var $homeAppPicture = $("div.homeApp img.dataSign");
      // 标题
      var $homeAppTitle = $("div.homeApp div.col-3 div.card a.product-title");
      // 简介
      var $homeAppIntro = $("div.homeApp div.col-3 div.card p.intro");
      // 价格 
      var $homeAppPrice = $("div.homeApp div.col-3 div.card p.product-price");
       // 标签路由
       $homeAppLabel.each(function(index){
        if(result[index + 2].label !== null){
          $(this).text(result[index + 2].label);
          if(result[index + 2].label.indexOf("减") !== -1){
            $(this).addClass("bg-danger");
          }else{
            $(this).addClass("bg-green");
          } 
        }else{
          $(this).html("&nbsp;");
        }
      });
       // 图片路由
      $homeAppPicture.each(function(index){
        $(this).prop("src", result[index].picture);
      });
       // 标题路由
      $homeAppTitle.each(function(index){
        $(this).text(result[index + 2].title);
      });
      // 简介路由
      $homeAppIntro.each(function(index){
        if(result[index + 2].intro !== null){
          $(this).text(result[index + 2].intro);
        }else{
          $(this).html("&nbsp;");
        }
      });
      // 价格路由
      $homeAppPrice.each(function(index){
        $(this).text("¥" + result[index + 2].price);
      });
    }
  });
  // 首页智能商品推荐路由
  $.ajax({
    url: '/index/product_capacity',
    type: 'get',
    dataType: 'json',
    success(result){
      // 标签
      var $capacityLabel = $("div.capacity div.col-3 div.card span");
      // 图片
      var $capacityPicture = $("div.capacity img.dataSign");
      // 标题
      var $capacityTitle = $("div.capacity div.col-3 div.card a.product-title");
      // 简介
      var $capacityIntro = $("div.capacity div.col-3 div.card p.intro");
      // 价格 
      var $capacityPrice = $("div.capacity div.col-3 div.card p.product-price");
       // 标签路由
       $capacityLabel.each(function(index){
        if(result[index + 2].label !== null){
          $(this).text(result[index + 2].label);
          if(result[index + 2].label.indexOf("减") !== -1){
            $(this).addClass("bg-danger");
          }else{
            $(this).addClass("bg-green");
          } 
        }else{
          $(this).html("&nbsp;");
        }
      });
       // 图片路由
      $capacityPicture.each(function(index){
        $(this).prop("src", result[index].picture);
      });
       // 标题路由
      $capacityTitle.each(function(index){
        $(this).text(result[index + 2].title);
      });
      // 简介路由
      $capacityIntro.each(function(index){
        if(result[index + 2].intro !== null){
          $(this).text(result[index + 2].intro);
        }else{
          $(this).html("&nbsp;");
        }
      });
      // 价格路由
      $capacityPrice.each(function(index){
        $(this).text("¥" + result[index + 2].price);
      });
    }
  });
  // 首页为你推荐商品展示路由
  $.ajax({
    url: '/index/recommend',
    type: 'get',
    dataType: 'json',
    success(result){
      var $recommendImg = $("div.recommend div div.card img");
      var $recommendTitle = $("div.recommend div div.card div p a.text-dark");
      var $recommendPrice = $("div.recommend div div.card div p.xms");
      var $recommendGoodReputation = $("div.recommend div div.card div p.mb-3");
      $recommendImg.each(function(index){
        $(this).prop("src", result[index].image);
      });
      $recommendTitle.each(function(index){
        $(this).text(result[index].title);
      });
      $recommendPrice.each(function(index){
        $(this).text("¥" + result[index].price);
      });
      $recommendGoodReputation.each(function(index){
        $(this).text(result[index].good_reputation + "人好评");
      });
    }
  });
  // 首页热评产品商品展示路由
  $.ajax({
    url: '/index/buzz',
    tupe: 'get',
    dataType: 'json',
    success(result){
      var $buzz = $("div.buzz");
      var html = "";
      for(let item of result){
        html += `
        <div class="col-3 pr-0 pl-sm-2 pl-md-3">
          <div class="card border-0 product">
            <a href="#">
              <img src="${item.image}" alt="" class="w-100 ">
            </a>
            <div class="p-lg-4 p-md-3 p-sm-2">
              <p class="buzz-appraisal m-0">${item.appraisal}</p>
              <p class="buzz-userSource sm-fontSize light_gray mb-sm-2 mb-md-3 text-truncate">来自 ${item.userSource} 的评价</p>
              <p class="m-0 buzz-price d-flex ">
                <span class="buzz-product text-truncate">${item.product}</span>
                <span class="light_gray mx-2">|</span>
                <span class="xms align-self-stretch ">¥${item.price}</span>
              </p>
            </div>
          </div>
        </div>`;
      }
      $buzz.append($(html));
    }
  });
  // 首页内容标题商品展示路由
  $.ajax({
    url: '/index/content',
    type: 'get',
    dataType: 'json',
    success(result){
      
      var $content = $("div.content"); //要添加html片段的父元素
      var html = "",  // 用于存放全部html片段
          border = "",  //上边框颜色
          color = "",   //标题字体颜色
          indicator = "";  //指示符
      // var bookIndex = 0,
      //     MIUIIndex = 0,
      //     gamesIndex = 0,
      //     applysIndex = 0;
      var obj = {
        books: [],
        MIUI: [],
        games: [],
        applys: []
      }
      for(let item of result){
        if(item.theme === "图书"){
          obj.books.push(item);
        }else if(item.theme === "MIUI主题"){
          obj.MIUI.push(item);
        }else if(item.theme === "游戏"){
          obj.games.push(item);
        }else{
          obj.applys.push(item);
        }
      }
      Object.keys(obj).forEach(key =>{
        if(obj[key][0].theme == "图书"){
          border = "orange-border";
          color = "orange";
        }else if(obj[key][0].theme == "MIUI主题"){
          border = "cyan-border";
          color = "cyan";
        }else if(obj[key][0].theme == "游戏"){
          border = "red-border"
          color = "red";
        }else{
          border = "blue-border"
          color = "blue";
        }
        for(var i = 0; i < obj[key].length; i++){
          if(i == 0){
            indicator += `<p class="content-active"></p>`;
            continue;
          }
            indicator += `<p class="content-indicator"></p>`;
        }
        html += `
        <div class="col-3 pr-0 pl-sm-2 pl-md-3">
          <div class="card text-center product ${border} p-md-3 p-sm-2 rounded-0 position-relative">
            <div class="content-icon-div-left">
              <img src="image/index/left.png" class="content-icon-left">
            </div>
            <div class="content-icon-div-right">
              <img src="image/index/right.png" class="content-icon-right">
            </div>
            <h6 class="${color}">${obj[key][0].theme}</h6>
            <h5 class="text-truncate ">${obj[key][0].title}</h5>
            <p class="sm-fontSize light_gray text-truncate mb-2 ">${obj[key][0].intro}</p>
            <p class="sm-fontSize mb-2">${obj[key][0].price ? obj[key][0].price + "元" : "&nbsp;"}</p> 
            <img src="${obj[key][0].picture}" class="w-100">
            <div class="d-flex justify-content-center indicator">
              ${indicator}
            </div>
          </div>
        </div>
        `;
        indicator = "";
      })
    $content.append($(html));
    }
  });
  // 首页视频展示路由
  $.ajax({
    url: '/index/video',
    type: 'get',
    dataType: 'json',
    success(result){
      var $video = $("div.video");
      var html = "";
      for(let item of result){
        html += `
        <div class="col-3 pr-0 pl-sm-2 pl-md-3 position-relative">
          <p class="video-icon-bg d-flex justify-content-center align-items-center">
            <img src="image/index/video/xueyuan-shipinbofang.png" class="video-icon" title="点击播放视频">
          </p>
          <div class="card text-center product rounded-0 border-0">
            <img src="${item.videoSite}" class="w-100">  
            <div class="p-md-3 p-sm-2 text-truncate">
              <a href="#" class="dark_gray xms-h md-fontSize ">${item.title}</a>
              <p class="light_gray sm-fontSize text-truncate">${item.intro}</p>
            </div>
          </div>
        </div>
        `;
      }
      $video.append($(html));
    }
  });
}) 