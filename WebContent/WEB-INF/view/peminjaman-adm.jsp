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
<li><a href="home-adm">Home</a><li>
<li><a href="histori-adm">Riwayat Peminjaman</a><li>
<li><a href="editAdm">Ubah Data</a></li>
<li><a href="tambah-adm">Tambah Admin</a></li>
<li><a href="/springmvc-hibernate-maven/game/tambahGame">Tambah Game</a></li>
<li><a href="daftarusr-adm">Daftar User</a></li>
<!-- <li><a href="lihatpeminjaman">Daftar Peminjaman</a></li>-->
<li><a href="lihatpeminjaman">Daftar Peminjaman</a></li>
<li style="float:right"><a class="aclive" href="/springmvc-hibernate-maven/Avagames/logout">Logout</a></li>
</ul>


<h2>Daftar Peminjaman</h2>
<table style="width:100%">
	
 	 
	 
	 <div class="table-responsive-md">
<table class="table table-striped table-bordered" style="width:100%">
<thead class="thead-dark">
	<tr>
	    <th>Buku</th>
	    <th>Tanggal Mulai</th> 
	    <th>Tanggal Selesai</th>
	    <th>Denda</th>
	    <th>Status Peminjaman</th>
	    <th>Action</th>
 	 </tr>
 </thead>
 	 <c:forEach var="value" items="${pinjam }"> 
	 	 <tr>	
	 	 	<th>${value.judulgame }</th>
		    <th>${value.tgl_pinjam }</th>
		    <th>${value.tgl_kembali }</th> 
		    <th>${value.denda }</th>
		    <th>${value.status_peminjaman }</th>
		    <th><a href="statusPinjam?id=${value.id_peminjaman}">Ganti Status</a></th>
	 	 </tr>
	 </c:forEach>
</table>
</div>
	 
	 
</table>
</body>
</html>