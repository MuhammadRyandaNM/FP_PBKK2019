<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 
<!DOCTYPE html>
<html>
<head>
<spring:url value="/resources/css/login.css" var="mainCss" />
<link href="${mainCss}" rel="stylesheet" />
<meta charset="ISO-8859-1">
<title>Login Page</title>
</head>
<body>
<div class="logo"><h1>Avagames</h1></div>
<div class="besar">
	<div class="badan">
		<div class="form-css">
			<form:form action="prosesLogin" method="POST" modelAttribute="model">
				No. KTP : <br /><br />
				<form:input path="id" /> <br /><br />
				Password : <br /><br />
				<form:password path="password" /> <br /><br />
				Role : <br /><br />
				<form:radiobutton path="role" value="User" />User
				<form:radiobutton path="role" value="Admin" />Admin<br /><br />
				<input type="submit" value="Submit">
			</form:form>
		</div>
	</div>
</div>
</body>
</html>