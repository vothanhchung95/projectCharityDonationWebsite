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
<body>
	<%@ include file="/WEB-INF/views/layouts/admin/header.jsp"%>
	<div class="">



		<decorator:body />


	</div>
	<%@ include file="/WEB-INF/views/layouts/user/footer.jsp"%>


</body>
</html>