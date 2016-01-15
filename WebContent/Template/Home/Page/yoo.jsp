<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
    <%@ include file="../Common/headerMeta.jsp"%>
    <%@ include file="../Common/headerBody.jsp"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>融友</title>
    <link rel="stylesheet" type="text/css" href="${HomeStatics}/yoo/css/style2.css?20150626">		
</head>
<body>
<header>

    <div class="span12 banner" style="margin-top:-9px;">

    </div>
</header>
<main>
    <div class="main_body">
        <div class="ry_title">什么是YOO校园</div>
        <div style="height: 360px;">
            <div class="ry_yoo">
                “<span style="color: #8fe0e1">YOO校园</span>”融友网倾心打造的金融助学品牌，凭借特定的品牌业务模式及发展定位，以统一的服务和形象树立在全国各大校区，为在校学生提供金融信息服务。
            </div>
            <img class="ry_h" src="${HomeStatics}/yoo/img/YOO_house.png">
        </div>
        <div class="ry_title">产品优势</div>
        <div class="ry_td">
            <img src="${HomeStatics}/yoo/img/YOO_td.png">
        </div>
        <div class="ry_join">
            <a href="${dfn:U('home/register/index')}"><img src="${HomeStatics}/yoo/img/YOO_join.png"></a>
        </div>
    </div>
</main>
</body>
</html>