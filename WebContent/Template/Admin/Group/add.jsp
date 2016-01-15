<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
<%@ include file="../Common/topHeader.jsp"%>
<body class="J_scroll_fixed">
<style type="text/css">
.menuListCheckBox li,.menuListCheckBox span,.menuListCheckBox b,.menuListCheckBox input,.menuListCheckBox checkbox{float:left;white-space:nowrap;}
.menuListCheckBox span{color:#1dd2af}
.menuListCheckBox li{margin: 10px 20px 10px;  list-style: none;  border-bottom: 1px dotted;}
.menuListCheckBox ul{overflow:hidden; border-left:1px dotted; padding-left:10px;}
.menuListCheckBox b{margin-left:10px}
.menuListCheckBox label{padding-left:25px}
.menuListCheckBox checkbox{margin-left:10px}
.menuListCheckBox em{font-style:normal; float:left; font-size:18px; position:relative}
.menuListCheckBox em.ck{top:10px; left:20px}
.menuListCheckBox h1{font-size:18px; position:relative; overflow:hidden; border-bottom:1px solid}
.menuListCheckBox h2{overflow:hidden; border-bottom:1px dotted}
</style>
	<div class="wrap jj">
		<ul class="nav nav-tabs">
			<li><a href="${dfn:U('admin/group/index')}">管理员角色</a></li>
			<li class="active"><a href="${dfn:U('admin/group/menu')}">添加角色
			</a></li>

		</ul>
		<ul class="nav nav-tabs">
			<li class="current"><a href="javascript:;">基本属性</a></li>

		</ul>
		<form method="post" action="${dfn:U('admin/group/do_add')}" class="form-horizontal J_ajaxForm">
			<div class="common-form cwh">

				<table>


					<tr>
						<th width="200" class="control-label">角色名： <input
							type="hidden" name="id" value="${data.id }" />
						</th>
						<td>${dfForm:input( "groupname", data['groupname'], dfForm_class, dfForm_style,dfForm_others)}
							<span class="commonToolTip">请输入角色名</span>
						</td>
					</tr>
					<tr>
						<th class="control-label">角色描述：</th>
						<td><textarea id="groupinfo" class="myarea" name="groupinfo" cols="40" rows="5">${groupinfo }</textarea>
						
						<span							class="commonToolTip">请输入角色描述</span>
						</td>
					</tr>
					<tr>
						<th width="200" height="40px" class="control-label">角色状态：</th>
						<td>${dfForm:select( "status",statusSelect, data['status'], dfForm_class,  dfForm_style,dfForm_others)}

							<span class="commonToolTip">请选择角色状态,禁用某角色后则其角色下所有管理员都禁用</span>
						</td>

					</tr>

					<tr>
						<th colspan="2">权限</th>
					</tr>

				</table>
			</div>
                    
                    <div class="menuListCheckBox">
				<c:if test="${not empty menuList }">
					<c:forEach items="${menuList }" var="menu_1">
                    	<!--最外层START-->
                    	<h1><em>${menu_1.name}</em><em class="ck"><input name="menuIds" value="${menu_1.id}" type="checkbox" onClick="select_all('m_1_${menu_1.id}',this);" id="m_1_${menu_1.id}" /><label for="m_1_${menu_1.id}">全选</label></em></h1>
                        
                            <c:if test="${not empty menu_1.son }">
                                <c:forEach items="${menu_1.son}" var="menu_2">
                                <ul><h2><input type="checkbox" name="menuIds" value="${menu_2.id}" class="m_1_${menu_1.id}" onClick="select_all('m_2_${menu_2.id}',this);" id="m_2_${menu_2.id}" /><label for="m_2_${menu_2.id}">${menu_2.name}</label></h2>
                                
                                    <c:if test="${not empty menu_2.son }">
                                        <c:forEach items="${menu_2.son}" var="menu_3">
                                            <li><span><input name="menuIds" value="${menu_3.id}" type="checkbox" class="m_1_${menu_1.id} m_2_${menu_2.id}" onClick="select_all('m_3_${menu_3.id}',this);" id="m_3_${menu_3.id}" /><label for="m_3_${menu_3.id}">${menu_3.name}</label></span>
                                            <c:if test="${not empty menu_3.son }">
                                                <c:forEach items="${menu_3.son}" var="menu_4">
                     <b><input name="menuIds" value="${menu_4.id}" type="checkbox" class="m_1_${menu_1.id} m_2_${menu_2.id} m_3_${menu_3.id}" onClick="select_all('m_4_${menu_4.id}',this);"  id="m_${menu_4.id}" /><label for="m_${menu_4.id}">${menu_4.name}</label></b>
                                                </c:forEach>
                                            </c:if>
                                            
                                			</li>
                                        
                                        </c:forEach>
                                    </c:if>
                                </ul>
                                </c:forEach>
                            </c:if>
                    	<!--最外层END-->
					</c:forEach>
				</c:if>
                    
                    </div>


			<div class="form-actions">
				<button type="submit" class="btn btn-primary btn_submit J_ajax_submit_btn">添加</button>
				&nbsp;&nbsp;<a class="btn" href="javascript:window.history.back(-1);">返回</a>
			</div>


		</form>
	</div>
    <script type="text/javascript">
	function select_all(className,obj){
		var isCK = $(obj).is(":checked");
		$("."+className).attr("checked",isCK);
		if(isCK){
			var parentClass = $(obj).attr("class").split(" ");
			$.each(parentClass,function(k,v){
				$("#"+v).attr("checked",isCK);
			});
		}
	}
	</script>
	<%@ include file="../Common/footer.jsp"%>