<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
<%@ include file="../Common/topHeader.jsp"%>
<body class="J_scroll_fixed">
	<div class="wrap jj">
		<ul class="nav nav-tabs">
			<li class="active"><a href="${dfn:U('admin/cache_bank/index')}">提现银行设置</a></li>
		</ul>
	<form action="${dfn:U('admin/cache_bank/editCache_bank')}" method="post">
		<dfTag:token />
		<div class="table_list">
			<table class="table table-hover" id = "area_list">
				<thead>
					<tr>
						<th align="center">序号</th>
						<th>银行名称</th>
						
						<th>操作</th>

					</tr>
				</thead>
				<tbody>
					<c:if test="${not empty data }">
					 <c:forEach items="${data['bank']}"  var="user" varStatus="status" >
						 <tr overstyle="on" id="bank_${user['value']['key']}" >
							<td  align="center">
								${user['value']['key']}
								<input type="hidden" name="bank[${user['value']['key']}][key]" value="${user['value']['key']}" />
								<c:if test="${status.last }">
									<c:set value="${user['value']['key']}" var = "id" />
								</c:if>
							</td>
							<td><input type="text" style="width: 100px" class="input"
								name="bank[${user['value']['key']}][name]" value="${user['value'] ['name']}" /></td>
							 
	
							<td> <a
								href="javascript:;" onclick="delx(${user['value']['key']});">删除</a> &nbsp;&nbsp; 
							</td>
						</tr>
					</c:forEach> 
				</c:if>
				</tbody>
			</table>
			 <input type="hidden" id="xss" value="${id}" />	
			<button class="btn" style="margin-top: 5px"
				onClick="addone();return false;">添加一个级别</button>
		</div>
		
			<div class="form-actions">
						<button type="submit"
							class="btn btn-primary btn_submit  J_ajax_submit_btn">保存</button>
						&nbsp;&nbsp;<a class="btn" href="javascript:;"
							onClick="window.history.back(-1);return false;">返回</a>
			</div>
		</form>
	</div>
	<script type="text/javascript"> 
	var xss = $("#xss").val();
	if (xss == undefined)
		xss = 0;
	function addone(){
		xss++;
		var htmladd = '<tr overstyle="on" id="bank_'+xss+'" >';
			htmladd += '<td align="center" >'+xss+'<input type="hidden" class="input" style="width:100px" name="bank['+xss+'][key]" value="'+xss+'" /></td>';
			htmladd += '<td><input type="text" class="input" style="width:100px" name="bank['+xss+'][name]"  /></td>';
			htmladd += '<td><a href="javascript:void(0);" onclick="delx('+xss+');">删除</a></td>';
			htmladd += '</tr>';	
		$(htmladd).appendTo("#area_list");
	}
	function delx(id){
		if(confirm("删除后不可恢复，并且删除完要确定保存后才会生产，确定要删除吗?")) $("#bank_"+id).remove();
	}
</script>
	<%@ include file="../Common/footer.jsp"%>