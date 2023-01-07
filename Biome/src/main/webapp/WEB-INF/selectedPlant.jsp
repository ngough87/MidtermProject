<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<title>${plant.commonName}</title>
</head>
<body>
	<jsp:include page="navbar.jsp"></jsp:include>
	
	${plant}
	
	
	<form action="updatePlant.do">
	<input type ="hidden" value="${plant.id}" name="id">
	<button type="submit" value="Edit">Edit</button>
	</form>
</body>
<jsp:include page="footer.jsp"></jsp:include>
</html>