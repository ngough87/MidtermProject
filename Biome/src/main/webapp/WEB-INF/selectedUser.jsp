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








	<div class="row h-100 justify-content-center align-items-center ">

		<div class="card " style="max-width: 800px; margin: 100px;">



			<div class="Aligner">
				<div class="Aligner-item">

					<div>

						<div class="card-header-img-img">
							<div class="card-header-img">
								<img class="card-img-top img-fluid"
									src="${user.profileImage.imageUrl}">
							</div>
						</div>
					</div>
				</div>














				<div class="card-body">
					<h5 class="card-title"">Username: ${user.username}</h5>

				</div>


				<ul class="list-group list-group-flush">
					<li class="list-group-item">Account created:
						${user.createDate.month} ${user.createDate.year }</li>
					<li class="list-group-item">Location: ${user.address.state}</li>


				</ul>



				<div class="card-body">
					<h5 class="card-title">User Recent Activity</h5>
					<div class="col text-center">

						<div class="d-flex">
							<div style="width: 850px; height: 400px; overflow-y: scroll;">

								<c:if test="${!empty user.comments}">
									<table class="table table-striped table-hover">
										<thead>
											<tr>
												<th>Date</th>
												<th>User</th>
												<th>Comment</th>
											</tr>
										</thead>

										<tbody>

											<c:forEach var="comment" items="${user.comments}">
												<tr>
													<td class="comments"><font size="2">
															${comment.datePosted.dayOfMonth}
															${comment.datePosted.month} ${comment.datePosted.year}</font></td>

													<td><a href="selectedUser.do?id=${comment.user.id}">${comment.user.username}</a></td>
													<td>${comment.contents}</td>

												</tr>
											</c:forEach>
										</tbody>
									</table>
								</c:if>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>














</body>

<jsp:include page="footer.jsp"></jsp:include>
</html>