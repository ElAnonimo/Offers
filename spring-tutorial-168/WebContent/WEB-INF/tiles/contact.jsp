<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<h2>Send Message</h2>
<%-- User: ${fromUser} --%>
<sf:form method="post" commandName="message"> <!-- no action specified so this form submits to the url it's on -->

<input type="hidden" name="_flowExecutionKey" value="${flowExecutionKey}"></input>
<input type="hidden" name="_eventId" value="send"></input>

<!-- <input type="hidden" name="username" value="johnwpurcell"></input> -->

<table class="formtable">
<tr><td class="label">Your name: </td><td><sf:input class="control" path="name" type="text" value="${fromName}"></sf:input>
	<br/><div class="error"><sf:errors path="name"></sf:errors></div></td></tr>
<tr><td class="label">Your email: </td><td><sf:input class="control" path="email" type="text" value="${fromEmail}"></sf:input>
	<br/><div class="error"><sf:errors path="email"></sf:errors></div></td></tr>
<tr><td class="label">Subject: </td><td><sf:input class="control" path="subject" type="text"></sf:input>
	<br/><div class="error"><sf:errors path="subject"></sf:errors></div></td></tr>
<tr><td class="label">Message to the user: </td><td><sf:textarea class="control" path="content" type="text"></sf:textarea>
	<br/><div class="error"><sf:errors path="content"></sf:errors></div></td></tr>

<tr><td class="label"></td><td><input class="control" value="Send message" type="submit"></input></td></tr>
</table>

</sf:form>