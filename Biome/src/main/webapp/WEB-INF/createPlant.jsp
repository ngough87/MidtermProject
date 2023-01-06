<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

<meta charset="UTF-8">
<title>Create Plant</title>
</head>
<jsp:include page="navbar.jsp"></jsp:include>
<body>

<form action="createPlant.do" method="GET" >
	

	

		<div>
	 <input type="text" name="imageURL" placeholder="Image URL" />
	 </div>
	 <br>
		<div>
	 <input type="text" name="commonName" placeholder="Common Name" />
	 </div>
	  <br>
		<div>
	 <input type="text" name="scientificName" placeholder="Scientific Name" />
	 </div>
	  <br>
		<div>
	
	 <label for="endangeredStat">Endangered Status:</label>
  <select  name="endangeredStat">
    <option value="1"> Presumed Extinct</option>
    <option value="2">Possibly Extinct</option>
    <option value="3">Critically imperiled</option>
    <option value="4">Imperiled</option>
    <option value="5">Vulnerable</option>
    <option value="6">Apparently Secure</option>
    <option value="7">Secure</option>
    <option value="8">No Status</option>
  	</select>
	 </div>
	  <br>
	 <h3>Zone</h3>
	  <div class="form-check form-check-inline">
		<div class="form-check ">
	
  <input class="form-check-input" type="checkbox" value="1" id="flexCheckDefault" name="plant.zone">
  <label class="form-check-label" for="flexCheckDefault">
    1
  </label>
  </div>
		<div class="form-check">
  <input class="form-check-input" type="checkbox" value="2" id="flexCheckDefault"name="plant.zone">
  <label class="form-check-label" for="flexCheckDefault">
    2
  </label>
   </div>
  <div class="form-check">
  <input class="form-check-input" type="checkbox" value="3" id="flexCheckDefault"name="plant.zone">
  <label class="form-check-label" for="flexCheckDefault">
    3
  </label>
   </div>
  <div class="form-check">
  <input class="form-check-input" type="checkbox" value="4" id="flexCheckDefault"name="plant.zone">
  <label class="form-check-label" for="flexCheckDefault">
    4
  </label>
   </div>
  <div class="form-check">
  <input class="form-check-input" type="checkbox" value="5" id="flexCheckDefault"name="plant.zone">
  <label class="form-check-label" for="flexCheckDefault">
    5
  </label>
   </div>
  <div class="form-check">
  <input class="form-check-input" type="checkbox" value="6" id="flexCheckDefault"name="plant.zone">
  <label class="form-check-label" for="flexCheckDefault">
    6
  </label>
   </div>
  <div class="form-check">
  <input class="form-check-input" type="checkbox" value="7" id="flexCheckDefault"name="plant.zone">
  <label class="form-check-label" for="flexCheckDefault">
    7
  </label>
   </div>
  <div class="form-check">
  <input class="form-check-input" type="checkbox" value="8" id="flexCheckDefault"name="plant.zone">
  <label class="form-check-label" for="flexCheckDefault">
    8
  </label>
   </div>
  <div class="form-check">
  <input class="form-check-input" type="checkbox" value="9" id="flexCheckDefault"name="plant.zone">
  <label class="form-check-label" for="flexCheckDefault">
    9
  </label>
   </div>
  <div class="form-check">
  <input class="form-check-input" type="checkbox" value="10" id="flexCheckDefault"name="plant.zone">
  <label class="form-check-label" for="flexCheckDefault">
    10
  </label>

  </div>
  </div>
   <br>
  <div>
	
	 <label for="hab">Habitat:</label>
  <select  name="hab">
    <option value="1"> Woodland</option>
    <option value="2">Prairie</option>
    <option value="3">Wetland</option>
    <option value="4">Savannah</option>
    <option value="5">High Desert</option>

  	</select>
	 </div>
  	
  	<div>
  <div class="form-check">
  <input class="form-check-input" type="checkbox" value="1" id="flexCheckDefault" name="sun">
  <label class="form-check-label" for="flexCheckDefault" >
    Full Sun
  </label>
  </div>
  <div class="form-check">
	 <input class="form-check-input" type="checkbox" value="2" id="flexCheckDefault" name="sun">
  <label class="form-check-label" for="flexCheckDefault">
    Partial Sun
  </label>
  	</div>
  <div class="form-check">
	 <input class="form-check-input" type="checkbox" value="3" id="flexCheckDefault" name="sun">
  <label class="form-check-label" for="flexCheckDefault">
    Partial Shade
  </label>
  	</div>
  <div class="form-check">
	 <input class="form-check-input" type="checkbox" value="4" id="flexCheckDefault" name="sun">
  <label class="form-check-label" for="flexCheckDefault">
    Shade
  </label>
  	</div>


  	</div>
  	
   <br>
  <div>
	 </div>
	  <br>
		<div class="form-check">
		
  <input class="form-check-input" type="checkbox" value="1" id="flexCheckDefault" name="sea">
  <label class="form-check-label" for="flexCheckDefault" >
    Perennial
  </label>
  </div>
  <div class="form-check">
	 <input class="form-check-input" type="checkbox" value="2" id="flexCheckDefault" name="sea">
  <label class="form-check-label" for="flexCheckDefault">
    Annual
  </label>
	 </div>
	  <br>
		<div>
	 <textarea name="environmentalNotes"> Plant Environmental Notes</textarea>
	 </div>
	 <br>
	<div>
	 <textarea name="medicinalProperties"> Medicinal Properties</textarea>
	 </div>
	<div>
	  <label for="edible">Edible:</label>
  <select  name="edible">
    <option value="0"> Yes</option>
    <option value="1">No</option>
	</select>
	 </div>
	 <br>
	<div>
	 <label for="plantT">Plant Type:</label>
  <select  name="plantT" >
    <option value="1"> Herbaceous</option>
    <option value="2">Tree</option>
    <option value="3">Shrub</option>
    <option value="4">Grass</option>
    <option value="5">Rush</option>

  	</select>
	 </div>
	
	  <input type="submit" value="Submit"class="btn btn-primary" role="button"/>
	
	
</form>
</body>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

</html>