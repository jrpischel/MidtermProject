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

<div class="container">

<jsp:include page="navbar.jsp"/>
<h1>${club.name}'s Home Page</h1>

<br>
<br>
<div class="text-center">
<img src="${club.photoURL}" class="img-fluid" alt="..."> 
</div>

<div>
<blockquote>${club.description}</blockquote>
</div>

<div>
<table class="table table-striped table-hover">
		<thead>
			<tr>
				<th>Name</th>
				<th>Role</th>
				<th>Nick Name</th>
			</tr>
		</thead>
		<tbody>

			<c:forEach var="m" items="${club.clubMembers}">
				<tr>
					<td><a href="account.do?userId=${m.id}">${m.firstName}</a></td>
					<td>${m.role}</td>
					<td>${m.nickname}</td>
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
					<td><a href="account.do?userId=${r.id}">${r.name}</a></td>
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

