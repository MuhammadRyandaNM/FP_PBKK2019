<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Avagames</title>
<style>
body {
  background-color: white;
  margin-bottom: 20px;
}

.top .header {
  background: linear-gradient(to bottom right, #17EAD9, #6078ea);
  padding: 20px;
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

.active {
  background-color: red;
}

.active:hover{
	background-color: #cc0000;
}

.besar{
	width : 40%;
	height : 500px;
	margin : auto;
	align-content: center;
}

.badan{
	background-color : #61b9d9;
	font-family : arial;
	font-size : 16px;
	padding-left : 20%;
}

input[type=button], input[type=submit], input[type=reset] {
	align-content : center; 
	text-decoration: none;
	font-family : arial;
	font-size : 16px;
	border : none;
	padding: 10px 20px;
	background-color : #1A8FCE;
	color : white;
	border-radius : 5px;
	margin-bottom: 10px;
}

input[type=submit]:hover {
	background-color: #0B4564;
	border-radius : 5px;
}

input[type=text] {
  width: 80%;
  padding: 8px 15px;
  margin: 8px 0;
  border-radius: 5px;
  box-sizing: border-box;
}

input[type=password]{
  width: 80%;
  padding: 8px 15px;
  margin: 8px 0;
  box-sizing: border-box;
  border-radius: 5px;
}

</style>
</head>

<body>
<div class=top>
	<div class=header>
		<h1>EDIT DATA</h1>
	</div>
</div>

<ul>
	<li><a href="/springmvc-hibernate-maven/usr/home-usr">Home</a></li>
	<li><a href="/springmvc-hibernate-maven/Avagames/logout">Logout</a></li>
</ul>

<br></br>
<div class="besar">
	
	<div class="badan" style="padding-top:5%">
		<div class="form-css">
			<form:form action="editDb" method="POST" modelAttribute="model">
				Nama : <br />
				<form:input path="nama"/> <br /><br />
				NO KTP : <br />
				<form:input disabled="true" path="ID_user" /> <br /><br />
				Password <br />
				<form:password path="password" /> <br /><br />
				Email : <br />
				<form:input path="email" /> <br /><br />
				No. HP : <br />
				<form:input path="nohp" /> <br /><br /><br /><br />
				<input style="margin-left: 50%;" type="submit" value="Submit">
			</form:form>
		</div>
	</div>
</div>
</body>
</html>