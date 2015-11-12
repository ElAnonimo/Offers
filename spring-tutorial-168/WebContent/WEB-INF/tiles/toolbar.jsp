<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<c:choose>
	<c:when test="${hasOffer}">
		<a href="${pageContext.request.contextPath}/createoffer">Edit or delete your offer</a>&nbsp;&nbsp;
	</c:when>
	<c:otherwise>
		<a href="${pageContext.request.contextPath}/createoffer">Click here to create an offer</a>
	</c:otherwise>
</c:choose>

<%-- <a href="${pageContext.request.contextPath}/offers">Click here to see the offers</a><p></p> --%>

<sec:authorize access="hasRole('ROLE_ADMIN')">
	<a href="<c:url value='/admin'></c:url>">Admin</a><p></p>
</sec:authorize>

<sec:authorize access="isAuthenticated()">
	<a href="<c:url value='/messages'></c:url>">Messages (<span id="numberMessages">0</span>)</a><p></p>
</sec:authorize>