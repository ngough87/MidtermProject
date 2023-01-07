<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome</title>
</head>
<body>

	<jsp:include page="navbar.jsp"></jsp:include>
	<jsp:include page="header.jsp"></jsp:include>

<div class="col-auto container header-container">
		<div style="margin: auto; float: left;">

			<h3>Welcome ${user.username}</h3>
		</div>
		<div style="margin: auto; float: right;">
			<img src="${profileImage}" width="100" height="100">
		</div>
	</div>






</body>

<jsp:include page="footer.jsp"></jsp:include>


</html>