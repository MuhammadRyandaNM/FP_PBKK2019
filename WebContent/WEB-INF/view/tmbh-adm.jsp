<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1>Tambah Pustakwan</h1>
<a href="/springmvc-hibernate-maven/adm/home-adm">Home</a>
<a href="/springmvc-hibernate-maven/Avagames/">Logout</a><br /><br />
<div class="besar">
	<div class="header">
		<div class="logo">Avagames</div>
	</div>
	<div class="badan">
		<div class="form-css">
			<form:form action="daftarAdmin" method="POST" modelAttribute="adm">
				Nama : <br />
				<form:input path="nama"/> <br /><br />
				NIP : <br />
				<form:input path="ID_Admin" /> <br /><br />
				Password <br />
				<form:password path="password" /> <br /><br />
				Email : <br />
				<form:input path="email" /> <br /><br />
				No. HP : <br />
				<form:input path="nohp" /> <br /><br />
				<input type="submit" value="Submit">
			</form:form>
		</div>
	</div>
</div>
</body>
</html>