<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
<%@ include file="../Common/topHeader.jsp"%>
<body class="J_scroll_fixed">
	<div class="wrap jj">
		<ul class="nav nav-tabs">
			<li class="active"><a href="${dfn:U('admin/cache_level/index')}">会员级别配置</a></li>
		</ul>
<form action="${dfn:U('admin/cache_level/editCache_level')}" method="post" class="form-horizontal J_ajaxForm">
	<dfTag:token />
		<div class="table_list">
			<table id="area_list" class="table table-hover">
				<thead>
					<tr>
						<th align="center">序号</th>
						<th>级别名称</th>
						<th>级别加息（年化）</th>
						<th>封顶总利率（年化）</th>
						<th>级别利息管理费率(百分比)</th>
						<th>级别图标名称</th>
						<th>图标显示</th>
						<th>操作</th>

					</tr>
				</thead>
				<tbody >
			
					<c:if test="${not empty data }">
					 <c:forEach items="${data['level']}"  var="user" varStatus="status" >
						 <tr overstyle="on" id="list_${user['value']['key']}" >
							<td  align="center">
								${user['value']['key']}
								<input type="hidden" name="level[${user['value']['key']}][key]" value="${user['value']['key']}" />
								<c:if test="${status.last }">
									<c:set value="${user['value']['key']}" var = "id" />
								</c:if>
							</td>
							<td><input type="text" style="width: 100px" class="input"
								name="level[${user['value']['key']}][name]" value="${user['value'] ['name']}" /></td>
							<td><input type="text" style="width: 100px" class="input"
								name="level[${user['value']['key']}][add_interest_rate]" value="${user['value'] ['add_interest_rate']}" /></td>
							<td><input type="text" style="width: 100px" class="input"
								name="level[${user['value']['key']}][interest_rate_top]" value="${user['value'] ['interest_rate_top']}" /></td>
							<td><input type="text" style="width: 100px" class="input"
								name="level[${user['value']['key']}][interest_rate]" value="${user['value'] ['interest_rate']}" /></td>
							<td><input type="text" style="width: 100px" class="input"
								name="level[${user['value']['key']}][icoName]" value="${user['value'] ['icoName']}" /></td>
							<td>无图片</td>
	
							<td> <a
								href="javascript:;" onClick="delx(${user['value']['key']});">删除</a> &nbsp;&nbsp; 
							</td>
						</tr>
					</c:forEach> 
				</c:if>
				</tbody>
			</table>

		<input type="hidden" id="xss" value="${dfn:defaultValue(id,'-1')}" />	
			<button class="btn" style="margin-top: 5px"
				onClick="addone();return false;">添加一个级别</button>
			<%-- <div class="pagination ajaxpagebar" data="include_page" id="page_bar">${list.pageBar}</div> --%>
		</div>
	<div class="form-actions">
		<button  type="submit"
			class="btn btn-primary btn_submit  J_ajax_submit_btn">保存</button>
		&nbsp;&nbsp;<a class="btn" href="javascript:;"
			onClick="window.history.back(-1);return false;">返回</a><b
			class="subtip">注册定好了以后只能修改，不能删除</b>
	</div>
	 
</form>
</div>
	<script type="text/javascript"> 
	var xss = $("#xss").val();
	if (xss == undefined)	xss = -1;
	function addone(){
		xss++;
		var htmladd = '<tr overstyle="on" id="list_'+xss+'" >';
			htmladd += '<td align="center" >'+xss+'<input type="hidden" class="input" style="width:100px" name="level['+xss+'][key]" value="'+xss+'" /></td>';
			htmladd += '<td><input type="text" class="input" style="width:100px" name="level['+xss+'][name]"  /></td>';
			htmladd += '<td><input type="text" class="input" style="width:100px" name="level['+xss+'][add_interest_rate]"  /></td>';
			htmladd += '<td><input type="text" class="input" style="width:100px" name="level['+xss+'][interest_rate_top]"  /></td>';
			htmladd += '<td><input type="text" class="input" style="width:100px" name="level['+xss+'][interest_rate]"  /></td>';
			htmladd += '<td><input type="text" class="input" style="width:100px" name="level['+xss+'][icoName]"  /></td>';
			htmladd += '<td>无图片</td>';
			htmladd += '<td><a href="javascript:void(0);" onclick="delx('+xss+');">删除</a></td>';
			htmladd += '</tr>';	
		$(htmladd).appendTo("#area_list");
	}
	function delx(id){
		if(confirm("删除后不可恢复，并且删除完要确定保存后才会生产，确定要删除吗?")) $("#list_"+id).remove();
	}
</script>


	<%@ include file="../Common/footer.jsp"%>