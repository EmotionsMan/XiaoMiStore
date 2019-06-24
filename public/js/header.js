// 包含页头相关的所有代码

$(function(){
  $.ajax({
    url: "header.html",
    type: "get",
    success: function(html){
      $(html).replaceAll("#header");
      $(`<link rel="stylesheet" href="css/header.css"/>`).appendTo("head");
    }
  })
})