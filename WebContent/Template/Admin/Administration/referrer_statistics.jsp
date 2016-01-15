<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:include page="../Common/topHeader.jsp"/>
<body class="J_scroll_fixed">
<div class="wrap jj">
	<ul class="nav nav-tabs">
		<li class="active"><a href="#">推荐统计</a></li>
	</ul>
  <div class="wrap J_check_wrap">
		<form class="well form-search" method="post"
			action="/admin_post/index.html">
			<div class="search_type cc mb10">
				<div class="mb10">
					<span class="mr20">
					 
					会员名： 
					 <input type="text" name="textfield2">
					 奖励：
				     <label>
				     <select class="select_2" name="select3">
                       <option selected="selected" value="0">VIP升级奖励</option>
                       <option value="1">投资奖励</option>
                     </select>
                     <select class="select_2" name="select">
                       <option selected="selected" value="0">大于</option>
                       <option value="1">等于</option>
                       <option value="2">小于</option>
                     </select>
                     <input type="text" name="textfield22">
                     </br>
</label>
				     &nbsp;&nbsp;<label>
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
                  <th align="center" valign="middle">ID</th>
                  <th align="center" valign="middle">用户名</th>
                  <th align="center" valign="middle">会员类型</th>
                  <th align="center" valign="middle">推荐人数</th>
                  <th align="center" valign="middle">获得VIP升级奖励</th>
                  <th align="center" valign="middle">获得被推荐人投资奖励</th>
                  <th align="center" valign="middle">获得总金额</th>                
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td align="center" valign="middle">238</td>
                  <td align="center" valign="middle"><a href="http://ggmoney.com/newadmin-other-o-menuid-61.shtml">123456789</a></td>
                  <td align="center" valign="middle">普通会员</td>
                  <td align="center" valign="middle">4人</td>
                  <td align="center" valign="middle">￥0.00</td>
                  <td align="center" valign="middle">￥0.00</td>
                  <td align="center" valign="middle">￥0.00</td>
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