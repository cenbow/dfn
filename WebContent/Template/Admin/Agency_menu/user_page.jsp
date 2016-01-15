<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
<%@ include file="../Common/topHeader.jsp"%>

<form method="post" class="J_ajaxForm" action="#">
<dfTag:token/>
	<div class="table_list">
		<table class="table table-hover">
			<thead>
				<tr>
					<th align="center">排序</th>
					<th>ID</th>
					<th>菜单英文名称</th>
					<th>状态</th>
					<th>管理操作</th>				
				</tr>
			</thead>
			<tbody>
				<c:if test="${not empty list.data }">
					<c:forEach items="${list.data }" var="user">
						<c:set var="thisSortOrder" value="${user.id }#sort#sort_order" />
						<tr>
							<td>
								${dfForm:input( thisSortOrder, user.sort_order, dfForm_class, dfForm_style,dfForm_others)}	
							</td>
							<td align="center">${user.id}</td>
							<td>${user.name}</td>
							
							<td><c:choose>
									<c:when test="${user.status=='1'}">显示</c:when>
									<c:when test="${user.status=='0'}">不显示</c:when>
								
								</c:choose></td>
							
							<td><a href="${dfn:U('admin/agency_menu/add_menu')}?id=${user.id}"
								> 添加子菜单| </a> &nbsp;&nbsp; <a
								href="${dfn:U('admin/agency_menu/edit')}?id=${user.id}"
								> 修改| </a> &nbsp;&nbsp; <a
						href="${dfn:U('admin/agency_menu/delAgency_menu')}?id=${user.id}"
						class="J_ajax_del">删除</a> &nbsp;&nbsp; </td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
	</div>
	<div class="form-actions">
							<button type="submit"
							class="btn btn-primary btn_submit  J_ajax_submit_btn">排序</button>
							&nbsp;&nbsp;<a class="btn" href="javascript:;" onClick="window.history.back(-1);return false;">返回</a>
	</div>
</form>
<%@ include file="../Common/footer.jsp"%>