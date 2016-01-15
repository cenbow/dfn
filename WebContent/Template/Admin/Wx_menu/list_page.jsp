<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
<%@ include file="../Common/topHeader.jsp"%>

<%
	request.setAttribute("dfForm_style", "width:30px;");
%>
<form action="${dfn:U('admin/wx_menu/doEdit_sort_order')}" method= "post" class="form-horizontal J_ajaxForm">
	<div class="table_list">
		<table class="table table-hover">
			<thead>
				<tr>
					<th align="center">排序</th>
					<th>ID</th>
					<th>菜单名称</th>
					<th>类型</th>
					<th>内容</th>
					<th>管理操作</th>

				</tr>
			</thead>
			<tbody>
				<c:if test="${not empty list.data }">
					<c:forEach items="${list.data }" var="user">
						<c:set var="thisSortOrder" value="${user.id }#sort#sort_order" />
						<tr id="list_${user.id}">
							<td align="center">
								${dfForm:input( thisSortOrder, user.sort_order, dfForm_class, dfForm_style,dfForm_others)}
							</td>
							<td >${user.id}</td>
							<td >${user.name}</td>
							<td >${typeSelect[user.type]}</td>
							<td >${user.content}</td>
							<td><a
								href="${dfn:U('admin/wx_menu/add_menu')}?id=${user.id}">
									添加子菜单 </a> &nbsp;&nbsp; <a
								href="${dfn:U('admin/wx_menu/edit_page')}?id=${user.id}">
									修改 </a> &nbsp;&nbsp;   <a
								href="${dfn:U('admin/wx_menu/deleteMenu')}?id=${user.id}"
								class="J_ajax_del">删除</a> &nbsp;&nbsp;  </td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
		<%-- <div class="pagination ajaxpagebar" data="include_page" id="page_bar">${list.pageBar}</div> --%>
	</div>
	<div class="form-actions">
							<button type="submit"		class="btn btn-primary btn_submit  J_ajax_submit_btn">排序</button>
                            <a class="btn" href="javascript:;" onClick="sendMenu();return false;">同步到微信</a>
	</div>
</form>
<script type="text/javascript">
var tbz=false;
function sendMenu(){
	if(tbz==true){
		return false;	
	}
	tbz=true;
	$.get("${dfn:SU(_thisUrl_,'sendMenu')}",{},function(d){
		tbz=false;
		if(d.state=="success") alert("成功");
		else alert("失败");
	},'json');
}
</script>

<%@ include file="../Common/footer.jsp"%>