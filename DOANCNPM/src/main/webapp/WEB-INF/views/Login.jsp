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
		<input type="submit" onclick="GetInfor(event)" name="submit" value="Redirectt">
	</form>
	<script >
		function GetInfor(event) {
			console.log("Run :",event.target.name);
			localStorage.setItem("username",event.target.name);
			localStorage.setItem("Userid","2")
		}
	</script>
</body>
</html>