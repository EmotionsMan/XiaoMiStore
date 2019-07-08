// 包含页头相关的所有代码

$(function(){
  $.ajax({
    url: "header.html",
    type: "get",
    success: function(html){
      $(html).replaceAll("#header");
      $(`<link rel="stylesheet" href="css/header.css"/>`).appendTo("head");;
      var $headNav = $("header div.head-nav");
      var $button = $("#myButton");
      var $download = $("a.nav-download");
      var $QR = $("div.head-download");
      var $cartBtn = $("li.nav-item div.shopp-bg");
      var $cartContent = $("div.head-cart");
      var $navHost = $("ul.head-nav-host");
      var $headProduct = $("div.head-product-show");
      // 设置二维码的X轴
      $QR.css("left", $download.offset().left - 87);
      // 视图尺寸变化事件
      $(window).resize(() => {
        if($("html").width() + 17 >= 992){
          $headNav.css({
            'height': 0,
            'z-index': -1,
            'opacity': 0
          });
        }
        $QR.css("left", $download.offset().left - 27);
      });
      // document点击事件冒泡
      $(document).click(() => {
        $headNav.css({
          'height': 0,
          'z-index': -1,
          'opacity': 0
        });
      })
      // 点击事件--阻止冒泡
      $button.click((e) => {
        if($headNav.attr("z-index") == -1){
          $headNav.css({
            'height': 80,
            'z-index': 9,
            'opacity':  1
          });
        }else{
          $headNav.css({
            'height': 0,
            'z-index': -1,
            'opacity': 0
          });
        }
        e.stopPropagation();
      })
      // 二维码事件触发
      $download.hover(
        () => {
          $QR.css({
            "opacity": 1,
            "z-index": 9,
            "height": 140
          });
        },
        () => {
          $QR.hover(
            () => {
              $QR.css({
               "opacity": 1,
               "z-index": 9,
               "height": 140
              });
            },
            () => {
              $QR.css({
                "opacity": 0,
                "z-index": -1,
                "height": 0
              });
            }
          );
          $QR.css({
            "opacity": 0,
            "z-index": -1,
            "height": 0
          });
        }
      );
      // 购物车折叠
      $cartBtn.hover(
        () => {
          $cartContent.css({
            "opacity": 1,
            "z-index": 9,
            "height": 110
          });
        },
        () => {
          $cartContent.hover(
            () => {
              $cartContent.css({
                "opacity": 1,
                "z-index": 9,
                "height": 110
              });
            },
            () => {
              $cartContent.css({
                "opacity": 0,
                "z-index": -1,
                "height": 0
              });
            }
          );
          $cartContent.css({
            "opacity": 0,
            "z-index": -1,
            "height": 0
          });
        }
      );
      // 首页顶部导航栏商品路由
      $.ajax({
        url: '/index/nav_product',
        type: 'get',
        dataType: 'json',
        success(result){
          var html = "";
          var data = 0;
          $navHost.on("mouseenter", "a.nav-link", function(event){
            html = "";
                $headProduct.empty();
            data = $(this).attr("data-store");
            myData = data;
            $headProduct.css({
              'height': 182,
              'opacity': 1,
              'z-index': 9
            });
            for(var item of result){
              if(item.whenfamily == data){
                html += `
                <div class="sm-fontSize text-center head-product-single py-3 pr-3 pl-0 ">
                  <img src="${item.pic}" class="head-product-pic px-5 border-right">
                  <p class="text-dark m-0 mt-3 pl-1">${item.title}</p>
                  <p class="xms m-0 pl-1">${item.price}元</p>
                </div>
                `;
              }
            }
            $headProduct.append($(html));
            $headProduct.children().last().children().first().removeClass("border-right");
          });
          $navHost.on("mouseleave", "a.nav-link", function(event){
            // 鼠标移入移出商品位置
            $headProduct.css({
              'z-index': -1,
              'height': 0,
              'opacity': 0
            });
            $headProduct.hover(
              () => {
                $headProduct.css({
                  'height': 182,
                  'opacity': 1,
                  'z-index': 9
                });
              },
              () => {
                $headProduct.css({
                  'z-index': -1,
                  'height': 0,
                  'opacity': 0
                });
                html = "";
                $headProduct.empty();
              }
            );
          });
        }
      });
    } 
  })
})