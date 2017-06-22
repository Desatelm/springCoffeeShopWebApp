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
<body >

	<h1>Welcome</h1>
		
	<div class="clearfix"></div>
	<c:if test="${pageContext.request.userPrincipal.name != null}">
		 ${pageContext.request.userPrincipal.name}
                <a href="<c:url value="/logout" />"> Logout</a>|
	</c:if>
	
	<security:authorize access="hasRole('ADMIN')">
		<a href="addProduct"> Add a Product</a>|
		<a href="../person"> List Of Customers</a>|
		<a href="../order">Order Lists</a>
		
	</security:authorize>
	
	<security:authorize access="hasRole('USER')">
	<td><form action="userProfile/" method="post">
				<input type="hidden" name="email" value="${pageContext.request.userPrincipal.name}"/>
							<input type="submit" value="Update Profile">
			</form></td>
		<%-- <a href="userProfile/${pageContext.request.userPrincipal.name}"> Update Profile</a> --%>
	</security:authorize>
	<table
		class="table table-striped, table table-hover table table-condensed table-bordered">
		<tr>
			<th>Id</th>
			<th>Name</th>
			<th>Price</th>
			<th>Description</th>
			<th>Type</th>
			<security:authorize access="hasRole('ADMIN')">
				<th colspan="2">Action</th>
			</security:authorize>
			<security:authorize access="hasRole('USER')">
				<th colspan="2">Action</th>
			</security:authorize>

		</tr>
		<c:forEach var="product" items="${products}">

			<tr>
				<td>${product.id}</td>
				<td>${product.productName}</td>
				<td>${product.price}</td>
				<td>${product.description}</td>
				<td>${product.productType}</td>
				<security:authorize access="hasRole('ADMIN')">					
					<td><form action="/editProduct/${product.id}" method="post">
							<input type="submit" value="edit">
						</form></td>
						
					<td><form action="/deleteProduct/${product.id}" method="post">
							<input type="submit" value="delete">
						</form></td>
				</security:authorize>
				<security:authorize access="hasRole('USER')">
					<td><a href="/placeOrder/${product.id}">place Order</a></td>
				</security:authorize>
			</tr>
		</c:forEach>
	</table>

</body>
</html>