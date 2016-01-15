<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
<%@ include file="../Common/headerMeta.jsp"%>
<title>${data.cate_name}_融友网</title>
<meta name="keywords" content="${data.keywords}">
<meta name="description" content="${data.description}">


<!-- top start -->
<%@ include file="../Common/headerBody.jsp"%>
<!-- end top  -->
<!-- curpage start -->
<div class="hc_curpage_wper">
	   <div class="hc_curpage px1000 pt">
	   	      <a href="${_WEB_ROOT_}/">融友网</a><span>></span><a href="">帮助中心</a><span>></span><a href="" class="curpage_ftcolor1">${data.cate_name}</a>
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
	   	        	 ${data.content}
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
<script type="text/javascript">
	$(function()
	{
		 $(".hc_cz_qustit").click(function()
		 {
		 	 if($(this).hasClass("bgcolor1"))
		 	 {   
                 $(this).find("span").css({"background-color":"#69c1ff"}).html("+").end().parents(".hc_cz").find(".hc_cz_qustext").hide().end().find(".hc_cz_qustit").removeClass("bgcolor1");
		 	 }else
		 	 {
                 $(this).parents(".hc_con_r_box").find("span").html("+").css({"background-color":"#69c1ff"}).end().find(".hc_cz_qustext").hide().end().find(".hc_cz_qustit").removeClass("bgcolor1");
                 $(this).find("span").css({"background-color":"#dcdcdc"}).html("-").end().parents(".hc_cz").find(".hc_cz_qustext").show().end().find(".hc_cz_qustit").addClass("bgcolor1");
		 	 }
		 })
	})
</script>
<%@ include file="../Common/footer.jsp"%>