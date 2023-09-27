<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<jsp:include page="bootstrapHead.jsp"/>

<link rel="stylesheet" href="css/main.css"/>
	<title>Disabled</title>
</head>
<body>
	<%@ include file="navbar.jsp"%>
	<div class="container">
	
	<c:choose>
	<c:when test="${club.enabled == false}">
	<h2>Disabled</h2>
	
	Your Club ${club.name} has been disabled. 
	</c:when>
	<c:otherwise>
	<h2>Enabled</h2>
	
	Your Club ${club.name} has been enabled.
	</c:otherwise>
	</c:choose>
	<jsp:include page="bootstrapFoot.jsp"/>
	</div>
</body>
</html>