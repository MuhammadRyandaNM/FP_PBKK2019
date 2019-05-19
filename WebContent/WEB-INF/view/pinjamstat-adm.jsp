<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Avagames</title>
</head>
<body>
<h1>Hai, ${model.nama}</h1>
<a href="/springmvc-hibernate-maven/adm/home-adm">Home</a>
<a href="/springmvc-hibernate-maven/Avagames/">Logout</a><br /><br />

	<form:form action="prosesPinjam?id=${id }" method="POST" modelAttribute="status">
		<h4>Mengubah Status Peminjaman</h4>
				Status : <br />
				<form:select path="message">
					<form:option value="OK"></form:option>
					<form:option value="Ditolak"></form:option>
					<form:option value="Selesai"></form:option>
				</form:select><br />
			
			<input type="submit" value="Ubah" />
	</form:form>
</body>
</html>