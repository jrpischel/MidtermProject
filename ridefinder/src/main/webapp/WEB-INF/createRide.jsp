<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="bootstrapHead.jsp"/>
<link rel="stylesheet" href="css/main.css"/>
<title>Create a Ride</title>
</head>
<body>
<jsp:include page="navbar.jsp"/>
<div class="container">
<h1>Create a Ride</h1>
	<br>

<form action="makeRideForm.do" method="GET">
	
			<input type="hidden" name="user.id" value="${loggedInUser.id}">

			<label for="name">Name:</label>
			<input type="text" name="ride.name" id="name">
			<br>
			<br>
			<label for="city">City:</label>
			<input type="text" name="city" id="city">
			<br>
			<br>
			<label for="state">State:</label>
			<input type="text" name="state" id="state">
			<br>
			<br>
			<label for="skillLevel">Choose your skill level:</label>
		<select name="skillLevel" id="skillLevel">
  			<option value="1">Beginner</option>
  			<option value="2">Intermediate</option>
  			<option value="3">Advanced</option>
		</select>
			<br>
			<br>
			<input type="submit" />




</form>
</div>
<br>
<br>
<jsp:include page="bootstrapFoot.jsp"/>
</body>
</html>