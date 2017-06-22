<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml11.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Update Profile</title>
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
    <h3>Create Account:</h3>
    <div class='container well col-md-8'>
	<form action="../savePerson" method="post" class="form-horizontal">
		
          <div class="form-group">
            <label class="col-lg-3 control-label">First name:</label>
            <div class="col-lg-6">
              <input class="form-control" name = "firstName" type="text" >
            </div>
	        </div>
	        
	        <div class="form-group">
            <label class="col-lg-3 control-label">Last name:</label>
            <div class="col-lg-6">
              <input class="form-control" name = "lastName" type="text" >
            </div>
	        </div>
	        
		    <div class="form-group">  
		    <label class="col-lg-3 control-label">Email:</label>          
            <div class="col-lg-6">
              <input class="form-control" type="text" name="email"
					>
            </div>
	        </div>			
           
           <div class="form-group">
            <label class="col-lg-3 control-label">Phone:</label>
            <div class="col-lg-6">
              <input class="form-control" type="text" name="phone" >
            </div>
	        </div>
			<div class="form-group">
            <label class="col-lg-3 control-label">City:</label>
            <div class="col-lg-6">
              <input class="form-control" type="text" name="city" >
            </div>
	        </div>
			
			<div class="form-group">
            <label class="col-lg-3 control-label">State:</label>
            <div class="col-lg-6">
              <input class="form-control" type="text" name="state" >
            </div>
	        </div>
			
			<div class="form-group">
            <label class="col-lg-3 control-label">Country:</label>
            <div class="col-lg-6">
              <input class="form-control" type="text" name="country" >
            </div>
	        </div>
	        
			<div class="form-group">
            <label class="col-lg-3 control-label">Zip Code:</label>
            <div class="col-lg-6">
              <input class="form-control" type="text" name="zipcode" >
            </div>
	        </div>
			<div class="form-group">
            <label class="col-md-3 control-label"></label>
            <div class="col-md-8">
              <input type="submit" class="btn btn-primary" value="Create Account">
              </div>
            </div>
	</form>
	</div>
</div>
</body>
</html>