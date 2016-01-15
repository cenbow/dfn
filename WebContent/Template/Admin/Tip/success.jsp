<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>提示信息</title>
<style type="text/css">
.success{background:#EFFEB9; border:1px solid #98C700;}
.error{background:#FCCAC1; border:1px solid #EB5439;}
.tip{line-height:50px; color:#565656}
.tip img{position:relative; top:10px;*top:0px; margin-left:20px; }
.tip span{position:relative; *top:-7px;}
.result{font-family:Arial, Helvetica, sans-serif; font-size:16px; font-weight:bold;text-transform:uppercase}
.text{margin-left:40px; font-family:微软雅黑; font-size:14px}
</style>
<script>
function Jump(){    window.location.href = '{$jumpUrl}';}
document.onload = setTimeout("Jump()" , 10000* 1000);
</script>
</head>
<base target="_self" />
<body>
<div class="success tip" style="position:absolute; width:800px; height:50px; left:50%; top:50%; margin-top:-25px; margin-left:-400px;">
	<img src="${AdminStatics}/tip/images/success.png"/> <span class="result">success</span> <span class="text">${message}</span>
</div>
</body>
</html>