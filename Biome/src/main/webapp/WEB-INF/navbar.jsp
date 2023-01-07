<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">

</head>
<body>

	<nav class="navbar navbar-expand-lg navbar-light " style="background-color: #6EBEB3 ">
		<a class="navbar-brand" href="#">
		<img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAH8AAAB/CAMAAADxY+0hAAAAxlBMVEX///84rgBFtwBKugBDtAA8sQBQvwExqAA+tAA0qwFaxAAtpgH+//1TwgAxrgAAmwAooQA7uADj89owtADz+vEYowBWtT0AlgDb78zQ7L/G66+y5J76/ffs9uXd8NLE6LSk3IaE0FRoyC5WwyJ3ylGE0l634qltyUOW1Hym2JZhvzys3pSK0W624JyO0YGk2opSvi++4bZwwl6Z0oxDtCmy26p7xGlnvlGXzpDH5MFXtE6BxXF5xlhKriyGw39Crjah0pxot17HKE7gAAAEhklEQVRoge2Za3OiSBRAG5BHCzavbmN2acxGY0zMmBA1PrJOzP//U3ubBtTMTO3WFmBNVZ+PmSrP7ea+YBBSKBQKhUKhUCgUCoVCoVD8riTR4PqPP5P2xR5Phzd/3Y6sXq/Xbdnv8eub8a0F6q6gd9eiGiE+u7NCS9CV9G7a8/PJfSzl1vH8w7bs0VQPdeuE3G9F7dj51AgNw7DO6HV7vVbs3oMu7MbXCLq9cQtyFD3Gum5UARjh6O62iGDWvB99M0P96DfCp2/T6gYGzevncHi9DEDXp+lsVD2FEW/anjyRjl5ihON0cB8ek2AsmkKjTEmnUwbghEP0HJ6kYThr1u+hB6EvIojHlL+c1UHYdPVnxKz88QRd645xxLLuabN6ujQdx8kDcJxrNHFO6wCYNqtHc2KaMgLTHKCZc1IIeSU2XH1c6PMATC1Cz3Hni3/U8OyfY00GYGKOFvGxEIpe8Nysnmqa9JskLQrhzB+ntWh+2cImTNPyEEh2VghlBKNa9En3+RdV9IqlnyxQBPqiEI7daFKLn0IbefrZTfJlrtfIG6KmVhXi8QrqKX7ag4lqja9/+LVUXj9ZUvRa1OFpBE5N2Sf8YqY/PnyJYCX9bIsmVR2e+Ds1jT4qWzl0Exitp/8wdzUNi9vnGinqwCwj0HUyr0ePEmmHcjbC+HHoVRPtzdUwxm6C1qQqRPCXd0BrGn3Jbe6/HUNN6Y7zMix/dm2Dnq2g9GQeaqcPgaxqkQPevWym44nY8joOeS2Gah/89trz7KIMzSoAp2Ou69Ij9CT9zuNgFouzES2t/JB8D0z7wW+SGveuRTFQ9DgadKDLwa/nc23t2u4roi6BNNAqZD+u861nWKw0sGFkvE/geBqJILneXJulaMNEFp77yUOdaxePpV08/Mzri1rHfegF35m7RnyP8ZlfjINpvUtfpYdnv036It2h5UP/YRk6MBt/iYDMa945F06uF36TRDRv+5BgW99FSd/+6meLunfeyCnsMOJMk3JxAXiDONugLbMFMgARA8HbeuViyX5ycr0oLJOsvQwqDmOU7CL0Kv3FHUA9vjex8Uado19M+zesYRahlceZ654EQPpZA3ZgFpe3b8IVpwkB1wH+noG/CMC22XLV2MvO36TQgx8voeVj+x3+vA5cEYCIgeEVau5li76ILTfXa5q9gdlj7zxEr9wCtm/u7DKAvO+UFU63rt1PUOYH0h5sGn7RggDEjiX12F1A4u8T9D3I/WzXykemBZNNRpQZ3YI/2QUuROAv2rAD0RKX/jn62Cc0EH6/tk3jX6HvYtZiqLU9PexQegUBsENresjwbFnUekY/0cGH039vTZ/D+3nHhck7EekX9Fv/vD6HACDpYcH6hOO39Hn1lJVoeLD30l3rty8RXZ/Ba8dH4Df+ee+nrHw38BEPgveL6D1YOoMrHjG/ng8M/4N3388if38pPTx7fxNdHS7mR9nVZ3qJ4qvYfWyDC/zXXoEHzX/7djG9YJ81tGz+R1aryzSfEn7Z48M2cGG/QqFQKBQKhUKhUCgUvw3/AFkEW692/vtPAAAAAElFTkSuQmCC" width="40" height="40" class="d-inline-block align-top" alt="logo"/>
		Biome
		</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link" href="home.do">Home
						<span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> Search By </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="plants.do">Plants</a> <a
							class="dropdown-item" href="#">Users</a> <a class="dropdown-item"
							href="#">Sightings</a>
					</div></li>
				<li class="nav-item"><a class="nav-link" href="#">Plant
						Sightings</a></li>
			</ul>
			<c:choose>
				<c:when test="${empty sessionScope.loggedInUser }">
					<form class="form-inline my-2 my-lg-0" action="login.do"
						method="POST">
						<input class="form-control mr-sm-2" type="text"
							placeholder="username" aria-label="Search" name="username">
						<input class="form-control mr-sm-2" type="text"
							placeholder="password" aria-label="Search" name="password">
						<button class="btn btn-secondary" type="submit">Log
							In</button>
					</form>

				</c:when>
				
				<c:otherwise>
				<ul class="navbar-nav topnav-right">
			
					<li class="nav-item active"><a  class="nav-link btn btn-secondary" href="account.do" role="button">Account</a></li>
					<br>
					<li class="nav-item active"><a class="nav-link btn btn-secondary" href="logout.do">Logout</a></li>
			</ul>
				</c:otherwise>
			
			</c:choose>
		</div>
	</nav>

	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js"
		integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"
		integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
		crossorigin="anonymous"></script>

</body>
</html>