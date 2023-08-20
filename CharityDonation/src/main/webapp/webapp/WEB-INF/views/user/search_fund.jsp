<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<title>Tìm kiếm</title>
<body>

	<!-- 
Body Section 
-->
	<img alt="" class="img-fluid"
		src="<c:url value = "/images/cover-image.png"/>">
	<div class="mt-5 container">
		<div class="mb-5">
			<p class="h2 text-success text-center font-weight-bold">Các hoàn
				cảnh quyên góp</p>
			<p class="h5 text-center">Chung tay quyên góp giúp đỡ các hoàn
				cảnh khó khăn trên khắp cả nước.</p>
		</div>

		<div class="row mb-5">
			<div class="col-md-12">
				<form class="row" action='<c:url value = "/search_fund"></c:url>'
					method="get">

					<div class="col-lg-5 col-md-12">
						<input type="text" class="form-control" placeholder="Tên quỹ"
							name="fundName" value="${param.fundName}" />
					</div>
					<div class="col-lg-3 col-md-5">

						<select class="form-control" id="selectCategory" name="categoryId">
							<option value="0" ${empty param.categoryId ? 'selected' : ''}>Chọn
								danh mục</option>
							<c:forEach var="category" items="${categoriesList}">
								<option value="${category.id}"
									${param.categoryId == category.id ? 'selected' : ''}>${category.name}</option>
							</c:forEach>

						</select>
					</div>
					<div class="col-lg-3 col-md-5">
						<select class="form-control" name="foundationId">
							<option value="0" ${empty param.foundationId ? 'selected' : ''}>Chọn
								tổ chức</option>
							<c:forEach var="foundation" items="${foundationList}">
								<option value="${foundation.id}"
									${param.foundationId == foundation.id ? 'selected' : ''}>${foundation.name}</option>
							</c:forEach>
						</select>
					</div>
					<div class="col-lg-1 col-md-2 pl-lg-1">
						<button class="btn btn-success " type="submit">
							<i class="fas fa-search"></i> Tìm
						</button>
					</div>
				</form>
			</div>


		</div>
		<c:if test="${fundsPagination.size() > 0}">
			<div class="row row-cols-lg-3 row-cols-md-2 row-cols-1 d-flex">
				<c:forEach var="item" items="${fundsPagination}">
					<c:if test="${item.status == 'Active'}">
						<div class="col mb-4 d-flex ">
							<div class=" d-flex justify-content-between flex-column">
								<div
									class="card h-100 shadow d-flex justify-content-between flex-column ">
									<a href="<c:url value = "/fund/${item.id}"/>"
										class="text-decoration-none text-dark"> <img
										class="img-fluid" alt="" src="${item.imgUrl}" />
										<div class="card-body">

											<h5 class="card-title pb-2 font-weight-bold">${item.name}</h5>
											<h6 class="card-subtitle mb-2 pb-2 text-muted font-italic">${item.foundationName}</h6>
											<p class="card-text mb-1">${item.description}</p>

										</div>
									</a>
									<div class=" ">
										<div class="row m-3 justify-content-between">
											<div>
												<span class="font-weight-bold"> <fmt:formatNumber
														type="currency" value="${item.currentAmount}" /></span> /<span
													class="text-secondary"><fmt:formatNumber
														type="currency" value="${item.expectedAmount}" /></span>
											</div>
											<div>
												<fmt:parseDate var="date" value="${item.endDate}"
													pattern="yyyy-MM-dd" />
												<span class="badge badge-success rounded p-2 text-light"><fmt:formatDate
														value="${date}" pattern="dd-MM-yyyy" /></span>
											</div>
										</div>
										<div class="my-1 mx-3 flex  rounded-lg "
											style="background-color: #ced4da">
											<div class="rounded-lg bg-success" aria-valuemin="0"
												aria-valuemax="100"
												style="width: ${(item.currentAmount / item.expectedAmount) * 100}%; height: 6px"></div>
										</div>
										<div class="row m-3 justify-content-between">
											<a href="<c:url value = "/fund/${item.id}"/>">
												<button class="btn btn-outline-success  align-items-end">Quyên
													góp</button>
											</a>
											<p class="mb-0 text-secondary">
												Đạt được <br> <span class="text-dark font-weight-bold"><fmt:formatNumber
														value="${(item.currentAmount / item.expectedAmount)}"
														type="percent" maxFractionDigits="1" /></span>
											</p>
										</div>
									</div>
								</div>

							</div>

						</div>
					</c:if>
					<c:if test="${item.status == 'Finish'}">
						<div class="col mb-4 d-flex ">
							<div class=" d-flex justify-content-between flex-column">
								<div
									class="card h-100 shadow d-flex justify-content-between flex-column ">
									<a href="<c:url value = "/fund/${item.id}"/>"
										class="text-decoration-none text-dark"> <img
										class="img-fluid" alt="" src="${item.imgUrl}" />
										<div class="card-body">

											<h5 class="card-title pb-2 font-weight-bold">${item.name}</h5>
											<h6 class="card-subtitle mb-2 pb-2 text-muted font-italic">${item.foundationName}</h6>
											<p class="card-text mb-1">${item.description}</p>

										</div>
									</a>
									<div class=" ">
										<div class="row m-3 justify-content-between">
											<div>
												<span class="font-weight-bold"> <fmt:formatNumber
														type="currency" value="${item.currentAmount}" /></span> /<span
													class="text-secondary"><fmt:formatNumber
														type="currency" value="${item.expectedAmount}" /></span>
											</div>
											<div>
												<fmt:parseDate var="date" value="${item.endDate}"
													pattern="yyyy-MM-dd" />
												<span class="badge badge-info rounded p-2 text-light"><fmt:formatDate
														value="${date}" pattern="dd-MM-yyyy" /></span>
											</div>
										</div>
										<div class="my-1 mx-3 flex  rounded-lg "
											style="background-color: #ced4da">
											<div class="rounded-lg bg-info" aria-valuemin="0"
												aria-valuemax="100"
												style="width: ${(item.currentAmount / item.expectedAmount) <= 1 ? ((item.currentAmount / item.expectedAmount) * 100) : 100}%; height: 6px"></div>
										</div>
										<div class="row m-3 justify-content-between">
											<a href="<c:url value = "/fund/${item.id}"/>">
												<button class="btn btn-outline-info  align-items-end">Xem
													quỹ</button>
											</a>
											<p class="mb-0 text-secondary">
												Đạt được <br> <span class="text-dark font-weight-bold">Hoàn
													thành</span>
											</p>
										</div>
									</div>
								</div>

							</div>

						</div>
					</c:if>
				</c:forEach>

			</div>
		</c:if>
		<c:if test="${fundsPagination.size() == 0}">

			<div class="my-5  justify-content-center">
				<h4 class="text-center font-weight-bold mb-5">Không tìm thấy
					kết quả, hãy thử lại với từ khóa khác</h4>
				<div class="d-flex justify-items-center">
					<a class="mx-auto" href='<c:url value="/"></c:url>'>
						<button class="btn btn-success">Quay về trang chủ</button>
					</a>
				</div>
			</div>

		</c:if>
		<div>
			<ul class="pagination justify-content-center">
				<c:if test="${pagination.currentPage > 1}">
					<li class="page-item"><a class="page-link"
						href="<c:url value = "/search_fund?page=${pagination.currentPage - 1}&fundName=${param.fundName}&categoryId=${param.categoryId}&foundationId=${param.foundationId}"/>"><i
							class="fas fa-angle-left"></i></a></li>

				</c:if>

				<c:forEach begin="1" end="${pagination.totalPage}" var="pageNumber">
					<c:choose>
						<c:when test="${pageNumber == pagination.currentPage}">
							<li class="page-item active"><a class="page-link"
								href="<c:url value = "/search_fund?page=${pageNumber}&fundName=${param.fundName}&categoryId=${param.categoryId}&foundationId=${param.foundationId}"/>">${pageNumber}</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link"
								href="<c:url value = "/search_fund?page=${pageNumber}&fundName=${param.fundName}&categoryId=${param.categoryId}&foundationId=${param.foundationId}"/>">${pageNumber}</a></li>
						</c:otherwise>
					</c:choose>

				</c:forEach>


				<c:if test="${pagination.currentPage < pagination.totalPage}">
					<li class="page-item"><a class="page-link"
						href="<c:url value = "/search_fund?page=${pagination.currentPage + 1}&fundName=${param.fundName}&categoryId=${param.categoryId}&foundationId=${param.foundationId}"></c:url>"><i
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
