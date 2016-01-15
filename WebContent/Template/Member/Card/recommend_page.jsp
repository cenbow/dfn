<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
<%@ include file="../Common/headerMeta.jsp"%>

<div class="df_member_jfactivecon">
     <ul class="df_member_jfactiveconul1 df_member_jfactiveconulbg">
         <li class="df_member_zw120">
            会员ID
         </li>
         <li class="df_member_zw500">
            会员名
         </li>
         <li class="df_member_zw150">
            注册时间
         </li>
     </ul>
     <c:if test="${not empty data.data }">
      <c:forEach items="${data.data }" var="user">
     <ul class="df_member_jfactiveconul1 ">
         <li class="df_member_zw120">
          ${user.id}
         </li>
         <li class="df_member_zw500">
            ${user.user_name}
         </li>
         <li class="df_member_zw150">
           ${dfn:date(user.reg_time,'yyy-MM-dd')}
         </li>
     </ul>
      </c:forEach>
  </c:if>
</div>
<div class="pagination ajaxpagebar" data="include_page_recommend">${data.pageBar}</div>
                 
                  
              
          
         
