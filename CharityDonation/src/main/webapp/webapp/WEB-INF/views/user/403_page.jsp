<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<title>Home</title>
<body>

	<!-- 
Body Section 
-->

	<div class="container ">
		<img alt="" class="img-fluid"
			src="<c:url value = "/images/403-page.png"/>">
		<div class="vh-100">
			
			<p class="h4 text-success text-center font-weight-bold pb-2">Bạn không có quyền
				truy cập trang này</p>
			<div class="d-flex justify-content-center">
				<a class="" href='<c:url value="/home"/>'>
					<button class="h3 btn bg-success text-light text-center">Quay
						về trang chủ</button>
				</a>
			</div>
		</div>


	</div>




</body>
