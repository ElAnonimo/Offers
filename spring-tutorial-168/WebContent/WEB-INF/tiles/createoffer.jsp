<%@ page language="java" contentType="text/html; charset=US-ASCII"
    pageEncoding="US-ASCII"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">
function onDeleteClick(event) {
	
	var doDelete = confirm("Delete your offer?");
	if (doDelete == false) {
		event.preventDefault();
	}
}

function onReady() {
	$("#delete").click(onDeleteClick);
}

$(document).ready(onReady);
</script>

<sf:form method="post" action="${pageContext.request.contextPath}/docreate" commandName="offer">
<sf:input type="hidden" name="id" path="id" />
<table class="formtable">
<%-- <tr><td class="label">Name: </td><td><sf:input class="control" path="name" name="name" type="text" /><br/><sf:errors path="name" cssClass="error"></sf:errors></td></tr> --%>
<%-- <tr><td class="label">Email: </td><td><sf:input class="control"  path="email" name="email" type="text" /><br/><sf:errors path="email" cssClass="error"></sf:errors></td></tr> --%>

<tr><td class="label">Your offer: </td><td><sf:textarea class="control"  path="text" name="text" rows="10"
				cols="10"></sf:textarea> <br/> <sf:errors path="text" cssClass="error"></sf:errors></td></tr>
<tr><td class="label"> </td><td><input class="control" value="Save offer" type="submit" /></td></tr>

<c:if test="${offer.id != 0}">
<tr><td class="label"> </td><td>&nbsp;</td></tr>
<tr><td class="label"> </td><td><input class="deletecontrol" name="delete" id="delete" value="Delete offer"
		type="submit" /></td></tr>
</c:if>
</table>

</sf:form>
