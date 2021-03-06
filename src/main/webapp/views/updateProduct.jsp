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
	<div class='container' >
		<div class='container raw'>
			<div class=' container-fluid well col-xs-3'
				style="margin-right: 25px;">
				<form action = "/updateProduct/${product.id}" method = "post">
				<fieldset>
					<legend> Update Product</legend>
					Product Name:<input type="text" name="productName" value = "${product.productName}"
						class="form-control" /> Price:<input type="text" name="price" value = "${product.price}"
						class="form-control" />
					<textarea class='form-control' name='description' 
						id='offersTextArea' style="margin-bottom: 25px;" rows="6">
				                ${product.description}			
			                 </textarea>
					<select name="productType">						
							<option value="BREAKFAST">BREAKFAST</option>
							<option value="LUNCH">LUNCH</option>
							<option value="DINNER">DINNER</option>						
					</select>					
                    <br/>
					<div class='text-center'>
						<input type='submit' id='postSubmit' class='btn-primary'
							class='btn-lg' value='UPDATE'>
					</div>
				</fieldset>
				</form>
			</div>
		</div>
	</div>
</body>
</html>