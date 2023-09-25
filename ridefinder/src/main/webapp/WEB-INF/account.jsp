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
	UserName: <c:out value="${loggedInUser.getUsername()}" />
			<br>
	First Name: <c:out value="${loggedInUser.getFirstName()}" />
			<br>
	Last Name: <c:out value="${loggedInUser.getLastName()}" />
			<br>

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