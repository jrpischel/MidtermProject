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

<form action="updateAccount.do" method="GET">
	
			<input type="hidden" name="id" value="${user.id}">

			<label for="username">Username:</label>
			<input type="text" name="username" id="username" value="${user.username}" required>

			<br>
			<br>
			<label for="firstName">First Name:</label>
			<input type="text" name="firstName" id="firstName" value="${user.firstName}">

			<br>
			<br>
			<label for="lastName">Last Name:</label>
			<input type="text" name="lastName" id="lastName" value="${user.lastName}">


			<br>
			<br>
			<label for="nickname">Nickname:</label>
			<input type="text" name="nickname" id="nickname" value="${user.nickname}">
			
			<br>
			<br>
			<label for="photoURL">Photo:</label>
			<input type="text" name="photoURL" id="photoURL" value="${user.photoURL}">


			<br>
			<br>
			<div class="input-group">
     		<span class="input-group-text">Description</span>
     		<textarea class="form-control" aria-label="With textarea" name="description" id="description">${user.description}</textarea>
   			</div>

			<br>
			<br>
			<%-- Address:
			<div>
			<label for="street">Street:</label>
			<input type="text" name="street" id="street" value="${user.address.street}">
   			</div>
   			--%>
			<div>
			<label for="city">City:</label>
			<input type="text" name="city" id="city" value="${city}">
   			</div>
			<div>
			<label for="state">State:</label>
			<input type="text" name="state" id="state" value="${state}">
   			</div>
			<div>
			<!-- 
			<label for="zip">Zip Code:</label>
			<input type="text" name="zip" id="zip" value="${user.address.zip}">
   			</div>  -->

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