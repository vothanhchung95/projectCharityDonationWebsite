<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<title>Quên mật khẩu</title>
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
								<c:url value="/update_forget_password" var="forgetAction"></c:url>
								<form method="get" action="${forgetAction}"
									accept-charset="UTF-8">

									<div class="d-flex align-items-center mb-3 pb-1">

										<div class="col-2">
											<img src='<c:url value = "/images/logo.png"/>'
												alt="login form" class="img-fluid" />
										</div>
										<a href="<c:url value="/"/>"><span class="h2 fw-bold mb-0"
											style="color: #40c057">helpingpeople</span> </a>
									</div>

									<h5 class="fw-normal mb-3" style="letter-spacing: 1px;">Quên
										mật khẩu</h5>
									<p class="mb-4">Vui lòng nhập địa chỉ email của bạn, mật
										khẩu mới sẽ được gửi về địa chỉ email của bạn.</p>
									<div class="form-outline mb-4">
										<label class="form-label">Email</label> <input type="text"
											name="email" class="form-control form-control-lg" />
									</div>

									<c:if test="${param.error != null}">
										<div class="alert alert-danger">Email không chính xác</div>
									</c:if>
									<div class="pt-1 mb-4">
										<button class="btn btn-success mr-2" type="submit"
											value="Login">Submit</button>
										<a href="<c:url value="/login"/>">
											<button class="btn btn-secondary" type="button" value="Login">Hủy</button>
										</a>
									</div>


								</form>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</section>
</body>
</html>