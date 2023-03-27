<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<title>Quản lý Danh mục</title>
<body>

	<div class="mx-lg-5">
		<h2 class="text-center my-5">Quản lý Danh mục</h2>

		<div class="d-flex mb-3">
			<div class="col-md-12">
				<form class="row"
					action='<c:url value = "/admin/search_categories"></c:url>'>
					<div class="col-md-2">
						<input type="text" class="form-control" placeholder="ID" name="id" />
					</div>
					<div class="col-md-6">
						<input type="text" class="form-control" placeholder="Tên danh mục"
							name="name" />
					</div>
					<div class="col-md-4 d-flex justify-content-between">
						<button class="btn btn-primary " type="submit">
							<i class="fas fa-search"></i> Tìm
						</button>
						<a
							href="<c:url value = "/admin/categories_management/add_categories"/>">
							<button class="btn btn-success mr-lg-2" type="button">
								<i class="fas fa-plus"></i> Thêm
							</button>
						</a>

					</div>

				</form>
			</div>


		</div>

		<div class="table-responsive shadow">
			<form
				action="<c:url value = "categories_management/delete_multiple"/>"
				id="deleteForm">
				<div class="modal fade" id="confirmDeleteMultiModal" tabindex="-1"
					role="dialog" aria-labelledby="confirmDeleteModalLabel">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="confirmDeleteModalLabel">Xác
									nhận xoá nhiều phần tử</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								<p>Bạn có chắc chắn muốn xoá phần tử này không?</p>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">Hủy</button>
								<button type="button" class="btn btn-danger"
									id="confirmDeleteMultiBtn">Xóa</button>
							</div>
						</div>
					</div>
				</div>
				<!-- Modal success -->
				<div class="modal fade" id="deleteSuccessModal" tabindex="-1"
					role="dialog" aria-labelledby="deleteSuccessModalLabel"
					aria-hidden="true">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="deleteSuccessModalLabel">Xóa
									thành công</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">Phần tử đã được xóa thành công.</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">Đóng</button>
							</div>
						</div>
					</div>
				</div>
				<table class="table table-striped">
					<thead>
						<tr>
							<th ><button class="btn btn-danger" type="button"
									data-toggle="modal" data-target="#confirmDeleteMultiModal"
									data-id="${ids}">
									<i class="fas fa-trash"></i>
								</button></th>
							<th>ID</th>
							<th>Tên danh mục</th>
							<th class="d-none d-sm-table-cell">Mô tả</th>
							<th>Trạng thái</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="item" items="${categoriesPagination}">
							<tr>
								<td class="d-flex justify-content-center"><c:choose>
										<c:when test="${item.status == 'Active'}">
											<input class="mt-1" type="checkbox" name="ids"
												value="${item.id}" id="categoriesids">
										</c:when>

									</c:choose></td>
								<td>${item.id}</td>
								<td>${item.name}</td>
								<td class="d-none d-sm-table-cell">${item.description}</td>

								<td><c:choose>
										<c:when test="${item.status == 'Active'}">
											<p class="badge badge-success rounded p-2 text-light">${item.status}</p>
										</c:when>
										<c:when test="${item.status == 'Inactive'}">

											<p class="badge badge-danger rounded p-2 text-light">${item.status}</p>
										</c:when>
										<c:when test="${item.status == 'Finish'}">

											<p class="badge badge-info rounded p-2 text-light">${item.status}</p>
										</c:when>
									</c:choose></td>
								<td class="col-1 px-md-0" ><a
									href='<c:url value = "/admin/categories_management/edit_categories/${item.id}"/>'>
										<button type="button" class="btn btn-info">
											<i class="fas fa-edit"></i>
										</button>
								</a> <c:choose>
										<c:when test="${item.status == 'Active'}">
											<button type="button" class="btn btn-danger"
												data-toggle="modal" data-target="#confirmDeleteModal"
												data-id="${item.id}"
												onclick="handleDelete('../admin/categories_management/delete/')">
												<i class="fas fa-trash-alt"></i>
											</button>
										</c:when>
										<c:when test="${item.status == 'Inactive'}">

											<a
												href='<c:url value = "/admin/categories_management/undelete/${item.id}"/>'>
												<button type="button" class="btn btn-success">
													<i class="fas fa-undo"></i>
												</button>
											</a>
										</c:when>
									</c:choose></td>
							</tr>
						</c:forEach>

					</tbody>
				</table>
			</form>
			<div>
				<ul class="pagination justify-content-center">
					<c:if test="${pagination.currentPage > 1}">
						<li class="page-item"><a class="page-link"
							href="<c:url value = "/admin/categories_management?page=${pagination.currentPage - 1}"/>"><i
								class="fas fa-angle-left"></i></a></li>

					</c:if>

					<c:forEach begin="1" end="${pagination.totalPage}" var="pageNumber">
						<c:choose>
							<c:when test="${pageNumber == pagination.currentPage}">
								<li class="page-item active"><a class="page-link"
									href="<c:url value = "/admin/categories_management?page=${pageNumber}"/>">${pageNumber}</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link"
									href="<c:url value = "/admin/categories_management?page=${pageNumber}"/>">${pageNumber}</a></li>
							</c:otherwise>
						</c:choose>

					</c:forEach>


					<c:if test="${pagination.currentPage < pagination.totalPage}">
						<li class="page-item"><a class="page-link"
							href="<c:url value = "/admin/categories_management?page=${pagination.currentPage + 1}"></c:url>"><i
								class="fas fa-angle-right"></i></a></li>

					</c:if>
				</ul>
			</div>
		</div>
		<!-- Modal -->
		<!-- Modal -->
		
		<div class="modal fade" id="confirmDeleteModal" tabindex="-1"
			role="dialog" aria-labelledby="confirmDeleteModalLabel"
			aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="confirmDeleteModalLabel">Xác nhận
							xoá phần tử</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Đóng">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">Bạn có chắc chắn muốn xoá phần tử này
						không?</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Hủy</button>
						<a href="#" class="btn btn-danger" id="confirmDeleteBtn">Xoá</a>
					</div>
				</div>
			</div>
		</div>

	</div>
	<script>
		
	</script>
</body>
