<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
<%@ include file="../Common/topHeader.jsp"%>
<body class="J_scroll_fixed">
	<div class="wrap J_check_wrap">
		<div class="nav">
			<ul class="cc">
				<li class="current"><a href="${dfn:U("admin/borrow_type/type")}">标种配置</a></li>
			</ul>
		</div>
		<ul class="nav nav-tabs">
			<li class="active"><a href="#A" data-toggle="tab">标种配置</a></li>
			<li><a href="#B" data-toggle="tab">环境参数</a></li>
		</ul>
		<form class="form-horizontal J_ajaxForm" name="myform" id="myform"
			action="${dfn:U('admin/borrow_type/savetype')}" method="post">
			<dfTag:token />
			<fieldset>
				<div class="tabbable">
					<div class="tab-content">
						<div class="tab-pane active" id="A">
							<div>标种配置</div>

							<div class="table_list">
								<table id="yt_list" class="table table-hover">									
									<thead>
										<tr>
											<th>ID</th>
											<th>标种名称</th>
											<th>标种别名</th>
											<th>图标</th>
											<th>操作(谨慎操作)</th>
										</tr>
									</thead>
									<tbody>
										<c:if test="${not empty data }">
											<c:forEach items="${data['type']}" var="user"
												varStatus="status">
												<tr align="center" overstyle="on" id="list_type_${user['value']['key']}">
													<td align="center">${user['value']['key']}<input
														type="hidden" name="type[${user['value']['key']}][key]"
														value="${user['value']['key']}" /> <c:if
															test="${status.last }">
															<c:set value="${user['value']['key']}" var="type_id" />
														</c:if>
													</td>
                                                 <td align="center"><input type="text" style="width: 200px"	class="input" name="type[${user['value']['key']}][borrow_name]"	value="${user['value'] ['borrow_name']}"/></td>
                                                 <td align="center"><input type="text" style="width: 200px"	class="input" name="type[${user['value']['key']}][borrow_alias]" value="${user['value'] ['borrow_alias']}"/></td>
												 <td align="center"><img src="${HomeStatics}/images/borrowico/${user['value']['key']}.png"/></td>
                                                 <td> <a href="javascript:;" onclick="delyt(${user['value']['key']});">删除</a>&nbsp;&nbsp; </td>
												</tr>
											</c:forEach>
										</c:if>
									</tbody>
								</table>
								<input type="hidden" id="yt" value="${type_id}" />
								<button class="btn" style="margin-top: 5px"
									onClick="addone_yu();return false;">添加一个标种</button>


							</div>
							<script type="text/javascript">
									var yt = $("#yt").val();
									if (yt == undefined)
										yt = 0;
										function addone_yu() {
											yt++;
											var htmladd = '<tr align="center" overstyle="on" id="list_type_'+yt+'">';
											htmladd += '<td align="center" >'+yt+'<input type="hidden" class="input" style="width:200px" name="type['+yt+'][key]" value="'+yt+'" /></td>';
											htmladd += '<td ><input type="text" class="input" style="width:200px" name="type['+yt+'][borrow_name]"  /></td>';
											htmladd += '<td ><input type="text" class="input" style="width:200px" name="type['+yt+'][borrow_alias]"  /></td>';
											htmladd += '<td >&nbsp;</td>';
											htmladd += '<td ><a href="javascript:void(0);" onclick="delyt('+ yt + ');">删除</a></td>';
											htmladd += '</tr>';																		
											  $(htmladd).appendTo(																																					
													$("#yt_list"));
										}
										function delyt(id) {
											if (confirm("删除后不可恢复，如果已经有标选择了这里面的借款用途，建议只是修改不要删除，并且删除完要确定保存后才会生效，确定要删除吗?"))
												$("#list_type_" + id).remove();
										}
									</script>
						</div>
                        
						<div class="tab-pane" id="B" style="display:none">
							<div>环境参数</div>

							<div class="table_full">
								<table width="80%" class="table_form">
									<tr>
										<th width="200" class="control-label">年化天数:</th>
										<td>${dfForm:input( "borrowSetting[yearDay]", data['borrowSetting']['yearDay'], dfForm_class, dfForm_style,dfForm_others)}<span
											class="commonToolTip">一年以多少天来算，计算天标利息时有用，比如填360，那么年化利率是14.4%是投1000元每天利息是14.4%/360*1000=0.40,如是365则天利率是14.4%/365*1000=0.39(计算结果保留两位小数)</span></td>
									</tr>
								</table>


							</div>
						</div>
                        

					</div>
					<div class="form-actions">
						<button type="submit"
							class="btn btn-primary btn_submit  J_ajax_submit_btn">保存</button>
						&nbsp;&nbsp;<a class="btn" href="javascript:;"
							onClick="window.history.back(-1);return false;">返回</a><b
							class="subtip">所有修改点击一次保存即可</b>
					</div>
				</div>
			</fieldset>
		</form>
	</div>
        <script type="text/javascript">
		$(".nav-tabs li a").click(function(e) {
			$(".tab-pane").removeClass("active").hide();
            var id = $(this).attr("href");
			$(id).addClass("active").show();
        });
		</script>
	<%@ include file="../Common/footer.jsp"%>