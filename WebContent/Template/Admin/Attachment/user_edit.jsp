<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
<%@ include file="../Common/topHeader.jsp"%>
<body class="J_scroll_fixed">
	<div class="wrap jj">

		<form method="post" class="J_ajaxForm"
			action="${dfn:U('admin/attachment/editUser')}"
			class="form-horizontal J_ajaxForm">
			<div class="common-form cwh">
				 <%-- <table>
					<tr>
						<th width="200" class="control-label">会员名： <input type="hidden" name="id"
							value="${data.id }" />
						</th>
						<td>${dfForm:input( "name", data['name'], dfForm_class, dfForm_style,dfForm_others)}
							<!-- <input type="text"  name="m_type" > --> <!-- <a target="_blank"
									href="user.jsp">egspoon</a> -->
						</td>
					</tr>					
				</table>  --%>
				<img src="${MemberStatics }/download/images/${imageName}">
				
			</div>



		</form>


	</div>
	<%@ include file="../Common/footer.jsp"%>