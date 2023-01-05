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
	 <input type="email" name="email" value="${user.email}" placeholder="Email" />
	<br>
	<input type="hidden" id="id" name="address.id" value="${user.address.id}"/>
	<br>
	 <input type="text" name="address.street" value="${user.address.street}" placeholder="Street Address" />
	<br>
	 <input type="text" name="address.city" value="${user.address.city}" placeholder="City" />
	<br>
	 <input type="text" name="address.state" value="${user.address.state}" placeholder="State" />
	<br>
	 <input type="text" name="address.zip" value="${user.address.zip}" placeholder="Zip Code" />
	<br>
	  
	<br>
	 
   	<div class="form-check form-switch">
  	<input class="form-check-input" type="checkbox" id="flexSwitchCheckChecked" checked name="hidden">
 	 <label class="form-check-label" for="flexSwitchCheckChecked" name="hidden">Private</label>

	</div>
	<h3>About me:</h3>
	<textarea name="aboutMe" placeholder="About me">${user.aboutMe} </textarea>
	
    
    <h3> Please select a profile picture </h3>
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
	
	<input type="submit" value="Update Account" class="btn btn-primary" role="button"/>
	
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