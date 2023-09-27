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
<p>Ride Date: <strong>${ ride.rideDate }</strong></p>

<c:choose>
	<c:when test="${!empty loggedInUser}">
		<a href="#LINK_TO_JOIN_RIDE" class="btn btn-dark">Join Ride</a>
	</c:when>
	<c:otherwise></c:otherwise>
</c:choose>

<h3>Description</h3>
<p>${ride.description}</p>
<img src="${ride.photoURL}" style="height: 150px;">





<jsp:include page="bootstrapFoot.jsp"/>
</div>
</body>
</html>