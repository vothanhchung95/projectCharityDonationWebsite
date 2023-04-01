<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>

<title>Tài khoản</title>
<body>
	<div class="row mx-5">
		<div class="col-lg-4">
			<h2 class="text-center my-5">Tài khoản</h2>


			<div id="content">

				<c:url value="/user/update_user" var="updateUser"></c:url>
				<form:form action="${updateUser}" class="create-form" method="POST"
					modelAttribute="user" accept-charset="UTF-8">

					<div class="form-group ">
						<label class="form-label">Họ và tên</label>
						<form:input path="username" class="form-control" />
						<c:if test="${error != null}">
							<span class="form-message text-danger">${error}</span>
						</c:if>

					</div>

					<div class="form-group">
						<label class="form-label">Email</label>
						<form:input type="text" class="form-control" path="email"
							readonly="true" />
						<span class="form-message text-danger"><form:errors
								path="email" /></span>
					</div>



					<div class="form-group">
						<label class="form-label">Phone</label>
						<form:input type="number" class="form-control" path="phone" />
						<span class="form-message text-danger"></span>
					</div>

					<div class="form-group">
						<label class="form-label">Address</label>
						<form:input type="text" class="form-control" path="address" />
						<span class="form-message text-danger"></span>
					</div>

					<div class="form-group">
						<button id="btn-Save" type="submit" class="btn btn-success mx-1">
							<i class="fa-solid fa-floppy-disk"></i> Save
						</button>
						<a href="<c:url value = "/"/>">
							<button type="button" class="btn btn-primary mx-1">Cancel</button>
						</a> <a href="<c:url value = "/user/change_password"/>">
							<button type="button" class="btn btn-warning">Đổi mật
								khẩu</button>
						</a>
						<script>
							
						</script>
					</div>
				</form:form>


			</div>
		</div>
		<div class="col-lg-8">
			<h2 class="text-center my-5">Lịch sử quyên góp</h2>
			<c:if test="${donationsPagination.size() > 0}">
				<div class="table-responsive ">
					<table class="table table-bordered table-light shadow-sm">
						<thead>
							<tr>
								<th>Quỹ</th>
								<th>Số tiền</th>
								<th>Tin nhắn</th>
								<th>Ngày</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="item" items="${donationsPagination}">
								<tr>
									<td>${item.fundName}</td>
									<td><fmt:formatNumber type="currency"
											value="${item.amount}" /></td>
									<td>${item.message}</td>
									<td>${item.createdDate}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</c:if>
			<c:if test="${donationsPagination.size() == 0}">
				<h4 class="text-center">Bạn chưa thực hiện lượt quyên góp nào</h4>
				<a href='<c:url value="/"/>'>
					<h5 class="text-center text-success font-weight-bold">Xem các
						quỹ quyên góp của chúng tôi</h5>
				</a>

			</c:if>
			<div>
				<ul class="pagination justify-content-center">
					<c:if test="${pagination.currentPage > 1}">
						<li class="page-item"><a class="page-link"
							href="<c:url value = "/user?page=${pagination.currentPage - 1}"/>"><i
								class="fas fa-angle-left"></i></a></li>

					</c:if>

					<c:forEach begin="1" end="${pagination.totalPage}" var="pageNumber">
						<c:choose>
							<c:when test="${pageNumber == pagination.currentPage}">
								<li class="page-item active"><a class="page-link"
									href="<c:url value = "/user?page=${pageNumber}"/>">${pageNumber}</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link"
									href="<c:url value = "/user?page=${pageNumber}"/>">${pageNumber}</a></li>
							</c:otherwise>
						</c:choose>

					</c:forEach>


					<c:if test="${pagination.currentPage < pagination.totalPage}">
						<li class="page-item"><a class="page-link"
							href="<c:url value = "/user?page=${pagination.currentPage + 1}"></c:url>"><i
								class="fas fa-angle-right"></i></a></li>

					</c:if>
				</ul>
			</div>
		</div>
	</div>



</body>
