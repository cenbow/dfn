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
				<h2 class="df_member_jfh2">我的积分</h2>
				<div class="df_member_jftext">
					<ul>
						<li class="df_member_jftextzw238"><span>累计获取积分</span> <span>1000</span>
						</li>
						<li class="df_member_jftextzw238"><span>可用积分</span> <span
							class="df_member_jftext_curspan">520</span></li>
						<li class="df_member_jftext_brnone df_member_jftextzw238"><span>以用积分</span>
							<span>480</span></li>
					</ul>
				</div>
				<!--  -->
				<div class="df_member_jflist">
					<ul class="df_member_jflistul1 df_member_jslistulbg1">
						<li class="df_member_zw230">发生日期</li>
						<li class="df_member_zw130">影响积分</li>
						<li class="df_member_zw130">剩余积分</li>
						<li class="df_member_zw230">说明</li>
					</ul>

					<c:if test="${not empty list.data }">
						<c:forEach items="${list.data }" var="user">
							<ul class="df_member_jflistul1">
								<li class="df_member_zw230">${user.add_time}</li>
								<li class="df_member_zw130  df_member_jftext_curspan">${user.affect_credits}</li>
								<li class="df_member_zw130">${user.credits}</li>
								<li class="df_member_zw230">${user.info}</li>
							</ul>
						</c:forEach>
					</c:if>
				</div>
				<!--  -->
				<div class="df_member_jfjlcon">
					<h2 class="df_member_jfjlconh2">
						<span>积分兑换记录</span> <a href="">查看积分兑换产品</a>
					</h2>
					<div class="df_member_jfjllist">
						<ul class="df_member_jflistul1 df_member_jslistulbg1">
							<li class="df_member_zw170">兑换时间</li>
							<li class="df_member_zw110">兑换数量</li>
							<li class="df_member_zw110">兑换商品</li>
							<li class="df_member_zw110">消耗积分</li>
							<li class="df_member_zw110">消耗金额</li>
							<li class="df_member_zw110">兑换状态</li>
						</ul>
						<c:if test="${not empty list.data }">
							<c:forEach items="${list.data }" var="user">
								<ul class="df_member_jflistul1 ">
									<li class="df_member_zw170">${user.add_time}</li>
									<li class="df_member_zw110">${user.amount}</li>
									<li class="df_member_zw110">${user.gods}</li>
									<li class="df_member_zw110">${user.fee}</li>
									<li class="df_member_zw110">${user.money}</li>
									<li class="df_member_zw110">${user.status}</li>
								</ul>
							</c:forEach>
						</c:if>
					</div>
				</div>
				<!--  -->
				<div class="df_member_hqjf">
					<h3>如何快速获取积分？</h3>
					<P>1.邮箱验证 通过邮箱验证，即可一次性获得1000积分。</P>
					<P>2.实名验证 通过邮箱验证，即可一次性获得1000积分。</P>
					<P>3.手机验证 通过邮箱验证，即可一次性获得1000积分。</P>
					<P>1.邮箱验证 通过邮箱验证，即可一次性获得1000积分。</P>
					<P>1.邮箱验证 通过邮箱验证，即可一次性获得1000积分。</P>
					<P>1.邮箱验证 通过邮箱验证，即可一次性获得1000积分。</P>
					<P>1.邮箱验证 通过邮箱验证，即可一次性获得1000积分。</P>
				</div>


			</div>
			<!--df_member_content_r  END-->

		</div>

	</div>
	<!--df_member_main  END-->
<%@ include file="../Common/footer.jsp"%>
