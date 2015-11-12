<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script type="text/javascript" src="${pageContext.request.contextPath}/static/script/jquery-1.11.3.min.js"></script>
<script type="text/javascript">

function onLoad() {
	$("#password").keyup(checkPasswordsMatch);
	$("#confirmpass").keyup(checkPasswordsMatch);
	
	$("#details").submit(canSubmit);
}

function canSubmit() {
	var password = $("#password").val();       // stores the field's input text in the var password
	var confirmpass = $("#confirmpass").val();
	
	if (password != confirmpass) {
		alert("<fmt:message key='UnmatchedPasswords.user.password'></fmt:message>");
		return false;
	} else {
		return true;
	}
}

function checkPasswordsMatch() {
	var password = $("#password").val();       
	var confirmpass = $("#confirmpass").val();
	
	if (password.length > 3 || confirmpass.length > 3) {
		if (password == confirmpass) {
			$("#matchpass").text("<fmt:message key='MatchedPasswords.user.password'></fmt:message>");
			$("#matchpass").addClass("valid");        // adding CSS classes in the main.css
			$("#matchpass").removeClass("error");
		} else {
			$("#matchpass").text("<fmt:message key='UnmatchedPasswords.user.password'></fmt:message>");
			$("#matchpass").addClass("error");
			$("#matchpass").removeClass("valid");
		}
	}
}

$(document).ready(onLoad);

</script>