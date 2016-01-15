<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
<%@ include file="../Common/headerMeta.jsp"%>
<title>会员中心</title>
<!-- top start -->
<%@ include file="../Common/headerBody.jsp"%>
	<!--df_member_main  START-->
	<div class="df_member_main">

		<div class="df_member_main_in clearFix">
			<div class="df_member_subMenu">
				<div class="df_member_subMenu_title">会员中心</div>
				
				
				<ul class="df_member_submenu_content">
					<li class="df_member_current df_member_current_1">
						<h3>
							<a href="javascript:;">资产管理</a>
						</h3>
						<ul class="df_member_submenu_ul">
							<li ><a href="${dfn:U('member/capital/index')}">资产统计</a></li>
						</ul>
					 </li>
					<li class="df_member_current df_member_current_2">
						<h3>
							<a href="javascript:;">投资管理</a>
						</h3>
						<ul class="df_member_submenu_ul">
							
							<li ><a href="${dfn:U('member/myinvest/index')}">我的投资</a></li>
							<li><a href="${dfn:U('member/mytransfer/index')}">我的债权转让</a></li>
						</ul>
					</li>
					<li class="df_member_current df_member_current_3">
						<h3>
							<a href="javascript:;">借款管理</a>
						</h3>
						<ul class="df_member_submenu_ul">
							<li><a href="${dfn:U('member/myborrow/index')}">借款总表</a></li>
						</ul>
					</li>
					<li class="df_member_current df_member_current_4">
						<h3>
							<a href="javascript:;">推广奖励</a>
						</h3>
						<ul class="df_member_submenu_ul">
							<li ><a href="${dfn:U('member/promote/index')}">我的奖励金</a></li>
							<li><a href="${dfn:U('member/credit/index')}">积分记录</a></li>
						</ul>
					</li>
					<li class="df_member_current df_member_current_5">
						<h3>
							<a href="javascript:;">消息管理</a>
						</h3>
						<ul class="df_member_submenu_ul">
							<li><a href="${dfn:U('member/sitemsg/index')}">我的消息</a></li>
						</ul>
					</li>
					<li class="df_member_current df_member_current_6">
						<h3>
							<a href="javascript:;">账户管理</a>
						</h3>
						<ul class="df_member_submenu_ul">
							<li><a href="${dfn:U('member/recharge/index')}">在线充值</a></li>
							<li><a href="${dfn:U('member/bank/index')}">银行账号</a></li>
						</ul>
					</li>
			
				</ul>
			</div>


		
	<!--df_member_main  END-->
			<div id="ajaxPage" >
				<jsp:include page="../${empty menuName?'Capital':menuName }/index.jsp" />
			</div>

		</div>
</div>

<script type="text/javascript">
	
	$(function() {
		$(".df_member_submenu_content li h3").click(
				function() {
					$(this).parent("li").addClass("current").siblings("li")
							.removeClass("current")
					$(this).siblings("ul.df_member_submenu_ul").slideToggle();
					if ($(".df_member_submenu_content li.df_member_current")
							.hasClass("current")) {
						$(this).parent("li.df_member_current").siblings(
								"li.df_member_current").find(
								"ul.df_member_submenu_ul").hide();
					}
				});
		$(".df_member_submenu_ul li").live("click",
				function() {
					$(this).addClass("current").siblings("li").removeClass(
							"current").parent("ul.df_member_submenu_ul ")
							.parent("li.df_member_current").siblings(
									"li.df_member_current").find(
									".df_member_submenu_ul li").removeClass(
									"current");
					var $thisA = $(this).children("a");
					var url = $thisA.attr("href");
					$.get(url,function(data){
						$("#ajaxPage").html(data);
					});
					return false; 
				});
		

	})
</script>
<%@ include file="../Common/footer.jsp"%>