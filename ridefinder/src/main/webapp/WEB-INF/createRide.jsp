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
			<input type="text" name="name" id="name">
			<br>
			<br>
			
			
			
			
			<h2>Ride Date</h2>
			<label for="start">Start date:</label>

			<input type="date" id="start" name="rideDate" value="2023-09-26" min="2023-09-26" max="2034-01-18" />
			
			<br>
			<br>
			<label for="appt">Start Time:</label>
			<input type="time" id="appt" name="startTime"/>
			
			<h2>Starting Address</h2>
			
			<label for="street">Street:</label>
			<input type="text" name="street" id="street">
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
			

			<label for="zipcode">ZIP Code</label>
			<input type="text" pattern="[0-9]{5}" id="zipcode" name="zip" />
			<br>
			<br>
			
			
			<label for="skillLevel">Choose the skill level for this ride:</label>
		<select name="skillLevelId" id="skillLevel">
  			<option value="1">Beginner</option>
  			<option value="2">Intermediate</option>
  			<option value="3">Advanced</option>
		</select>
			<br>
			<br>
			
			<div class="input-group">
     		<span class="input-group-text">Description</span>
     		<textarea class="form-control" aria-label="With textarea" name="description" id="description"></textarea>
   			</div>
   			
			<h2>Add a photo for this ride</h2>
			<label for="photoURL">photo:</label>
			<input type="text" name="photoURL" id="photoURL">
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