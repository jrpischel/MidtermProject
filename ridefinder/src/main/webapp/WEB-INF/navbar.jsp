<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<nav class="navbar navbar-expand-lg bg-body-tertiary fixed-top">
	<div class="container-fluid">
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarTogglerDemo01"
			aria-controls="navbarTogglerDemo01" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarTogglerDemo01">


			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<c:choose>
					<c:when test="${!empty loggedInUser}">
						<li class="nav-item">
						<h4 style="padding-right : 20px;">Welcome ${loggedInUser.firstName}</h4>
						</li>
						<li class="nav-item">
						<a class="navbar-brand" href="home.do">Home</a>
						</li>
						<li class="nav-item">
						<a class="navbar-brand" href="account.do">Account info</a>
						</li>
						<li class="nav-item"><a class="navbar-brand" href="logout.do">Logout</a>
						</li>
						<li class="nav-item">
						<a class="navbar-brand" href="updateAccountForm.do">Update Account</a>
						</li>
						<li class="nav-item">
						<a class="navbar-brand" href="createUpdateForm.do">Create Club</a>
						</li>
					</c:when>

					<c:otherwise>
						<li class="nav-item">
						<a class="navbar-brand" href="home.do">Home</a>
						</li>
						<li class="nav-item">
						<a class="navbar-brand" href="login.do">Login</a>
						</li>
						<li class="nav-item">
						<a class="navbar-brand" href="createAccount.do">Create Account</a>
						</li>



					</c:otherwise>
				</c:choose>
			</ul>
			​
		</div>
	</div>
</nav>