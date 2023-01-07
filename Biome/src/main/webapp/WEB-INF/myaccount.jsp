<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/backgroundcolor.css">
</head>
<body>

<jsp:include page="navbar.jsp"></jsp:include>

<div class="backgroundcolor">

<div style="overflow: scroll;" >
<div id="form-wrapper" style="max-width:750px;margin:100px; float:left;">
<h2 class="text-center">Account Settings</h2>
<br>

<form action="updateUser.do" method="GET" >
  <div class="form-row">
  <input type="hidden" id="id" name="id" value="${user.id}"/>
  
    <div class="form-group col-md-6">
      <label for="inputEmail4">Create Username</label>
      <input type="text" class="form-control" id="inputEmail4" value="${user.username}" name="username" placeholder="Create Username">
    </div>
    <div class="form-group col-md-6">
      <label for="inputPassword4">Create Password</label>
      <input type="password" class="form-control" id="inputPassword4" name="password" placeholder="Password">
    </div>
  </div>
   <div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputEmail4">First Name</label>
      <input type="text" class="form-control" id="inputEmail4" value="${user.firstName}" name="firstName" placeholder="First Name">
    </div>
    <div class="form-group col-md-6">
      <label for="inputPassword4">Last Name</label>
      <input type="text" class="form-control" id="inputPassword4" value="${user.lastName}" name="lastName" placeholder="Last Name">
    </div>
 </div>
  <div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputEmail4">Email</label>
      <input type="email" class="form-control" id="inputEmail4" value="${user.email}" name="email" placeholder="Email">
    </div>
    <div class="form-group col-md-6">
      <label for="inputPassword4">Password</label>
      <input type="password" class="form-control" id="inputPassword4" name="password" placeholder="Password">
    </div>
  </div>
  <div class="form-group">
    <label for="inputAddress">Address</label>
    <input type="text" class="form-control" id="inputAddress" value="${address.street}" name="street" placeholder="1234 Main St">
  </div>
  <div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputCity">City</label>
      <input type="text" class="form-control" value="${address.city}" name="city" id="inputCity">
    </div>
    <div class="form-group col-md-4">
      <label for="inputState">State</label>
       <input type="text" class="form-control" value="${address.state}" name="state" id="inputState">
    </div>
    <div class="form-group col-md-2">
      <label for="inputZip">Zip</label>
      <input type="text" class="form-control" value="${address.zip}" name="zip" id="inputZip">
    </div>
  </div>

  
  <h4>Privacy Setting:</h4>
  <div class="form-check form-switch">
    <div class="form-check">
      <input class="form-check-input" type="checkbox" name="hidden" id="gridCheck">
      <label class="form-check-label" for="gridCheck">
        Private
      </label>
    </div>
  </div>
  
   <h4> Please select a profile picture </h4>
  	<div class="profilepic form-check form-check-inline">
		<label>
  		 <img src="https://media.istockphoto.com/id/1298338829/vector/print.jpg?s=612x612&w=0&k=20&c=5md-EbBeSPaEPC2w2CT8GLMqy8FHrgSdCUnkRMVP0Zc=" alt="Option 1" width="100" height="100">
  		 <input type="radio" name="profileImage.id" value="2" checked >
		</label>
		<label>
		 <img src="https://cdn.dribbble.com/users/1810157/screenshots/14012338/media/a3f8eb7682029ff464542d79fe126717.png?compress=1&resize=800x600&vertical=top" alt="Option 2" width="100" height="100">
  		 <input type="radio" name="profileImage.id" value="3">
		</label>
		<label>
  		 <img src="https://cdn0.iconfinder.com/data/icons/good-morning-1/128/flower_plant_nature_happy_cute_eco-1024.png" alt="Option 3" width="100" height="100">
  		 <input type="radio" name="profileImage.id" value="4">
		</label>
		<label>
 		 <img src="https://static.vecteezy.com/system/resources/previews/003/426/274/non_2x/happy-baby-leaf-cartoon-character-free-vector.jpg " alt="Option 4" width="100" height="100">
  		 <input type="radio" name="profileImage.id" value="1">
		</label>
	</div>
  <div>
  <button type="submit" class="btn btn-info btn-lg">Update Account</button>
</div>
</form>
</div>


<div class="container h-700">
<div id="form-wrapper" style="max-width:400px;margin:100px; float:right;">
 <h2 class="text-center"> Do you want to delete your account?</h2>
	
	<form action="deleteUser.do" method="GET" >
		<input type="hidden" id="id" name="id" value="${user.id}"/>
	
      <input type="submit" value="Delete Account"class="btn btn-info btn-lg" role="button"/>
    
    
	</form>
	</div>
	</div>
</div>
</div>
</body>
<jsp:include page="footer.jsp" ></jsp:include>
</html>