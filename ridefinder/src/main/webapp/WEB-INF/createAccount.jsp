<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="bootstrapHead.jsp"/>
<link rel="stylesheet" href="css/main.css"/>
<title>Add A Pet</title>
</head>
<body>
<jsp:include page="navbar.jsp"/>

<h1>Add your new pet</h1>
	<p> "*" indicates required fields</p><br>

<form action="makeAccount.do" method="post">

			<label for="Owner">Username</label>
			<input type="text" name="username" id="owner" required>

			<br>
			<br>
			<label for="name">Password</label>
			<input type="text" name="password" id="name" required>

			<br>
			<input type="submit" />




</form>
<p>Contact the Database Admin Team to have a picture of your new user added to their personal page.
<jsp:include page="bootstrapFoot.jsp"/>
</body>
</html>