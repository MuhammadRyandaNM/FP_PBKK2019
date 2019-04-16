<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    
	<meta charset="ISO-8859-1">
	<title>Form Input</title>
</head>
<body>
<div style="text-align: center;">
<div  style="display: inline-block">
	<h1>Input Here</h1>
	</div>
	</div>
	
<!-- <form role="form">
  <div class="form-group">
    <label for="email">Email address:</label>
    <input type="email" class="form-control" id="email">
  </div>
  <div class="form-group">
    <label for="pwd">Password:</label>
    <input type="password" class="form-control" id="pwd">
  </div>
  <div class="checkbox">
    <label><input type="checkbox"> Remember me</label>
  </div>
  <button type="submit" class="btn btn-default">Submit</button>
</form> -->	
<div style="text-align: center;">
<div  style="display: inline-block">
	<form:form  role="form" method="POST" action="/SpringWebMVC/form_input_output" modelAttribute="profiles">
		<table>
		<div style="display: inline-block;" class="form-group">
			<tr>
                <td><form:label path="name">Profile Name</form:label></td>
            	<td><form:input style="margin-left: 10%;" type="name" class="form-control" path="name"/></td>
            </tr>
            </div>
            <div style="display: inline-block;margin-left: 5%;" class="form-group">
            <tr>
                <td><form:label path="nrp">Password</form:label></td>
            	<td><form:input style="margin-left: 10%;" type="text" class="form-control" path="nrp"/></td>
            </tr>
            </div>
            <div style="display: inline-block;margin-left: 5%;" class="form-group">
            <tr>
                <td><form:label path="score">Confirm Password</form:label></td>
            	<td><form:input style="margin-left: 10%;" type="text" class="form-control" path="score"/></td>
            </tr>
            </div>
            <div style="display: inline-block;margin-left: 5%;" class="form-group">
            <tr>
            	<td></td>
                <td><input style="margin-left: 80%;margin-top: 10%;"type="submit" value="Submit"/></td>
            </tr>
            </div>
		</table>
	</form:form>
	</div>
	</div>
</body>
</html>