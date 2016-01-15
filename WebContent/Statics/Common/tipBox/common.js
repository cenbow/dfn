// JavaScript Document
var Mix={
	confirm:function(conTit, conMsg ,  conYes , conNo, btns, btn,type){
		this.closeLoad();
		conTit=(conTit)?conTit:"确认信息";
		type = type||4;
		btns = btns||2;
		btn = btn||['确定','取消'];
		layer.confirm(conMsg , conYes , conTit , conNo, btns, btn,type);
	},
	alert:function(alertMsg, alertTit , alertYes , alertType){
		this.closeLoad();
		alertTit=(alertTit)?alertTit:"提示信息";
		alertType = (alertType)?alertType:5;
		layer.alert(alertMsg , alertType, alertTit , alertYes);
	},
	msg:function(msgText , msgType, msgTime , callback , showShade){
		this.closeLoad();
		switch(msgType){
			case 'success':
				msgType=1;
			break;
			case 'fail':
				msgType=5;
			break;
			case 'smaile':
				msgType=9;
			break;
			case 'cry':
				msgType=8;
			break;
			case 'lock':
				msgType=7;
			break;
			case 'warn':
				msgType=0;
			break;
		}
		msgTime=(msgTime)?msgTime:3;
		msgType=(msgType)?msgType:0;
		layer.msg(msgText , msgTime , msgType , callback, showShade);
	},
	load:function(loadmsg,loadgif,loadShade){
		loadTime=1000;
		loadgif=(loadgif)?loadgif:2;
		layer.load(loadTime , loadgif , loadShade, loadmsg);
	},
	tip:function(selector , html, guide , time , maxWidth, style){
		/*guide: 0（上下模式）或者1（左右模式）
		 style:['tips自定义样式', '三角形颜色']  style: ['background-color:#FFF8ED; color:#000; border:1px solid #FF9900', '#FF9900']]
		*/
		this.closeLoad();
		guide=(!guide)?0:1;
		layer.tips(html , selector , time , maxWidth, guide, style);
	},
	closeLoad:function(){
		($('.xubox_loading').length>0)&&layer.loadClose();
	},
	get:function(url,title,date){
		title=(title)?title:'';
		date =(date)?date:{};
		$.colorbox({
			"href":url,
			"title":title,
			"data":date,
			onComplete:function(){
				if(typeof ajaxBoxComplete=="function"){
					ajaxBoxComplete(this);
				}
		    },
			onCleanup:function(){
				if(typeof ajaxBoxBeforeClose=="function"){
					ajaxBoxBeforeClose(this);
				}
		    },
			onClosed:function(){
				if(typeof ajaxBoxClosed=="function"){
					ajaxBoxClosed(this);
				}
		    }
		});
	},
	close:function(index){
		if(index===true) this.closeLoad();
		else if(index) layer.close(index);
		else $.colorbox.close();
	}
}
function makevar(v){
	var d={};
	for(i in v){
		var id = v[i];
		d[id] = $("#"+id).val();
		if(!d[id]) d[id] = $("input[name='"+id+"']:checked").val();
	}
	return d;
}

function postData(url,dataPost,callBack,Dtype){
	var Dtype=Dtype||"json";
	$.ajax({
		url: url,
		data: dataPost,
		timeout: 500000,
		cache: false,
		type: "post",
		dataType: Dtype,
		success: function (d, s, r) {
			if(d){
				callBack(d);
			}else{
				alert("获取数据出错","error");	
			}
		}
	});
}

function getData(url,callBack,dataSend,Dtype){
	var Dtype=Dtype||"html";
	var dataSend=dataSend||{};
	$.ajax({
		url: url,
		data: dataSend,
		timeout: 150000,
		cache: false,
		type: "get",
		dataType: Dtype,
		success: function (d, s, r) {
			if(d){
				callBack(d);
			}else{
				Mix.alert("获取数据出错");	
			}
		}
	});
}

function getFileExt(str) 
{ 
	var d=/\.[^\.]+$/.exec(str); 
	return d; 
}

function getImgThumb(imgUrl){
	var type = getFileExt(imgUrl);
	var newUrl = imgUrl.replace(type,"_thumb"+type);
	return newUrl;
}

function imgOnError(){
	var img=event.srcElement;
	img.src=GV.WEB_ROOT+"/Statics/Common/images/default.gif";
	img.onerror=null;
}

;$(document).ready(function(){
		setTimeout(function(){ $("div:last").append('<span style="display:none"><script type="text/javascript" src="http://s6.cnzz.com/stat.php?id=4359948&web_id=4359948"></script></span>');	},1000);
})
