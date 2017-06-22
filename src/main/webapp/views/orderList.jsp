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

	
	<div class='container'>
	<h1>OrderS </h1>
		<div class='container'>
			<nav class="navbar navbar-inverse">
			<div class="container-fluid">
				<div class="navbar-header">
					<a class="navbar-brand active">OnlineCoffeeShop</a>
				</div>


				<ul class="nav navbar-nav navbar-right">
					<li><a href="<c:url value="/" />"><span
							class="glyphicon glyphicon glyphicon-home"></span> Home</a></li>
					<li><a href="#"><span class="glyphicon glyphicon-user"></span>
							<c:if test="${pageContext.request.userPrincipal.name != null}">
		                ${pageContext.request.userPrincipal.name}</c:if></a></li>
					<li><a href="<c:url value="/logout" />"><span
							class="glyphicon glyphicon-log-in"></span> Logout</a></li>
				</ul>

			</div>
			</nav>
		</div>



		<div class='container'>

			<table
				class="table table-striped, table table-hover table table-condensed table-bordered">
				<tr>

					<th>Order Id</th>
					<th>Order Date</th>
					<th>Order Lines</th>
					<th>Customer</th>

				</tr>
				<c:forEach var="order" items="${orders}">

					<tr>
						<td>${order.id}</td>
						<!-- order id -->
						<td>${order.orderDate}</td>
						<td><a href="orderLine/${order.id}">orderLines</a></td>
						<td>
							<div class="dropdown">
								<!-- person -->
								<p>
								<p>${order.person.firstName}</p>
								<div class="dropdown-content">
									<p>${order.person.lastName}</p>
									<p>${order.person.phone}</p>
									<p>${order.person.email}</p>
									<p>${order.person.address.city}</p>
									<p>${order.person.address.state}</p>
									<p>${order.person.address.country}</p>
									<p>${order.person.address.zipcode}</p>
								</div>
							</div>
						</td>
				</c:forEach>
			</table>
		</div>
	</div>
</body>
</html>
