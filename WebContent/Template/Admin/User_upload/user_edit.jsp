<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
<%@ include file="../Common/topHeader.jsp"%>
<body class="J_scroll_fixed" style="width:700px">
	<div class="wrap jj" >
		<ul class="nav nav-tabs">
			<li class="current"><a href="javascript:;">上传资料审核</a></li>
		
		</ul>
		<form method="post" class="J_ajaxForm"
			action="${dfn:U('admin/user_upload/editUser_upload')}"  >
			<div class="common-form cwh">
				<table>
					<tr>
						<th width="200" class="control-label">是否通过： <input type="hidden" name="id"
							value="${data.id }" />
						</th>
						<td>${dfForm:radio( "status",statusSelect, data['status'], dfForm_class, dfForm_style,dfForm_others)}
							<!-- <input type="text"  name="m_type" > --> <!-- <a target="_blank"
									href="user.jsp">egspoon</a> -->
						</td>
					</tr>
					<tr>
						<th width="200" height="40px" class="control-label">资料类型：</th>
						<td> 
						${egroup[data['type']] }
						<span class="commonToolTip">本人身份证正面（照片或者复印件）</span>
						</td>

					</tr>
					<tr>
						<th width="200" height="40px" class="control-label">处理说明：</th>
							<td><textarea  class="myarea" name="deal_info" id="deal_info">${deal_info}</textarea>
							
						
							<span class="commonToolTip">借款会员才能发布借款</span>

						</td>
					</tr>
					<tr>
						<th>资料详情：</th>
						<td>
						<a target="_blank" href="/uploadData/UserData/72-201504081109115047.jpg">
						<img width="400px" src="/uploadData/UserData/72-201504081109115047.jpg">
						</a>
						</td>
					</tr>
					
				</table>
			</div>
			
			<div class="form-actions" style=" text-align: center;">
				<button type="submit"
					class="btn btn-primary btn_submit  J_ajax_submit_btn">审核</button>
				&nbsp;&nbsp;<a class="btn" id="J_dialog_close" href="javascript:;">关闭</a>
			</div>


		</form>


	</div>
	<%@ include file="../Common/footer.jsp"%>