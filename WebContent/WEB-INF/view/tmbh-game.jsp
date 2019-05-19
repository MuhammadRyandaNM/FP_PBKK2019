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
<h1>Tambah Buku</h1>
<a href="/springmvc-hibernate-maven/adm/home-adm">Home</a>
<a href="/springmvc-hibernate-maven/Avagames/">Logout</a><br /><br />
<div class="besar">
	<div class="header">
		<div class="logo">Avagames</div>
	</div>
	<div class="badan">
		<div class="form-css">
			<form:form action="insertDb" method="POST" modelAttribute="game">
				ISBN : <br />
				<form:input path="ID_Game"/> <br /><br />
				Judul : <br />
				<form:input path="judul" /> <br /><br />
				Tahun Terbit : <br />
				<form:input path="tahun_terbit" /> <br /><br />
				Pengarang : <br />
				<form:input path="developer" /> <br /><br />
				Edisi : <br />
				<form:input path="edisi" /> <br /><br />
				Status : <br />
				<form:select path="status">
					<form:option value="Tersedia"></form:option>
					<form:option value="Dipinjam"></form:option>
				</form:select><br />
				<input type="submit" value="Submit">
			</form:form>
		</div>
	</div>
</div>
</body>
</html>