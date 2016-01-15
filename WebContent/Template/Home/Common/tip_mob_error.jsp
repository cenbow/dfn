<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>提示信息</title>
<style type="text/css">
.success{ background:#EFFEB9; border:1px solid #98C700;}
.error{ background:#FCCAC1; border:1px solid #EB5439;}
.tip{ line-height:50px; color:#565656}
.tip img{ position:relative; top:10px;*top:0px; margin-left:20px; }
.tip span{ position:relative; *top:-7px;}
.result{ font-family:Arial, Helvetica, sans-serif; font-size:1.7em; font-weight:bold;text-transform:uppercase}
.text{ margin-left:40px; font-family:微软雅黑; font-size:1.2em}
</style>
</head>
<base target="_self" />
<body>
<div class="error tip" style="position: absolute;width: 80%;height: 5em;left: 10%;top: 30%;text-align: center;border-radius: 10px;font-size: 2em; line-height:2.5em">
	<span class="text">${msg}</span>
</div>
<script>
window.uexOnload = function(type){
	alert("加载了");
	setTimeout(function(){
		try{
		uexWindow.evaluateScript('otherWebWindow',0,'closeOtherWeb()');
		}catch(e){ }
	},1000);
}
</script>

</body>
</html>