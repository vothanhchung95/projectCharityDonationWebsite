<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>

<title>Chỉnh sửa Nhà tổ chức</title>
<body>

	<div class="mx-5">
		<h2 class="text-center my-5">Chỉnh sửa Nhà tổ chức</h2>


		<div id="content">

			<c:url value="/admin/update_foundation" var="updateFoundation"></c:url>
			<form:form action="${updateFoundation}" class="create-form" method="POST"
				modelAttribute="foundation" accept-charset="UTF-8">
				<div class="row">
					<div class="form-group col-3">
						<label class="form-label">ID</label>
						<form:input path="id" readonly="true" class="form-control" />
						<span class="form-message"></span>
					</div>
					<div class="form-group col-9">
						<label class="form-label">Name</label>
						<form:input path="name" value="${name}" class="form-control" />
						<span class="form-message text-danger"><form:errors
								path="name" /></span>

					</div>
				</div>
				
				<div class="form-group">
					<label class="form-label">Description</label>
					<form:textarea id="foundation-description" rows="3" class="form-control"
						path="description" />
					<span class="form-message text-danger"><form:errors
							path="description" /></span>
				</div>
				
				<div class="form-group">
					<label class="form-label">Email</label>
					<form:input id="foundation-email" type="text" class="form-control"
						path="email" />
					<span class="form-message text-danger"><form:errors
							path="email" /></span>
				</div>
				
				<div class="form-group">
					<label class="form-label">Status</label>
					<form:select id="foundation-status" class="form-select" path="status"
						defaultValue="${foundation.status}">
						<c:forEach var="status" items="${statusList}">

							<form:option value="${status.name}">${status.name}</form:option>

						</c:forEach>

					</form:select>
					<span class="form-message"></span>
				</div>
				

				<div class="form-group">
					<button id="btn-Save" type="submit" class="btn btn-success mx-1">
						<i class="fa-solid fa-floppy-disk"></i> Save
					</button>

					<a href="<c:url value = "/admin/foundation_management"/>">
						<button type="button" class="btn btn-primary mx-1">Cancel</button>
					</a>

					<script>
						
					</script>
				</div>
			</form:form>


		</div>
	</div>




</body>
