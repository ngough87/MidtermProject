<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Account</title>



</head>
<body style="background-color: #FFFCF1">

	<jsp:include page="navbar.jsp"></jsp:include>


	<div class="row" style="overflow: scroll;">
		<div class="col px-md-40" id="form-wrapper"
			style="max-width: 750px; margin: 100px; float: left; border: 3px solid #0ABE9A; padding: 40px; background-color: #C5D4D2">
			<h2 class="text-center">Account Preferences</h2>
			<br>


			<form action="updateUser.do" method="GET">
				<div class="form-row">
					<input type="hidden" id="id" name="userId" value="${user.id}" />

					<div class="form-group col-md-6">
						<label for="inputEmail4">Update Username</label>
						<input type="text" class="form-control" id="inputEmail4"
							value="${user.username}" name="username"
							placeholder="Create Username">
					</div>
					<div class="form-group col-md-6">
						<label for="inputPassword4">Update Password</label>
						<input type="password" class="form-control" id="inputPassword4"
							name="password" placeholder="Password">
					</div>
				</div>
				<div class="form-row">
					<div class="form-group col-md-6">
						<label for="inputEmail4">First Name</label>
						<input type="text" class="form-control" id="inputEmail4"
							value="${user.firstName}" name="firstName"
							placeholder="First Name">
					</div>
					<div class="form-group col-md-6">
						<label for="inputPassword4">Last Name</label>
						<input type="text" class="form-control" id="inputPassword4"
							value="${user.lastName}" name="lastName" placeholder="Last Name">
					</div>
				</div>

				<div class="form-group">
					<label for="inputEmail4">Email</label>
					<input type="email" class="form-control" id="inputEmail4"
						value="${user.email}" name="email" placeholder="Email">
				</div>

				<div class="form-group">
					<label for="inputAddress">Address</label>
					<input type="text" class="form-control" id="inputAddress"
						value="${address.street}" name="street" placeholder="1234 Main St">
				</div>
				<div class="form-row">
					<div class="form-group col-md-6">
						<label for="inputCity">City</label>
						<input type="text" class="form-control" value="${address.city}"
							name="city" id="inputCity">
					</div>
					<div class="form-group col-md-4">
						<label for="inputState">State</label>
						<input type="text" class="form-control" value="${address.state}"
							name="state" id="inputState">
					</div>
					<div class="form-group col-md-2">
						<label for="inputZip">Zip</label>
						<input type="text" class="form-control" value="${address.zip}"
							name="zip" id="inputZip">
					</div>
					<div class="form-group col-md-2">
						<label for="zone">Zone</label>
						<input type="text" class="form-control"
							value="${user.address.zone}" name="zoneId">
					</div>
				</div>



				<div class="form-check form-switch container my-3">
					<div class="form-check col-md-12 text-center">
						<label for="privacySetting">Privacy Setting: </label>
						<br>
						<input class="form-check-input" type="checkbox" name="hidden"
							id="gridCheck">
						<label class="form-check-label" for="gridCheck"> Private </label>
					</div>
				</div>


				<div class="profilepic form-check form-check-inline">
					<div class="form-check col-md-12 text-center">
						<label for="profilepic">Select a profile picture: </label>
						<br>
						<c:forEach items="${profileImage}" var="image">
							<c:choose>
								<c:when test="${user.profileImage.id eq image.id}">

									<label>
										<img src="${image.imageUrl}" alt="Option 1" width="100"
											height="100">
										<input type="radio" name="profileImage.id" value="${image.id}"
											checked>
									</label>

								</c:when>
								<c:otherwise>
									<label>
										<img src="${image.imageUrl}" alt="Option 1" width="100"
											height="100">
										<input type="radio" name="profileImage.id" value="${image.id}">
									</label>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</div>
				</div>
				<div>

					<div class="container my-3 ">
						<div class="col-md-12 text-center">
							<button type="submit" class="btn btn-info btn-lg">Update
								Preferences</button>

						</div>
					</div>

				</div>
			</form>
		</div>






		<div class="col px-md-40" id="form-wrapper"
			style="max-width: 750px; margin: 100px; float: right">
			<form action="deleteUser.do" method="GET">
				<input type="hidden" id="id" name="id" value="${user.id}" />
				<div class="card" style="background-color: #EAF3F2">
					<h5 class="card-header text-center"
						style="background-color: #C5D4D2">Delete Account</h5>
					<div class="card-body">

						<p class="card-text text-center">Permanently this account:
							${user.username}</p>
						<div class="container my-3 ">
							<div class="col-md-12 text-center">
								<button type="submit" class="btn btn-danger btn-md">Delete</button>

							</div>
						</div>
					</div>
				</div>
			</form>




		</div>
	</div>



	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>