<%@page import="org.apache.taglibs.standard.tag.common.xml.ForEachTag"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>.
<!DOCTYPE html>

<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<span>Login form 2</span>
	<c:forEach var="user" items="${item}">
		<p>${user.getUsername()}</p>
	</c:forEach>
	<form action="login">
		<input type="text" id="myname" value="name">
		<input type="text" id="myid" value="id">
		<input type="submit" onclick="GetInfor(event)" name="submit" value="Redirectt">
	</form>
	<script >
		function GetInfor(event) {
			console.log("Run :",event.target.name);
			localStorage.setItem("username",document.getElementById("myname").value);
			localStorage.setItem("Userid",document.getElementById("myid").value)
		}
	</script>
</body>
</html>