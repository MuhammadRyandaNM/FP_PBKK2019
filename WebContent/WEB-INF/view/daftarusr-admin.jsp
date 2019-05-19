<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<spring:url value="/resources/css/tabel.css" var="mainCss" />
<spring:url value="/resources/lib/bootstrap/css/bootstrap.min.css" var="bootstrapmin" />
<spring:url value="/resources/css1/style.css" var="css" />
<link href="${mainCss}" rel="stylesheet" />
<link href="${bootstrapmin}" rel="stylesheet">
<link href="${css}" rel="stylesheet">
<meta charset="ISO-8859-1">
<title>Avagames</title>
</head>
<body>
<h1>Hai, ${model.nama }</h1>

<ul>
<li><a href="home-adm">Home</a></li>
<li><a href="editAdm">Ubah Data</a></li>
<li><a href="tambah-adm">Tambah Admin</a></li>
<li><a href="/springmvc-hibernate-maven/game/tambahGame">Tambah Game</a></li>
<li><a href="daftarusr-adm">Daftar User</a></li>
<!-- <li><a href="lihatpeminjaman">Daftar Peminjaman</a></li>-->
<li><a href="lihatpeminjaman">Daftar Peminjaman</a></li>
<li><a href="/springmvc-hibernate-maven/Avagames/logout">Logout</a></li>

</ul>
<h1>Daftar User</h1>
<div class="table-responsive-md">
<table class="table table-striped table-bordered" style="width:100%">
<thead class="thead-dark">
	<tr>
	    <th>No. KTP</th>
	    <th>Nama</th> 
	    <th>Email</th>
	    <th>No. HP</th>
	    <th>Action</th>
 	 </tr>
 </thead>
 	 <c:forEach var="value" items="${user }"> 
	 	 <tr>
	 	 	<th>${value.ID_user }</th>
		    <th>${value.nama }</th>
		    <th>${value.email }</th> 
		    <th>${value.nohp }</th>
		    <th><a href="/springmvc-hibernate-maven/usr/deleteUsr?id=${value.ID_user }">Hapus</a></th>
	 	 </tr>
	 </c:forEach>
</table>
</div>

</body>
</html>