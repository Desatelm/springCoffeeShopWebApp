<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags"%>

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
<style>
body {
	background-image: url("/images/img5.jpe");
	background-color: #cccccc;
}
</style>
</head>
<body>
	<div class='container'>
		<h1 style="color: blue;">
			Ethio-Coffee <small style="color: blue;">|Add Product!!</small>
		</h1>
	
	<div class=' container-fluid well col-xs-8' >
		<form action="/addProduct" method="post">
		
			<fieldset>
				<legend> add Product</legend>
				Product Name:<input type="text" name="productName"
					class="form-control" /> Price:<input type="text" name="price"
					class="form-control" />
				<textarea class='form-control' name='description'
					id='offersTextArea' style="margin-bottom: 25px;" rows="6">
				                Enter Coffee description				
			                 </textarea>
				<select name="productType">
					<option value="BREAKFAST">BREAKFAST</option>
					<option value="LUNCH">LUNCH</option>
					<option value="DINNER">DINNER</option>
				</select>

				<div class='text-center' style="margin-top:25px;">
					<input type='submit' id='postSubmit' class='btn-primary'
						class='btn-lg' value='ADD PRODUCT'>
				</div>
			</fieldset>
		</form>
	</div>
	</div>
	</body>
</html>