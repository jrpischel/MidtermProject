<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/main.css"/>
<jsp:include page="bootstrapHead.jsp"/>
<title>Clubs</title>
</head>
<body>

<jsp:include page="navbar.jsp"/>
<div class="container">

	<h1>Clubs Page</h1>
	

	<table class="table table-striped table-hover">
		<thead>
			<tr>
				<th>ID</th>
				<th>Logo</th>
				<th>Club Name</th>
				<th>Description</th>
			</tr>
		</thead>
		<tbody>

			<c:forEach var="c" items="${club}">
					<input type="hidden" name="id" value="${c.id}">
				<tr>
					<td>${c.id}</td>
					<td><img src="${c.photoUrl}" style="height:150px"></td>
					<td><a href="clubHome.do?Id=${c.id}">${c.name}</a></td>
					<td>${c.description}</td>
					
				</tr>
			</c:forEach>

		</tbody>
	</table> 
	</div>
<jsp:include page="bootstrapFoot.jsp"/>
</body>
</html>