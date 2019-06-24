$(function(){
  // 首页轮播图路由
  $.ajax({
    url: '/index/banner',
    type: 'get',
    success: function(result) {
      var $parentDiv = $("div.carousel-inner");
      var html = "";
      for(let item of result){
        var childDiv = `
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
    success: function(result){
      var $lgShows = $("div.row div.col-12 a img.w-100");
      $lgShows.each(function(index, elem){
        $(this).prop("src", result[index].lgMap);
      });
    }
  });
  // 
  $.ajax({
    url: '/index/product_phone',
    type: 'get',
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
        console.log(index);
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
  $.ajax({
    url: '/index/product_homeApp',
    type: 'get',
    success(result){
      console.log(result);
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
  $.ajax({
    url: '/index/product_capacity',
    type: 'get',
    success(result){
      console.log(result);
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
}) 