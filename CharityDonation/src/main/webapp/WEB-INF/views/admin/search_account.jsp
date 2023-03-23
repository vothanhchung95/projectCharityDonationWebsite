<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<title>Quản lý Tài khoản</title>
<body>

	<div class="mx-5">
		<h2 class="text-center my-5">Quản lý Tài khoản</h2>

		<div class="row mb-3">
			<div class="col-md-10">
				<form class="row"
					action='<c:url value = "/admin/search_account"></c:url>'>
					<div class="col-md-4">
						<input type="text" class="form-control" placeholder="Họ và tên" name="username" value="${param.username}" />
					</div>
					<div class="col-md-4">
						<input type="text" class="form-control" placeholder="Số điện thoại"
							name="phone" value="${param.phone}"/>
					</div>

					<button class="btn btn-primary " type="submit">
						<i class="fas fa-search"></i> Tìm
					</button>
				</form>
			</div>
			<div class="col-md-2 d-flex justify-content-end">


				<button class="btn btn-success mr-2" type="submit">
					<i class="fas fa-plus"></i> Thêm
				</button>

			</div>

		</div>

		<div class="table-responsive shadow">
			<form action="<c:url value = "account_management/delete_multiple"/>">
				<table class="table table-striped">
					<thead>
						<tr>
							<th><button type="submit" class="btn btn-danger">
									<i class="fas fa-trash"></i>
								</button></th>
							<th>ID</th>
							<th>Họ và tên</th>
							<th>Email</th>
							<th>Điện thoại</th>
							<th>Địa chỉ</th>
							<th>Vai trò</th>
							<th>Trạng thái</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="item" items="${searchAccountPagination}">
							<tr>
								<td><c:choose>
										<c:when test="${item.status == 'Active'}">
											<input class="mt-1" type="checkbox" name="ids"
												value="${item.id}" id="accountids">
										</c:when>

									</c:choose></td>


								<td>${item.id}</td>
								<td>${item.username}</td>
								<td>${item.email}</td>
								<td>${item.phone}</td>
								<td>${item.address}</td>
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
										<c:when test="${item.status == 'Finish'}">

											<p class="badge badge-info rounded p-2 text-light">${item.status}</p>
										</c:when>
									</c:choose></td>
								<td class="col-1"><a
									href='<c:url value = "/admin/account_management/edit_account/${item.id}"/>'>
										<button type="button" class="btn btn-info">
											<i class="fas fa-edit"></i>
										</button>
								</a> <c:choose>
										<c:when test="${item.status == 'Active'}">
											<a
												href='<c:url value = "/admin/account_management/delete/${item.id}"/>'>
												<button type="button" class="btn btn-danger">
													<i class="fas fa-trash-alt"></i>
												</button>
											</a>
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
	</div>

	
	<script>
		$('#confirmDeleteModal').on(
				'show.bs.modal',
				function(e) {
					var id = $(e.relatedTarget).data('id');
					$('#confirmDeleteBtn').attr('href',
							'../admin/fund_management/delete/' + id);
				});
		$(function() {
			$('#confirmDeleteMultiModal')
					.on(
							'show.bs.modal',
							function(e) {
								var form = $('#deleteForm');
								var ids = form
										.find('input[name="ids"]:checked').map(
												function() {
													return $(this).val();
												}).get();
								if (ids.length === 0) {
									alert('Please select at least one item to delete.');
									e.preventDefault(); // prevent modal from showing
									return false;
								} else {
									form.attr('action', form.attr('action')
											+ '?ids=' + ids.join('&ids='));
									$(this).find('.modal-body').html(
											'Bạn có muốn xóa '
													+ ids.length + ' phần tử này không?');
								}
							});
			$('#confirmDeleteMultiModal').on('hidden.bs.modal', function(e) {
				var form = $('#deleteForm');
				form.attr('action', form.attr('action').replace(/\?.*$/, ''));
				$(this).find('form')[0].reset();
				$(this).find('.modal-body').empty();
			});
		});
	</script>
	


</body>
