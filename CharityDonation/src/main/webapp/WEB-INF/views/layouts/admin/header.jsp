<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<header id="header ">



	<div style="background-color: #40c057" class="fixed-top">
		<div class=" d-flex flex-column flex-md-row justify-content-start "
			style="background-color: #FFFFFF">

			<div class="col-lg-1 col-md-2 col-1 my-0 my-md-3">
				<div class="">
					<img class="img-fluid " alt=""
						src='<c:url value = "/images/logo-2.png"/>' />
				</div>
			</div>
			<div class="align-self-center mx-auto my-3">
				<h3 class="text-center font-weight-bold" style="color: #40c057">Cùng
					nhau xây dựng một thế giới tốt đẹp hơn!</h3>
			</div>
		</div>
		<nav class="navbar navbar-expand-lg py-3">
			<a class="navbar-brand text-light  my-0"
				href="<c:url value = "/home"/>"><img class="pr-2"
				style="width: 30px" alt="" src='<c:url value = "/images/logo.png"/>' />helpingpeople.com</a>
			<button class="navbar-toggler " type="button" data-toggle="collapse"
				data-target="#navbarNav" aria-controls="navbarNav"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon text-light"><i
					class="fas fa-bars"></i></span>
			</button>
			<div class="collapse navbar-collapse justify-content-between"
				id="navbarNav">
				<ul class="navbar-nav">
					<li class="nav-item pr-2"><a class="nav-link text-light  my-0"
						href="<c:url value = "/"/>"><i class="fas fa-home pr-1"></i>Trang
							chủ</a></li>
					<li class="nav-item pr-2"><a class="nav-link text-light  my-0"
						href="<c:url value = "/categories"/>"><i
							class="fas fa-layer-group pr-1"></i>Danh mục</a></li>
					<li class="nav-item pr-2"><a class="nav-link text-light  my-0"
						href="<c:url value = "/foundation"/>"><i
							class="fas fa-users pr-1"></i>Tổ chức</a></li>
					

					<li class="nav-"><a class="nav-link text-light  my-0"
						href="<c:url value="/user" />"><i
							class="fas fa-user pr-1"></i>Tài khoản</a></li>
					<c:if test="${user.role == 1}">
						<li class="nav-"><a class="nav-link text-light  my-0"
							href="<c:url value = "/admin"/>"><i class="fas fa-tools pr-1"></i>Trang Admin</a></li>
					</c:if>
				</ul>
				<div class="row">
					<c:if test="${user != null}">
						<a href="<c:url value="/user" />">
							<p class="text-light h6 text-center mr-3 mb-0">
								Welcome</br>${user.username}</p>
						</a>
						<form:form action="${pageContext.request.contextPath}/logout"
							method="POST">
							<button
								class="btn mx-2 bg-light text-success font-weight-bold justify-self-end"
								type="submit">Đăng xuất</button>
						</form:form>
					</c:if>
					<c:if test="${user == null}">
						<a href="<c:url value = "/login"/>">
							<button
								class="btn bg-light mx-2 text-success font-weight-bold justify-self-end">Đăng
								nhập</button>
						</a>
					</c:if>

				</div>
			</div>

		</nav>
	</div>
	<div style="height: 160px;"></div>
	<div class="d-sm-none" style="height: 40px;"></div>



</header>





