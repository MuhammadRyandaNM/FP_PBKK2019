<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<spring:url value="/resources/css/table-usr.css" var="mainCss" />
<link href="${mainCss}" rel="stylesheet" />
<meta charset="ISO-8859-1">
<title>Avagames</title>
<style>
body {
  background-color: white;
  margin-bottom: 20px;
}

.header {
  background: linear-gradient(to bottom right, #17EAD9, #6078ea);
  padding: 20px;
  text-align: center;
}

.content h2 {
  text-align: center;
}

ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  overflow: hidden;
  background-color: #333;
}

li {
  float: left;
}

li a {
  display: block;
  color: white;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}

li a:hover {
  background-color: #04275e;
}



#tabel {
  font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 85%;
  margin-left: auto;
  margin-right: auto;
}

#tabel td, #tabel th {
  border: 1px solid #ddd;
  padding: 8px;
}

#tabel tr:nth-child(even){background-color: #f2f2f2;}

#tabel tr:hover {background-color: #ddd;}

#tabel th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: center;
  background-color: #0280c9;
  color: white;
}
</style>
</head>
<body>
<div class=header>
	<h1>Hai, ${model.nama }</h1>
</div>

<ul>
	<li><a href="home-usr">Home</a></li>
	<li><a href="peminjaman-usr?id=${model.ID_user }">List Peminjaman</a></li>
	<li><a href="/springmvc-hibernate-maven/Avagames/logout">Logout</a></li>

</ul>

<div class=content>
<h2>Riwayat Peminjaman</h2>
	<table id="tabel">
		<tr>
		    <th>Buku</th>
		    <th>Tanggal Mulai</th> 
		    <th>Tanggal Selesai</th>
		    <th>Denda</th>
		    <th>Status Peminjaman</th>
		    
	 	 </tr>
	 	 <c:forEach var="value" items="${pinjam }"> 
		 	 <tr>
		 	 	<th>${value.judulgame }</th>
			    <th>${value.tgl_pinjam }</th>
			    <th>${value.tgl_kembali }</th> 
			    <th>${value.denda }</th>
			    <th>${value.status_peminjaman }</th>
		 	 </tr>
		 </c:forEach>
	</table>
</div>
</body>
</html>