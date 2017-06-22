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

<style>
body {
	background-image: url("/images/img5.jpe");
	background-color: #cccccc;
}
</style>
</head>
<body>
  <div class="page-header">
	<h1 style="color:blue;">
		WellCome <small style="color:blue;">|Ethio-Coffee Shop!!</small>
	</h1></div>
	<div class='container'>
		<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand active">OnlineCoffeeShop</a>
			</div>
			<security:authorize access="hasRole('ADMIN')">
				<ul class="nav navbar-nav">
					<li><a href="addProduct">Add a Product</a></li>
					<li><a href="../person">List Of Customers</a></li>
					<li><a href="../order">Order Lists</a></li>
				</ul>
			</security:authorize>

			<ul class="nav navbar-nav navbar-right">
				<li><a href="#"><span class="glyphicon glyphicon-user"></span>
						<c:if test="${pageContext.request.userPrincipal.name != null}">
		 ${pageContext.request.userPrincipal.name}</c:if></a></li>
				<li><a href="<c:url value="/logout" />"><span
						class="glyphicon glyphicon-log-in"></span> Logout</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><security:authorize access="hasRole('USER')">
						<form action="userProfile/" method="post">
							<input type="hidden" name="email"
								value="${pageContext.request.userPrincipal.name}" /> <input
								type="submit" value="Update Profile">
						</form>
					</security:authorize></li>
			</ul>
		</div>
		</nav>


		<div class="row">
			<c:forEach var="product" items="${products}">
				<div class="col-sm-3 col-md-3">
					<div class="thumbnail">
						<img src="${product.img}" alt="${product.img}">
						<div class="caption">
							<h3>${product.productName}</h3>
							ID: ${product.id},${product.description}, ${product.productType}
							<p>
								<Strong>price:</Strong>${product.price}</p>

							<security:authorize access="hasRole('ADMIN')">
								<div class="pull-right">
									<form action="/editProduct/${product.id}" method="post">
										<input type="submit" value="Edit">
									</form>
								</div>

								<form action="/deleteProduct/${product.id}" method="post">
									<input type="submit" value="Delete">
								</form>
							</security:authorize>
							<security:authorize access="hasRole('USER')">
								<td><a href="/placeOrder/${product.id}">place Order</a></td>
							</security:authorize>
						</div>
					</div>
				</div>

			</c:forEach>
		</div>

		<%-- <table
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
			
		</table> --%>

	</div>
</body>
</html>