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
		<c:when test="${!empty sessionScope.loggedInUser}">
			
			<h2>Your Account Details</h2>
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
			<br>
		<h3>Address</h3>
			<br>
	City: <c:out value="${loggedInUser.getAddress().getCity()}" />
		    <br>
	State: <c:out value="${loggedInUser.getAddress().getState()}" />
			<br>
		<h3>Clubs</h3>
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
			<c:forEach var="clubMember" items="${loggedInUser.clubMembers}">
				<tr>
				<td><a href="clubHome.do?Id=${clubMember.club.id}">${clubMember.club.name}</a> </td>
				</tr>
			</c:forEach>
		</tbody>
	</table> 
	<br>
	<br>
		<h3>Rides</h3>
			<br>
	<table class="table table-striped table-hover">
		<thead>
		<tr>
			<th>Id</th>
			<th>Ride Name</th>
		</tr>
		</thead>
		<tbody>
			<c:forEach var="ride" items="${loggedInUser.getRides()}">
				<tr>
				<td>${ride.getId()}</td>
				<td><a href="showRide.do?ride=${ride.id}" name="ride">${ride.name}</a> </td>
				</tr>
			</c:forEach>
		</tbody>
	</table> 
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