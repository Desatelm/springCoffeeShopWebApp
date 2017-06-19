<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<form action="../addAddres" method="post" class="form-group">
	
	<table>	  
		
		<tr>
			<td>Id:</td>
			<td><input type="text" name="id" value="${person.id}" class="form-control" /> </td>
		</tr>
		<tr>
			<td>City:</td>
			<td><input type="text" name="city" value="city" class="form-control" /> </td>
		</tr>
		<tr> 
			<td>State:</td>
			<td><input type="text" name="state" value="state" class="form-control" /> </td>
		</tr>
		<tr>
			<td>Country:</td>
			<td><input type="text" name="country" value="Country" class="form-control" /> </td>
		</tr>
		<tr>
			<td>ZipCode:</td>
			<td><input type="text" name="zipcode" value="zipcode" class="form-control"/> </td>
		</tr>
		
		
	</table>
	<input type="submit" value="add"/>
	</form>
</html>