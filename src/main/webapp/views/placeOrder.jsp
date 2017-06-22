<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
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
<body>
	<div class='container'>
		<h1 >
			Ethio-Coffee <small >|Place Order!!</small>
		</h1>
			
			<div class=' container-fluid well col-xs-6' >
				<form action="/addToCart/${product.id}" method="post">
					<fieldset>
						<legend> Order</legend>
						<div class="form-group"><label class="col-lg-3 control-label">Product Name:
						</label><input type="text" name="productName"
							value="${product.productName}" readonly class="form-control col-lg-2" /></div>
					    
					     <div class="form-group"><label class="col-lg-3 control-label">Price:</label> 
					     <input type="text" name="price" value="${product.price}"
							class="form-control" readonly /></div>
						<div class="form-group"><label class="col-lg-3 control-label">Description:</label><textarea class='form-control' name='description'
							id='offersTextArea' style="margin-bottom: 25px;" rows="6"
							readonly>
				                ${product.description}			
			                 </textarea></div>
						<select name="productType">
							<option value="BREAKFAST">BREAKFAST</option>
							<option value="LUNCH">LUNCH</option>
							<option value="DINNER">DINNER</option>
						</select> 						
							<div class="form-group"><label class="col-lg-3 control-label">Quantity:</label>
							<input type="text" name="quantity" class="form-control" style="margin-top:25px;"/></div>
							<div class='text-center' style="margin-top:25px;">
							<input type="hidden" name="email" value="${pageContext.request.userPrincipal.name}" /> 
							
							<input type='submit' id='postSubmit' class='btn-primary' class='btn-lg'
								value='AddToCart'>
								</div>
						</div>
					</fieldset>
				</form>
			</div>
		
	</div>
</body></html>