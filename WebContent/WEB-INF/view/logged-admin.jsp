<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>
<spring:url value="/resources/css/logged-pustakawan.css" var="mainCss" />
<link href="${mainCss}" rel="stylesheet" />
<meta charset="ISO-8859-1">
<title>Avagames</title>
</head>
<body>
<h1>HALO PUSTAKAWAN, ${model.nama}</h1>
<ul>
<li><a href="editAdm">Ubah Data</a></li>
<li><a href="tambah-adm">Tambah Pustakawan</a></li>
<li><a href="/springmvc-hibernate-maven/game/tambahGame">Tambah Game</a></li>
<li><a href="daftarmhs-adm">Daftar Mahasiswa</a></li>
<!-- <li><a href="lihatpeminjaman">Daftar Peminjaman</a></li>-->
<li><a href="lihatpeminjaman">Daftar Peminjaman</a></li>
<li style="float:right"><a class="aclive" href="/springmvc-hibernate-maven/Avagames/logout">Logout</a></li>
</ul>
<h1>Daftar Game</h1>
<div class="table-responsive-md">
<table class="table table-striped table-bordered" style="width:100%">
<thead class="thead-dark">
	<tr>
	    <th>Judul</th>
	    <th>Pengarang</th> 
	    <th>Tahun Terbit</th>
	    <th>Edisi</th>
	    <th>Status</th>
	    <th>Action</th>
 	 </tr>
 </thead>
 	 <c:forEach var="value" items="${game }"> 
	 	 <tr>
	 	 	<th>${value.judul }</th>
		    <th>${value.developer }</th>
		    <th>${value.tahun_terbit }</th> 
		    <th>${value.edisi }</th>
		    <th>${value.status }</th>
		    <th><a href="/springmvc-hibernate-maven/game/deleteGame?id=${value.ID_Game }">Hapus</a>
		    <a href="/springmvc-hibernate-maven/game/editStatus?id=${value.ID_Game}">Ubah</a></th>
	 	 </tr>
	 </c:forEach>
</table>
</div>

</body>
</html>