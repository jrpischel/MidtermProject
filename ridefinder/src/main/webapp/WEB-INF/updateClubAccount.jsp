<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="bootstrapHead.jsp"/>
<link rel="stylesheet" href="css/main.css"/>
<title>Update Your Account</title>
</head>
<body>
<jsp:include page="navbar.jsp"/>
<div class="container">
<h1>Update your account</h1>
	<br>

<form action="clubUpdate.do" method="GET">
	
			<input type="hidden" name="id" value="${club.id}">

			<label for="name">Club Name:</label>
			<input type="text" name="name" id="name" value="${club.name}" required>
			
			<br>
			<br>
			<label for="photoURL">Photo:</label>
			<input type="text" name="photoURL" id="photoURL" value="${club.photoURL}">


			<br>
			<br>
			<div class="input-group">
     		<span class="input-group-text">Description</span>
     		<textarea class="form-control" aria-label="With textarea" name="description" id="description">${club.description}</textarea>
   			</div>

			<br>
			<br>
			<%-- Address:
			<div>
			<label for="street">Street:</label>
			<input type="text" name="street" id="street" value="${club.address.street}">
   			</div>
			<div>
			<label for="city">City:</label>
			<input type="text" name="city" id="city" value="${club.address.city}">
   			</div>
			<div>
			<label for="state">State:</label>
			<input type="text" name="state" id="state" value="${club.address.state}">
   			</div>
			<div>
			<label for="zip">Zip Code:</label>
			<input type="text" name="zip" id="zip" value="${club.address.zip}">
   			</div> --%>

			<br>
			<br>
			<div class="form-check form-switch form-check-reverse">
  			<input class="form-check-input" type="checkbox"  name="shared" id="shared" value="1">
  			<label class="form-check-label" for="flexSwitchCheckReverse">Make Profile Private</label>
			</div>

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