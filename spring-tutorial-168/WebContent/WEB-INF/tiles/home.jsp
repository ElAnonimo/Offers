<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!-- Bienvenidos a mi pagina. <p></p> -->

<table class="offers">
<tr><td>Name</td><td>Email</td><td>Offer</td></tr>

<c:forEach var="offer" items="${offers}">
	<tr class="offerrow">
		<td class="name"><c:out value="${offer.user.name}"></c:out></td>
		<td class="contact"><a href="<c:url value='/message?uid=${offer.username}'></c:url>">contact</a></td>
		<td class="text"><c:out value="${offer.text}"></c:out></td>
	</tr>	
</c:forEach>
</table>

<script type="text/javascript">
	function updateMessageLink(data) {
		$("#numberMessages").text(data.number);
		// alert(data.number);
	}

	function onLoad() {
		updateNumberMessage();
		window.setInterval(updateNumberMessage, 3000);
	}
	
	function updateNumberMessage() {
		// alert("Updating message count...");
		$.getJSON("<c:url value="/getmessages"></c:url>", updateMessageLink);
	}
	
	$(document).ready(onLoad);
</script>