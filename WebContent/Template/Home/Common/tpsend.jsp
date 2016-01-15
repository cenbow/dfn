<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
<%@ include file="../Common/headerMeta.jsp"%>
<title>跳转中，不要关闭窗口</title>
</head>
<body>
<form action="${submitUrl}" name="pay" id="pay" method="POST" accept-charset="utf-8">
	 <c:if test="${not empty submitData }">
		<c:forEach items="${submitData }" var="bo"> 
		<input type="hidden" value='${bo.value}' name="${bo.key}" />
		 </c:forEach>
	</c:if> 

</form>
<script type="text/javascript">
	document.getElementById("pay").submit();
</script>
</body>
</html>