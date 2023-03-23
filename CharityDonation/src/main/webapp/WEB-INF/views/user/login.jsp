<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<title>Đăng nhập</title>
</head>
<body>
	<section class="vh-100">
	<div class="container py-3 h-100">
		<div
			class="row d-flex justify-content-center align-items-center h-100">
			<div class="col col-xl-10">
				<div class="card" style="border-radius: 1rem;">
					<div class="row g-0">
						<div class="col-md-6 col-lg-5 d-none d-md-block">
							<img src="<c:url value = "/images/login-image.png"/>"
								alt="login form" class="img-fluid"
								style="border-radius: 1rem 0 0 1rem;" />
						</div>
						<div class="col-md-6 col-lg-7 d-flex align-items-center">
							<div class="card-body p-4 p-lg-5 text-black">
								<c:url value="/login" var="loginAction"></c:url>
								<form:form method="post" action="${loginAction}"
									accept-charset="UTF-8">

									<div class="d-flex align-items-center mb-3 pb-1">

										<div class="col-2">
											<img src='<c:url value = "/images/logo.png"/>'
												alt="login form" class="img-fluid" />
										</div>
										<a href="<c:url value="/"/>"><span class="h2 fw-bold mb-0"
											style="color: #40c057">helpingpeople</span> </a>
									</div>

									<h5 class="fw-normal mb-3 pb-3" style="letter-spacing: 1px;">Đăng
										nhập</h5>

									<div class="form-outline mb-4">
										<input type="text" name="username"
											class="form-control form-control-lg" /> <label
											class="form-label">Email</label>
									</div>

									<div class="form-outline mb-4">
										<input type="password" name="password"
											class="form-control form-control-lg" /> <label
											class="form-label">Password</label>
									</div>
									<c:if test="${param.error != null}">
										<div class="alert alert-danger">Email hoặc mật khẩu
											không chính xác</div>
									</c:if>
									<div class="pt-1 mb-4">
										<button class="btn btn-success btn-lg btn-block" type="submit"
											value="Login">Login</button>
									</div>

									<a class="text-muted" href="<c:url value="/forget_password" />">Quên
										mật khẩu?</a>
									<p class="mb-5 pb-lg-2" style="color: #393f81;">
										Chưa có tài khoản? <a href="<c:url value="/register" />">Đăng
											ký ở đây.</a>
									</p>

								</form:form>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="messageModal" tabindex="-1" role="dialog"
		aria-labelledby="messageModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="messageModalLabel">Thông báo</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">${message}</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Đóng</button>
				</div>
			</div>
		</div>
	</div>
	</section>
	<script>
		var message = "${message}";
		if (message) {
			$('#messageModal').modal('show');
		}
	</script>
</body>
</html>