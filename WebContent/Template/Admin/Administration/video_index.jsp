<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:include page="../Common/topHeader.jsp"/>
<body class="J_scroll_fixed">
	<div class="wrap jj">
		<ul class="nav nav-tabs">
			<li class="active"><a href="#">视频认证申请</a></li>
		</ul>
			<div class="common-form ad_list"> 
					<form class="well form-search" method="post"
			action="/admin_post/index.html">
			<div class="search_type cc mb10">
				<div class="mb10">
					<span class="mr20">是否VIP： 
					<input name="radiobutton" type="radio" value="radiobutton" checked>
全部
<input name="radiobutton" type="radio" value="radiobutton">
是
<input type="radio" name="radiobutton" value="radiobutton">
否
					
					会员名： 
					 <input type="text" name="textfield2">
					 真实姓名：
				     <label>
				    <input type="text" name="textfield">
				    </label>
				     &nbsp;认证状态：
                     <select class="select_2" name="select2">
                       <option selected="selected" value="0">所有</option>
                       <option value="1">待审核</option>
					   <option value="1">已通过</option>
					   <option value="1">未通过</option>
                     </select>
                    注册时间： 
					 <input name="start_time"
						class="input length_2 J_date date" style="width: 80px;"
						autocomplete="off" type="text">-<input
						class="input length_2 J_date date" name="end_time"
						style="width: 80px;" autocomplete="off" type="text"> 
					 <!-- 
        <select class="select_2" name="searchtype" style="width:70px;"> <option value='0' >标题</option> </select>         -->
					 <label>
			   <input type="submit" name="Submit2" value="搜索">
					</label> 
					&nbsp;</span>				</div>
			</div>
		</form>
			<form method="post" class="J_ajaxForm" action="#">
			  <div class="table_list">
			    <table width="100%" align="center" class="table table-hover">
                  <thead>
                    <tr>
                       <th align="center" valign="middle">ID</th>
                      <th align="center" valign="middle" >用户名</th>
                      <th align="center" valign="middle" >真实姓名</th>
                      <th align="center" valign="middle" >是否VIP</th>
                      <th align="center" valign="middle" >可用余额</th>
                      <th align="center" valign="middle" >冻结金额</th>
                      <th align="center" valign="middle" >待收金额</th>
                      <th align="center" valign="middle" >申请时间</th>
					  <th align="center" valign="middle" >操作</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td align="center" valign="middle">1</td>
                      <td align="center" valign="middle"><a href="http://ggmoney.com/newadmin-other-o-menuid-61.shtml">123456789</a></td>
                      <td align="center" valign="middle">&nbsp;</td>
                      <td align="center" valign="middle">普通会员</td>
                      <td align="center" valign="middle">&nbsp;</td>
                      <td align="center" valign="middle">&nbsp;</td>
                      <td align="center" valign="middle">&nbsp;</td>
                      <td align="center" valign="middle">&nbsp;</td>
                      <td align="center" valign="middle"><a href="javascript:;" onClick="dialogUrl('/newadmin-ApplyVideo-edit?id=18','视频认证审核');">审核</a></td>
                    </tr>
                  </tbody>
                </table>
			  </div>
			
					<div class="pagination">
                      <p>222 条记录 5/23 页 <a href="/newadmin-user-index-menuid-50.shtml?page=4">上一页</a> <a href="http://demo.鼎峰P2P.com/user/oauthadmin/index/p/2.html">下一页</a> &nbsp; <a href="/newadmin-user-index-menuid-50.shtml?page=1">&nbsp;1&nbsp;</a> &nbsp; <a href="/newadmin-user-index-menuid-50.shtml?page=10">下5页</a> <a href="/newadmin-user-index-menuid-50.shtml?page=23">最后一页</a></p>
				  </div>
					<label class="checkbox inline" for="check_all"></label>
			</form>
		</div>
		
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