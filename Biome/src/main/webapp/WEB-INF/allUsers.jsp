<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	
	
	<link rel="stylesheet" href="css/mysightings.css">
<title>All Users</title>
</head>
<body>
<jsp:include page="navbar.jsp"></jsp:include>

<div class="backgroundcolor">
<br> <br> <br>
<div class="container">
<div class="grid-container">
		<c:forEach var="user" items="${users}">
			<div class="grid-item">
				<form action="selectedUser.do">
					<br>
					<input type="hidden" value="${user.id}" name="id">
					<input type="image" src="${user.profileImage.imageUrl}" width="200"
										height="200">

					<c:out value="${user.username}"></c:out>
					<br>
				</form>
			</div>

		</c:forEach>
</div>
</div>
	</div>
</body>
<jsp:include page="footer.jsp"></jsp:include>
</html>