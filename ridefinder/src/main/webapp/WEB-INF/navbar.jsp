<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <nav class="navbar navbar-expand-sm bg-body-tertiary fixed-top">
  <div class="container-fluid">
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
      <a class="navbar-brand" href="home">Home</a>
      
      
      <a class="navbar-brand" href="loginPage">Login</a>
      
      <!-- TODO  -->
      <ul>
      <c:choose>
	  <c:when test="${empty user}">
	  <li> <a href="login.do">Login Here</a></li>
	  </c:when>
	  <c:otherwise>
	  <li> <a href="account.do">Account info</a></li>
	  <li> <a href="logout.do">Logout</a></li>
	  </c:otherwise>
	  </c:choose>
      </ul>
​
    </div>
  </div>
</nav>