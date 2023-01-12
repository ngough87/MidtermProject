<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Plants</title>

<link rel="stylesheet" href="css/allrecords.css">

</head>
<body>
	<jsp:include page="navbar.jsp"></jsp:include>

	<div class="backgroundcolor">

		<div class="col-auto button-container">
			<c:if test="${user != null}">
				<div style="margin: auto; float: left;">
					<form action="uploadedPlant.do">
						<button type="submit" class="btn btn-info btn-md">Upload
							New Plant</button>
					</form>
				</div>
			</c:if>

			<div style="margin: auto; float: right;">
				<form action="searchPlants.do" class="in-line">

					<input type="text" name="searchTerm" placeholder="Search" />

					<input type="submit" value="Submit" class="btn btn-info btn-md"
						role="button" />
				</form>
			</div>
		</div>

		<br> <br> <br>
		<div class="backgroundcolor center">
		<h3> ${headerString} </h3>
		</div>
		<button onclick="sortListDir()">Sort</button>
		<c:choose>

			<c:when test="${ !empty plants}">

				<div class="container">
					<div class="grid-container" id="alpha">
						<c:forEach var="plant" items="${plants}" varStatus="status">
							<div class="grid-item">
								<form action="selectedPlant.do">
									<br>
									<input type="hidden" value="${plant.id}" name="id">
									<input type="image" src="${plant.imageUrl}" width="200"
										height="200">
									<br>
									<c:out value="${plant.commonName}">
									</c:out>
								</form>
							</div>

						</c:forEach>
<script>
function sortListDir() {
  var list, i, switching, b, shouldSwitch, dir, switchcount = 0;
  list = document.getElementById("alpha");
  switching = true;
  
  dir = "asc"; 

  while (switching) {
    
    switching = false;
    b = list.getElementsByTagName("div");
  
    for (i = 0; i < (b.length - 1); i++) {

      shouldSwitch = false;
 
      if (dir == "asc") {
        if (b[i].innerHTML.toLowerCase() > b[i + 1].innerHTML.toLowerCase()) {
       
          shouldSwitch = true;
          break;
        }
      } else if (dir == "desc") {
        if (b[i].innerHTML.toLowerCase() < b[i + 1].innerHTML.toLowerCase()) {
       
          shouldSwitch= true;
          break;
        }
      }
    }
    if (shouldSwitch) {
  
      b[i].parentNode.insertBefore(b[i + 1], b[i]);
      switching = true;
    
      switchcount ++;
    } else {
    
      if (switchcount == 0 && dir == "asc") {
        dir = "desc";
        switching = true;
      }
    }
  }
}
</script>

					</div>
				</div>


			</c:when>
			<c:otherwise>
				<div class="container">
					<h3>No Results Found</h3>
				</div>
			</c:otherwise>


		</c:choose>


	</div>

</body>
<jsp:include page="footer.jsp"></jsp:include>
</html>