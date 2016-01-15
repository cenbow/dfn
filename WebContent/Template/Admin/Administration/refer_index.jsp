<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:include page="../Common/topHeader.jsp"/>
<body class="J_scroll_fixed">
<div class="wrap jj">
	<ul class="nav nav-tabs">
		<li class="active"><a href="#">会员推荐情况</a></li>
	</ul>
  <div class="common-form">
		<form class="well form-search" method="post"
			action="/admin_post/index.html">
			<div class="search_type cc mb10">
				<div class="mb10">
				  <span class="mr20">是否VIP： &nbsp;
                    <label></label>
                    <label>
<input name="radiobutton" type="radio" value="radiobutton" checked>
						全部
<input name="radiobutton" type="radio" value="radiobutton">
是
<input type="radio" name="radiobutton" value="radiobutton">
否</label>
					
					会员名： 
					 <input type="text" name="textfield2">
					 真实姓名：
				     <label>
				    <input type="text" name="textfield">
				    </label>
					 所属客服：
					 <input type="text" name="textfield3">
					 &nbsp;推荐人会员名：
                     <input type="text" name="textfield32"></br>
                     推荐时间： 
					 <input name="start_time"
						class="input length_2 J_date date" style="width: 80px;"
						autocomplete="off" type="text">-<input
						class="input length_2 J_date date" name="end_time"
						style="width: 80px;" autocomplete="off" type="text">
					 推荐类型：&nbsp;
						<label></label>
						<label>
						<input name="radiobutton" type="radio" value="radiobutton" checked>
						全部
						<input name="radiobutton" type="radio" value="radiobutton">
						推荐注册
						<input type="radio" name="radiobutton" value="radiobutton">
						
						网站指定
						<input type="radio" name="radiobutton" value="radiobutton">
						
						无推荐人
						<input type="submit" name="Submit2" value="搜索">
						</label> 
				    &nbsp;</span>				</div>
			</div>
		</form>
		<form method="post" class="J_ajaxForm" action="#">
          <div class="table_list">
            <table class="table table-hover">
              <thead>
                <tr>
                  <th align="center">ID</th>
                  <th>用户名</th>
                  <th>真实姓名</th>
                  <th>所属客服</th>
                  <th>会员类型</th>
                  <th>注册IP</th>
                  <th>注册时间</th>
                  <th>推荐人</th>
                  <th>推荐/取消时间</th>
                  <th>推荐类型</th>
                  <th align="center">操作</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td align="center">238</td>
                 <td><a href="http://ggmoney.com/newadmin-other-o-menuid-61.shtml">123456789</a></td>
                  <td>&nbsp;</td>
                  <td>投资者</td>
                  <td>普通会员</td>
                  <td>58.19.1.122</td>
                  <td>2015-01-31 18:40:18</td>
                  <td>--</td>
				   <td>--</td>
                  <td align="center">--</td>
                  <td><a href="javascript:;" onclick="dialogUrl('/newadmin-UserRefer-editreward?id=238','设置推荐奖励','',800,570);">设置推荐奖励</a>   <a href="javascript:;" onclick="dialogUrl('/newadmin-UserRefer-appoint?id=238','指定推荐人','','',250);">指定推荐人</a>&nbsp; </td>
                </tr>
              </tbody>
            </table>
            <div class="pagination"> 222 条记录 5/23 页 <a href="/newadmin-user-index-menuid-50.shtml?page=4">上一页</a> <a href="http://demo.鼎峰P2P.com/user/oauthadmin/index/p/2.html">下一页</a> &nbsp; <a href="/newadmin-user-index-menuid-50.shtml?page=1">&nbsp;1&nbsp;</a> &nbsp; <a href="/newadmin-user-index-menuid-50.shtml?page=10">下5页</a> <a href="/newadmin-user-index-menuid-50.shtml?page=23">最后一页</a> </div>
          </div>
    </form>
  </div>

	<script src="${AdminStatics}/js/common.js"></script>
<script type="text/javascript">
$(".nav-tabs li").click(function(){
	var index=$(this).index();
	$(this).addClass("active").siblings().removeClass("active");
	$(".J_check_wrap").eq(index).show().siblings(".J_check_wrap").hide();
});
</script>

</body>
</html>