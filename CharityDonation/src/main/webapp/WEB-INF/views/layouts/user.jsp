<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator"
	prefix="decorator"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title><decorator:title default="Master-Layout" /></title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<!-- Bootstrap styles -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
	integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />

<link href="https://fonts.googleapis.com/css?family=Open+Sans"
	rel="stylesheet">
<!-- Import jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- Import Popper.js -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.9.3/umd/popper.min.js"></script>

<!-- Import Bootstrap JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src='<c:url  value = "/js/admin-delete-element.js"/>'></script>
<script src='<c:url  value = "/js/admin-delete-account.js"/>'></script>
<style>
body {
	font-family: 'Open Sans', sans-serif;
}
</style>
</head>
<body style="background-color: #ebfbee">
	<!-- 
	Upper Header Section 
-->

	<!--
Lower Header Section 
--><%@ include file="/WEB-INF/views/layouts/user/header.jsp"%>
	<div>
		<decorator:body />
	</div>
	<%@ include file="/WEB-INF/views/layouts/user/footer.jsp"%>

	<a href="#" class="gotop"><i class="icon-double-angle-up"></i></a>
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="<c:url value = "/assets/user/js/jquery.js"/>"></script>
	<script src="<c:url value = "/assets/user/js/bootstrap.min.js"/>"></script>
	<script
		src="<c:url value = "/assets/user/js/jquery.easing-1.3.min.js"/>"></script>
	<script
		src="<c:url value = "/assets/user/js/jquery.scrollTo-1.4.3.1-min.js"/>"></script>
	<script src="<c:url value = "/assets/user/js/shop.js"/>"></script>
</body>
</html>