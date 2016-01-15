<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
<%@ include file="../Common/headerMeta.jsp"%>
<title>新手指引</title>
<link href="${HomeStatics}/Guide/style/guide.css"  type="text/css" rel="stylesheet" />
<link href="${HomeStatics}/Guide/style/colorbox.css"  type="text/css" rel="stylesheet" />
<link href="${HomeStatics}/Guide/style/layer.css"  type="text/css" rel="stylesheet" />
	<script type="text/javascript" src="${HomeStatics}/Guide/js/xx-js.js"></script>
<script type="text/javascript">
function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}
function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}
</script>
<style>
	.cwh_container{
		width:100%;
		height:600px;
		padding-top:20px;
		position:relative;	
	}
	.cwh_arrowLeft,.cwh_arrowRight{
		z-index:999;
		cursor:pointer;
		position:absolute;	
	}
	.cwh_arrowLeft{
		top:50%;
		left:30px;	
	}
	.cwh_arrowRight{
		top:50%;
		right:30px;	
	}
	.cwh_flashWarp{
		width:100%;
		height:600px;
		position: relative;
		overflow:hidden;	
	}
	.cwh_flash{
		width:9000px;
		height:600px;
		top:0px;
		left:0px;
		position:absolute;
		overflow:hidden;
	}
	.cwh_flash li {
		float:left;	
	}	
</style>  
<%@ include file="../Common/headerBody.jsp"%>


<!--banner-->
<div class="guide_banner"></div>
<!--banner结束-->
<script type="text/javascript">
var lhash=location.hash;
var tabindex = parseInt(lhash.substr(-1,1));
$(function(){
	if(!isNaN(tabindex)){
		$(".ry_tab"+tabindex).click();
	}
})
</script>


<div id="tab1" style="background:#ffffff;">
	<div style="width:1000px;margin:0 auto;background-color:#ffffff;text-align:center;font-size:16px;cursor:pointer;overflow:hidden;padding-top:10px;">

	<div class="ry_tab1" style="line-height:50px;width:150px;float:left;border-left:dashed 1px #dadada;border-top:solid 3px #69c1ff;color:#69c1ff;">我要投资</div>
	<div class="ry_tab2" style="line-height:50px;width:150px;float:left;border:dashed 1px #dadada;border-top:none;">我要借款</div>

	</div>
<div class="guide_box_white">
	<div class="guide_know" style="height:630px;">
	<p class="title" style="padding-top:20px;">平台模式</p>
	<p style="margin-top:-25px;">Platform mode</p>
	<p><img src="${HomeStatics}/Safe/images/ry_ty.png" /></p>
	<p style="margin-left:-50px;"><img src="${HomeStatics}/Guide/images/guide_2.png" /></p>
	<p style="width:370px;font-size:14px;text-align:left;margin:10px auto auto auto;color:#9d9d9d">融友网为建立安全透明的交易环境，创建安全可靠的资金保障。与新浪集团旗下的支付平台“新浪支付”合作，为融友网平台的用户资金做托管。</p>
	</div>
</div>




<div class="guide_point" style="height:700px;background-color:#f7f7f7;">
	<div class="guide_know" >
	<p class="title" style="padding-top:20px;">灵活投资</p>
	<p style="margin-top:-25px;font-size:14px;">Flexible investment</p>
	<p><img src="${HomeStatics}/Safe/images/ry_ty.png" /></p>
	<p><img src="${HomeStatics}/Guide/images/guide_investment.png" /></p>
	<p style="margin:10px auto auto auto;color:#949494;font-size:14px;"><span style="font-size:20px;">轻松转出</span>  获得流动资金</p>
	<p style="margin:10px auto auto auto;color:#949494;font-size:18px;">10%-18%  年化收益</p>
	<p style="margin:10px auto auto auto;color:#949494;font-size:14px;">信用认证  实地认证  抵押认证</p>
	</div>
</div>




<div class="guide_box_white" style="height:400px;">
	<div class="guide_know" >
	<p class="title" style="padding-top:20px;">资金托管</p>
	<p style="margin-top:-25px;">Fund custody</p>
	<p><img src="${HomeStatics}/Safe/images/ry_ty.png" /></p>
	<p><img src="${HomeStatics}/Guide/images/guide_4.png" /></p>
	</div>
</div>




<div class="guide_product" style="height:800px;background-color:#f7f7f7">
	<div class="guide_know" >
		<p class="title" style="padding-top:20px;">快速投资</p>
		<p style="margin-top:-25px;font-size:14px;">Quick investment</p>
		<p><img src="${HomeStatics}/Safe/images/ry_ty.png" /></p>
		<div style="position:relative;text-align:center;">
			<div id="arrLeft" style="position:absolute;top:200px;left:20%;">
				<img class="arrLeft" src="${HomeStatics}/Guide/images/guide_left.png">
			</div>
			<div id="scrollbox1" style="margin:0 auto;">
				<img src="${HomeStatics}/Guide/images/guide_01.png" />
				<img src="${HomeStatics}/Guide/images/guide_02.png" />
				<img src="${HomeStatics}/Guide/images/guide_03.png" />
				<img src="${HomeStatics}/Guide/images/guide_04.png" />
				<img src="${HomeStatics}/Guide/images/guide_05.png" />
			</div>
			<div id="arrRight" style="position:absolute;top:200px;right:20%;">
				<img class="arrRight"src="${HomeStatics}/Guide/images/guide_right.png">
			</div>
		</div>
	</div>
</div>
	<div class="guide_register" style="background-color:#ffffff;height:260px;"><a href="${dfn:U('home/register/index')}"><img src="${HomeStatics}/Guide/images/guide_register_btn.png" /></a></div>
	</div>


	<div id="tab2" style="display:none;background:#ffffff;">
	<div style="width:1000px;margin:0 auto;padding-top:10px;background-color:#ffffff;text-align:center;font-size:16px;cursor:pointer;overflow:hidden;">

	<div class="ry_tab1" style="line-height:50px;width:150px;float:left;border:dashed 1px #dadada;border-top:none;">我要出借</div>
	<div class="ry_tab2" style="line-height:50px;width:150px;float:left;border-right:dashed 1px #dadada;border-top:solid 3px #69c1ff;color:#69c1ff;">我要借款</div>

	</div>
	<div class="guide_box_white">
	<div class="guide_know" style="height:600px;">
	<p class="title" style="padding-top:20px;">轻松借款</p>
	<p style="margin-top:-25px;">Easy loan</p>
	<p><img src="${HomeStatics}/Safe/images/ry_ty.png" /></p>
	<p><img src="${HomeStatics}/Guide/images/guide_1.png" /></p>
	</div>
	</div>
	<div class="guide_point" style="height:530px;background-color:#f7f7f7;">
	<div class="guide_know" >
	<p class="title" style="padding-top:20px;">三步认证</p>
	<p style="margin-top:-25px;font-size:14px;">Three step authentication</p>
	<p ><img src="${HomeStatics}/Safe/images/ry_ty.png" /></p>
	<p><img src="${HomeStatics}/Guide/images/guide_3.png" /></p>

	</div>
	</div>


	<div class="guide_box_white" style="height:720px;">
	<div class="guide_know" >
	<p class="title" style="padding-top:20px;">快速借款</p>
	<p style="margin-top:-25px;">Fast loan</p>
	<p><img src="${HomeStatics}/Safe/images/ry_ty.png" /></p>
	<div style="position:relative;text-align:center;">
	<div id="arrLeft2" style="position:absolute;top:200px;left:20%;">

	<img class="arrLeft" src="${HomeStatics}/Guide/images/guide_left.png">
	</div>
	<div id="scrollbox2" style="margin:0 auto;">
	<img src="${HomeStatics}/Guide/images/guide_tab2_1.png" />
	<img src="${HomeStatics}/Guide/images/guide_tab2_2.png" />
	<img src="${HomeStatics}/Guide/images/guide_tab2_3.png" />
	<img src="${HomeStatics}/Guide/images/guide_tab2_4.png" />
	</div>
	<div id="arrRight2" style="position:absolute;top:200px;right:20%">
	<img class="arrRight"src="${HomeStatics}/Guide/images/guide_right.png">
	</div>
	</div>
	</div>
	</div>


	<div class="guide_register" style="height:260px;"><a href="${dfn:U('home/register/index')}"><img src="${HomeStatics}/Guide/images/guide_register_btn.png" /></a></div>

	</div>
<!--免费注册开始-->
	<script type="text/javascript">
	var scrollPic_01 = new ScrollPic();
	scrollPic_01.scrollContId   = "scrollbox1"; //内容容器ID
	scrollPic_01.arrLeftId      = "arrLeft";//左箭头ID
	scrollPic_01.arrRightId     = "arrRight"; //右箭头ID
	scrollPic_01.frameWidth     = 409;//显示框宽度
	scrollPic_01.pageWidth      = 409; //翻页宽度   更改移动距离的时候用！！！！！！！！！！！
	scrollPic_01.speed          = 10; //移动速度(单位毫秒，越小越快)
	scrollPic_01.space          = 10; //每次移动像素(单位px，越大越快)
	scrollPic_01.autoPlay       = false; //自动播放
	scrollPic_01.autoPlayTime   = 3; //自动播放间隔时间(秒)
	scrollPic_01.initialize(); //初始化
	var scrollPic_02 = new ScrollPic();
	scrollPic_02.scrollContId   = "scrollbox2"; //内容容器ID
	scrollPic_02.arrLeftId      = "arrLeft2";//左箭头ID
	scrollPic_02.arrRightId     = "arrRight2"; //右箭头ID
	scrollPic_02.frameWidth     = 408;//显示框宽度
	scrollPic_02.pageWidth      = 408; //翻页宽度   更改移动距离的时候用！！！！！！！！！！！
	scrollPic_02.speed          = 10; //移动速度(单位毫秒，越小越快)
	scrollPic_02.space          = 10; //每次移动像素(单位px，越大越快)
	scrollPic_02.autoPlay       = false; //自动播放
	scrollPic_02.autoPlayTime   = 3; //自动播放间隔时间(秒)
	scrollPic_02.initialize(); //初始化
	$(function(){
	$(".guide_return").click(function(){
	$('html,body').animate({scrollTop:0},'slow');
	});
	$('.arrLeft').hover(function(){
	$(this).attr("src","${HomeStatics}/Guide/images/guide_left_hover.png");
	},function(){
	$(this).attr("src","${HomeStatics}/Guide/images/guide_left.png");
	});
	$('.arrRight').hover(function(){
	$(this).attr("src","${HomeStatics}/Guide/images/guide_right_hover.png");
	},function(){
	$(this).attr("src","${HomeStatics}/Guide/images/guide_right.png");
	});

	});
	$(".ry_tab1").click(function(){
	$("#tab1").show();
	$("#tab2").hide();
	});
	$(".ry_tab2").click(function(){
	$("#tab1").hide();
	$("#tab2").show();
	});
	</script>
<!--<div class="guide_register" style="background-color:#ffffff;height:260px;"><a href="${dfn:U('home/register/index')}"><img src="${HomeStatics}/Guide/images/guide_register_btn.png" /></a>-->
<!--<p class="guide_return"><a href="javascript:;"><img src="${HomeStatics}/Guide/images/return_top_btn.png" /></a></p>--></div>

<!--免费注册结束-->

<%@ include file="../Common/footer.jsp"%>