<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml11.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Update Profile</title>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
</head>
<body>

	<form action="../personUpdate/${person.id}" method="post"
		class="form-group">

		<table>

			<tr>
				<td>First Name:</td>
				<td><input type="text" name="firstName"
					value="${person.firstName}" class="form-control" /></td>
			</tr>
			<tr>
				<td>Last Name:</td>
				<td><input type="text" name="lastName"
					value="${person.lastName}" class="form-control" /></td>
			</tr>
			<tr>
				<td>Email:</td>
				<td><input type="text" name="email" value="${person.email}"
					class="form-control" /></td>
			</tr>
			<tr>
				<td>Phone:</td>
				<td><input type="text" name="phone" value="${person.phone}"
					class="form-control" /></td>
			</tr>			
			<tr>
				<td>City:</td>
				<td><input type="text" name="city"
					value="${person.address.city}" class="form-control" /></td>
			</tr>
			<tr>
				<td>State:</td>
				<td><input type="text" name="state"
					value="${person.address.state}" class="form-control" /></td>
			</tr>
			<tr>
				<td>Country:</td>
				<td><input type="text" name="country"
					value="${person.address.country}" class="form-control" /></td>
			</tr>
			<tr>
				<td>ZipCode:</td>
				<td><input type="text" name="zipcode"
					value="${person.address.zipcode}" class="form-control" /></td>
			</tr>


		</table>
		<input type="submit" value="update" />
	</form>

</body>
</html>