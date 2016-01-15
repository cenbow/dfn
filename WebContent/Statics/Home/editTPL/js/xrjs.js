// cody by QQ240065000


function ud(){
  $(".xrbz").toggle(300);
  if($(".rzud").hasClass("rzbg")){$(".rzud").removeClass('rzbg')}
  else{$(".rzud").addClass('rzbg');}
}

function msud3(){
  $(".udbox3").toggle(300);
}
function msud4(){
  $(".udbox4").toggle(300);
}
function msud5(){
  $(".udbox5").toggle(300);
}
function fkud(){
  $(".fkbox").toggle(300);
}

$(function(){
$('.xgzj,.hkly').inputbox();
$('[name="dyw"], [name="wtxy"], [name="dbjg"]').inputbox();
});


$(document).ready( function(){ 
	$(".xr-enable").click(function(){
		var parent = $(this).parents('.switch');
		$('.xr-disable',parent).removeClass('selected');
		$(this).addClass('selected');
		$('.checkbox',parent).attr('checked', true);
	});
	$(".xr-disable").click(function(){
		var parent = $(this).parents('.switch');
		$('.xr-enable',parent).removeClass('selected');
		$(this).addClass('selected');
		$('.checkbox',parent).attr('checked', false);
	});
});

 $(document).on("input propertychange", "textarea", function (e) {
       var target = e.target;
       // 保存初始高度，之后需要重新设置一下初始高度，避免只能增高不能减低。           
        var dh = $(target).attr('defaultHeight') || 0;
        if (!dh) {
            dh = target.clientHeight;
            $(target).attr('defaultHeight', dh);
        }

        target.style.height = dh +'px';
        var clientHeight = target.clientHeight;
        var scrollHeight = target.scrollHeight;
        if (clientHeight !== scrollHeight) { target.style.height = scrollHeight + 10 + "px";
        }
    });