<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="bootstrapHead.jsp" />
<link rel="stylesheet" href="css/main.css" />
<title>Account Profile</title>
</head>
<body>
<jsp:include page="navbar.jsp"/>
	<%--Edit the file nav.jsp to change nav links --%>
<div class="container">
	<c:choose>
		<c:when test="${!empty user}">
			
			<h2>Your Account Details</h2>
			<img src="${user.getPhotoURL() }" style="height:150px">
			<br>
	UserName: <c:out value="${user.getUsername()}" />
			<br>
	First Name: <c:out value="${user.getFirstName()}" />
			<br>
	Last Name: <c:out value="${user.getLastName()}" />
			<br>

	Nickname: <c:out value="${user.getNickname()}" />
			<br>
	Joined Date: <c:out value="${user.getCreateDate().toLocalDate()}" />
			<br>	
	Description: <c:out value="${user.getDescription()}" />
			<br>
			<br>
		<h3>Address</h3>
			<br>
	City: <c:out value="${user.getAddress().getCity()}" />
		    <br>
	State: <c:out value="${user.getAddress().getState()}" />
			<br>
		<h3>Clubs</h3>
			<br>
	
	<c:if test= "${! empty user.clubs}">
	 <table class="table table-striped table-hover">
		<thead>
		<tr>
			<th>Club Name</th>
			<th>Delete</th>
		</tr>
		</thead>
		<tbody>
			<c:forEach var="club" items="${user.clubs}">
				<tr>
				<td><a href="clubHome.do?Id=${club.id}">${club.name}</a> </td>
				<c:choose>
				<c:when test="${club.enabled == true}">
				<td><a class="btn btn-dark" href="delete.do?clubId=${club.id}" role="button">Disable</a> </td>
				</c:when>
				<c:otherwise>
				<td><a class="btn btn-dark" href="enable.do?clubId=${club.id}" role="button">Enable</a> </td>
				</c:otherwise>
				</c:choose>
				</tr>
			</c:forEach>
		</tbody>
	</table> 
	</c:if>
	<br>
	<br>
	 <table class="table table-striped table-hover">
		<thead>
		<tr>
			
			<th>Club Name</th>
			
		</tr>
		</thead>
		<tbody>
			<c:forEach var="clubMember" items="${user.clubMembers}">
				<tr>
				<td><a href="clubHome.do?Id=${clubMember.club.id}">${clubMember.club.name}</a> </td>
				</tr>
			</c:forEach>
		</tbody>
	</table> 
	<div class="container text-center">
		<div class="row align-items-start">
			<div class="col">
		<h3>Rides ${user.nickname} Created</h3>
			<br>
	<table class="table table-striped table-hover">
		<thead>
		<tr>
			<th>Ride Name</th>
		</tr>
		</thead>
		<tbody>
			<c:forEach var="ride" items="${user.getRides()}">
				<tr>
				<td><a href="rideDisplay.do?theRideId=${ride.id}">${ride.name}</a> </td>
				</tr>
			</c:forEach>
		</tbody>
	</table> 
	</div>
	<div class="col">
		<h3>Rides ${user.nickname} Joined</h3>
			<br>
	<table class="table table-striped table-hover">
		<thead>
		<tr>
			<th>Ride Name</th>
		</tr>
		</thead>
		<tbody>
			<c:forEach var="rider" items="${user.getRiders()}">
				<tr>
				<td><a href="rideDisplay.do?theRideId=${rider.ride.id}">${rider.ride.name}</a> </td>
				</tr>
			</c:forEach>
		</tbody>
	</table> 
	</div>
	</div>
	</div>
		</c:when>
		<c:otherwise>
			<h1>Not logged in</h1>
		</c:otherwise>
	</c:choose>
	</div>
	<jsp:include page="bootstrapFoot.jsp"/>
	<%-- Output user details --%>



</body>
</html>