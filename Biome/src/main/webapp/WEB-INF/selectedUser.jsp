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
</head>
<body style="background-color: #FFFCF1">

<jsp:include page="navbar.jsp"></jsp:include>

	<div class="row h-100 justify-content-center align-items-center">
		<div class="card" style="max-width: 750px; margin: 100px;">
			<img src="${user.profileImage}" class="card-img-top">
			<div class="card-body">
				<h5 class="card-title">Username: ${user.username}</h5>

			</div>
			<ul class="list-group list-group-flush">

				<li class="list-group-item">Account created:
					${user.createDate}</li>
			
			</ul>
			<div>
<form action="followUser.do" method="post" target="_self" >
<input type="hidden" value="${user.id}" name="id">
	<button type="submit" class="btn btn-info btn-md">Follow User</button>
  
</form>
		</div>
				</div>
				</div>
		




</body>

<jsp:include page="footer.jsp"></jsp:include>
</html>