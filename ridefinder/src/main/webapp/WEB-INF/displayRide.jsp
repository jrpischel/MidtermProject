<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<jsp:include page="bootstrapHead.jsp"/>

<link rel="stylesheet" href="css/main.css"/>


<title>Ride Finder</title>
</head>

<body>

<div class="container">

<jsp:include page="navbar.jsp"/>


<h1>${ ride.name }</h1>

<c:choose>
	<c:when test="${!empty loggedInUser}">
		
		<c:choose>
			<c:when test="${rideOwner }">
			<a href="#" class="btn btn-success">Your Ride</a>
			</c:when>
			<c:when test="${alreadyJoined }">
			<a href="#" class="btn btn-success">Joined Ride</a>
			</c:when>
			<c:otherwise>
			<a href="userJoinsRide.do?theRideId=${ride.id }" class="btn btn-dark">Join Ride</a>
			</c:otherwise>
		</c:choose>
		
		
		
	</c:when>
	<c:otherwise></c:otherwise>
</c:choose>

<h5>Ride Date: ${ ride.rideDate } </h5>
		<h3>Address</h3>
	Street: <c:out value="${ride.getStartAddressId().getStreet()}" />
			<br>
	City: <c:out value="${ride.getStartAddressId().getCity()}" />
		    <br>
	State: <c:out value="${ride.getStartAddressId().getState()}" />
		    <br>
		
	<%-- Zip: <c:out value="${ride.getAddress().getZip()}" /> --%>





<h3>Description</h3>
<p>${ride.description}</p>
<div class="text-center">
<img src="${ride.photoURL}" class="img-fluid">
</div>



<jsp:include page="bootstrapFoot.jsp"/>
</div>
</body>
</html>