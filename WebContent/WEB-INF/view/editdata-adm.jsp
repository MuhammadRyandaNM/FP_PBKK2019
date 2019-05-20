<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>
<spring:url value="/resources/css/form.css" var="mainCss" />
<spring:url value="/resources/lib/bootstrap/css/bootstrap.min.css" var="bootstrapmin" />
<spring:url value="/resources/css1/style.css" var="css" />
<link href="${mainCss}" rel="stylesheet" />
<link href="${bootstrapmin}" rel="stylesheet">
<link href="${css}" rel="stylesheet">

<meta charset="ISO-8859-1">
<title>Avagames</title>
</head>
<body>
<h1>Edit Data</h1>

<ul style="height:60px;">
<li><a href="/springmvc-hibernate-maven/adm/home-adm">Home</a></li>
<li style="float:right"><a class="aclive" href="/springmvc-hibernate-maven/Avagames/logout">Logout</a></li>
</ul>


<div class="besar">
	<div class="badan" style="padding-top:5%">
		<div class="form-css">
			<form:form action="editDb" method="POST" modelAttribute="model">
				Nama : <br />
				<form:input path="nama"/> <br /><br />
				No KTP : <br />
				<form:input disabled="true" path="ID_Admin" /> <br /><br />
				Password <br />
				<form:password path="password" /> <br /><br />
				Email : <br />
				<form:input path="email" /> <br /><br />
				No. HP : <br />
				<form:input path="nohp" /> <br /><br />
				<input style="margin-left: 50%;" type="submit" value="Submit">
			</form:form>
		</div>
	</div>
</div>
</body>
</html>