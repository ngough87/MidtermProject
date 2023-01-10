<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Sighting</title>
</head>
<body>



	<div class="row h-100 justify-content-center align-items-center">
		<div class="col px-md-40" id="form-wrapper"
			style="max-width: 750px; margin: 100px; float: left; border: 3px solid #0ABE9A; padding: 40px; background-color: #C5D4D2">
			<form action="updatedSighting.do">

				<input type="hidden" value="${sighting.id}" name="id">
				<div class="form-row">
					<div class="form-group col-md-6">
						<label for="latitude">Latitude: </label>
						<input type="text" class="form-control" name="latitude"
							placeholder="Enter Latitude" value="${sighting.latitude }" />
					</div>
					<div class="form-group col-md-6">
						<label for="longitude">Longitude: </label>
						<input type="text" class="form-control" name="longitude"
							placeholder="Enter Longitude" value="${sighting.longitude }" />
					</div>
				</div>


				<div class="form-group ">
					<label for="sightingDescription">Sighting Description: </label>
					<textarea class="form-control" name="description"
						placeholder="Enter brief description">${sighting.description} </textarea>
				</div>
				<div>
					<div class="container my-3 ">
						<div class="col-md-12 text-center">
							<input type="hidden" value="${sighting.id}" name="id">
							<button class="btn btn-info btn-lg" type="submit"
								value="submitUpdateSighting">Submit</button>
						</div>
					</div>
				</div>

			</form>
		</div>
	</div>
</body>
</html>