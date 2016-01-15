<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:include page="../Common/topHeader.jsp"/>
<body class="J_scroll_fixed">
<div class="wrap jj">
	<ul class="nav nav-tabs">
		<li class="active"><a href="#">查看会员积分明细</a></li>
	</ul>
  <div class="common-form">
		<form class="well form-search" method="post"
			action="/admin_post/index.html">
			<div class="search_type cc mb10">
				<div class="mb10">
					<span class="mr20">
					 
					会员名： 
					 <input type="text" name="textfield2">
					 真实姓名：
				     <label>
				    <input type="text" name="textfield">
				    </label>
				     交易类型：
					 <select class="select_2" name="select">
                       <option selected="selected" value="0">所有</option>
                       <option value="1">正常还款</option>
					   <option value="2">迟还</option>
					   <option value="3">逾期还款</option>
					   <option value="4">提前还款</option>
					   <option value="5">实名认证</option>
					   <option value="6">视频认证</option>
                       <option value="7">现场认证</option>
					   <option value="8">VIP审核</option>
					   <option value="9">管理员操作</option>
					   <option value="10">普通标投标</option>
					   <option value="11">流转标投标</option>
					   <option value="12">兑换商品消耗</option>
                     </select>
					 &nbsp;变动原因：
                     <label>
                     <input type="text" name="textfield3">
                     </label>
                     &nbsp; 影响积分：
					 
					 <select class="select_2" name="select3">
                       <option selected="selected" value="0">大于</option>
                       <option value="1">等于</option>
                       <option value="2">小于</option>
                     </select>
					 <input type="text" name="textfield22"></br>
					 产生时间： 
					 <input name="start_time"
						class="input length_2 J_date date" style="width: 80px;"
						autocomplete="off" type="text">-<input
						class="input length_2 J_date date" name="end_time"
						style="width: 80px;" autocomplete="off" type="text"> 
					 <!-- 
        <select class="select_2" name="searchtype" style="width:70px;"> <option value='0' >标题</option> </select>         -->
					 <label></label>
						<label>
						<input type="submit" name="Submit2" value="搜索">
						</label> 
						&nbsp;
						<input type="submit" name="Submit2" value="导出">
			  </span>				</div>
			</div>
		</form>
		<form method="post" class="J_ajaxForm" action="#">
          <div class="table_list">
            <table class="table table-hover">
              <thead>
                <tr>
                  <th align="center" valign="middle" bordercolor="#FFFFFF">ID</th>
                  <th align="center" valign="middle" bordercolor="#FFFFFF">用户名</th>
                  <th align="center" valign="middle" bordercolor="#FFFFFF">交易类型</th>
                  <th align="center" valign="middle" bordercolor="#FFFFFF">影响积分</th>
                  <th align="center" valign="middle" bordercolor="#FFFFFF">帐户积分</th>
                  <th align="center" valign="middle" bordercolor="#FFFFFF">发生时间</th>
                  <th align="center" valign="middle" bordercolor="#FFFFFF">变动原因</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td align="center" valign="middle" bordercolor="#FFFFFF">238</td>
                 <td align="center" valign="middle" bordercolor="#FFFFFF"><a href="http://ggmoney.com/newadmin-other-o-menuid-61.shtml">123456789</a></td>
                  <td align="center" valign="middle" bordercolor="#FFFFFF">普通标投标</td>
                  <td align="center" valign="middle" bordercolor="#FFFFFF">5分</td>
                  <td align="center" valign="middle" bordercolor="#FFFFFF">306分</td>
                  <td align="center" valign="middle" bordercolor="#FFFFFF">2015-02-05 16:49</td>
                  <td align="center" valign="middle" bordercolor="#FFFFFF">成功投标84号标奖励</td>
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