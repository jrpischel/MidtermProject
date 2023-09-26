<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="bootstrapHead.jsp"/>
<link rel="stylesheet" href="css/main.css"/>
<title>Add A Club</title>
</head>
<body>
<jsp:include page="navbar.jsp"/>

<h1>Add your new club</h1>
	<p> "*" indicates required fields</p><br>

<form action="makeClub.do" method="post">

			<input type="hidden" name="user.id" value="${loggedInUser.id}">

			<div>
			<label for="name">Club Name</label>
			<input type="text" name="name" id="name" required>
			</div>
			
			<br>
			<br>
			<div>
			<label for="photoUrl">Photo</label>
			<input type="text" name="photoUrl" id="photoUrl">
			</div>
			
			<br>
			<br>
			<div class="input-group">
     		<span class="input-group-text">Description</span>
     		<textarea class="form-control" aria-label="With textarea" name="description" id="description">${user.description}</textarea>
   			</div>
			
			<br>
			<br>
			<div class="form-check form-switch form-check-reverse">
  			<input class="form-check-input" type="checkbox"  name="shared" id="shared" value="1">
  			<label class="form-check-label" for="flexSwitchCheckReverse">Make Profile Private</label>
			</div>
			
			
			
			
			

			<br>
			<input type="submit" />




</form>
<jsp:include page="bootstrapFoot.jsp"/>
</body>
</html>