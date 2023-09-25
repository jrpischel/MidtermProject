<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Account Profile</title>
</head>
<body>
 
	<%--Edit the file nav.jsp to change nav links --%>
	
	<c:choose>
		<c:when test="${!empty sessionScope.loggedInUser}">
		<%@ include file="navbar.jsp"%>
	<h2>Your Account Details</h2>
	UserName: <c:out value="${loggedInUser.getUsername()}"/>
	<br>
	First Name: <c:out value="${loggedInUser.getFirstName()}"/>
	<br>
	Last Name: <c:out value="${loggedInUser.getLastName()}"/>
	<br>
	
	</c:when>
	<c:otherwise>
		<h1>Not logged in</h1>
	</c:otherwise>
	</c:choose>
	<%-- Output user details --%>

	
	
</body>
</html>