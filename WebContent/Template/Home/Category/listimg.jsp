<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
<%@ include file="../Common/headerMeta.jsp"%>
<title>${data.cate_name}</title>
<meta name="keywords" content="${data.keywords}">
<meta name="description" content="${data.description}">
<style>
.hc_con_r ul{}
.hc_con_r ul li{ height:110px; margin:20px 0; border-bottom:1px solid #f1f1f1;}
.hc_con_r ul li img{float:left;}
.hc_con_r ul li p{float:left; width:550px;font-size:14px;}
.hc_con_r ul li p a{}
.hc_con_r ul li p a:hover{color:#69c1ff; text-decoration:underline;}

.hc_con_r ul li p.report_title{font-size:20px;color:#555555; height:20px; line-height:20px; margin-bottom:10px;}
.hc_con_r ul li p.report_content{color:#666666; line-height:20px;}
.hc_con_r ul li p.report_time{color:#aaaaaa;}
</style>
<%@ include file="../Common/headerBody.jsp"%>
<!-- end top  -->
<!-- curpage start -->
<div class="hc_curpage_wper">
	   <div class="hc_curpage px1000 pt">
	   	      <a href="${_WEB_ROOT_}/">融友网</a><span>></span><a href="javascript:;" class="curpage_ftcolor1">${data.cate_name}</a>
	   </div>
</div>
<!-- end curpage -->
<div class="hc_content_wper " style="border-bottom:2px solid #69c1ff;padding-bottom:50px;">
	   <div class="hc_content px1000">
	   	        <div class="hc_con_l fl mr35">
	   	        	     <h2  class="hc_l_tit">${data.cate_name}</h2>
	   	        	     <ul class="hc_l_text">
				<c:if test="${not empty categoryList }">
					<c:forEach items="${categoryList }" var="cate">
	   	        	     	<li><a href="${cate.url}" <c:if test="${cate.id == data.id}">class="lt_cur"</c:if>>${cate.cate_name}</a></li>
					</c:forEach>
				</c:if>
	   	        	     </ul>
	   	        </div>
	   	        <!-- end left -->
	   	        <div class="hc_con_r fl ">
               	<h1 class="hc_con_rtit">${data.cate_name}</h1>
                <ul class="category_list">
				<c:if test="${not empty artList.list }">
					<c:forEach items="${artList.list }" var="cate">
                       <li>
                       <img src="${dfn:getThumbImgUrl(cate['thumburl'])}" width="176px" height="95px" />
                       <p class="report_title"><a href="${cate.url}">${cate.title}</a></p>
                       <p class="report_content"><a href="${cate.url}">${cate.description}</a></p>
                       <p class="report_time">${cate.add_time}</p>
                       </li>
					</c:forEach>
				</c:if>
                </ul>
                <ul>${artList.pageBar}</ul>
	   	        </div>
	   	        <!-- end rigth -->
	   </div>
</div>

<script type="text/javascript">
	$(function()
	{   
		
		  $(".hc_l_text li a").mouseover(function()
		 {  
		 	
		 	$(".hc_l_text li a").removeClass("lt_cur");
		    $(this).addClass("lt_cur");
		 })
	})
</script>
<%@ include file="../Common/footer.jsp"%>