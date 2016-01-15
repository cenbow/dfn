<%@ tag pageEncoding="UTF-8"%>

<%@ attribute name="type" type="java.lang.String" required = "true" %>
<%@ attribute name="name"  type = "java.lang.String" required= "true" %>
<%@ attribute name="items" type="java.util.Map" required="true"%>
<%@ attribute name="statValue" type="java.lang.Object" required="false"%>
<%@ attribute name="others" type="java.lang.String" required="false"%>
<%@ attribute name="defaultValue" type="java.lang.Integer" required="false"%>
<%@ attribute name="checkboxDefault" type="java.util.List" required="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:choose>

	<c:when test="${type eq 'select' }">
		<select  name="${name}"  name="${name}" ${ others}  > 
			<c:forEach items="${items }" var="i"  >
				<option value= "${i.key }" <c:if test="${statValue eq i.key ||((empty statValue) && defaultValue eq i.key) }">selected="selected" </c:if> > 
					${i.value } 
				</option>
			</c:forEach>
		</select>
		
	</c:when>	
	
	<%-- <c:when test="${type eq 'radio' }">
			<c:forEach items="${items }" var="i"  >
				${i.value }<input type="radio" name="${name}" ${ other} value="${i.key }" <c:if test="${defaultValue eq i.key }">checked="checked" </c:if> /> 
			</c:forEach>
	</c:when>
		
	<c:when test="${type eq 'checkbox' }">
			<c:forEach items="${items }" var="i"   >
				${i.value }<input type="checkbox" name="${name}" ${ other} value="${i.key }" 
									<c:forEach items="${checkboxDefault}" var ="k" >
										<c:if test="${k eq i.key }" >
											checked="checked" 
										</c:if> 
									</c:forEach> 
								>
					 	  </input> 
			</c:forEach>
	</c:when>	 --%>
		
		
		
</c:choose>