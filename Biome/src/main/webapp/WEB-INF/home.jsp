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
<link rel="stylesheet" href="css/home.css">
<title>Biome</title>
</head>
<body>

	<jsp:include page="navbar.jsp"></jsp:include>
	<jsp:include page="header.jsp"></jsp:include>


	<div class="row">
		<div class="column">
			<div class='logoimage'>
				<p>Be apart of our preservation community</p>
			</div>
		</div>
		<div class="column">
			<div class='plantimage'></div>
		</div>
	</div>




	<div class="row">
		<div class="column">
			<div class='Native'>
				<h3>Why choose Native plants?</h3>
				<ul>
					<li>Native plants are healthier and stronger.</li>
					<li>Native plants create wildlife habitat in your backyard.</li>
					<li>Native plants help the environment.</li>
					<li>Native plants are low maintenance.</li>
				</ul>
			</div>
		</div>
		<div class="column">
			<div class='mission'></div>
			<p>Here at Biome we are on a mission to connect neighbors with
				neighbors in an effort to restore our native habitats.</p>
		</div>
	</div>

	<div class='imagetop'>
		<p class='caption'>
	</div>


	



	<section class="vh-100" style="background-color: #eee;">
		<div class="container h-100">
			<div
				class="row d-flex justify-content-center align-items-center h-100">
				<div class="col-lg-12 col-xl-11">
					<div class="card text-black" style="border-radius: 25px;">
						<div class="card-body p-md-5">
							<div class="row justify-content-center">
								<div class="col-md-10 col-lg-6 col-xl-5 order-2 order-lg-1">

									<p class="text-center h1 fw-bold mb-5 mx-1 mx-md-4 mt-4">Sign
										up</p>

									<form class="mx-1 mx-md-4" action="register.do">

										<div class="d-flex flex-row align-items-center mb-4">
											<i class="fas fa-user fa-lg me-3 fa-fw"></i>
											<div class="form-outline flex-fill mb-0">
												<input type="text" id="username" class="form-control"
													name="username" />
												<label class="form-label" for="username">Username</label>
											</div>
										</div>

										<div class="d-flex flex-row align-items-center mb-4">
											<i class="fas fa-envelope fa-lg me-3 fa-fw"></i>
											<div class="form-outline flex-fill mb-0">
												<input type="text" id="email" class="form-control"
													name="email" />
												<label class="form-label" for="email">Your Email</label>
											</div>
										</div>


										<div class="d-flex flex-row align-items-center mb-4">
											<i class="fas fa-lock fa-lg me-3 fa-fw"></i>
											<div class="form-outline flex-fill mb-0">
												<input type="text" id="password" class="form-control"
													name="password" />
												<label class="form-label" for="password">Password</label>
											</div>
										</div>

										<div class="d-flex flex-row align-items-center mb-4">
											<i class="fas fa-key fa-lg me-3 fa-fw"></i>
											<div class="form-outline flex-fill mb-0">
												<input type="text" id="passwordConfirm" class="form-control"
													name="passwordConfirm" value="This is a test" />
												<label class="form-label" for="passwordConfirm">Repeat
													your password</label>
											</div>
										</div>

										<div class="d-flex justify-content-center mx-4 mb-3 mb-lg-4">
											<button type="submit" value="Submit"
												class="btn btn-info btn-lg">Register</button>
										</div>

									</form>

								</div>
								<div
									class="col-md-10 col-lg-6 col-xl-7 d-flex align-items-center order-1 order-lg-2">

									<img
										src="https://www.succulentsandsunshine.com/wp-content/uploads/2021/05/aeonium-kiwi-pink-yellow-green-696x365.jpg"
										class="img-fluid" alt="Sample image">
									<div></div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
	</section>




</body>

<jsp:include page="footer.jsp"></jsp:include>

</html>