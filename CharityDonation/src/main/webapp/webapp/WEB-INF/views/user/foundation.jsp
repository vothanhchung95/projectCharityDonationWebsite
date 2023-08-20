<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<title>Nhà tổ chức</title>
<body>

	<!-- 
Body Section 
-->
	<img alt="" class="img-fluid"
		src="<c:url value = "/images/cover-image.png"/>">
	<div class="mt-5 container">
		<div class="mb-5">
			<p class="h2 text-success text-center font-weight-bold">Các nhà
				tổ chức quỹ</p>
			<p class="h5 text-center">Thông tin về các Nhà tổ chức quỹ đang
				đồng hành cùng chúng tôi</p>
		</div>
		<div class="row row-cols-lg-3 row-cols-md-2 row-cols-1 d-flex">
			<c:forEach var="item" items="${foundationsPagination}">
				<div class="col mb-4 d-flex ">
					<div class=" d-flex justify-content-between flex-column">
						<div
							class="card h-100 shadow d-flex justify-content-between flex-column ">
							<a href="<c:url value = "/foundation/${item.id}"/>"
								class="text-decoration-none text-dark">
								<div class="card-body">

									<h5 class="card-title pb-2 font-weight-bold">${item.name}</h5>

									<p class="card-text mb-1">${item.description}</p>
									<p class="card-text font-italic text-secondary mb-1">Email:
										${item.email}</p>

								</div>
							</a>
							<div class=" ">
								<a href="<c:url value = "/foundation/${item.id}"/>"
									class="text-decoration-none text-dark">
									<button class="btn btn-outline-success m-3 align-items-end">Chi
										tiết</button>
								</a>
							</div>
						</div>

					</div>

				</div>
			</c:forEach>

		</div>
		<div>
			<ul class="pagination justify-content-center">
				<c:if test="${pagination.currentPage > 1}">
					<li class="page-item"><a class="page-link"
						href="<c:url value = "/foundation?page=${pagination.currentPage - 1}"/>"><i
							class="fas fa-angle-left"></i></a></li>

				</c:if>

				<c:forEach begin="1" end="${pagination.totalPage}" var="pageNumber">
					<c:choose>
						<c:when test="${pageNumber == pagination.currentPage}">
							<li class="page-item active"><a class="page-link"
								href="<c:url value = "/foundation?page=${pageNumber}"/>">${pageNumber}</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link"
								href="<c:url value = "/foundation?page=${pageNumber}"/>">${pageNumber}</a></li>
						</c:otherwise>
					</c:choose>

				</c:forEach>


				<c:if test="${pagination.currentPage < pagination.totalPage}">
					<li class="page-item"><a class="page-link"
						href="<c:url value = "/foundation?page=${pagination.currentPage + 1}"></c:url>"><i
							class="fas fa-angle-right"></i></a></li>

				</c:if>
			</ul>
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
	</div>
	<script>
		var message = "${message}";
		if (message) {
			$('#messageModal').modal('show');
		}
	</script>




</body>
