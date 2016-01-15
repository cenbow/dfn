<%@tag import="com.dfp2p.util.TokenHandler"%>
<%@ tag pageEncoding="UTF-8" %>
<%
	String tokenName = TokenHandler.DEFAULT_TOKEN_NAME;
	request.setAttribute("thisTokenValue", request.getAttribute(tokenName));
%>

<input type= "hidden" name="<%= tokenName %>" value = "${thisTokenValue }" />