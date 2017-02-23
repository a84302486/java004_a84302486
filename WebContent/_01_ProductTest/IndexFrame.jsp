<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/asset/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/asset/css/bootstrap-theme.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/product_main.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/tab_main.css">
<script
	src="${pageContext.request.contextPath}/jQuery/jquery-1.12.4.min.js"
	type="text/JavaScript"></script>
<script src="${pageContext.request.contextPath}/js/product_new.js"
	type="text/JavaScript"></script>
<script src="${pageContext.request.contextPath}/js/tab_new.js"
	type="text/JavaScript"></script>

<title>work</title>
</head>
<body onload="getQueryData('SelectServlet');">
	<div class="tab_container">
		<div id="tab1" class="tab_content">
			<section class="container-fuild" id='showDAOJsp'>
				<h3>請選擇功能</h3>
			</section>
			<section class="container-fuild" id='showResult'></section>
		</div>
	</div>

</body>
</html>