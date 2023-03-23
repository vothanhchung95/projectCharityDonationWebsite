<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>

<title>Thêm Qũy quyên góp</title>
<body>

	<div class="mx-5">
		<h2 class="text-center my-5">Thêm Qũy quyên góp</h2>

		<div id="content">

			<c:url value="/admin/insert_fund" var="insertFund"></c:url>
			<form:form action="${insertFund}" class="create-form" method="POST"
				modelAttribute="fund" accept-charset="UTF-8">


				<div class="form-group">
					<label class="form-label">Name</label>
					<form:input path="name" value="${name}" class="form-control" />
					<span class="form-message text-danger"><form:errors
							path="name" /></span>

				</div>


				<div class="form-group">
					<label class="form-label">Description</label>
					<form:textarea id="fund-description" rows="3" class="form-control"
						path="description" />
					<span class="form-message text-danger"><form:errors
							path="description" /></span>
				</div>
				<div class="form-group">
					<label class="form-label">Content</label>
					<form:textarea rows="5" id="fund-content" path="content"
						class="ckeditor form-control" />
					<span class="form-message text-danger"><form:errors
							path="content" /></span>
				</div>
				<div class="form-group">
					<label class="form-label">Image URL</label>
					<form:input id="fund-image-url" type="text" class="form-control"
						path="imgUrl" />
					<span class="form-message text-danger"><form:errors
							path="imgUrl" /></span>
				</div>
				<div class="form-group">
					<label class="form-label">Expected Amount</label>
					<form:input id="fund-expected-result" class="form-control"
						path="expectedAmount" type="number" />
					<span class="form-message text-danger"><form:errors
							path="expectedAmount" /></span>
				</div>
				<div class="form-group">
					<label class="form-label">Status</label>
					<form:select id="fund-status" class="form-select" path="status"
						defaultValue="${fund.status}">
						<c:forEach var="status" items="${statusList}">

							<form:option value="${status.name}">${status.name}</form:option>

						</c:forEach>

					</form:select>
					<span class="form-message"></span>
				</div>
				<div class="form-group ">
					<label class="form-label">End Date</label>
					<form:input id="fund-end-date" type="date" class="form-control"
						path="endDate" name="pickup_date" required="true" />
					<span class="form-message text-danger"><form:errors
							path="endDate" /></span>
				</div>


				<div class="form-group">
					<label class="form-label">Category</label>
					<form:select id="fund-category" class="form-select"
						path="categoryName" defaultValue="${fund.categoryName}">

						<c:forEach var="category" items="${categoryList}">
							<form:option value="${category.name}">${category.name}</form:option>
						</c:forEach>
					</form:select>
					<span class="form-message"></span>
				</div>
				<div class="form-group">
					<label class="form-label">Foundation</label>
					<form:select id="fund-foundation" class="form-select"
						path="foundationName" defaultValue="${fund.foundationName}">

						<c:forEach var="foundation" items="${foundationList}">

							<form:option value="${foundation.name}">${foundation.name} 
							</form:option>

						</c:forEach>

					</form:select>
					<span class="form-message"></span>
				</div>

				<div class="form-group">
					<button id="btn-Save" type="submit" class="btn btn-success mx-1">
						<i class="fa-solid fa-floppy-disk"></i> Save
					</button>

					<a href="<c:url value = "/admin/fund_management"/>">
						<button type="button" class="btn btn-primary mx-1">Cancel</button>
					</a>

					<script>
						function goBack() {
							window.history.back();
						}
					</script>
				</div>

			</form:form>


		</div>
	</div>
	<script src="https://cdn.ckeditor.com/4.19.1/full/ckeditor.js"></script>

	<script type="text/javascript">
		const toDay = new Date();
		const dateString = toDay.toISOString().slice(0, 10);
		const dateInput = document.getElementById('fund-end-date');
		dateInput.defaultValue = dateString;
		dateInput.min = dateString;
	</script>
	<script>
		CKEDITOR.config.removePlugins = 'exportpdf';
	</script>


</body>
