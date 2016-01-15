<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<jsp:include page="../Common/topHeader.jsp" />
<body class="J_scroll_fixed">
	<div class="wrap jj">
		<ul class="nav nav-tabs">
			<li class="active"><a href="#">会员资料填写情况</a></li>
		</ul>
		<div class="wrap J_check_wrap">
			<form class="well form-search" method="post"
				action="/admin_post/index.html">
				<div class="search_type cc mb10">
					<div class="mb10">
						<span class="mr20"> 会员名： <input type="text"
							name="textfield2"> 真实姓名： <label> <input
								type="text" name="textfield">
						</label> 所属客服： <input type="text" name="textfield3"> &nbsp;&nbsp;<label>
								<input type="submit" name="Submit2" value="搜索">
						</label> &nbsp;
						</span>
					</div>
				</div>
			</form>
			<form method="post" class="J_ajaxForm" action="#">
				<div class="table_list">
					<table class="table table-hover">
						<thead>
							<tr>
								<th align="center">ID</th>
								<th>用户名</th>
								<th>真实姓名</th>
								<th>基本资料</th>
								<th>联系方式</th>
								<th>单位资料</th>
								<th>财务状况</th>
								<th>房产资料</th>
								<th>联保情况</th>
								<th align="center">操作</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td align="center">238</td>
								<td><a
									href="http://ggmoney.com/newadmin-other-o-menuid-61.shtml">123456789</a></td>
								<td>未填写</td>
								<td>已填写</td>
								<td>未填写</td>
								<td>未填写</td>
								<td>未填写</td>
								<td>未填写</td>
								<td>未填写</td>
								<td align="center"><a href="#" class="J_ajax_del">查看</a></td>
							</tr>
						</tbody>
					</table>
					<div class="pagination">
						222 条记录 5/23 页 <a
							href="/newadmin-user-index-menuid-50.shtml?page=4">上一页</a> <a
							href="http://demo.鼎峰P2P.com/user/oauthadmin/index/p/2.html">下一页</a>
						&nbsp; <a href="/newadmin-user-index-menuid-50.shtml?page=1">&nbsp;1&nbsp;</a>
						&nbsp; <a href="/newadmin-user-index-menuid-50.shtml?page=10">下5页</a>
						<a href="/newadmin-user-index-menuid-50.shtml?page=23">最后一页</a>
					</div>
				</div>
			</form>
		</div>

		<script src="${AdminStatics}/js/common.js"></script>
		<script type="text/javascript">
			$(".nav-tabs li").click(
					function() {
						var index = $(this).index();
						$(this).addClass("active").siblings().removeClass(
								"active");
						$(".J_check_wrap").eq(index).show().siblings(
								".J_check_wrap").hide();
					});
		</script>
</body>
</html>