<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
<%@ include file="../Common/headerMeta.jsp"%>
<title>我的投资</title>
<!-- top start -->
<%@ include file="../Common/headerBody.jsp"%>
	<!--df_member_main  START-->
	<%@ include file="../Common/left.jsp"%>
	<!--df_member_content_r  START-->
			<div class="df_member_content_r">
				<h2 class="df_member_jfh2">我的奖励金</h2>
				<div class="df_member_jftext">
					<ul>
						<li class="df_member_jftextzw178"><span>累计获取奖励金</span> <span>300</span>
						</li>
						<li class="df_member_jftextzw178"><span>可用奖励金</span> <span
							class="df_member_jftext_curspan">300</span></li>
						<li class="df_member_jftextzw178"><span>已用奖励金</span> <span
							class="df_member_jftext_curspan">300</span></li>
						<li class="df_member_jftext_brnone df_member_jftextzw178"><span>过期奖励金</span>
							<span>100</span></li>
					</ul>
				</div>
				<!--  -->
				<div class="df_member_tjid">
					<div class="df_member_tjidleft">
						<h4>推荐ID号</h4>
						<div class="df_member_tjidlcon">
							<span class="df_member_tjidlconspan1">34</span>
							<div class="df_member_tjidcontext">邀请朋友来注册，投资，注册时填写您的推荐ID.</div>

						</div>
						<a href="" class="df_member_tjidbtn">复制ID号</a>
					</div>
					<div class="df_member_tjidleft">
						<h4>推广链接邀请</h4>
						<div class="df_member_tjidlcon">
							<span class="df_member_tjidlconspan2">http://www.xxx.com</span>
							<div class="df_member_tjidcontext" style="line-height: 40px;">复制推广链接，邀请朋友来投资</div>

						</div>
						<a href="" class="df_member_tjidbtn">复制ID号</a>
					</div>
				</div>
				<!--  -->
				<div class="df_member_awtip">
					<h5>温馨提示:</h5>
					<p>1.被推荐人注册后，奖励金即刻生效；</p>
					<p>2.推荐奖励金无上限，推荐越多，奖励越多；</p>
					<p>3.推荐奖励金具有有效期，在有效期内可以投资任意标的；</p>
					<p>4.请不要随意邀请您不熟悉的人，避免给别人带来不必要的困扰；</p>
					<p>5.使用过程遇到问题，请联系客服，40000-10068</p>
				</div>
				<!--  -->
				<div class="df_member_jfjlcon">
					<h2 class="df_member_jfjlconh2">
						<span>推广记录</span>

					</h2>

					<div class="df_member_jfjllist">
						<ul class="df_member_jflistul1 df_member_jslistulbg1">
							<li class="df_member_zw170">会员名</li>
							<li class="df_member_zw110">注册时间</li>
							<li class="df_member_zw110">是否完成注册</li>
							<li class="df_member_zw110">推荐类型</li>
							<li class="df_member_zw110">推荐时间</li>
							<li class="df_member_zw110">奖励金额</li>
						</ul>


						<%-- <c:if test="${not empty list.data }">
					<c:forEach items="${list.data }" var="user">
 --%>
						<ul class="df_member_jflistul1 ">

							<li class="df_member_zw170">${user.username}</li>


							<li class="df_member_zw110">${user.reg_time}</li>

							<li class="df_member_zw110">${user.get_back}</li>
							<li class="df_member_zw110">${user.type}</li>
							<li class="df_member_zw110">${user.add_time}</li>

							<li class="df_member_zw110">${user.award_money}</li>

						</ul>

						<%-- </c:forEach>
				</c:if> --%>
					</div>

					<!--  -->
				<!--df_member_content_r  END-->
                </div>
                </div>
<%@ include file="../Common/footer.jsp"%>
