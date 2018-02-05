$(document).ready(function(){
  $("#push-mobile-menu").click(function(){
    $("#mobile-menu").animate({width: '0px'});
    $("#push-mobile-menu").css("display", "none");
    $("#pull-mobile-menu").css("display", "initial");
    $("#items-menu").fadeOut("slow");
  });

  $("#pull-mobile-menu").click(function(){
    $("#mobile-menu").animate({width: '250px'});
    $("#pull-mobile-menu").css("display", "none");
    $("#push-mobile-menu").css("display", "initial");
    $("#items-menu").fadeIn("slow");
  });
});
