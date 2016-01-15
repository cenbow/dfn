<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:include page="../Common/topHeader.jsp"/>
<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>光谷惠众-系统后台</title>
<link href="http://ggmoney.com/statics/admin/css/admin_style.css" rel="stylesheet" />
<link href="http://ggmoney.com/statics/admin/js/artDialog/skins/default.css" rel="stylesheet" />
<style type="text/css"> 
.table_list tr.higlight_select td{background-color:#CC0}
</style>
<script type="text/javascript"> 
//全局变量
var GV = {
    DIMAUB: "",
    JS_ROOT: "http://ggmoney.com/statics/admin/js/",
    TOKEN: "b4aaa51c38fd6666a791d6d9560c87f9_bd928c8d87144b0f6f556065f4608f74",
	MAIN_DOMAIN:"http://ggmoney.com"
};
</script>
<script src="http://ggmoney.com/statics/admin/js/wind.js"></script>
<script src="http://ggmoney.com/statics/admin/js/jquery.js"></script>
<script type="text/javascript"> 
$(function(){
	$(".table_list tr").click(function(){
		$(this).addClass("higlight_select").siblings("tr").removeClass("higlight_select");
	})	
})
</script>
</head>
<body class="J_scroll_fixed">
<div class="wrap J_check_wrap">
    <div class="nav">
  <ul class="cc">
        <li class="current"><a href="/newadmin-capital_all-index-menuid-85.shtml">网站资金统计</a></li>
      </ul>
</div>
  <div class="h_a">搜索</div>
  <form method="get" action="/newadmin-CapitalAll-index">
    <div class="search_type cc mb10">
      <div class="mb10"> <span class="mr20">
      统计时间段：
        <input type="text" name="start_time" class="input length_2 J_date" value="" style="width:80px;">
        -
        <input type="text" class="input length_2 J_date" name="end_time" value="" style="width:80px;">
 
        <button class="btn">统计</button>
        </span> </div>
    </div>
  <input type="hidden" name="__hash__" value="b4aaa51c38fd6666a791d6d9560c87f9_bd928c8d87144b0f6f556065f4608f74" /></form>
   <div class="table_list">
 
 
<style type="text/css"> 
.ssx a{height:30px; line-height:30px}
.table_list td{border-right:1px solid #C4CACE; width:30%}
.table_list tr:hover td{background:#FFFFFF}
.lx{width:100%; overflow:hidden; height:30px; line-height:30px}
.lx dt,.lx dd{float:left; width:40%}
.lx dt{text-align:right;}
.lx dd{text-align:left; text-indent:10px}
</style>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <thead>
      <tr>
        <th class="line_l">会员统计</th>
        <th class="line_l">资金进出统计</th>
        <th class="line_l">借款统计</th>
      </tr>
    </thead>
      <tr>
        <td valign="top">
        	<dl class="lx"><dt>会员总数:</dt><dd><a href="/newadmin-user-index.shtml">222</a>人</dd></dl>
        	<dl class="lx"><dt>VIP:</dt><dd><a href="/newadmin-user-index.shtml?is_vip=yes">0</a>人</dd></dl>
        	<dl class="lx"><dt>通过身份认证:</dt><dd><a href="/newadmin-applyreal-index.shtml?mi%23id_status=1">11</a>人</dd></dl>
        	<dl class="lx"><dt>通过手机认证:</dt><dd><a href="/newadmin-verify_phone-index.shtml">0</a>人</dd></dl>
        	<dl class="lx"><dt>通过现场认证:</dt><dd><a href="/newadmin-applyface-index.shtml?v%23apply_status=1">7</a>人</dd></dl>
        	<dl class="lx"><dt>通过视频认证:</dt><dd><a href="/newadmin-applyvideo-index.shtml?v%23apply_status=1">5</a>人</dd></dl>
        </td>
        <td valign="top">
         	<dl class="lx"><dt>线上充值:</dt><dd><a href="/newadmin-capitallog-index.shtml?l%23type=3">￥0.00</a></dd></dl>
         	<dl class="lx"><dt>线下充值:</dt><dd><a href="/newadmin-capitallog-index.shtml?l%23type=27">￥0.00</a></dd></dl>
         	<dl class="lx"><dt>成功提现:</dt><dd><a href="/newadmin-capitallog-index.shtml?l%23type=29">￥0.00</a></dd></dl>
         	<dl class="lx"><dt>管理员操作:</dt><dd><a href="/newadmin-capitallog-index.shtml?l%23type=7">￥-1,398,779,068.99</a></dd></dl>
         	<dl class="lx"><dt>总计:</dt><dd>￥-1,398,779,068.99</dd></dl>
        </td>
        <td valign="top">
         	<dl class="lx"><dt>成功借出总额:</dt><dd>￥10,600.00</dd></dl>
         	<dl class="lx"><dt>已还款总额:</dt><dd>￥10,000.00</dd></dl>
         	<dl class="lx"><dt>未还款总额:</dt><dd>￥600.00</dd></dl>
         	<dl class="lx"><dt>冻结中的保证金总额:</dt><dd>￥0.00</dd></dl>
        </td>
	</tr>
    <tr>
    <thead>
        <th class="line_l">逾期统计</th>
        <th class="line_l">网站收益统计</th>
        <th class="line_l">投资者收益统计</th>
    </thead>
    </tr>
    <tr>
        <td valign="top">
         	<dl class="lx"><dt>逾期已还款总额:</dt><dd>￥0.00</dd></dl>
         	<dl class="lx"><dt>逾期未还款总额:</dt><dd>￥0.00</dd></dl>
         	<dl class="lx"><dt>催收费总额:</dt><dd><a href="/newadmin-capitallog-index.shtml?l%23type=31">￥0.00</a></dd></dl>
         	<dl class="lx"><dt>逾期罚息总额:</dt><dd><a href="/newadmin-capitallog-index.shtml?l%23type=30">￥0.00</a></dd></dl>
        </td>
        <td valign="top">
         	<dl class="lx"><dt>借入者成交管理费总额:</dt><dd><a href="/newadmin-capitallog-index.shtml?l%23type=18">￥1,023,336.00</a></dd></dl>
         	<dl class="lx"><dt>投资者成交管理费总额:</dt><dd><a href="/newadmin-capitallog-index.shtml?l%23type=23">￥1,534.97</a></dd></dl>
         	<dl class="lx"><dt>提现手续费总额:</dt><dd>￥0.00</dd></dl>
         	<dl class="lx"><dt>VIP费用总额:</dt><dd><a href="/newadmin-capitallog-index.shtml?l%23type=14">￥0.00</a></dd></dl>
         	<dl class="lx"><dt>实名认证费用总额:</dt><dd><a href="/newadmin-capitallog-index.shtml?l%23type=25">￥0.00</a></dd></dl>
         	<dl class="lx"><dt>视频认证费用总额:</dt><dd><a href="/newadmin-capitallog-index.shtml?l%23type=22">￥0.00</a></dd></dl>
         	<dl class="lx"><dt>现场认证费用总额:</dt><dd><a href="/newadmin-capitallog-index.shtml?l%23type=26">￥0.00</a></dd></dl>
         	<dl class="lx"><dt>总计:</dt><dd>
            ￥1,024,870.97            </dd></dl>
        </td>
        <td valign="top">
         	<dl class="lx"><dt>成功借款利息总额:</dt><dd>￥0.00</dd></dl>
         	<dl class="lx"><dt>成功借款投标奖励总额:</dt><dd><a href="/newadmin-capitallog-index.shtml?l%23type=21">￥66,766.66</a></dd></dl>
         	<dl class="lx"><dt>邀请注册奖金总额:</dt><dd><a href="/newadmin-capitallog-index.shtml?l%23type=1">￥0.00</a></dd></dl>
         	<dl class="lx"><dt>回款奖励:</dt><dd><a href="/newadmin-capitallog-index.shtml?l%23type=34">￥0.00</a></dd></dl>
         	<dl class="lx"><dt>线下充值奖励:</dt><dd><a href="/newadmin-capitallog-index.shtml?l%23type=36">￥0.00</a></dd></dl>
         	<dl class="lx"><dt>总计:</dt><dd>￥66,766.66</dd></dl>
        </td>
      </tr>
 
    </table>
 
 
   </div>
</div>
<script type="text/javascript" src="http://ggmoney.com/statics/admin/js/content_addtop.js"></script>
<script src="http://ggmoney.com/statics/admin/js/common.js?v"></script>

<script type="text/javascript"> 
(function(){
var tab_tit  = document.getElementById('think_page_trace_tab_tit').getElementsByTagName('span');
var tab_cont = document.getElementById('think_page_trace_tab_cont').getElementsByTagName('div');
var open     = document.getElementById('think_page_trace_open');
var close    = document.getElementById('think_page_trace_close').childNodes[0];
var trace    = document.getElementById('think_page_trace_tab');
var cookie   = document.cookie.match(/thinkphp_show_page_trace=(\d\|\d)/);
var history  = (cookie && typeof cookie[1] != 'undefined' && cookie[1].split('|')) || [0,0];
open.onclick = function(){
	trace.style.display = 'block';
	this.style.display = 'none';
	close.parentNode.style.display = 'block';
	history[0] = 1;
	document.cookie = 'thinkphp_show_page_trace='+history.join('|')
}
close.onclick = function(){
	trace.style.display = 'none';
this.parentNode.style.display = 'none';
	open.style.display = 'block';
	history[0] = 0;
	document.cookie = 'thinkphp_show_page_trace='+history.join('|')
}
for(var i = 0; i < tab_tit.length; i++){
	tab_tit[i].onclick = (function(i){
		return function(){
			for(var j = 0; j < tab_cont.length; j++){
				tab_cont[j].style.display = 'none';
				tab_tit[j].style.color = '#999';
			}
			tab_cont[i].style.display = 'block';
			tab_tit[i].style.color = '#000';
			history[1] = i;
			document.cookie = 'thinkphp_show_page_trace='+history.join('|')
		}
	})(i)
}
parseInt(history[0]) && open.click();
tab_tit[history[1]].click();
})();
</script>
</body>
</html>
