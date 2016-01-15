
//选项卡
$(document).ready(function() {
	jQuery.jqtab = function(tabtit,tab_conbox,shijian) {
		$(tab_conbox).children("li").hide();
		$(tabtit).children("li:first").addClass("thistab").show(); 
		$(tab_conbox).children("li:first").show();
	
		$(tabtit).children("li").bind(shijian,function(){
		  $(this).addClass("thistab").siblings("li").removeClass("thistab"); 
			var activeindex = $(tabtit).children("li").index(this);
			$(tab_conbox).children().eq(activeindex).show().siblings().hide();
			return false;
		});
	
	};
	/*调用方法如下：*/
	$.jqtab("#b_xxk","#b_jkk","click");
	
});

