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
<style>
.profile {color:#FFFFFF;}
</style>
</head>


<body>
<jsp:include page="navbar.jsp"/>
	<%--Edit the file nav.jsp to change nav links --%>
<div class="container">
 <div class="profile">
	<c:choose>
		<c:when test="${!empty sessionScope.loggedInUser}">
			
			<h2 class="newColor">Your Account Details</h2>
			<img src="${loggedInUser.getPhotoURL() }" style="height:150px">
			<br>
	UserName: <c:out value="${loggedInUser.getUsername()}" />
			<br>
	First Name: <c:out value="${loggedInUser.getFirstName()}" />
			<br>
	Last Name: <c:out value="${loggedInUser.getLastName()}" />
			<br>

	Nickname: <c:out value="${loggedInUser.getNickname()}" />
			<br>
	Joined Date: <c:out value="${loggedInUser.getCreateDate().toLocalDate()}" />
			<br>	
	Description: <c:out value="${loggedInUser.getDescription()}" />
			<br>
		<h3>Address</h3>
	City: <c:out value="${loggedInUser.getAddress().getCity()}" />
		    <br>
	State: <c:out value="${loggedInUser.getAddress().getState()}" />
			<br>
	</div>
	
	<div class="container text-center">
		<div class="row align-items-start">
			<div class="col">
		<h3>Clubs You Created</h3>
			<br>
	<c:if test= "${! empty loggedInUser.clubs}">
	 <table class="table table-striped table-hover">
		<thead>
		<tr>
			<th>Club Name</th>
			<th>Delete</th>
		</tr>
		</thead>
		<tbody>
			<c:forEach var="club" items="${loggedInUser.clubs}">
				<tr>
				<td><a href="clubHome.do?Id=${club.id}">${club.name}</a> </td>
				<c:choose>
				<c:when test="${club.enabled == true}">
				<td><a class="btn btn-dark" href="toggleEnabled.do?clubId=${club.id}" role="button">Disable</a> </td>
				</c:when>
				<c:otherwise>
				<td><a class="btn btn-dark" href="toggleEnabled.do?clubId=${club.id}" role="button">Enable</a> </td>
				</c:otherwise>
				</c:choose>
				</tr>
			</c:forEach>
		</tbody>
	</table> 
	</c:if>
	</div>
	
	<div class="col">
	<h3>Clubs You've Joined</h3>
	 <table class="table table-striped table-hover">
		<thead>
		<tr>
			<th>Club Name</th>
		</tr>
		</thead>
		<tbody>
			<c:forEach var="clubMember" items="${loggedInUser.clubMembers}">
				<tr>
				<td><a href="clubHome.do?Id=${clubMember.club.id}">${clubMember.club.name}</a> </td>
				</tr>
			</c:forEach>
		</tbody>
	</table> 
	</div>
	</div>
	</div>
	
	<div class="container text-center">
		<div class="row align-items-start">
			<div class="col">
		<h3>Rides You Created</h3>
			<br>
	<table class="table table-striped table-hover">
		<thead>
		<tr>
			<th>Ride Name</th>
		</tr>
		</thead>
		<tbody>
			<c:forEach var="ride" items="${loggedInUser.getRides()}">
				<tr>
				<td><a href="showRide.do?ride=${ride.id}">${ride.name}</a> </td>
				</tr>
			</c:forEach>
		</tbody>
	</table> 
	</div>
	<div class="col">
		<h3>Rides You Joined</h3>
			<br>
	<table class="table table-striped table-hover">
		<thead>
		<tr>
			<th>Ride Name</th>
		</tr>
		</thead>
		<tbody>
			<c:forEach var="rider" items="${loggedInUser.getRiders()}">
				<tr>
				<td><a href="displayRide.do?ride=${rider.ride.id}">${rider.ride.name}</a> </td>
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