<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
<h1>Tambah Game</h1>
<ul>
<li><a href="home-adm">Home</a></li>
<li style="float:right"><a class="aclive" href="/springmvc-hibernate-maven/Avagames/logout">Logout</a></li>
</ul>
<div class="besar">

	<div class="badan" style="padding-top:5%">
		<div class="form-css">
			<form:form action="insertDb" method="POST" modelAttribute="game">
				ID Game: <br />
				<form:input path="ID_Game"/> <br /><br />
				Judul : <br />
				<form:input path="judul" /> <br /><br />
				Tahun Terbit : <br />
				<form:input path="tahun_terbit" /> <br /><br />
				Developer : <br />
				<form:input path="developer" /> <br /><br />
				Edisi : <br />
				<form:input path="edisi" /> <br /><br />
				Link Deskripsi : <br />
				<form:input path="linkdeskripsi" /> <br /><br />
				Status : <br />
				<form:select path="status">
					<form:option value="Tersedia"></form:option>
					<form:option value="Dipinjam"></form:option>
				</form:select><br />
				<input style="margin-left: 50%;" type="submit" value="Submit">
			</form:form>
		</div>
	</div>
</div>
</body>
</html>