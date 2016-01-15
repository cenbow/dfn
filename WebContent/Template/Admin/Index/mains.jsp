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
<div class="welcome_login"><span class="green">${_ADMIN_.user_name}</span> 您好，欢迎登陆${_siteInfo_.siteName}后台管理系统<span>上次登陆时间：${lastLogin.add_time}</span><span>上次登陆IP：${lastLogin.ip}</span></div>

<!--<div class="welcome_important_tip">系统检测到系统后台入口还是默认的Newadmin，建议修改后台入口</div>-->

<div class="welcome_block" style="width:96%">
  <h2 class="h_a">待办事项</h2>
  <table class="centerTable" cellpadding="0" cellspacing="1">
  <tr><th>3天内到期</th><th>待初审</th><th>待复审</th><th>提现申请</th><th>融资申请</th></tr>
  <tr>
      <td>${row.will_repay}</td>
      <td>${row.borrow_check}</td>
      <td>${row.borrow_recheck}</td>
      <td>${row.withdraw}</td>
      <td>${row.loan}</td>
  </tr>
  <tr>
      <td><a href="${dfn:U('admin/borrow_repayment/index')}" class="taba">查看详情</a></td>
      <td><a href="${dfn:U('admin/borrow_check/index')}" class="taba">查看详情</a></td>
      <td><a href="${dfn:U('admin/borrow_recheck/index')}" class="taba">查看详情</a></td>
      <td><a href="${dfn:U('admin/withdraw/index')}" class="taba">查看详情</a></td>
      <td><a href="${dfn:U('admin/loan/index')}" class="taba">查看详情</a></td>
  </tr>
  </table>
</div>

<div class="welcome_block" style="width:96%">
  <h2 class="h_a">今日统计</h2>
  <table class="centerTable" cellpadding="0" cellspacing="1">
  <tr><th>新增会员</th><th>新增充值</th><th>新增提现</th><th>新增借款</th><th>新增投资</th></tr>
  <tr>
      <td><span class="gray">${countMap.user}</span></td>
      <td><span class="gray">${countMap.recharge_money}</span>(${countMap.recharge}笔)</td>
      <td><span class="gray">${countMap.withdraw_money}</span>(${countMap.withdraw}笔)</td>
      <td><span class="gray">${countMap.borrow_money}</span>(${countMap.borrow}笔)</td>
      <td><span class="gray">${countMap.invest_money}</span>(${countMap.invest}笔)</td>
  </tr>
  </table>
</div>
</body>
</html>