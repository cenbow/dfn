<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:include page="../Common/topHeader.jsp"/>
<body class="J_scroll_fixed">
<div class="wrap jj">
	<ul class="nav nav-tabs">
		<li class="active"><a href="#">会员提现统计</a></li>
	</ul>
  <div class="common-form">
		<form class="well form-search" method="post"
			action="/admin_post/index.html">
			<div class="search_type cc mb10">
				<div class="mb10">
					<span class="mr20">
					
					会员名： 
					 <input type="text" name="textfield2">
					 提现总金额： 
					 <select class="select_2" name="select">
                       <option selected="selected" value="0">大于</option>
                       <option value="1">等于</option>
                       <option value="2">小于</option>
                     </select>
				    &nbsp;提现次数：
					 
					 <select class="select_2" name="select3">
                       <option selected="selected" value="0">大于</option>
                       <option value="1">等于</option>
                       <option value="2">小于</option>
                     </select>
					 <input type="text" name="textfield22">
					 <!-- 
        <select class="select_2" name="searchtype" style="width:70px;"> <option value='0' >标题</option> </select>         -->
					 <label></label>
					 <button class="btn">搜索</button>
        <button class="btn export" onClick="window.open('/newadmin-CapitalLog-export?');return false;">导出</button>
			  </span>				</div>
			</div>
		</form>
		<form method="post" class="J_ajaxForm" action="#">
          <div class="table_list">
            <table class="table table-hover">
              <thead>
                <tr>
                  <th class="line_l">UID</th>
    <th class="line_l">用户名</th>
    <th class="line_l">真实姓名</th>
    <th class="line_l">所属客服</th>
    <th class="line_l">提现总金额</th>
    <th class="line_l">提现总手续费</th>
    <th class="line_l">提现总次数</th>

                </tr>
              </thead>
              <tbody>
                <tr>
                <tr overstyle='on' id="list_248">
        <td>248</td>
        <td><a target="_blank" href="/newadmin-common-user-user_name-13297970980.shtml">13297970980</a></td>
        <td>会员注册奖励</td>
        <td>10.00元</td>
        <td>10.00元</td>
        <td>2015-01-31 18:40</td>
        <td title="注册奖励">注册奖励</td>
      </tr>
      </tr>
                </tr>
              </tbody>
            </table>
            <div class="pagination"> 222 条记录 5/23 页 <a href="/newadmin-user-index-menuid-50.shtml?page=4">上一页</a>
             <a href="http://demo.鼎峰P2P.com/user/oauthadmin/index/p/2.html">下一页</a> &nbsp;
              <a href="/newadmin-user-index-menuid-50.shtml?page=1">&nbsp;1&nbsp;</a> &nbsp;
               <a href="/newadmin-user-index-menuid-50.shtml?page=10">下5页</a> 
               <a href="/newadmin-user-index-menuid-50.shtml?page=23">最后一页</a> </div>
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
<div id="calroot" style="display: none; position: absolute;">
		<div id="calhead">
			<a id="calprev"></a>
			<div id="caltitle">
				<select id="calmonth"></select><select id="calyear"></select>
			</div>
			<a id="calnext"></a>
		</div>
		<div id="calbody">
			<div id="caldays">
				<span>日</span><span>一</span><span>二</span><span>三</span><span>四</span><span>五</span><span>六</span>
			</div>
			<div id="calweeks"></div>
			<div class="caltime">
				<button type="button" class="btn btn_submit fr" name="submit">确认</button>
				<input id="calHour" class="input" min="0" max="23" size="2"
					value="0" type="number"><span>点</span><input id="calMin"
					class="input" size="2" min="1" max="59" value="0" type="number"><span>分</span>
			</div>
		</div>
</div>


</body>
</html>