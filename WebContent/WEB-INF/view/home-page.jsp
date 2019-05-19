<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<spring:url value="/resources/css/home.css" var="mainCss" />
<link href="${mainCss}" rel="stylesheet" />
<meta charset="ISO-8859-1">
<title>Avagames</title>
</head>
<body>
<div class="logo"><h1> </h1></div>
	<div class="besar">
		<div class="header">
			<!--  <img src="http://rbtc.if.its.ac.id/v8/template/default/img/logo.png">-->
			<img style="padding-left: 27.5%;height: 100px;padding-top: 5%;" src="https://i.ibb.co/6WLmSm2/logo.jpg">

		</div>
		<div class="badan">
			<a href="login">Login</a>
			<a href="signup">Sign Up</a>
		</div>
	</div>
</body>
</html>