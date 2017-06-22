<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml11.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Edit Profile</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
</head>
<body>
  <div class='container'>
    <h3>Edit Account:</h3>
    
	<form action="../personUpdate/${person.id}" method="post"
		class="form-horizontal">
		<div class="form-group">
			<label class="col-lg-3 control-label">First name:</label>
			<div class="col-lg-4">
				<input class="form-control" name="firstName" type="text"
					value="${person.firstName}">
			</div>
		</div>

		<div class="form-group">
			<label class="col-lg-3 control-label">Last name:</label>
			<div class="col-lg-4">
				<input class="form-control" name="lastName" type="text"
					value="${person.lastName}">
			</div>
		</div>

		<div class="form-group">
			<label class="col-lg-3 control-label">Email:</label>
			<div class="col-lg-4">
				<input class="form-control" type="text" name="email"
					value="${person.email}">
			</div>
		</div>

		<div class="form-group">
			<label class="col-lg-3 control-label">Phone:</label>
			<div class="col-lg-4">
				<input class="form-control" type="text" name="phone"
					value="${person.phone}">
			</div>
		</div>
		<div class="form-group">
			<label class="col-lg-3 control-label">City:</label>
			<div class="col-lg-4">
				<input class="form-control" type="text" name="city"
					value="${person.address.city}">
			</div>
		</div>

		<div class="form-group">
			<label class="col-lg-3 control-label">State:</label>
			<div class="col-lg-4">
				<input class="form-control" type="text" name="state"
					value="${person.address.state}">
			</div>
		</div>

		<div class="form-group">
			<label class="col-lg-3 control-label">Country:</label>
			<div class="col-lg-4">
				<input class="form-control" type="text" name="country"
					value="${person.address.country}">
			</div>
		</div>

		<div class="form-group">
			<label class="col-lg-3 control-label">Zip Code:</label>
			<div class="col-lg-4">
				<input class="form-control" type="text" name="zipcode"
					value="${person.address.zipcode}">
			</div>
		</div>
		<div class="form-group">
			<label class="col-md-3 control-label"></label>
			<div class="col-md-8">
				<input type="submit" class="btn btn-primary" value="Save Changes">
			</div>
		</div>
	</form>
</div>
</body>
</html>