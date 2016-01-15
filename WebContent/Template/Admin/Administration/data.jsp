<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:include page="../Common/topHeader.jsp"/>
<body class="J_scroll_fixed">
	<div class="wrap jj">
		<ul class="nav nav-tabs">
			<li class="active"><a href="#">会员资料类型管理</a></li>
		</ul>
			<div class="common-form ad_list"> 	
			<form method="post" class="J_ajaxForm" action="#">
			  <div class="table_list">
			    <table width="100%" align="center" class="table table-hover">
                  <thead>
                    <tr>
					<th align="center" valign="middle">排序</th>
                       <th align="center" valign="middle">ID</th>
                      <th align="center" valign="middle" >分类名称</th> 
					  <th align="center" valign="middle" >管理操作</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td align="center" valign="middle"><input name="sort_order[3]" type="text" size="3" value="3" class="input"></td>
					  <td align="center" valign="middle">1</td>        
                      <td align="center" valign="middle">&nbsp;</td>
                      <td align="center" valign="middle"><a href="javascript:;" onclick="dialogUrl('/newadmin-egroup-add-parentid-3-menuid-71-type-userUploadCate.shtml','添加子分类','','',350)">添加子分类</a> | <a href="javascript:;" onclick="dialogUrl('/newadmin-egroup-edit-id-3-menuid-71-type-userUploadCate.shtml','修改','','',350)">修改</a> | <a href="http://ggmoney.com/newadmin-egroup-delete-id-3-menuid-71-type-userUploadCate.shtml">删除</a><a href="javascript:;" onClick="dialogUrl('/newadmin-ApplyVideo-edit?id=18','视频认证审核');"></a></td>
                    </tr>
                  </tbody>
                </table>
			  </div>
			
					<div class="form-actions">
<div class="btn_wrap_pd">             
  <button class="btn btn-primary J_ajax_submit_btn" type="submit"
					data-action="/admin_post/listorders.html">排序</button>&nbsp;&nbsp;<a href="javascript:;" onclick="window.history.back(-1);return false;">返回</a></div>
</div>
				
		
                    <script type="text/javascript">
$(".nav-tabs li").click(function(){
	var index=$(this).index();
	$(this).addClass("active").siblings().removeClass("active");
	$(".common-form").eq(index).show().siblings(".common-form").hide();
});
</script>
	
</body>
</html>