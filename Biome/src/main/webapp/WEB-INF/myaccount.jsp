<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<jsp:include page="navbar.jsp"></jsp:include>




<div id="form-wrapper" style="max-width:500px;margin:auto;">
<form action="updateUser.do" method="GET" >
		<input type="hidden" id="id" name="id" value="${user.id}"/>
	 <br>
		<div>
	 <input type="text" name="username" value="${user.username}"  />
	 </div>
	  <br>
	 <input type="text" name="firstName" value="${user.firstName}" placeholder="First Name"  />
	<br>
	 <input type="text" name="lastName" value="${user.lastName}" placeholder="Last Name" />
	<br>
	 <input type="text" name="email" value="${user.email}" placeholder="Email" />
	<br>
	 <input type="text" name="street" value="${user.address.street}" placeholder="Street Address" />
	<br>
	 <input type="text" name="city" value="${user.address.city}" placeholder="City" />
	<br>
	 <input type="text" name="state" value="${user.address.state}" placeholder="State" />
	<br>
	 <input type="text" name="zip code" value="${user.address.zip}" placeholder="Zip Code" />
	<br>
	  
	<br>
	 
   	<div class="form-check form-switch">
  	<input class="form-check-input" type="checkbox" value="${user.hidden}" id="flexSwitchCheckChecked" checked>
 	 <label class="form-check-label" for="flexSwitchCheckChecked" name="private">Private</label>
	</div>
	<input type="submit" value="Update Account "class="btn btn-primary" role="button"/>
	</form>
  
  	 <h2> Do you want to delete your account?</h2>
	<form action="deleteUser.do" method="GET" >
		<input type="hidden" id="id" name="id" value="${user.id}"/>
	
      <input type="submit" value="Delete Account"class="btn btn-primary" role="button"/>
    
	</form>
	 <br>
	<br>
</div>




</body>
<jsp:include page="footer.jsp"></jsp:include>
</html>