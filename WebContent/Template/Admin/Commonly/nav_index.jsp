<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../Common/topHeader.jsp"%>
<%@ page import="java.util.*"%>
<body class="J_scroll_fixed">
	<div class="wrap jj">
		<ul class="nav nav-tabs">
			<li class="active"><a href="#">前台导航设置</a></li>
			<li><a href="#">添加导航</a></li>
		</ul>

		<div class="common-form">	
					<div class="table_list">
						<table class="table table-hover" width="100%">
							<thead>
								<tr>
									 <td align="center">排序</td>
            <td align="center">ID</td>
            <td align="center">显示名称</td>
            <td align="center">是否显示</td>
            <td align="center">是否新窗口打开</td>
            <td align="center">链接</td>
            <td align="center">管理操作</td>

								</tr>
							</thead>
						 <tr id='list_1'>
	<td align='center'><input name='sort_order[1]' type='text' size='3' value='10' class='input'></td>
	<td align='center'>1</td>
	<td align="center" >首页</td>
	<td align="center" >显示</td>
	<td align="center" >否</td>
	<td align="center" >/</td>
	<td align='center'><a href="javascript:;" onClick="dialogUrl('/newadmin-nav-add-id-1-menuid-141.shtml','添加子菜单','','',350)">添加子菜单</a> | <a href="javascript:;" onClick="dialogUrl('/newadmin-nav-edit-id-1-menuid-141.shtml','修改','','',350)">修改</a> | <a class="J_ajax_del" href="/newadmin-nav-delete-id-1-menuid-141.shtml">删除</a> </td>
	</tr>

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
				
			
		</div>
		
		<div style="display: none;" class="common-form">
			<form class="form-horizontal J_ajaxForm" name="myform" id="myform"
				action="/newadmin-Article-doadd" method="post">
				<div class="tab-content">
					<div class="control-group">
					<jsp:include page="../Commonly/nav_add.jsp"/>
					</div>
				</div>

			</form>
		</div>
</div>


	<script src="${AdminStatics}/js/common.js"></script>
	<script type="text/javascript">
		$(".nav-tabs li").click(function() {
			var index = $(this).index();
			$(this).addClass("active").siblings().removeClass("active");
			$(".common-form").eq(index).show().siblings(".common-form").hide();
		});
	</script>

	<script type="text/javascript">
		var dialogCallBack = function() {
			var iframeName = $(".aui_content").find("iframe").attr("name");
			$(".J_ajaxForm", window.frames[iframeName].document).submit();
			return false;

		}
	</script>
	<script type="text/javascript"
		src="${AdminStatics}/js/content_addtop.js"></script>
	<script src="${AdminStatics}/js/common.js?v"></script>

</body>
</html>