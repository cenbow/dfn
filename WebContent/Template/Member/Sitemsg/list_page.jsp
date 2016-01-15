<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
<%@ include file="../Common/headerMeta.jsp"%>
 
                  <div class="df_member_jfactivecon">
                       <ul class="df_member_jfactiveconul1 df_member_jfactiveconulbg">
                           <li class="df_member_zw120">
                              消息类型
                           </li>
                           <li class="df_member_zw500">
                              内容
                           </li>
                           <li class="df_member_zw150">
                              发送时间
                           </li>
                       </ul>
                       <c:if test="${not empty list.data }">
						<c:forEach items="${list.data }" var="user">
                       <ul class="df_member_jfactiveconul1 ">
                           <li class="df_member_zw120">
                            ${user.title}
                           </li>
                           <li class="df_member_zw500">
                              <a href="javascript:;" onClick="showDetail()">${dfn:subStr(user.msg,20)}&nbsp;...
                              </a>
                           </li>
                           <li class="df_member_zw150">
                             ${user.send_time}
                           </li>
                       </ul>
                     	</c:forEach>
					</c:if>
                  </div>
                  <!--  -->
                 
                  
              
          
         
