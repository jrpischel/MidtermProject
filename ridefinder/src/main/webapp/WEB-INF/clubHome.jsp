<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<jsp:include page="bootstrapHead.jsp"/>

<link rel="stylesheet" href="css/main.css"/>


<title>${club.name}</title>
</head>

<body>
<input type="hidden" name="id" value="${club.id}">
<div class="container">

<jsp:include page="navbar.jsp"/>
<h1>${club.name}'s Home Page</h1>

<br>
<br>
<div class="text-center">
<img src="${club.photoUrl}" class="img-fluid" alt="..."> 
</div>

<div>
<blockquote>${club.description}</blockquote>
</div>

<div>

<c:if test="${alreadyJoined == false }"><a class="btn btn-dark" href="joinClub.do?Id=${club.id}" role="button">Join Club</a></c:if>
<table class="table table-striped table-hover">
		<thead>
			<tr>
				<th>Nick Name</th>
				<th>First Name</th>
				<c:if test="${loggedInUser.id == club.user.id && member.administrator != true}">
				<th>Remove Member</th>
				</c:if>
				
			</tr>
		</thead>
		<tbody>

			<c:forEach var="member" items="${club.clubMembers}">
				<tr>
					<td><a href="profile.do?userId=${member.user.id}">${member.user.nickname}</a></td>
					<td>${member.user.firstName}</td>
					<c:if test="${loggedInUser.id == club.user.id && member.administrator != true}">
					<td><a class="btn btn-dark" href="removeMember.do?clubId=${club.id}&memberId=${member.user.id}" role="button">Remove</a></td>
					</c:if>
				</tr>
			</c:forEach>

		</tbody>
	</table> 
</div>
<div>
<table class="table table-striped table-hover">
		<thead>
			<tr>
				<th>Ride Name</th>
				<th>Date</th>
				<th>Time</th>
				<th>Location</th>
			</tr>
		</thead>
		<tbody>

			<c:forEach var="r" items="${club.rides}">
				<tr>
					<td><a href="rideDisplay.do?theRideId=${r.id}">${r.name}</a></td>
					<td>${r.rideDate}</td>
					<td>${r.startTime}</td>
					<td>${r.startAddressId}</td>
				</tr>
			</c:forEach>

		</tbody>
	</table> 
</div>


<jsp:include page="bootstrapFoot.jsp"/>
</div>
</body>
</html>

