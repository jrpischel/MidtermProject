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
<h1>Ride Finder</h1>


<p>${ SMOKETEST }</p>


<!-- FOR TESTING RIDE VIEWS -->
<!-- TODO: Make into a prettier list of ride displays -->
<h1>Test Ride Views</h1>

<c:forEach var="ride" items="${rides }">
	<a href="rideDisplay.do?theRideId=${ride.id} ">${ride.name}</a>
	<br>
</c:forEach>


<jsp:include page="bootstrapFoot.jsp"/>
</div>
</body>
</html>

