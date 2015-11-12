<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<h2>Create New Account</h2>

<sf:form id="details" method="post" action="${pageContext.request.contextPath}/createaccount" commandName="user">

<table class="formtable">
<tr><td class="label">Username: </td><td><sf:input class="control" path="username" name="username" type="text"></sf:input>
	<br/><div class="error"><sf:errors path="username"></sf:errors></div></td></tr>
<tr><td class="label">Name: </td><td><sf:input class="control" path="name" name="name" type="text"></sf:input>
	<br/><div class="error"><sf:errors path="name"></sf:errors></div></td></tr>
<tr><td class="label">Email: </td><td><sf:input class="control" path="email" name="email" type="text"></sf:input>
	<br/><div class="error"><sf:errors path="email"></sf:errors></div></td></tr>
<tr><td class="label">Password: </td><td><sf:input id="password" class="control" path="password" name="password" type="password"></sf:input>
	<br/><div class="error"><sf:errors path="password"></sf:errors></div></td></tr>
<tr><td class="label">Confirm password: </td><td><input id="confirmpass" class="control" name="confirmpass" type="password"></input>
	<div id="matchpass"></div></td></tr>
<tr><td class="label"></td><td><input class="control" value="Create account" type="submit"></input></td></tr>
</table>

</sf:form>