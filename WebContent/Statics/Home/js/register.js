var tipMsg={
	"user_name":"请输入6-20字符的用户名，且只能包含英文字母,数字",
	"pass_word":"请输入大于6个字符的登陆密码",
	"re_pass_word":"再次输入与上面相同的密码",
	"email":"请输入您的常用邮箱，验证时需要使用",
	"user_phone":"请输入您的手机号码",
	"vcode":"请输入图片中的验证码"
}
var errorMsg={
	"user_name":"用户名长度应该在6-20之间,且只能包含英文字母,数字",
	"user_name_1":"用户名不能使用殊字符",
	"pass_word":"密码长度不能小于6",
	"re_pass_word":"请再次确认密码",
	"re_pass_word_1":"两次输入密码不相同!",
	"email":"请输入正确的邮箱地址",
	"user_phone":"请输入您的手机号码",
	"vcode":"请输入4位验证码"
}



function strLength(as_str){
	return as_str.replace(/[^\x00-\xff]/g, 'xx').length;
}
function isLegal(str){
	if(/[!,@,#,$,%,^,&,*,?,_,~,\s+]/gi.test(str)) return false;
	return true;
}
function isUname(str){
	var regUserName = /^[a-zA-Z0-9]+$/;
	if(regUserName.test(str)) return true;
	return false;
}
function isMobil(s){  
	var patrn=/^[+]{0,1}(\d){1,3}[ ]?([-]?((\d)|[ ]){1,12})+$/;  
	if (!patrn.exec(s)) return false  
	return true  
} 
function showTip(obj){
	var _this = $(obj);
	var type=_this.attr("id");
	msg = tipMsg[type];
	$(".zhucezliao dl dt.tip").not("dt.tip.success,dt.tip.errorTip").hide();
	_this.parent("dt").siblings("dt.tip").removeClass("error errorTip").html(msg).show();
}
function testInput(obj){
	var msg= tipMsg[type];
	var _this = $(obj);
	var type=_this.attr("id");
	switch(type){
		case "user_name":
			if(strLength(_this.val())<6||strLength(_this.val())>20||!isUname(_this.val())) msg=errorMsg[type];
			else msg=true;
		break;	
		case "pass_word":
			if(strLength(_this.val())<6) msg=errorMsg[type];
			else msg=true;
		break;	
		case "re_pass_word":
			if(strLength(_this.val())<6) msg=errorMsg[type];
			else if(_this.val()!=$("#pass_word").val()) msg=errorMsg[type+"_1"];
			else msg=true;
		break;	
		case "email":
			if(!Utils.isEmail(_this.val())) msg=errorMsg[type];
			else msg=true;
		break;	
		case "user_phone":
			if(!isMobil(_this.val())) msg=errorMsg[type];
			else msg=true;
		break;	
		case "vcode":
			if(strLength(_this.val())!=4) msg=errorMsg[type];
			else msg=true;
		break;	
		case "invite_id":
			msg=true;
		break;	
		default:
			msg=true;
		break;	
	}
	if(msg!==true){
		Mix.tip("#"+type,msg,1,1);
	}else{
		//_this.parent("dt").siblings("dt.tip").removeClass("error errorTip").addClass("success").show();
	}
	return msg;
}

function showErrorTip(obj,res){
	var _this=$(obj);
	if(res===true) return;
	else _this.parent("dt").siblings("dt.tip").removeClass("success error").addClass("errorTip").html('').show();
}

/*$(function(){
	$(".zhucezliao dl dt input").focus(function(){
		showTip(this);
	}).blur(function(){
		var res = testInput(this);
		showErrorTip(this,res);
	}).keyup(function(){
		testInput(this);
	});
	$("#pass_word").blur(function(){
		testInput("#re_pass_word");
	});
});*/

