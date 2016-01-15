
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
			$("#kf_qqlink").show();
		},
		function () {
			$("#kf_qqlink").hide();
		}
	);
	$(".rt_codeico").hover(
		function () {
			$("#kf_weibo").show();
		},
		function () {
			$("#kf_weibo").hide();
		}
	);
	
})

