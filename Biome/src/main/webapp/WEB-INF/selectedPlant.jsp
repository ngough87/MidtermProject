<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${plant.commonName}</title>
</head>
<body>

	${plant}
	
	
	<form action="updatePlant.do">
	<input type ="hidden" value="${plant.id}" name="id">
	<button type="submit" value="Edit">Edit</button>
	</form>
</body>
</html>