<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${categories.name}</title>
</head>
<body>
	<div class="container">

		<h3 class="my-4">${categories.name}</h3>
		<h5 class="text-muted mb-4">${categories.description}</h5>
		<img class="img-fluid" alt=""
			src='<c:url value="/images/category-${categories.id}.jpg" />' />

		<c:if test="${funds.size() > 0}">
			<h3 class="my-5 text-center text-success">Các quỹ đang thực hiện</h3>
		</c:if>
		<div class="row row-cols-lg-3 row-cols-md-2 row-cols-1 d-flex">
			<c:forEach var="item" items="${funds}">
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
			</c:forEach>

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
</html>