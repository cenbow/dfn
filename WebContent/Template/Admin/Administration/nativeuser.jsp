<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:include page="../Common/topHeader.jsp"/>
<body class="J_scroll_fixed">
	<div class="" style="display: none; position: absolute;">
		<div class="aui_outer">
			<table class="aui_border">
				<tbody>
					<tr>
						<td class="aui_nw"></td>
						<td class="aui_n"></td>
						<td class="aui_ne"></td>
					</tr>
					<tr>
						<td class="aui_w"></td>
						<td class="aui_c"><div class="aui_inner">
								<table class="aui_dialog">
									<tbody>
										<tr>
											<td colspan="2" class="aui_header"><div class="aui_titleBar">
													<div style="cursor: move;" class="aui_title"></div>
													<a class="aui_close" href="javascript:/*artDialog*/;">×</a>
												</div></td>
										</tr>
										<tr>
											<td style="display: none;" class="aui_icon"><div
													style="background: none repeat scroll 0% 0% transparent;"
													class="aui_iconBg"></div></td>
											<td style="width: auto; height: auto;" class="aui_main"><div
													style="padding: 20px 25px;" class="aui_content"></div></td>
										</tr>
										<tr>
											<td colspan="2" class="aui_footer"><div
													style="display: none;" class="aui_buttons"></div></td>
										</tr>
									</tbody>
								</table>
							</div></td>
						<td class="aui_e"></td>
					</tr>
					<tr>
						<td class="aui_sw"></td>
						<td class="aui_s"></td>
						<td style="cursor: se-resize;" class="aui_se"></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<div class="wrap jj">
		<div class="common-form">
			<form method="post" class="J_ajaxForm" action="#">
				<div class="table_list">
					<table class="table table-hover">
						<thead>
							<tr>
								<th align="center">ID</th>
								<th>用户名</th>
								<th>昵称</th>
								<th>头像</th>
								<th>E-mail</th>
								<th>注册时间</th>
								<th>最后登录时间</th>
								<th>最后登录IP</th>
								<th>状态</th>
								<th align="center">操作</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td align="center">527</td>
								<td>第三方用户</td>
								<td>好吧，我就叫于小布。。。</td>
								<td><img src="index_files/527.jpg" height="25" width="25"></td>
								<td></td>
								<td>2015-01-22 21:49:31</td>
								<td>2015-01-22 21:49:31</td>
								<td>124.205.52.152</td>
								<td>正常</td>
								<td align="center"><a
									href="#"
									class="J_ajax_dialog_btn" data-msg="您确定要拉黑此用户吗？">拉黑</a>| <a
									href="#"
									class="J_ajax_dialog_btn" data-msg="您确定要启用此用户吗？">启用</a></td>
							</tr>
							<tr>
								<td align="center">526</td>
								<td>第三方用户</td>
								<td>新农民</td>
								<td><img src="index_files/526.jpg" height="25" width="25"></td>
								<td></td>
								<td>2015-01-22 20:15:51</td>
								<td>2015-01-22 20:15:51</td>
								<td>118.205.183.171</td>
								<td>正常</td>
								<td align="center"><a
									href="#"
									class="J_ajax_dialog_btn" data-msg="您确定要拉黑此用户吗？">拉黑</a>| <a
									href="#"
									class="J_ajax_dialog_btn" data-msg="您确定要启用此用户吗？">启用</a></td>
							</tr>
							<tr>
								<td align="center">525</td>
								<td>silencehym</td>
								<td>silencehym</td>
								<td><img src="index_files/525.png" height="25" width="25"></td>
								<td>silencehym@163.com</td>
								<td>2015-01-22 15:14:55</td>
								<td>2015-01-22 15:14:55</td>
								<td>183.189.140.84</td>
								<td>正常</td>
								<td align="center"><a
									href="#"
									class="J_ajax_dialog_btn" data-msg="您确定要拉黑此用户吗？">拉黑</a>| <a
									href="#"
									class="J_ajax_dialog_btn" data-msg="您确定要启用此用户吗？">启用</a></td>
							</tr>
						</tbody>
					</table>
					<div class="pagination">
						&nbsp;<span class="current">1</span> <a
							href="http://demo.鼎峰P2P.com/user/indexadmin/index/p/2.html"> 2</a>
						<a href="http://demo.鼎峰P2P.com/user/indexadmin/index/p/3.html">
							3</a> <a
							href="http://demo.鼎峰P2P.com/user/indexadmin/index/p/4.html"> 4</a>
						<a href="http://demo.鼎峰P2P.com/user/indexadmin/index/p/5.html">
							5</a> <a
							href="http://demo.鼎峰P2P.com/user/indexadmin/index/p/6.html"> 6</a>
						<span>...</span><a
							href="http://demo.鼎峰P2P.com/user/indexadmin/index/p/26.html">
							26 </a> <a
							href="http://demo.鼎峰P2P.com/user/indexadmin/index/p/27.html">
							27 </a> &nbsp;<a
							href="http://demo.鼎峰P2P.com/user/indexadmin/index/p/2.html">下一页</a>
						<a href="http://demo.鼎峰P2P.com/user/indexadmin/index/p/27.html">尾页</a>
					</div>
				</div>
			</form>
		</div>
	</div>
	<script src="${AdminStatics}/js/common.js"></script>
	<script> </script>
</body>
</html>