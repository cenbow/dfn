<%@ page trimDirectiveWhitespaces="true" %>
<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.dfp2p.com" prefix="dfn"%>
<%@ taglib uri="http://www.dfp2p.com/form" prefix="dfForm"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="dfTag" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>后台首页</title>
<link href="${AdminStatics}/My97DatePicker/skin/WdatePicker.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="${AdminStatics}/My97DatePicker/WdatePicker.js"></script>
</head>
<body>
<style type="text/css">
body{color: #333;
    font-size: 12px;
	font-family:微软雅黑;
	}
	a{text-decoration:none}
.h_a {
	/*
	border:1px solid #FFBE7A;;
    background: #FFFCED;
	color:#000;
	*/
	margin:0px;
    background: #72A8CF;
    border-bottom: 1px solid #FFFFFF;
    border-top: 1px solid #DDDDDD;
    color: #FFFFFF;
    font-size: 12px;
    font-weight: 700;
    padding: 5px 9px;
}
tr.h_a{
	background:#e6e6e6;
	padding:0;
}
tr.h_a th,
tr.h_a td
{
	padding-top:5px;
	padding-bottom:5px;
	line-height:18px;
	background:#e6e6e6 !important;
	border-top:1px solid #ddd;
	border-bottom:1px solid #ffffff;
}
.welcome_login{padding:5px 0px; text-indent:0px; width:96%; margin-left:2%; border-bottom:2px solid #F90; font-size:14px; font-family:寰蒋闆呴粦; margin-bottom:20px}
.welcome_login span{font-size:12px; margin-left:10px; color:#CCC}
.welcome_important_tip{border:1px solid #F90;color:#C92020; padding:5px 0px; width:96%; text-indent:30px; margin-left:2%; margin-bottom:10px; background:#FC0 url(../images/zhuce1.gif) no-repeat 10px center; }
.welcome_block{float:left; width:47%; margin-left:2%; overflow:hidden; border:0 none; margin-bottom:20px}
.welcome_block .h_a{border-bottom:0 none}
.welcome_block .home_info{border:1px solid #CCC; border-top:0 none;}
.centerTable{background:#E5E5E5; width:100%}
.centerTable th{background:#F8F8F8; height:20px; line-height:20px; padding:5px 0px; text-align:center; font-family:寰蒋闆呴粦; border:1px solid #EEE9E9; border-top:0 none}
.centerTable td{background:#FFF; text-align:center;height:20px; line-height:20px; padding:5px 0px; color:#FF0000;border:1px solid #EEE9E9}

.table_list tr td.redinner, .table_list tr td.redinner a{color:#F00}
.redinner, .redinner a{color:#F00}
table {
	border-collapse: collapse;
	border-spacing:0;
}
.rybll{ width:50px; border:0 none; border-bottom:1px solid #000; text-align:center}
#rybll{ padding:0px 5px;}
#rybll:hover{ background:#999}
</style>
<div class="wrap">


<div class="welcome_block" style="width:96%">
				<form class="well form-search" method="get"	action="${dfn:SU(_thisUrl_,'index')}">
						    统计时间段： 
							 <input class="input Wdate" style="width: 200px;" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',readOnly:true})" type="text"	name="startTime" value="${startTime}" /> - <input class="input Wdate" 
								style="width:200px;" type="text" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',readOnly:true})" name="endTime" value="${endTime}" /> <input type="submit"class="btn" id="searchButton" value="搜索"> 
                         </form>
  <h2 class="h_a">平台统计</h2>
  <table class="centerTable" cellpadding="0" cellspacing="1">
  <tr><th>总注册用户</th><th>充值总额</th><th>提现总额</th><th>现金券使用总计</th><th>体验金使用总计</th><th>红包使用总计</th></tr>
  <tr>
      <td><span class="gray">${countMap.user}</span></td>
      <td><span class="gray">${dfn:getFloatValue(countMap.recharge_money)}</span>(${countMap.recharge}笔)</td>
      <td><span class="gray">${dfn:getFloatValue(countMap.withdraw_money)}</span>(${countMap.withdraw}笔)</td>
      <td><span class="gray">${dfn:getFloatValue(countMap.card_2)}</span></td>
      <td><span class="gray">${dfn:getFloatValue(countMap.card_1)}</span></td>
      <td><span class="gray">${dfn:getFloatValue(countMap.card_4)}</span></td>
  </tr>
  <tr><th>待还总额</th><th>待还本金</th><th>待还利息</th><th>已还总额</th><th>已还本金</th><th>已还利息</th></tr>
  <tr>
      <td><span class="gray">${dfn:getFloatValue(countMap.collect_capital+countMap.collect_interest)}</span></td>
      <td><span class="gray">${dfn:getFloatValue(countMap.collect_capital)}</span></td>
      <td><span class="gray">${dfn:getFloatValue(countMap.collect_interest)}</span></td>
      <td><span class="gray">${dfn:getFloatValue(countMap.collect_receive_capital+countMap.collect_receive_interest)}</span></td>
      <td><span class="gray">${dfn:getFloatValue(countMap.collect_receive_capital)}</span></td>
      <td><span class="gray">${dfn:getFloatValue(countMap.collect_receive_interest)}</span></td>
  </tr>
  </table>
</div>
</div>
</body>
</html>