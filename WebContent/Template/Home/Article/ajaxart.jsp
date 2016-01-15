<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
<dt>${Article.title}</dt>
<span>${dfn:date(Article.add_time,"yyyy-MM-dd")}</span>
<dd>${Article.content}</dd>