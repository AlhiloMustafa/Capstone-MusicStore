<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Album</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1"
	crossorigin="anonymous">
<script src="https://kit.fontawesome.com/f8ebbde80f.js"
	crossorigin="anonymous"></script>
</head>
<body>
	<div class="container main bg-light">
		
			<form:form id="form" class="border border-3 rounded p-4 m-3">
				<h1 class="text-center">Album Details:</h1>

				<label for="name" class="mb-1">Name:</label>
				<div class="input-group mb-3">

					<input type="text" id="name" name="name" value="${album.name}"
						class="form-control">

				</div>
				<label for="price" class="mb-1">Price:</label>
				<div class="input-group mb-3">

					<input type="text" id="price" name="price" value="${album.price}"
						class="form-control">
				</div>
				<label for="inventory" class="mb-1">Inventory:</label>
				<div class="input-group mb-3">

					<input type="text" id="inventory" name="inventory"
						value="${album.inventory}" class="form-control">
				</div>
				<label for="date" class="mb-1">Date:</label>
				<div class="input-group mb-3">

					<input type="date" id="date" name="date"
						class="form-control"
						value=<fmt:formatDate pattern = "yyyy-MM-dd" value = "${album.date}" />>
				</div>
				<label for="image" class="mb-1">Image:</label>
				<div class="input-group mb-3">

					<input type="text" id="image" name="image"
						value="${album.image}" class="form-control">
				</div>
				
				<label for="status" class="mb-1">Status:</label>
				<div class="input-group mb-3">

					<select name="status" id="status" class="form-control">
						
							<option value="NEW"
								<c:if test="${album.status == 'NEW'}"> selected</c:if>>New
							</option>
							<option value="USED"
								<c:if test="${album.status == 'USED'}"> selected</c:if>>Used
							</option>
						
					</select>
				</div>
				
				<label for="genre_id" class="mb-1">Genre:</label>
				<div class="input-group mb-2">

					<select name="genre_id" id="genre_id" class="form-control">
						<c:forEach items="${genres}" var="genre">
							<option value="${genre.id}"
								<c:if test="${album.genre.id == genre.id}"> selected</c:if>>${genre.name}
							</option>
						</c:forEach>
					</select>
				</div>
				<label for="artist_id" class="mb-1">Artist:</label>
				<div class="input-group mb-2">

					<select name="artist_id" id="artist_id" class="form-control">
						<c:forEach items="${artists}" var="artist">
							<option value="${artist.id}"
								<c:if test="${album.artist.id == artist.id}"> selected</c:if>>${artist.name}
							</option>
						</c:forEach>
					</select>
				</div>

				<div class="text-center text-danger">${error}</div>
				<div class="d-flex justify-content-center mt-3">
					<input type="submit" value="Submit">
				</div>
			</form:form>
		</div>
</body>
</html>