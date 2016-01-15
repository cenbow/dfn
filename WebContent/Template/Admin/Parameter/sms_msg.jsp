<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:include page="../Common/topHeader.jsp"/>
<body class="J_scroll_fixed">
<div class="wrap jj">
	<ul class="nav nav-tabs">
		<li class="active"><a href="#">短信发送记录</a></li>
	</ul>
  <div class="h_a">搜索</div>
  <form method="get" action="/newadmin-SmsMsg-index">
    <div class="search_type cc mb10">
      <div class="mb10"> <span class="mr20">
        接收人：
        <input style='width:100px' type="text" class="input" name="s#receiver" id="s#receiver" value=""/>        信息内容：
        <input style='width:100px' type="text" class="input" name="s#msg" id="s#msg" value=""/>       发送时间：
        <input type="text" name="start_time" class="input length_2 J_date" value="" style="width:80px;">
        -
        <input type="text" class="input length_2 J_date" name="end_time" value="" style="width:80px;">
        <button class="btn">搜索</button>
        </span> </div>
    </div>
  <input type="hidden" name="__hash__" value="3be5270d7bad3d858f0b3dba03c29dec_05c6037e663275d61efcb619da084af5" /></form>
   <div class="table_list">
  <table id="area_list" width="100%" border="0" cellspacing="0" cellpadding="0">
   <thead>
  <tr>
    <th class="line_l">ID</th>
    <th class="line_l">发送内容</th>
    <th class="line_l">发送时间</th>
    <th class="line_l">接收人</th>
    <th class="line_l">本次发送条数</th>
  </tr>
   </thead>
  <tr overstyle='on' id="list_47">
        <td>47</td>
        <td title="处理充值验证码为:3746">处理充值验证码为:3746</td>
        <td>2015-03-10 15:05:09</td>
        <td title=""></td>
        <td>1</td>
      </tr><tr overstyle='on' id="list_46">
        <td>46</td>
        <td title="投资用户1您好，你的手机认证码是1021。">投资用户1您好，你的手机认证码是1021…</td>
        <td>2015-02-03 17:21:39</td>
        <td title="15871458553">15871458553</td>
        <td>1</td>
      </tr><tr overstyle='on' id="list_45">
        <td>45</td>
        <td title="lincolnbz您好，你的手机认证码是2601。">lincolnbz您好，你的手机认证码是…</td>
        <td>2015-01-27 14:30:23</td>
        <td title="18675830831">18675830831</td>
        <td>1</td>
      </tr>  </table>
      <div class="p10">
        <div class="pages">  47 条记录 1/5 页  <a href='/newadmin-sms_msg-index-menuid-216.shtml?page=2'>下一页</a>     &nbsp;<span class='current'>1</span>&nbsp;<a href='/newadmin-sms_msg-index-menuid-216.shtml?page=2'>&nbsp;2&nbsp;</a>&nbsp;<a href='/newadmin-sms_msg-index-menuid-216.shtml?page=3'>&nbsp;3&nbsp;</a>&nbsp;<a href='/newadmin-sms_msg-index-menuid-216.shtml?page=4'>&nbsp;4&nbsp;</a>&nbsp;<a href='/newadmin-sms_msg-index-menuid-216.shtml?page=5'>&nbsp;5&nbsp;</a>    </div>
      </div>
   </div>
</div>

    </form>
  </div>
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
<script type="text/javascript"> 
var dialogCallBack = function(){
	 var iframeName = $(".aui_content").find("iframe").attr("name");
	 $(".J_ajaxForm",window.frames[iframeName].document).submit();
	 return false;
	 
 }
</script>
<script type="text/javascript" src="${AdminStatics}/js/content_addtop.js"></script>
<script src="${AdminStatics}/js/common.js?v"></script>


</body>
</html>