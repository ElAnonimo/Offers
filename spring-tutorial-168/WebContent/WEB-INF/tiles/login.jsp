<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">
$(document).ready(function () {      // anonimous function
	document.f.username.focus();
});
</script>

<h3>Login with Username and Password</h3>

<c:if test="${param.error != null}">
	<p class="error">Login failed. Check the credentials.</p>
</c:if>

<form name='f' action='${pageContext.request.contextPath}/login' method='POST'>
 <table class="formtable">
    <tr><td>User:</td><td><input type='text' name='username' value=''></td></tr>
    <tr><td>Password:</td><td><input type='password' name='password'/></td></tr>
    <tr><td>Remember me:</td><td><input type='checkbox' name='remember-me' checked="checked"/></td></tr>
    <tr><td colspan='2'><input name="submit" type="submit" value="Login"/></td></tr>
    <!-- <input name="_csrf" type="hidden" value="d591e0e3-a816-43ee-b9bc-9559d4e188cc" /> -->
  </table>
</form>

<p><a href="<c:url value="/newaccount" />">Create new account</a></p>