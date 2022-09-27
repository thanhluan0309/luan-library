<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form:form method="POST" action="edit" modelAttribute="user">
		<table>
			<tr>
				<td><form:input path="username"/></td>
			</tr>
			<tr>
				<td><form:input path="password"/></td>
			</tr>
			<tr>
				<td><input type="submit" value="Update"/></td>		
			</tr>
		</table>
	</form:form>
	<h1>Thong tin nhan vien </h1>
	<span>Username : ${user.username }</span>
	<br/>
	<span>Password : ${user.password }</span>
</body>
</html>