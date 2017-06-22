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
<div class='container' >
		<h1>Thank You for Shopping</h1>
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
		
	<div class='container' style="margin-left:75px;">		
			<div class=' container-fluid well col-xs-8'	>
				<fieldset>
					<legend> Reciept</legend>
					<p>Order Id: ${order.id}</p>
					<p>Name:${order.person.firstName}</p>
					<p>DateandTime: ${order.orderDate}</p>
					<table
						class="table table-striped, table table-hover table table-condensed ">
						<tr>
							<th>Product</th>
							<th>Quantity</th>
							<th>Price</th>
							
						</tr>
						<c:forEach var="order_line" items="${order_lines}">
							<tr>
								<td>${order_line.product.productName}</td>
								<td>${order_line.quantity}</td>
								<td>${order_line.product.price}</td>
							</tr>
						</c:forEach>
						<tr>
							<th colspan="">Total:</th>
							<td>${totalQuantity}</td>
							<td>${totalPrice}</td>
						</tr>
					</table>
					<fieldset>
						<legend>Shipping Address</legend>
						<p>${order.person.address.city},
							${order.person.address.state}, ${order.person.address.country},
							${order.person.address.zipcode}</p>
					</fieldset>
				</fieldset>
			</div>
		</div>
	</div>
  

</body>
</html>
