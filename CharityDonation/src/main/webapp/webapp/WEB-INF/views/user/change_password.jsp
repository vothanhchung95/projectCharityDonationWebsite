<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>

<title>Thay đổi mật khẩu</title>
<body>

	<div class="mx-5">
		<h2 class="text-center my-4">Thay đổi mật khẩu</h2>


		<div class="container">


			<form action="<c:url value="/user/updatepassword" />"
				class="create-form" method="GET" accept-charset="UTF-8">


				<div class="form-group">
					<label class="form-label">Email</label> <input type="text"
						class="form-control-plaintext" name="email" value="${user.email}"
						readonly><span class="form-message text-danger"><form:errors
							name="email" /></span>
				</div>


				<label class="form-label">Nhập mật khẩu hiện tại</label>

				<div class="form-group ">
					<input type="password" class="form-control" name="password" /> <span
						class="form-message text-danger">${wrongPassword}</span>

				</div>

				<label class="form-label">Nhập mật khẩu mới (Tối thiểu 8 ký
					tự)</label>

				<div class="form-group ">
					<input type="password" class="form-control" name="newPassword" />

					<span class="form-message text-danger">${invalidPassword}</span>


				</div>

				<label class="form-label">Xác nhận mật khẩu mới</label>

				<div class="form-group ">
					<input type="password" class="form-control" name="confirmPassword" />

					<span class="form-message text-danger">${confirmFail}</span>


				</div>
				<button class="btn bg-success text-light" type="submit">Thay
					đổi</button>
				<a href="<c:url value = "/user"/>">
					<button type="button" class="btn btn-primary mx-1">Cancel</button>
				</a>

			</form>


		</div>
	</div>




</body>
