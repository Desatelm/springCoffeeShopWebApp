<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml11.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Coffee Shop</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="../CSS/admin.css" rel="stylesheet">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
</head>
<body onload='document.f.username.focus();'>

	<h1>Welcome</h1>

	<div class="clearfix"></div>
	<c:if test="${pageContext.request.userPrincipal.name != null}">
		 ${pageContext.request.userPrincipal.name}
                <a href="<c:url value="/logout" />"> Logout</a>|
	</c:if>
	
	
		<a href="addPerson"> Add Person</a>
	
	
	<security:authorize access="hasRole('USER')">
		<a href="profile"> Update Profile</a>
	</security:authorize>
	<table
		class="table table-striped, table table-hover table table-condensed table-bordered">
		<tr>

			<th>First Name</th>
			<th>Last Name</th>
			<th>Email</th>
			<th>Phone</th>
			<th>Address</th>
			<security:authorize access="hasRole('ADMIN')">
				<th colspan="2">Action</th>
			</security:authorize>


		</tr>
		<c:forEach var="person" items="${person}">
         
			<tr>
               
				<td>${person.email}</td>
				<td>${person.firstName}</td>
				<td>${person.lastName}</td>
				<td>${person.phone}</td>
				<td>
					<div class="dropdown">
						<p><p>${person.address.city}</p>

						<div class="dropdown-content">               
                <p>${person.address.state}</p>  
                <p>${person.address.country}</p>  
                <p>${person.address.zipcode}</p>                     
                </div>
					</div>
				</td>                
				<security:authorize access="hasRole('ADMIN')">				
					<td><a href="persons/${person.id}">edit</a></td> 
					<td><form action="/delete/${person.id}" method="post">
							<input type="submit" value="delete">
						</form></td>
		
				</security:authorize>
				<security:authorize access="hasRole('USER')">
					<td><a href="stadiumsInfo/${match.stadium}">place Order</a></td>
				</security:authorize>
                </tr>
                </c:forEach>
            	</table>
</body>
</html>
