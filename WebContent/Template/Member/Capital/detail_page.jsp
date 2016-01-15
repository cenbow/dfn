<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
<script type="text/javascript">
$(function(){
	$('.df_member_zw200').poshytip({
		className: 'tip-yellowsimple',
		showOn: 'hover',
		alignTo: 'target',
		alignX: 'center',
		alignY: 'top',
		offsetX: 0,
		offsetY: 5
	});
});
</script>
<div class="df_member_zsec">
    <ul class="df_member_zsecul1">
        <li class="df_member_zw60">ID</li>
        <li class="df_member_zw80">事件类型</li>
        <li class="df_member_zw70">影响金额</li>
        <li class="df_member_zw70">可用余额</li>
        <li class="df_member_zw70">待收金额</li>
        <li class="df_member_zw70">冻结金额</li>
        <li class="df_member_zw130">发生时间</li>
        <li class="df_member_zw170">说明</li>
    </ul>
    <c:if test="${not empty list.data }">
        <c:forEach items="${list.data }" var="user">
            <div class="df_member_zsecpro1" id="list_${user.id}">
                <ul class="df_member_zsecul2">
                    <li class="df_member_zw60">${user.id}</li>
                    <li class="df_member_zw80">${moneyType[user['type']]}</li>
                    <li class="df_member_zw70">${dfn:compareNum(user['affect_money'],'0','<b class="green">','<b class="red">')}${user.affect_money}</b></li>
                    <li class="df_member_zw70">${user.account_money}</li>
                    <li class="df_member_zw70">${user.collect_money}</li>
                    <li class="df_member_zw70">${user.freeze_money}</li>
                    <li class="df_member_zw130">${user.add_time}</li>
                    <li class="df_member_zw200" title="${user.info}">${user.info}</li>
                </ul>

            </div>
        </c:forEach>
    </c:if>
    <div class="pagination ajaxpagebar" data="include_page">${list.pageBar}</div>
</div>
		
		 
	
