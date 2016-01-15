
//登陆
$(document).ready(function(){
  $(".name,.pla1").click(function(){
    $(".name").next().hide();
	$(".name").focus();
  });
  $(".name").blur(function(){
    $(".name").next().show();
  });
  
  $(".pass,.pla2").click(function(){
    $(".pass").next().hide();
	$(".pass").focus();
  });
  $(".pass").blur(function(){
    $(".pass").next().show();
  });

  $(".phone,.pla3").click(function(){
    $(".phone").next().hide();
	$(".phone").focus();
  });
  $(".phone").blur(function(){
    $(".phone").next().show();
  });
  
  $(".yanzh,.pla4").click(function(){
    $(".yanzh").next().hide();
	$(".yanzh").focus();
  });
  $(".yanzh").blur(function(){
    $(".yanzh").next().show();
  });
});

