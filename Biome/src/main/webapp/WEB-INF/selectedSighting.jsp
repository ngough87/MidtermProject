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
<title>Selected Sighting</title>
<link rel="stylesheet" href="css/myaccount.css">
</head>
<body style="background-color: #FFFCF1">
	<jsp:include page="navbar.jsp"></jsp:include>


	<div class="row h-100 justify-content-center align-items-center ">
		<div class="card" style="max-width: 900px; margin: 100px;">
			<img src="${sighting.image}" class="card-img-top">
			<div class="card-body">
				<h5 class="card-title">Common Name:
					${sighting.plant.commonName}</h5>

			</div>


			<ul class="list-group list-group-flush">
				<c:if test="${sighting.user != null}">
					<li class="list-group-item">
			
						Created By:
						<a href="selectedUser.do?id=${sighting.user.id}"> <img src="${sighting.user.profileImage.imageUrl}" class="rounded-circle"
									height="40" loading="lazy"> ${sighting.user.username}</a>
					</li>
				</c:if>
				<li class="list-group-item">Latitude: ${sighting.latitude}</li>
				<li class="list-group-item">Longitude: ${sighting.longitude}</li>
				<li class="list-group-item">Description:
					${sighting.description}</li>
				<li class="list-group-item">Date Posted:
					${sighting.datePosted.dayOfMonth} ${sighting.datePosted.month}
					${sighting.datePosted.year}</li>

			</ul>



			<div class="card-body row-inline">
				<div style="float: left;">
					<form action="allSightings.do">

						<button class="btn btn-info btn-md" type="submit"
							value="Return to All Plants" id="btn1">Return to All
							Plants Sightings</button>

					</form>
				</div>

				<div style="float: right;">

					<c:if test="${sighting.user != null}">
						<c:if test="${sighting.user.id == user.id}">
							<form action="updateSighting.do">

								<button class="btn btn-info btn-md" type="submit" name="id"
									value="${sighting.id}">Update Sighting</button>

							</form>
						</c:if>
					</c:if>
				</div>
			</div>



			<div class="card-body">

				<div class="col text-center">
					<form action="comment.do">
						<div class="d-flex">
							<textarea name="contents" rows="5"
								style="width: 100%; max-width: 100%;"
								placeholder="Enter comment here">  </textarea>
						</div>
						<br>
						<div>
							<button class="btn btn-info btn-lg" type="submit"
								name="sightingId" value="${sighting.id}">Submit Comment</button>

						</div>
						<br>
					</form>

					<div class="d-flex">
						<div style="width: 850px; height: 400px; overflow-y: scroll;">

							<c:if test="${!empty sighting.comments}">
								<table class="table table-striped table-hover">
									<thead>
										<tr>
											<th>Date</th>
											<th>User</th>
											<th>Comment</th>
										</tr>
									</thead>

									<tbody>

										<c:forEach var="comment" items="${sighting.comments}">
											<tr>
												<td class="comments">
													<font size="2"> ${comment.datePosted.dayOfMonth}
														${comment.datePosted.month} ${comment.datePosted.year}</font>
												</td>

												<td >
													
													<a href="selectedUser.do?id=${sighting.user.id}"> <img src="${sighting.user.profileImage.imageUrl}" class="rounded-circle"
									height="40" loading="lazy"> ${sighting.user.username}</a>
								
												</td>
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


</body>

<jsp:include page="footer.jsp"></jsp:include>
</html>