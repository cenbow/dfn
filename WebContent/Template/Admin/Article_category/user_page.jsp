<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
<%@ include file="../Common/topHeader.jsp"%>
<form method="post" action="${dfn:U('admin/article_category/doEdit_sort_order')}">
	<div class="table_list">
		<table class="table table-hover">
			<thead>
				<tr>
					<th align="center">排序</th>
					<th>CatID</th>
					<th>栏目名称</th>
					<th>栏目类型</th>
					<th>分类唯一标识</th>
					<th>管理操作</th>


				</tr>
			</thead>
			<tbody>
				<c:if test="${not empty list.data }">
					<c:forEach items="${list.data }" var="user">
						<c:set var="thisSortOrder" value="${user.id }#sort#sort_order" />
						<tr id="list_${user.id}">
							<td>
								${dfForm:input( thisSortOrder, user.sort_order, dfForm_class, dfForm_style,dfForm_others)}	
							</td>
							<td align="center">${user.id}</td>
							<td><a href="${dfn:U('home/category/index')}?id=${user.id}" target="_blank">${user.cate_name}</a></td>
							<td>
								
							</td>
							<td>${user.cate_nid}</td>



							<td><a href="${dfn:U('admin/article_category/add_menu')}?id=${user.id}">添加子栏目|
							</a><a
								href="${dfn:U('admin/article_category/edit')}?id=${user.id}">修改|
							</a><a
								href="${dfn:U('admin/article_category/delete')}?id=${user.id}"	class="J_ajax_del">删除</a> &nbsp;&nbsp; </td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
		<%-- <div class="pagination ajaxpagebar" data="include_page" id="page_bar">${list.pageBar}</div> --%>
	</div>
	<div class="form-actions">
							<button type="submit"
							class="btn btn-primary btn_submit  J_ajax_submit_btn">排序</button>
							&nbsp;&nbsp;<a class="btn" href="javascript:;" onClick="window.history.back(-1);return false;">返回</a>
	</div>
</form>
