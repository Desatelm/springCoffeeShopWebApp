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

	<h1>Order Lines</h1>

	<div class="clearfix"></div>
	<c:if test="${pageContext.request.userPrincipal.name != null}">
		 ${pageContext.request.userPrincipal.name}
                <a href="<c:url value="/logout" />"> Logout</a>|
	</c:if>		
	
	
	<table
		class="table table-striped, table table-hover table table-condensed table-bordered">
		<tr>

			<th>Id</th>
			<th>Order</th>
			<th>Product</th>
			<th>Quantity</th>	

		</tr>
		<c:forEach var="order_line" items="${order_lines}">

			<tr>
				<td>${order_line.id}</td>	<!-- order id -->			
				 <td><div class="dropdown">   <!-- order  -->
						<p><p>${order_line.order.date}</p>
						<div class="dropdown-content">               
                <p>${order_line.order.person.firstName}</p>  
                <p>orderLines</p>                                     
                </div>
					</div>
				<td>
				<div class="dropdown">     <!-- person -->
						<p><p>${order_line.person.firstName}</p>
						<div class="dropdown-content">               
                        <p>${order_line.person.lasttName}</p>  
                        <p>${order_line.person.phone}</p> 
                        <p>${order_line.person.email}</p>
                        <p>${order_line.person.address.city}</p>
                        <p>${order_line.person.address.state}</p>
                        <p>${order_line.person.address.country}</p>
                        <p>${order_line.person.address.zipcode}</p>                                    
                </div></div></td>					
				<td>${order_line.quantity}</td> <!-- quantity -->
				    <td><div class="dropdown">   <!-- product  -->
						<p><p>${order_line.product.productName}</p>
						<div class="dropdown-content">               
                        <p>${order_line.product.price}</p> 
                        <p>${order_line.product.productType}</p>
                        <p>${order_line.product.description}</p>                                                     
                </div>
					</div></td>         
				
                </c:forEach>
            	</table>
</body>
</html>
