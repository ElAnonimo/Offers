<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<div id="messages"></div>

<script type="text/javascript">

	var timer;

	function showReply(i) {
		stopTimer();
		$("#form" + i).toggle();  // toggle() toggles displaying the forms on the page
	}
	
	function success(data) {
		$("#form" + data.target).toggle();
		$("#alert" + data.target).text("Message sent.");
		startTimer();
		// alert(data.target);
	}
	
	function error(data) {
		alert("Error sending message.");
	}
	
	function sendMessage(i, name, email) {
		// alert($("#textbox" + i).val());
		// alert(name + ": " + email);
		var text = $("#textbox" + i).val();
		$.ajax({
			type: 'POST',
			url: '<c:url value="/sendmessage"></c:url>',
			data: JSON.stringify({"target": i, "text": text, "name": name, "email": email}),
			success: success,
			error: error,
			contentType: "application/json",
			dataType: "json"
		});
	}

	function showMessages(data) {
		// $("#numberMessages").text(data.number);
		// alert(data.number);
		
		$("div#messages").html(""); 									// clear the html page
		// to clear the div id="messages" before each run of the updateNumberMessage() by timer
		// div#messages is equal to #messages
		for (var i=0; i<data.messages.length; i++) {
			var message = data.messages[i];
			
			// $("div#messages").append(message.subject); // this would output all the messages' subjects
			var messageDiv = document.createElement("div");
			messageDiv.setAttribute("class", "message");
			
			var subjectSpan = document.createElement("span");
			subjectSpan.setAttribute("class", "subject");
			subjectSpan.appendChild(document.createTextNode(message.subject));
			
			var contentSpan = document.createElement("span");
			contentSpan.setAttribute("class", "messagebody");
			contentSpan.appendChild(document.createTextNode(message.content));
			
			var nameSpan = document.createElement("span");
			nameSpan.setAttribute("class", "name");
			nameSpan.appendChild(document.createTextNode(message.name + " ("));
			
			var link = document.createElement("a");
			link.setAttribute("class", "replylink");
			link.setAttribute("href", "#");  // # to underline the link
			link.setAttribute("onclick", "showReply(" + i + ")");
			link.appendChild(document.createTextNode(message.email));
			nameSpan.appendChild(link);
			nameSpan.appendChild(document.createTextNode(")"));
			
			var alertSpan = document.createElement("span");
			alertSpan.setAttribute("class", "alert");
			alertSpan.setAttribute("id", "alert" + i);
			// alertSpan.appendChild(document.createTextNode("message sent"));
			
			var replyForm = document.createElement("form");
			replyForm.setAttribute("class", "replyform");
			replyForm.setAttribute("id", "form" + i);
			
			var textarea = document.createElement("textarea");
			textarea.setAttribute("class", "replyarea");
			textarea.setAttribute("id", "textbox" + i);
			
			var replyButton = document.createElement("input");
			replyButton.setAttribute("class", "replybutton");
			replyButton.setAttribute("type", "button");
			replyButton.setAttribute("value", "Reply");
			// replyButton.onclick = sendMessage;
			replyButton.onclick = function(j, name, email) {
				return function() {
					sendMessage(j, name, email);
				}
			}(i, message.name, message.email);
			
			replyForm.appendChild(textarea);
			replyForm.appendChild(replyButton);
			
			messageDiv.appendChild(subjectSpan);
			messageDiv.appendChild(contentSpan);
			messageDiv.appendChild(nameSpan);
			messageDiv.appendChild(alertSpan);
			messageDiv.appendChild(replyForm);
			
			$("div#messages").append(messageDiv);
		}
	}

	function onLoad() {
		updateNumberMessage();
		startTimer();
	}
	
	function updateNumberMessage() {
		// alert("Updating message count...");
		$.getJSON("<c:url value='/getmessages'></c:url>", showMessages);
	}
	
	function startTimer() {
		timer = window.setInterval(updateNumberMessage, 5000);
	}
	
	function stopTimer() {
		window.clearInterval(timer);
	}
	
	$(document).ready(onLoad);
</script>