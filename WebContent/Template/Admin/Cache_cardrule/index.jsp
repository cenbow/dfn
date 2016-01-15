<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
<%@ include file="../Common/topHeader.jsp"%>
<body class="J_scroll_fixed">
	<div class="wrap jj">
		<ul class="nav nav-tabs">
			<li class="active"><a href="${dfn:SU(_thisUrl_,'index')}">会员级别配置</a></li>
		</ul>
        <ul>
        	<li>注意："卡券有效期至"和"卡券过期天数"中以最先到期的为准，只设置了其中一个的，以设置的为准，在会员列表直接添加卡券的，以直接添加的时间为准</li>
        	<li>注意："使用卡券金额"是指使用多少自有资金投标方可使用此类卡券,如果是针对红包的卡券，则"使用卡券金额"是指使用红包所占自有资金投标金额的百分比，比如设置10，自有资金投标金额100，则可使用10块的红包，总共投标110元</li>
        	<li>注意："卡券有效期至"以 2016-02-29 的形式填入</li>
        	<li>注意："卡券过期天数"是指从会员获取卡起计算多少天过期</li>
        </ul>
		<div id="borrowTypeStr" style="display:none">
           <c:forEach items="${borrowType}"  var="bt">
           <input type="checkbox" name="rule[-key-][bt]" id="bt_-key-_${bt.key}" value="${bt.key}"><label for="bt_-key-_${bt.key}">${bt.value}</label>
           </c:forEach> 
        </div>
<form action="${dfn:SU(_thisUrl_,'editCache_cardrule')}" method="post" class="form-horizontal J_ajaxForm">
	<dfTag:token />
		<div class="table_list">
			<table id="area_list" class="table table-hover">
				<thead>
					<tr>
						<th align="center">序号</th>
						<th>卡券规则名称</th>
						<th>使用卡券金额</th>
						<th>卡券可用产品</th>
						<th>卡券有效期至</th>
						<th>卡券过期天数</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody >
			
					<c:if test="${not empty data }">
					 <c:forEach items="${data['rule']}"  var="user" varStatus="status" >
						 <tr overstyle="on" id="list_${user['value']['key']}" >
							<td  align="center">
								${user['value']['key']}
								<input type="hidden" name="rule[${user['value']['key']}][key]" value="${user['value']['key']}" />
								<c:if test="${status.last }">
									<c:set value="${user['value']['key']}" var = "id" />
								</c:if>
							</td>
							<td><input type="text" style="width: 100px" class="input"
								name="rule[${user['value']['key']}][name]" value="${user['value'] ['name']}" /></td>
							<td><input type="text" style="width: 100px" class="input"
								name="rule[${user['value']['key']}][useCondition]" value="${user['value'] ['useCondition']}" /></td>
							<td>
					 <c:forEach items="${borrowType}"  var="bt">
                     <input type="checkbox" name="rule[${user['value']['key']}][bt]" id="bt_${user['value']['key']}_${bt.key}" value="${bt.key}" ${dfn:ckbox(user['value']['bt'],bt['key'],'checked')}> <label for="bt_${user['value']['key']}_${bt.key}">${bt.value}</label>
					 </c:forEach> 
							<td><input type="text" style="width: 100px" class="input" name="rule[${user['value']['key']}][expiredDate]" value="${user['value']['expiredDate']}" /></td>
							<td><input type="text" style="width: 100px" class="input" name="rule[${user['value']['key']}][expiredDay]" value="${user['value']['expiredDay']}" /></td>
							<td> <a href="javascript:;" onClick="delx(${user['value']['key']});">删除</a> &nbsp;&nbsp; 
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
			class="subtip">定好了以后只能修改，修改也慎用，会影响所有以前发放的被修改类型的卡片规则，不能删除</b>
	</div>
	 
</form>
</div>
	<script type="text/javascript"> 
	var xss = $("#xss").val();
	if (xss == undefined)	xss = -1;
	function addone(){
		xss++;
		var htmladd = '<tr overstyle="on" id="list_'+xss+'" >';
			htmladd += '<td align="center" >'+xss+'<input type="hidden" class="input" style="width:100px" name="rule['+xss+'][key]" value="'+xss+'" /></td>';
			htmladd += '<td><input type="text" class="input" style="width:100px" name="rule['+xss+'][name]"  /></td>';
			htmladd += '<td><input type="text" class="input" style="width:100px" name="rule['+xss+'][useCondition]"  /></td>';
			htmladd += '<td>';
		var typeStr = $("#borrowTypeStr").html().replace(/-key-/g,xss);
			htmladd +=typeStr+'</td>';
			htmladd += '<td><input type="text" class="input" style="width:100px" name="rule['+xss+'][expiredDate]"  /></td>';
			htmladd += '<td><input type="text" class="input" style="width:100px" name="rule['+xss+'][expiredDay]"  /></td>';
			htmladd += '<td><a href="javascript:void(0);" onclick="delx('+xss+');">删除</a></td>';
			htmladd += '</tr>';	
		$(htmladd).appendTo("#area_list");
	}
	function delx(id){
		if(confirm("删除后不可恢复，并且删除完要确定保存后才会生产，确定要删除吗?")) $("#list_"+id).remove();
	}
</script>


	<%@ include file="../Common/footer.jsp"%>