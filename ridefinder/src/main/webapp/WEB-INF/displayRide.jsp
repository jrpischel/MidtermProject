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
<h3>Description</h3>
<p>${ride.description}</p>
<img src="${ride.photoURL}">





<jsp:include page="bootstrapFoot.jsp"/>
</div>
</body>
</html>