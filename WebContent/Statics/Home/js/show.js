
//wx
$(document).ready(function(){
  $(".t_wx").hover(function(){
    $(".u_t_wx").show();
  },function(){
    $(".u_t_wx").hide();
  });
});

//QQ
$(document).ready(function(){
	$(".rt_kfico").hover(
		function () {
			$("#kf_qqlink").show(100);
		},
		function () {
			$("#kf_qqlink").hide(100);
		}
	);
	$(".fewm").hover(
		function () {
			$(".fewm_k").show(100);
		},
		function () {
			$(".fewm_k").hide(100);
		}
	);
  $(".code").hover(function(){
    $(".code_k").show(100);
  },function(){
    $(".code_k").hide(100);
  });
});
