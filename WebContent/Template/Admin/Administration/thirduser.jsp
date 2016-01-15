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
								<th>来源</th>
								<th>用户名</th>
								<th>头像</th>
								<th>绑定账号</th>
								<th>首次登录时间</th>
								<th>最后登录时间</th>
								<th>最后登录IP</th>
								<th>登录次数</th>
								<th align="center">操作</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td align="center">487</td>
								<td>qq</td>
								<td>森林</td>
								<td><img src="/Template/Admin/index_files/100_006.png" height="25" width="25"></td>
								<td>518</td>
								<td>2015-01-21 11:17:06</td>
								<td>2015-01-21 11:17:06</td>
								<td>123.89.3.37</td>
								<td>1</td>
								<td align="center"><a
									href="#"
									class="J_ajax_del">删除</a></td>
							</tr>
							<tr>
								<td align="center">486</td>
								<td>qq</td>
								<td>BoHai-</td>
								<td><img src="/Template/Admin/index_files/100_014.jpg" height="25" width="25"></td>
								<td>517</td>
								<td>2015-01-21 10:21:48</td>
								<td>2015-01-21 10:21:48</td>
								<td>183.233.130.7</td>
								<td>1</td>
								<td align="center"><a
									href="#"
									class="J_ajax_del">删除</a></td>
							</tr>
							<tr>
								<td align="center">485</td>
								<td>qq</td>
								<td>gitile</td>
								<td><img src="/Template/Admin/index_files/100_002.jpg" height="25" width="25"></td>
								<td>515</td>
								<td>2015-01-21 08:46:05</td>
								<td>2015-01-21 08:46:05</td>
								<td>101.70.122.214</td>
								<td>1</td>
								<td align="center"><a
									href="#"
									class="J_ajax_del">删除</a></td>
							</tr>
						</tbody>
					</table>
					<div class="pagination">
						&nbsp;<span class="current">1</span> <a
							href="http://demo.鼎峰P2P.com/user/oauthadmin/index/p/2.html"> 2</a>
						<a href="http://demo.鼎峰P2P.com/user/oauthadmin/index/p/3.html">
							3</a> <a
							href="http://demo.鼎峰P2P.com/user/oauthadmin/index/p/4.html"> 4</a>
						<a href="http://demo.鼎峰P2P.com/user/oauthadmin/index/p/5.html">
							5</a> <a
							href="http://demo.鼎峰P2P.com/user/oauthadmin/index/p/6.html"> 6</a>
						<span>...</span><a
							href="http://demo.鼎峰P2P.com/user/oauthadmin/index/p/16.html">
							16 </a> <a
							href="http://demo.鼎峰P2P.com/user/oauthadmin/index/p/17.html">
							17 </a> &nbsp;<a
							href="http://demo.鼎峰P2P.com/user/oauthadmin/index/p/2.html">下一页</a>
						<a href="http://demo.鼎峰P2P.com/user/oauthadmin/index/p/17.html">尾页</a>
					</div>
				</div>
			</form>
		</div>
	</div>
	<script src="${AdminStatics}/js/common.js"></script>
	<script> </script>
</body>
</html>