<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Admin</title>
</head>
<body>
	<div class="mt-5 container">
		<h2 class="text-center my-5">Trang Quản lý Admin</h2>
		<div class="row row-cols-lg-3 row-cols-md-2 row-cols-1">
			<div class="col mb-4">
				<div class="card shadow" style="height: 100%">
					<a target="_blank"
						href="<c:url value = "/admin/categories_management"/>"
						class="text-decoration-none text-dark"> <img class="img-fluid"
						alt="" src="<c:url value = "/images/categories-icon.png"/>" />
						<div class="card-body">

							<h5 class="card-title">
								<i class="fas fa-layer-group pr-3"></i> Quản lý Danh mục
							</h5>
							<h6 class="card-subtitle mb-2 text-muted">Chức năng</h6>
							<p class="card-text mb-1">- Xem và tìm kiếm các Danh mục</p>
							<p class="card-text mb-1">- Thêm mới Danh mục</p>
							<p class="card-text mb-1">- Chỉnh sửa và cập nhật Danh mục</p>
							<p class="card-text">- Xóa Danh mục từ thiện</p>
						</div>
					</a>
				</div>
			</div>

			<div class="col mb-4">
				<div class="card shadow" style="height: 100%">
					<a target="_blank"
						href="<c:url value = "/admin/foundation_management"/>"
						class="text-decoration-none text-dark">
						<img class="img-fluid"
						alt="" src="<c:url value = "/images/foundation-icon.png"/>" />
						<div class="card-body">
							<h5 class="card-title">
								<i class="fas fa-users pr-3"></i>Quản lý Tổ chức
							</h5>
							<h6 class="card-subtitle mb-2 text-muted">Chức năng</h6>
							<p class="card-text mb-1">- Xem và tìm kiếm các Tổ chức</p>
							<p class="card-text mb-1">- Thêm mới Tổ chức</p>
							<p class="card-text mb-1">- Chỉnh sửa và cập nhật Tổ chức</p>
							<p class="card-text">- Xóa Tổ chức từ thi</p>
						</div>
					</a>
				</div>
			</div>
			<div class="col mb-4">
				<div class="card shadow" style="height: 100%">
					<a target="_blank" href="<c:url value = "/admin/fund_management"/>"
						class="text-decoration-none text-dark">
						<img class="img-fluid"
						alt="" src="<c:url value = "/images/fund-icon.png"/>" />
						<div class="card-body">
							<h5 class="card-title">
								<i class="fas fa-hand-holding-usd pr-3"></i>Quản lý Quỹ quyên góp
							</h5>
							<h6 class="card-subtitle mb-2 text-muted">Chức năng</h6>
							<p class="card-text mb-1">- Xem và tìm kiếm các Quỹ quyên góp</p>
							<p class="card-text mb-1">- Thêm mới Quỹ quyên góp</p>
							<p class="card-text mb-1">- Chỉnh sửa và cập nhật Quỹ quyên góp</p>
							<p class="card-text">- Xóa Quỹ quyên góp</p>
						</div>
					</a>
				</div>
			</div>
			<div class="col mb-4">
				<div class="card shadow" style="height: 100%">
					<a target="_blank"
						href="<c:url value = "/admin/donation_management"/>"
						class="text-decoration-none text-dark">
						<img class="img-fluid"
						alt="" src="<c:url value = "/images/donation-icon.png"/>" />
						<div class="card-body">
							<h5 class="card-title">
								<i class="fas fa-money-check-alt pr-3"></i>Lượt quyên góp
							</h5>
							<h6 class="card-subtitle mb-2 text-muted">Chức năng</h6>
							<p class="card-text mb-1">- Xem và tìm kiếm các lượt quyên góp</p>
							
						</div>
					</a>
				</div>
			</div>
			<div class="col mb-4">
				<div class="card shadow" style="height: 100%">
					<a target="_blank"
						href="<c:url value = "/admin/account_management"/>"
						class="text-decoration-none text-dark">
						<img class="img-fluid"
						alt="" src="<c:url value = "/images/account-icon.png"/>" />
						<div class="card-body">
							<h5 class="card-title">
								<i class="fas fa-user pr-3"></i>Quản lý Tài khoản
							</h5>
							<h6 class="card-subtitle mb-2 text-muted">Chức năng</h6>
							<p class="card-text mb-1">- Xem và tìm kiếm các Tài khoản</p>
							<p class="card-text mb-1">- Thêm mới Tài khoản</p>
							<p class="card-text mb-1">- Chỉnh sửa và cập nhật Tài khoản</p>
							<p class="card-text">- Xóa Tài khoản</p>
						</div>
					</a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>