<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:include page="../Common/topHeader.jsp"/>
<body class="J_scroll_fixed">
	<div class="wrap jj">
		<ul class="nav nav-tabs">
			<li class="active"><a href="#">会员上传资料管理</a></li>
			<li class=""><a href="#">会员上传资料审核</a></li>
		</ul>
			<div class="common-form ad_list"> 
					<form class="well form-search" method="post"
			action="/admin_post/index.html">
			<div class="search_type cc mb10">
				<div class="mb10">
					<span class="mr20">
					所选客服：
					<select class="select_2" name="select2">
                      <option selected="selected" value="0">所有</option>
                      <option value="1">test</option>     
                    </select>
					会员名： 
					 <input type="text" name="textfield2">
					 <label></label>
					 真实姓名： 
					 <input type="text" name="textfield22">
					 &nbsp;资料类型：
                     <select name="u#type" id="u#type" style="width:150px;">
        <option value="">所有</option>
        <option value='3'  disabled> 工作状况及保障</option><option value='50'  >&nbsp;├ 五险一金缴纳查询单</option><option value='49'  >&nbsp;├ 能证明身份的工作证件（如：教师资格证、警官证、执法证等）</option><option value='48'  >&nbsp;└ 劳动合同或单位证明或工作证</option><option value='8'  disabled> 借款手续及认证资料上传</option><option value='41'  >&nbsp;├ 借款承诺书</option><option value='42'  >&nbsp;├ 担保借款协议</option><option value='43'  >&nbsp;├ 抵押借款协</option><option value='44'  >&nbsp;├ 视频认证资料</option><option value='45'  >&nbsp;└ 现场认证资料</option><option value='2'  disabled> 个人资产与负债</option><option value='23'  >&nbsp;├ 行驶证</option><option value='30'  >&nbsp;├ 其他借款说明</option><option value='29'  >&nbsp;├ 信用报告</option><option value='28'  >&nbsp;├ 近3个月银行代发工资记录或个人转账存款记录</option><option value='27'  >&nbsp;├ 水费发票或电费发票或煤气发票（最近2个月）</option><option value='26'  >&nbsp;├ 居住地租赁合同</option><option value='25'  >&nbsp;├ 房产证</option><option value='24'  >&nbsp;└ 驾驶证</option><option value='10'  disabled> 经营或养殖状况</option><option value='40'  >&nbsp;├ 养种植基地照片</option><option value='39'  >&nbsp;├ 商铺照片</option><option value='38'  >&nbsp;├ 经营租赁合同</option><option value='37'  >&nbsp;├ 银行开户证明</option><option value='36'  >&nbsp;├ 贷款卡</option><option value='35'  >&nbsp;├ 公司报税情况查询（近三个月的）</option><option value='34'  >&nbsp;├ 公司利润表（近三个月的）</option><option value='52'  >&nbsp;├ xz</option><option value='53'  >&nbsp;│&nbsp;└ dd</option><option value='33'  >&nbsp;├ 公司资产负债表（近半年的）</option><option value='32'  >&nbsp;├ 业务订单或者经营场所账单</option><option value='31'  >&nbsp;└ 营业执照副本（需要彩色）</option><option value='1'  disabled> 个人身份信息</option><option value='11'  >&nbsp;├ 居住证(暂住证)</option><option value='21'  >&nbsp;├ 本人身份证背面</option><option value='20'  >&nbsp;├ 手机通话记录清单（最近2个月）</option><option value='19'  >&nbsp;├ 固定电话通话记录清单（最近2个月）</option><option value='18'  >&nbsp;├ 家人身份证背面</option><option value='17'  >&nbsp;├ 家人身份证正面</option><option value='16'  >&nbsp;├ 结婚证</option><option value='15'  >&nbsp;├ 户口本</option><option value='14'  >&nbsp;├ 学位证书或毕业证书</option><option value='22'  >&nbsp;├ 本人身份证正面</option><option value='13'  >&nbsp;└ 生活照</option><option value='9'  disabled> 联保类资料上传</option><option value='47'  >&nbsp;├ 其他资料</option><option value='46'  >&nbsp;└ 联保合同</option>        </select>

                     &nbsp;审核状态：
                     <select class="select_2" name="select3">
                       <option selected="selected" value="0">所有</option>
                       <option value="1">待审核</option>
                       <option value="1">已通过</option>
                       <option value="1">未通过</option>
                     </select>
                     上传时间： 
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
                      <th align="center" valign="middle" >会员名</th>
                      <th align="center" valign="middle" >真实姓名</th>
                      <th align="center" valign="middle">所属客服</th>
                      <th align="center" valign="middle" >资料分类</th>
                      <th align="center" valign="middle" >资料名称</th>
                      <th align="center" valign="middle" >上传时间</th>
					  <th align="center" valign="middle" >操作</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td>1</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
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
				<div class="common-form ad_add" style="display:none;">
			<form method="post" class="form-horizontal J_ajaxForm"  action="*">
				<div class="table_list">
					<table class="table_form" cellpadding="2" cellspacing="2"
						width="100%">
						<tbody>
							<tr>
								<td width="180">是否通过：
<input name="radiobutton" type="radio" value="radiobutton" checked>
是
<input type="radio" name="radiobutton" value="radiobutton">
否</td>		
							</tr>
							<td width="180">资料类型：</td>		
							</tr>
							<tr>
								<td>处理说明:</td>
								<td><textarea name="ad_content" rows="5" cols="57"></textarea></td>
							</tr>
							<td width="180">资料详情：点击下载</td>		
							</tr>
							<tr>
						</tbody>
					</table>
				</div>
				<div class="form-actions">
					<button type="submit" class="btn btn-primary btn_submit J_ajax_submit_btn">审核</button>
					<a class="btn" href="#">返回</a>
				</div>
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