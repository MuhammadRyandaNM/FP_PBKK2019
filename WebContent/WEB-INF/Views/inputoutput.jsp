<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Profile View</title>
</head>
<body>
<div style="text-align: center;">
<div  style="display: inline-block">
    <h1 style="font-size:50px;">Submitted Profile Information</h2>
    <table style="font-size: 30px;">
        <tr>
            <td>Name :</td>
            <td style="margin-left:10%">${name}</td>
        </tr>
        <tr>
            <td>Password:</td>
            <td style="margin-left:10%">${nrp}</td>
        </tr>
        <tr>
            <td>Confirm Password:</td>
            <td style="margin-left:10%">${score}</td>
        </tr>
        
    </table>
    <h3><a href="/SpringWebMVC/home/">Back home</a></h3>
    </div>
    </div>
</body>
</html>