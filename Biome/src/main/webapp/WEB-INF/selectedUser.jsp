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
<title>Selected User</title>
<link rel="stylesheet" href="css/selectedUser.css">
</head>
<body style="background-color: #FFFCF1">

	<jsp:include page="navbar.jsp"></jsp:include>
	<div class="row h-100 justify-content-center align-items-center">

		<div class="col px-md-40" id="form-wrapper"
			style="max-width: 750px; margin: 100px; float: left; border: 3px solid #0ABE9A; padding: 40px; background-color: #C5D4D2">

			<img src="${user.profileImage.imageUrl}"  class="card-img-top">
			<div class="card-body"></div>
			<ul class="list-group list-group-flush">
				<li class="list-group-item">Username: ${user.username}</li>
				<li class="list-group-item">Account created:
					${user.createDate.month} ${user.createDate.year }</li>
				<li class="list-group-item">Location: ${user.address.state}</li>
				<li class="list-group-item">Recent Activity: ${user.comments}</li>

			</ul>
		<br>
		<br>
			<h4> Following:</h4>
			<div class="showName">
				<div class="ed Users:</p>container">
				<div class="grid-container">
					<c:forEach var="followedUser" items="${user.followedUsers}"
							varStatus="followed">
						<div class="grid-item">
							<form action="selectedUser.do">
								<br>
								<input type="hidden" value="${followedUser.id}" name="id">
								<input type="image" src="${followedUser.profileImage.imageUrl}"
										width="200" height="200">
<br>
								<c:out value="${followedUser.username}"></c:out>
								<br>
							</form>
						</div>
					
					</c:forEach>

			</div>

				</div>
			</div>
		</div>
	</div>


</body>

<jsp:include page="footer.jsp"></jsp:include>
</html>