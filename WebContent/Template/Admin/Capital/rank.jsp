<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:include page="../Common/topHeader.jsp"/>
<body class="J_scroll_fixed">
<div class="wrap jj">
	<ul class="nav nav-tabs">
		<li class="active"><a href="#">投资排名统计</a></li>
		 <li ><a href="/newadmin-capital_recharge-export-menuid-82.shtml">导出excel</a></li>
	</ul>
  <div class="common-form">
		<form class="well form-search" method="post"
			action="/admin_post/index.html">
			<div class="search_type cc mb10">
				<div class="mb10">
					<span class="mr20">
					
					会员名： 
					 <input type="text" name="textfield2">
					 时间段：
                     <input name="start_time"
						class="input length_2 J_date date" style="width: 80px;"
						autocomplete="off" type="text">
                     -
                     <input
						class="input length_2 J_date date" name="end_time"
						style="width: 80px;" autocomplete="off" type="text">
					 <input type="text" name="textfield223">
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
                 <th style="width:30px;">排名</th>
    <th class="line_l">UID</th>
    <th class="line_l">用户名</th>
    <th class="line_l">投资金额</th>


        </TR>
      </THEAD>
  <tr overstyle='on' id="list_236">
        <td>1</td>
        <td>236</td>
        <td><a target="_blank" href="/newadmin-common-user-user_name-lincolnbz.shtml">lincolnbz</a></td>
        <td>￥10600.00</td>
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