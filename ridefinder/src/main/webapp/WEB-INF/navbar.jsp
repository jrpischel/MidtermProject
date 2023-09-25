<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <nav class="navbar navbar-expand-sm bg-body-tertiary fixed-top">
  <div class="container-fluid">
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
      
      
      
      
      
      <!-- TODO  -->
      <ul>
       <li> <a class="navbar-brand" href="home.do">Home</a></li>
      
      <c:choose>
	  <c:when test="${!empty sessionScope.user}">
	  <h1>Welcome ${user.username}</h1>
	  
	  <li> <a class="navbar-brand" href="account.do">Account info</a></li>
	  <li> <a class="navbar-brand" href="logout.do">Logout</a></li>
	  </c:when>
	  
	  <c:otherwise>
		  <li> <a class="navbar-brand" href="login.do">Login</a></li>
	
	  </c:otherwise>
	  </c:choose>
      </ul>
​
    </div>
  </div>
</nav>