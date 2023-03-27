<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>

<title>Quản lý đợt quyên góp</title>
<body>

	<div class="container">
		<h2 class="text-center my-5">Quản lý đợt quyên góp</h2>
		<form action='<c:url value = "/admin/search_donation"></c:url>'>
			<div class="row mb-3">

				<div class="col-md-1">
					<input type="text" class="form-control" placeholder="ID" name="id" />
				</div>
				<div class="col-md-3">
					<input type="text" class="form-control" placeholder="Tên tài khoản"
						name="accountName" />
				</div>
				<div class="col-md-6">
					<input type="text" class="form-control" placeholder="Tên quỹ"
						name="fundName" />
				</div>
				<div class="col-md-2">
					<button class="btn btn-primary" type="submit">Tìm kiếm</button>
				</div>

			</div>
		</form>

		<div class="table-responsive shadow">
			<table class="table table-striped">
				<thead>
					<tr>
						<th>ID</th>
						<th>Số tiền</th>
						<th class="d-none d-sm-table-cell">Tin nhắn</th>
						<th>Ngày tạo</th>
						<th>Tài khoản</th>
						<th class="d-none d-sm-table-cell">Quỹ</th>

					</tr>
				</thead>
				<tbody>
					<c:forEach var="item" items="${donationsPagination}">
						<tr>
							<td>${item.id}</td>
							<td><fmt:formatNumber type="currency" value="${item.amount}" /></td>
							<td class="d-none d-sm-table-cell">${item.message}</td>
							<td>${item.createdDate}</td>
							<td>${item.accountName}</td>
							<td class="d-none d-sm-table-cell">${item.fundName}</td>

						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div>
				<ul class="pagination justify-content-center">
					<c:if test="${pagination.currentPage > 1}">
						<li class="page-item"><a class="page-link"
							href="<c:url value = "/admin/donation_management?page=${pagination.currentPage - 1}"/>"><i
								class="fas fa-angle-left"></i></a></li>

					</c:if>

					<c:forEach begin="1" end="${pagination.totalPage}" var="pageNumber">
						<c:choose>
							<c:when test="${pageNumber == pagination.currentPage}">
								<li class="page-item active"><a class="page-link"
									href="<c:url value = "/admin/donation_management?page=${pageNumber}"/>">${pageNumber}</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link"
									href="<c:url value = "/admin/donation_management?page=${pageNumber}"/>">${pageNumber}</a></li>
							</c:otherwise>
						</c:choose>

					</c:forEach>


					<c:if test="${pagination.currentPage < pagination.totalPage}">
						<li class="page-item"><a class="page-link"
							href="<c:url value = "/admin/donation_management?page=${pagination.currentPage + 1}"></c:url>"><i
								class="fas fa-angle-right"></i></a></li>

					</c:if>
				</ul>
			</div>
		</div>

	</div>




</body>
