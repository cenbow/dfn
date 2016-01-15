
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

//相册
var timer = null;
var offset = 5000;
var index = 0;
var last = 2;

//大图交替轮换
function slideImage(i){
    var id = 'image_'+ target[i];
    $('#'+ id)
        .animate({opacity: 1}, 100, function(){
            $(this).find('.word').animate({height: 'show'}, '0');
        }).show()
        .siblings(':visible')
        .find('.word').animate({height: 'hide'},'0',function(){
            $(this).parent().animate({opacity: 0}, 100).hide();
        });
}
//bind thumb a
function hookThumb(){    
    $('#thumbs li a')
        .bind('click', function(){
            if (timer) {
                clearTimeout(timer);
            }                
            var id = this.id;            
            index = getIndex(id.substr(6));
            rechange(index);
            slideImage(index); 
            timer = window.setTimeout(auto, offset);  
            this.blur();            
            return false;
        });
}
//bind next/prev img
function hookBtn(){
    $('#thumbs li img').filter('#play_prev,#play_next')
        .bind('click', function(){
            if (timer){
                clearTimeout(timer);
            }
            var id = this.id;
            if (id == 'play_prev') {
                index--;
                if (index < 0) index = last;
            }else{
                index++;
                if (index > last) index = 0;
            }
            rechange(index);
            slideImage(index);
            timer = window.setTimeout(auto, offset);
        });
}

function bighookBtn(){
    $('#bigpicarea p span').filter('#big_play_prev,#big_play_next')
        .bind('click', function(){
            if (timer){
                clearTimeout(timer);
            }
            var id = this.id;
            if (id == 'big_play_prev') {
                index--;
                if (index < 0) index = last;
            }else{
                index++;
                if (index > last) index = 0;
            }
            rechange(index);
            slideImage(index);
            timer = window.setTimeout(auto, offset);
        });
}

//get index
function getIndex(v){
    for(var i=0; i < target.length; i++){
        if (target[i] == v) return i;
    }
}
function rechange(loop){
    var id = 'thumb_'+ target[loop];
    $('#thumbs li a.current').parent().removeClass('pabag');
    $('#thumbs li a.current').removeClass('current');
    $('#'+ id).addClass('current');
    $('#'+ id).parent().addClass('pabag');
}
function auto(){
    index++;
    if (index > last){
        index = 0;
    }
    rechange(index);
    slideImage(index);
    timer = window.setTimeout(auto,offset);
}
$(function(){    
    //change opacity
    $('div.word').css({opacity: 0.85});
    auto();  
    hookThumb(); 
    hookBtn();
	bighookBtn()
    
});





