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

<label>${user.username}</label>


<form action="followUser.do" method="post" target="_self" >
<input type="hidden" value="${user.id}" name="id">
	<button type="submit" class="btn btn-info btn-md">Follow User</button>
  
</form>


</body>

<jsp:include page="footer.jsp"></jsp:include>
</html>