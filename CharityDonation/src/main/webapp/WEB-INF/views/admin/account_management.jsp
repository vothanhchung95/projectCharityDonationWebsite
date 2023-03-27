<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<title>Quản lý Tài khoản</title>
<body>

	<div class="mx-lg-5">
		<h2 class="text-center my-5">Quản lý Tài khoản</h2>
		<div class="row mb-3">
			<div class="col-md-12">
				<form class="row"
					action='<c:url value = "/admin/search_account"></c:url>'>
					<div class="col-md-4">
						<input type="text" class="form-control" placeholder="Họ và tên"
							name="username" />
					</div>
					<div class="col-md-4">
						<input type="text" class="form-control"
							placeholder="Số điện thoại" name="phone" />
					</div>
					<div class="col-md-2 d-flex justify-content-between">
						<button class="btn btn-primary " type="submit">
							<i class="fas fa-search"></i> Tìm
						</button>
						<a href="<c:url value = "/admin/account_management/add_account"/>">
							<button class="btn btn-success mr-2" type="button">
								<i class="fas fa-plus"></i> Thêm
							</button>
						</a>

					</div>


				</form>
			</div>

		</div>

		<div class="table-responsive shadow">
			<form action="<c:url value = "account_management/delete_multiple"/>"
				id="deleteForm">
				<div class="modal fade" id="confirmDeleteMultiAccount" tabindex="-1"
					role="dialog" aria-labelledby="confirmDeleteModalAccountLabel">
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
								<button type="submit" class="btn btn-danger"
									id="confirmDeleteMultiAccountBtn">Xóa</button>
							</div>
						</div>
					</div>
				</div>
				<!-- Modal success -->

				<table class="table table-striped">
					<thead>
						<tr>
							<th><button class="btn btn-danger" type="button"
									data-target="#confirmDeleteMultiAccount" data-toggle="modal"
									data-id="${ids}">
									<i class="fas fa-trash"></i>
								</button></th>
							<th>ID</th>
							<th>Họ và tên</th>
							<th class="d-none d-sm-table-cell">Email</th>
							<th class="d-none d-sm-table-cell">Điện thoại</th>
							<th class="d-none d-sm-table-cell">Địa chỉ</th>
							<th>Vai trò</th>
							<th>Trạng thái</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="item" items="${accountsPagination}">
							<tr>
								<td><c:choose>
										<c:when test="${item.status == 'Active'}">
											<input class="mt-1" type="checkbox" name="ids"
												value="${item.id}" id="accountids">
										</c:when>

									</c:choose></td>


								<td>${item.id}</td>
								<td>${item.username}</td>
								<td class="d-none d-sm-table-cell">${item.email}</td>
								<td class="d-none d-sm-table-cell">${item.phone}</td>
								<td class="d-none d-sm-table-cell">${item.address}</td>
								<td><c:choose>
										<c:when test="${item.role == 1}">
											<p class="text-danger font-weight-bold">Admin</p>
										</c:when>
										<c:when test="${item.role == 2}">

											<p>User</p>
										</c:when>
									</c:choose></td>
								<td><c:choose>
										<c:when test="${item.status == 'Active'}">
											<p class="badge badge-success rounded p-2 text-light">${item.status}</p>
										</c:when>
										<c:when test="${item.status == 'Inactive'}">

											<p class="badge badge-danger rounded p-2 text-light">${item.status}</p>
										</c:when>

									</c:choose></td>
								<td class="col-1 p-0"><a
									href='<c:url value = "/admin/account_management/edit_account/${item.id}"/>'>
										<button type="button" class="btn btn-info">
											<i class="fas fa-edit"></i>
										</button>
								</a> <c:choose>
										<c:when test="${item.status == 'Active'}">
											<button type="button" class="btn btn-danger"
												data-toggle="modal" data-target="#confirmDeleteModalAccount"
												data-id="${item.id}"
												onclick="handleDeleteAccount('../admin/account_management/delete/')">
												<i class="fas fa-trash-alt"></i>
											</button>
										</c:when>
										<c:when test="${item.status == 'Inactive'}">

											<a
												href='<c:url value = "/admin/account_management/undelete/${item.id}"/>'>
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
							href="<c:url value = "/admin/account_management?page=${pagination.currentPage - 1}"/>"><i
								class="fas fa-angle-left"></i></a></li>

					</c:if>

					<c:forEach begin="1" end="${pagination.totalPage}" var="pageNumber">
						<c:choose>
							<c:when test="${pageNumber == pagination.currentPage}">
								<li class="page-item active"><a class="page-link"
									href="<c:url value = "/admin/account_management?page=${pageNumber}"/>">${pageNumber}</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link"
									href="<c:url value = "/admin/account_management?page=${pageNumber}"/>">${pageNumber}</a></li>
							</c:otherwise>
						</c:choose>

					</c:forEach>


					<c:if test="${pagination.currentPage < pagination.totalPage}">
						<li class="page-item"><a class="page-link"
							href="<c:url value = "/admin/account_management?page=${pagination.currentPage + 1}"></c:url>"><i
								class="fas fa-angle-right"></i></a></li>

					</c:if>
				</ul>
			</div>
		</div>
		<!-- Modal delete-->
		<div class="modal fade" id="confirmDeleteModalAccount" tabindex="-1"
			role="dialog" aria-labelledby="confirmDeleteModalAccountLabel"
			aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="confirmDeleteModalAccountLabel">Xác
							nhận xoá phần tử</h5>
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
						<button type="submit" class="btn btn-danger"
							id="confirmDeleteAccountBtn">Xoá</button>
					</div>
				</div>
			</div>
		</div>
		<div class="modal fade" id="deleteSuccessModal" tabindex="-1"
			role="dialog" aria-labelledby="deleteSuccessModalLabel"
			aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="deleteSuccessModalLabel">Thông
							báo</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">${deleteMessage}</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Đóng</button>
					</div>
				</div>
			</div>
		</div>

	</div>

	<script>
		var deleteMessage = "${deleteMessage}";
		if (deleteMessage) {
			$('#deleteSuccessModal').modal('show');
		}
		console.log(deleteMessage);
	</script>



</body>
