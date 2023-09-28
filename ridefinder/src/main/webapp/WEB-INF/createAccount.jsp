<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="bootstrapHead.jsp"/>
<link rel="stylesheet" href="css/main.css"/>
<title>Create An Account</title>
</head>
<body>
<jsp:include page="navbar.jsp"/>
<div class="container">
<h1>Create your new account</h1>
	<br>

<form action="makeAccount.do" method="post">

			<label for="Owner">Username</label>
			<input type="text" name="username" id="owner" required>

			<br>
			<br>
			<label for="name">Password</label>
			<input type="password" name="password" id="name" required>
			
			
			

			<br>
			<input type="submit" />




</form>
</div>
<jsp:include page="bootstrapFoot.jsp"/>
</body>
</html>