<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>

<title>Thêm Tài khoản</title>
<body>

	<div class="mx-5">
		<h2 class="text-center my-5">Thêm Tài khoản</h2>


		<div id="content">

			<c:url value="/admin/insert_account" var="updateAccount"></c:url>
			<form:form action="${updateAccount}" class="create-form"
				method="POST" modelAttribute="account" accept-charset="UTF-8">


				<div class="form-group">
					<label class="form-label">Name</label>
					<form:input path="username" value="${username}"
						class="form-control" />
					<span class="form-message text-danger"><form:errors
							path="username" /></span>
				</div>

				<div class="form-group">
					<label class="form-label">Email</label>
					<form:input type="text" class="form-control" path="email" />
					<span class="form-message text-danger"><form:errors
							path="email" /></span>
				</div>

				<label class="form-label">Password</label>

				<div class="form-group ">
					<form:input type="password" class="form-control" path="password" />
					<span class="form-message text-danger"><form:errors
							path="password" /></span>

				</div>
				<div class="form-group">
					<label class="form-label">Phone</label>
					<form:input type="number" class="form-control" path="phone" />
					<span class="form-message text-danger"><form:errors
							path="phone" /></span>
				</div>

				<div class="form-group">
					<label class="form-label">Address</label>
					<form:input type="text" class="form-control" path="address" />
					<span class="form-message text-danger"><form:errors
							path="address" /></span>
				</div>
				<div class="form-group">
					<label class="form-label">Role</label>
					<form:select id="account-status" class="form-select" path="role">
						<c:forEach var="roles" begin="1" end="2">

							<form:option value="${roles}">${roles == 1 ? "Admin": roles == 2 ? "User": "Unknow"}</form:option>

						</c:forEach>

					</form:select>
					<span class="form-message"></span>
				</div>
				<div class="form-group">
					<label class="form-label">Status</label>
					<form:select id="account-status" class="form-select" path="status"
						defaultValue="${account.status}">
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
					<a href="<c:url value = "/admin/account_management"/>">
						<button type="button" class="btn btn-primary mx-1">Cancel</button>
					</a>
					<script>
						
					</script>
				</div>
			</form:form>


		</div>
	</div>




</body>
