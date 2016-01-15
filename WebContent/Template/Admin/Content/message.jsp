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
		<ul class="nav nav-tabs">
			<li class="active"><a
				href="http://demo.鼎峰P2P.com/api/guestbookadmin/index.html">所有留言</a></li>
		</ul>
		<div class="common-form">
			<form method="post" class="J_ajaxForm" action="#">
				<div class="table_list">
					<table class="table table-hover" width="100%">
						<thead>
							<tr>
								<th width="50">ID</th>
								<th>姓名</th>
								<th>邮箱</th>
								<th>留言标题</th>
								<th>留言内容</th>
								<th>留言时间</th>
								<th width="120">操作</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>26</td>
								<td>1111</td>
								<td>admin@yunjixian.com</td>
								<td></td>
								<td>11111111</td>
								<td>2015-01-25 09:48:34</td>
								<td><a
									href="http://demo.鼎峰P2P.com/api/guestbookadmin/delete/id/26.html"
									class="J_ajax_del">删除</a></td>
							</tr>
							<tr>
								<td>25</td>
								<td>1111</td>
								<td>111@11.com</td>
								<td></td>
								<td>2123213</td>
								<td>2015-01-24 09:28:01</td>
								<td><a
									href="http://demo.鼎峰P2P.com/api/guestbookadmin/delete/id/25.html"
									class="J_ajax_del">删除</a></td>
							</tr>
							<tr>
								<td>24</td>
								<td>sdfasdf</td>
								<td>asdfasdf@163.com</td>
								<td></td>
								<td>asdfsdaf</td>
								<td>2015-01-23 15:47:47</td>
								<td><a
									href="http://demo.鼎峰P2P.com/api/guestbookadmin/delete/id/24.html"
									class="J_ajax_del">删除</a></td>
							</tr>
							<tr>
								<td>23</td>
								<td>都是</td>
								<td>ds@126.com</td>
								<td></td>
								<td>第三方</td>
								<td>2015-01-21 13:39:03</td>
								<td><a
									href="http://demo.鼎峰P2P.com/api/guestbookadmin/delete/id/23.html"
									class="J_ajax_del">删除</a></td>
							</tr>
							<tr>
								<td>22</td>
								<td>sss</td>
								<td>333@qq.com</td>
								<td></td>
								<td>dddd</td>
								<td>2015-01-16 18:27:02</td>
								<td><a
									href="http://demo.鼎峰P2P.com/api/guestbookadmin/delete/id/22.html"
									class="J_ajax_del">删除</a></td>
							</tr>
							<tr>
								<td>21</td>
								<td>esuo</td>
								<td>esuo@163.com</td>
								<td></td>
								<td>esuo.cn,diame.cn</td>
								<td>2015-01-10 15:58:13</td>
								<td><a
									href="http://demo.鼎峰P2P.com/api/guestbookadmin/delete/id/21.html"
									class="J_ajax_del">删除</a></td>
							</tr>
							<tr>
								<td>20</td>
								<td>李章云</td>
								<td>soltic@qq.com</td>
								<td></td>
								<td>散打的</td>
								<td>2015-01-07 16:02:22</td>
								<td><a
									href="http://demo.鼎峰P2P.com/api/guestbookadmin/delete/id/20.html"
									class="J_ajax_del">删除</a></td>
							</tr>
							<tr>
								<td>19</td>
								<td>aa</td>
								<td>aa@a.com</td>
								<td></td>
								<td>sadas</td>
								<td>2014-12-28 15:28:12</td>
								<td><a
									href="http://demo.鼎峰P2P.com/api/guestbookadmin/delete/id/19.html"
									class="J_ajax_del">删除</a></td>
							</tr>
							<tr>
								<td>18</td>
								<td>儿童</td>
								<td>154@qq.com</td>
								<td></td>
								<td>test</td>
								<td>2014-12-28 12:29:36</td>
								<td><a
									href="http://demo.鼎峰P2P.com/api/guestbookadmin/delete/id/18.html"
									class="J_ajax_del">删除</a></td>
							</tr>
							<tr>
								<td>17</td>
								<td>Zeng</td>
								<td>zxxjjforever@163.com</td>
								<td></td>
								<td>daf</td>
								<td>2014-12-28 10:52:46</td>
								<td><a
									href="http://demo.鼎峰P2P.com/api/guestbookadmin/delete/id/17.html"
									class="J_ajax_del">删除</a></td>
							</tr>
							<tr>
								<td>16</td>
								<td>Dean</td>
								<td>zxxjjforever@163.com</td>
								<td></td>
								<td>dd</td>
								<td>2014-12-28 10:52:09</td>
								<td><a
									href="http://demo.鼎峰P2P.com/api/guestbookadmin/delete/id/16.html"
									class="J_ajax_del">删除</a></td>
							</tr>
							<tr>
								<td>15</td>
								<td>test</td>
								<td>zxxjjforever@163.com</td>
								<td></td>
								<td>adf</td>
								<td>2014-12-28 10:50:05</td>
								<td><a
									href="http://demo.鼎峰P2P.com/api/guestbookadmin/delete/id/15.html"
									class="J_ajax_del">删除</a></td>
							</tr>
							<tr>
								<td>14</td>
								<td>blackeye</td>
								<td>blackeyemm@163.com</td>
								<td></td>
								<td>我来试试吧~</td>
								<td>2014-12-22 16:18:19</td>
								<td><a
									href="http://demo.鼎峰P2P.com/api/guestbookadmin/delete/id/14.html"
									class="J_ajax_del">删除</a></td>
							</tr>
							<tr>
								<td>13</td>
								<td>my name</td>
								<td>1317010768@qq.com</td>
								<td></td>
								<td>我在这</td>
								<td>2014-12-22 15:38:30</td>
								<td><a
									href="http://demo.鼎峰P2P.com/api/guestbookadmin/delete/id/13.html"
									class="J_ajax_del">删除</a></td>
							</tr>
							<tr>
								<td>12</td>
								<td>11</td>
								<td>222@qq.com</td>
								<td></td>
								<td>3</td>
								<td>2014-12-01 00:34:02</td>
								<td><a
									href="http://demo.鼎峰P2P.com/api/guestbookadmin/delete/id/12.html"
									class="J_ajax_del">删除</a></td>
							</tr>
							<tr>
								<td>11</td>
								<td>sadasas</td>
								<td>ghfghfghsadassad@qq.com</td>
								<td></td>
								<td>sadasdsaas</td>
								<td>2014-11-24 14:51:24</td>
								<td><a
									href="http://demo.鼎峰P2P.com/api/guestbookadmin/delete/id/11.html"
									class="J_ajax_del">删除</a></td>
							</tr>
							<tr>
								<td>10</td>
								<td>123</td>
								<td>7944324@qq.com</td>
								<td></td>
								<td>123</td>
								<td>2014-11-18 17:45:12</td>
								<td><a
									href="http://demo.鼎峰P2P.com/api/guestbookadmin/delete/id/10.html"
									class="J_ajax_del">删除</a></td>
							</tr>
							<tr>
								<td>9</td>
								<td>ttt</td>
								<td>zxxjjforever@qq.com</td>
								<td></td>
								<td>ggggggjjjjjjiiiiiiiytws</td>
								<td>2014-11-15 06:27:58</td>
								<td><a
									href="http://demo.鼎峰P2P.com/api/guestbookadmin/delete/id/9.html"
									class="J_ajax_del">删除</a></td>
							</tr>
							<tr>
								<td>8</td>
								<td>b</td>
								<td>c@fe.com</td>
								<td></td>
								<td>a</td>
								<td>2014-11-13 13:48:28</td>
								<td><a
									href="http://demo.鼎峰P2P.com/api/guestbookadmin/delete/id/8.html"
									class="J_ajax_del">删除</a></td>
							</tr>
							<tr>
								<td>7</td>
								<td>林先生</td>
								<td>1013054837@qq.com</td>
								<td></td>
								<td>看下能做什么</td>
								<td>2014-11-11 12:04:29</td>
								<td><a
									href="http://demo.鼎峰P2P.com/api/guestbookadmin/delete/id/7.html"
									class="J_ajax_del">删除</a></td>
							</tr>
						</tbody>
					</table>
					<div class="pagination">
						&nbsp;<span class="current">1</span> <a
							href="http://demo.鼎峰P2P.com/api/guestbookadmin/index/p/2.html">
							2</a> &nbsp;<a
							href="http://demo.鼎峰P2P.com/api/guestbookadmin/index/p/2.html">下一页</a>
						<a
							href="http://demo.鼎峰P2P.com/api/guestbookadmin/index/p/2.html">尾页</a>
					</div>
				</div>
			</form>
		</div>
	</div>
	<script src="${AdminStatics}/js/common.js"></script>
</body>
</html>