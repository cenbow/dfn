<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="javaTag.jsp" %>
<style type="text/css">
.float_menu{width:52px;height:272px; position:fixed; right:100px;bottom:20px; _position: absolute; /*IE6 用absolute模拟fixed*/_top: expression(documentElement.scrollTop + 500 + "px"); /*IE6 动态设置top位置*/}
.float_menu_code{width:110px;height:110px; background:rgba(0,0,0,0.7); position:absolute; right:52px;padding:40px;bottom:82px;}
#ry_fenxiang{width:180px; background:rgba(0,0,0,0.7); position:absolute; right:52px;padding:10px 10px 20px 10px;bottom:110px;}
  #ry_fenxiang table{width:100%;line-height:30px;}
  #ry_fenxiang table tr td a {color:#ffffff;}
  #ry_fenxiang div{font-size:16px;text-align:center;color:white;margin-top:30px;background-color:rgba(255,255,255,0.3);line-height:30px;border-radius:3px;cursor:pointer;}
  .float_menu_phone{width:180px;height:97px;background:#fff;position:absolute; right:52px; bottom:0;padding:10px 10px 0 20px;border:1px solid #f8f8f8; border-right:none;}
.float_menu_phone p{color:#414141;}
.float_menu_phone p.title{font-size:14px; height:20px; line-height:20px;}
.float_menu_phone p.number{font-size:28px; height:30px; line-height:30px; font-family:Arial, Helvetica, sans-serif; font-weight:bold;}
.float_menu_phone p.explain{ font-size:12px;color:#bbbbbb; height:20px; line-height:20px; }
.float_menu_hight{ margin-bottom:3px;}
</style>
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

  /*document.getElementById('ry_fenxiang').style.display='none';*/
}
function fenxiang_show(){
  MM_swapImage('Image3','','${HomeStatics}/images/float_menu_hover_3.png',3);
  /*document.getElementById('ry_fenxiang').style.display='block';*/
  }
function code_show(){
  /*document.getElementById('ry_fenxiang').style.display='none';*/
	document.getElementById('wei_prcode').style.display='block';
	document.getElementById('Image1').src='${HomeStatics}/images/float_menu_hover_1.png';

}
function code_hide(){
	document.getElementById('wei_prcode').style.display='none';
	document.getElementById('Image1').src='${HomeStatics}/images/float_menu_1.png';
}


function phone_show(){

	/*document.getElementById('wei_prphone').style.display='block';*/
	document.getElementById('Image4').src='${HomeStatics}/images/float_menu_hover_4.png';

}
function phone_hide(){
	/*document.getElementById('wei_prphone').style.display='none';*/
	document.getElementById('Image4').src='${HomeStatics}/images/float_menu_4.png';
}
  function ry_er_show(obj){
  obj.nextSibling.style.display='block';
  var path=obj.src;
  var filename;
  filename=path.substring(path.lastIndexOf("/")+1,path.length-4);
  obj.src="/Statics/Home/images/"+filename+"_hover.jpg";
  }
  function ry_er_hide(obj){
  obj.nextSibling.style.display='none';
  var path=obj.src;
  var filename;
  filename=path.substring(path.lastIndexOf("/")+1,path.length-10);
  obj.src="/Statics/Home/images/"+filename+".jpg";
  }
  function ry_img_hover_in(num){
  var path=document.getElementById('ry_bottom_0' + num).src;
  var filename;
  filename=path.substring(path.lastIndexOf("/")+1,path.length-4);
  document.getElementById('ry_bottom_0' + num).src="/Statics/Home/images/"+filename+"_hover.png";
  }
  function ry_img_hover_out(num){
  var path=document.getElementById('ry_bottom_0' + num).src;
  var filename;
  filename=path.substring(path.lastIndexOf("/")+1,path.length-10);
  document.getElementById('ry_bottom_0' + num).src="/Statics/Home/images/"+filename+".png";
  }
  function ry_fenxiang_show(){
  document.getElementById('ry_fenxiang').style.display='block';
  }
  function ry_fenxiang_hide(){
  document.getElementById('ry_fenxiang').style.display='none';
  }
</script>
<!--漂浮菜单-->
<ul class="float_menu">

  <li class="float_menu_hight"><a onmouseout="code_hide();" onmouseover="code_show();" style= "cursor:default" ><img src="${HomeStatics}/images/float_menu_1.png" width="52" height="52" id="Image1"/></a>
    <div id="wei_prcode" class="float_menu_code"  style="display:none;"><img src="${HomeStatics}/images/weixin_fuwu.png" />
  <div style="color:#ffffff;font-size:16px;text-align:center;line-height:35px;">微信服务号</div>
  </div>
  </li>

  <li class="float_menu_hight"><a href="http://float2006.tq.cn/static.jsp?version=vip&admiuin=9637954&ltype=0&iscallback=1&page_templete_id=83395&is_message_sms=0&is_send_mail=0&uin=9637954" target="_blank" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image2','','${HomeStatics}/images/float_menu_hover_2.png',2)"><img src="${HomeStatics}/images/float_menu_2.png" width="52" height="52" id="Image2" /></a></li>
  <!--<li class="float_menu_hight"><a href="" onmouseout="MM_swapImgRestore()" onmouseover="fenxiang_show()"><img src="${HomeStatics}/images/float_menu_3.png" width="52" height="52" id="Image3" /></a>
  <div id="ry_fenxiang" style="display:none;">
  <table>
    <tr><td><a href="#"><img src="${HomeStatics}/images/qq_kj.png" align="absmiddle"> QQ空间</a></td><td><a href="#"><img src="${HomeStatics}/images/xinlang_wb.png" align="absmiddle"> 新浪微博</a></td></tr>
    <tr><td><a href="#"><img src="${HomeStatics}/images/tenxun_wb.png" align="absmiddle"> 腾讯微博</a></td><td><a href="#"><img src="${HomeStatics}/images/renren.png" align="absmiddle"> 人人网</a></td></tr>
    <tr><td><a href="#"><img src="${HomeStatics}/images/yijian_fx.png" align="absmiddle"> 一键分享</a></td><td><a href="#"><img src="${HomeStatics}/images/baidu_xc.png" align="absmiddle"> 百度相册</a></td></tr>
    <tr><td><a href="#"><img src="${HomeStatics}/images/kaixin.png" align="absmiddle"> 开心网</a></td><td><a href="#"><img src="${HomeStatics}/images/tenxun_py.png" align="absmiddle"> 腾讯朋友</a></td></tr>
    <tr><td><a href="#"><img src="${HomeStatics}/images/baidu_tb.png" align="absmiddle"> 百度贴吧</a></td><td><a href="#"><img src="${HomeStatics}/images/douban.png" align="absmiddle"> 豆瓣网</a></td></tr>
    <tr><td><a href="#"><img src="${HomeStatics}/images/qq.png" align="absmiddle"> QQ好友</a></td><td><a href="#"><img src="${HomeStatics}/images/fenxiang.png" align="absmiddle"> 分享到：</a></td></tr>
  </table>
  <div style="" onclick="ry_fenxiang_hide()">取消分享</div>
  </div>
  </li>-->
  
  <li class="float_menu_hight"><a href="http://www.p2pok.com/tools/calculator.do" onmouseout="phone_hide();" onmouseover="phone_show();"><img src="${HomeStatics}/images/float_menu_4.png" width="52" height="52" id="Image4"/></a>
    <!-- <span id="wei_prphone" class="float_menu_phone" style="display:none;"><p class="title" >服务热线</p><p class="number">400-8636-360</p><p class="explain">周一至周五 9:00 - 21:00</p><p class="explain">周六至周七 9:00 - 17:30</p></span> -->
  </li>
  
  <li class="float_menu_hight"><a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image5','','${HomeStatics}/images/float_menu_hover_5.png',5)"><img src="${HomeStatics}/images/float_menu_5.png" width="52" height="52" id="Image5" /></a></li>
</ul>
<!--漂浮菜单-->
