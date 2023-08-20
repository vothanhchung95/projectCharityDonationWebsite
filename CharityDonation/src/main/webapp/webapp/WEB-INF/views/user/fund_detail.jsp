<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${fund.name}</title>
<style>
</style>
</head>
<body onscroll="scrollHandler()">
	<div class="container">
		<div class="row">
			<div class="col-lg-8">
				<h3 class="my-4">${fund.name}</h3>
				<h5 class="text-muted mb-4">${fund.description}</h5>

				${fund.content}
			</div>
			<div class="col-lg-4 pl-lg-5 position-relative ">
				<div class="card-move" style="position: sticky;">
					<c:if test="${fund.status == 'Active'}">
						<div class="card shadow-sm my-4 ">
							<div class="card-body">
								<h5 class="card-title pb-2 font-weight-bold">Thông tin
									quyên góp</h5>
								<h6 class="card-subtitle mb-2 pb-2 text-muted">${fund.name}</h6>
								<p class="card-subtitle mb-2 pb-2 font-italic text-muted">${fund.foundationName}</p>
								<form action="<c:url value="/user/donation" />" method="post">
									<div class="mt-3">
										<p>Hãy nhập số tiền và lời nhắn bạn muốn gửi tới chương
											trình nhé!</p>

										<input type="number" class="form-control"
											placeholder="Số tiền" name="amount" />
										<textarea rows="2" class="form-control mt-2"
											placeholder="Lời nhắn" name="message"></textarea>
										<input type="hidden" name="fundId" value="${fund.id}">



									</div>
									<div class="mt-3">
										<span class="font-weight-bold"> <fmt:formatNumber
												type="currency" value="${fund.currentAmount}" /></span> /<span
											class="text-secondary"><fmt:formatNumber
												type="currency" value="${fund.expectedAmount}" /></span>
									</div>
									<div class="mt-3  flex  rounded-lg "
										style="background-color: #ced4da">
										<div class="rounded-lg bg-success" aria-valuemin="0"
											aria-valuemax="100"
											style="width: ${(fund.currentAmount / fund.expectedAmount) * 100}%; height: 6px"></div>
									</div>

									<div class="row mx-0 mt-3 justify-content-between">
										<button class="btn btn-outline-success  align-items-end"
											type="submit">Quyên góp</button>
										<p class="mb-0 text-secondary">
											Đạt được <br> <span class="text-dark font-weight-bold"><fmt:formatNumber
													value="${(fund.currentAmount / fund.expectedAmount)}"
													type="percent" maxFractionDigits="1" /></span>
										</p>
									</div>
								</form>
							</div>
						</div>
					</c:if>

					<c:if test="${fund.status == 'Finish'}">
						<div class="card shadow-sm my-4 ">
							<div class="card-body">
								<h5 class="card-title pb-2 font-weight-bold">Thông tin Quỹ</h5>
								<h6 class="card-subtitle mb-2 pb-2 text-muted">${fund.name}</h6>
								<p class="card-subtitle mb-2 pb-2 font-italic text-muted">${fund.foundationName}</p>

								<div class="mt-3">
									<p>Đã kết thúc quá trình gây quỹ, xin cảm ơn tấm lòng của
										các nhà hảo tâm</p>

								</div>
								<div class="mt-3">
									<span class="font-weight-bold"> <fmt:formatNumber
											type="currency" value="${fund.currentAmount}" /></span> /<span
										class="text-secondary"><fmt:formatNumber
											type="currency" value="${fund.expectedAmount}" /></span>
								</div>
								<div class="mt-3  flex  rounded-lg "
									style="background-color: #ced4da">
									<div class="rounded-lg bg-info" 
										style="width: ${(fund.currentAmount / fund.expectedAmount) <= 1 ? (fund.currentAmount / fund.expectedAmount) * 100 : 100}%; height: 6px"></div>
								</div>

								<div class="row mx-0 mt-3 justify-content-center">
									<a href='<c:url value = "/"/>'>
										<button class="btn btn-outline-success  align-items-end"
											type="button">Xem các quỹ khác của chúng tôi</button>
									</a>
								</div>

							</div>
						</div>
					</c:if>
				</div>
			</div>
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

		const card = document.querySelector('.card-move');
		const cardTop = card.offsetTop; // Lấy giá trị ban đầu của top
		window.addEventListener('scroll', function() {
			const scrollTop = window.scrollY; // Lấy vị trí hiện tại của cuộn chuột
			const newTop = Math.max(cardTop - scrollTop, 180); // Tính toán lại giá trị của top
			card.style.top = newTop + 'px'; // Cập nhật giá trị của top
		});
	</script>


</body>
</html>