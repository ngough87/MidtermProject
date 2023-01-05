<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Plants</title>
</head>
<body>
<jsp:include page="navbar.jsp"></jsp:include>


<form action="searchPlants.do">

	<input type="text" name="searchTerm" placeholder="Search"/>

	<input type="submit" value="Submit" class="btn btn-primary" role="button"/>

</form>

	<c:choose >
		<c:when test="${ !empty plants}">

	<table id="transparentbackground" class="table .table-sm">

		<c:forEach var="plant" items="${plants}">
		<tr>
		<td> ${plant}
		</td>
		</tr>
		</c:forEach>
		</table>
		</c:when>
		<c:otherwise>
		<h3>No Results Found</h3>
		</c:otherwise>
		</c:choose>

</body>
</html>