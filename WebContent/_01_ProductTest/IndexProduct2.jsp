<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/asset/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/asset/css/bootstrap-theme.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/product_main.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/tab_main.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/dropDown_main.css">
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
	<header class="container-fuild" id='window'>
		<h4 class="text-center">
			<strong>Window</strong>
		</h4>
	</header>

	<section class="container-fuild" id="pageTab">
		<div class="abgne_tab">
			<ul class="tabs">
				<li><a href="#tab1">產品資料表 <i><img
							src="../image/cross.svg" width="20" height="20" class="cross"></i>
				</a></li>
				<li><a href="#tab2">我是測試工具Tab <i><img
							src="../image/cross.svg" width="20" height="20" class="cross"></i>
				</a></li>
				<li><a href="#tab3">會員資料表 <i><img
							src="../image/cross.svg" width="20" height="20" class="cross"></i>
				</a></li>
			</ul>

			<div class="tab_container">
				<div id="tab1" class="tab_content">
					<div class="container-fluid">
						<br>
						<div>
							<span class="nav navbar-nav"> <input type='button'
								name='???' id='???' value="F1&#13;&#10;說明" /> <input
								type='button'
								onclick="getAction('SelectProduct.jsp','showDAOJsp');"
								name='insertName' id='selectId' value="F2&#13;&#10;查詢">
								<input type='button'
								onclick="getAction('InsertProduct.jsp','showDAOJsp');"
								name='deleteName' id='insertId' value="F3&#13;&#10;新增">
								<input type='button'
								onclick="getAction('UpdateProduct.jsp','showDAOJsp');"
								name='selectName' id='updateId' value="F4&#13;&#10;修改">
								<input type='button'
								onclick="getAction('DeleteProduct.jsp','showDAOJsp');"
								name='updateName' id='deleteId' value="F5&#13;&#10;刪除">

								<ul class="drop-down-menu">
									<li><a href="#">主選單</a>
										<ul>
											<li ><a href="#" class="DeleteProduct.jsp">產品資訊</a>
												<ul>
													<li><a href="">子功能1</a></li>
												</ul>
											</li>
											<li ><a href="#" class="../_14_Member/IndexMember.jsp">會員系統</a>
												<ul>
													<li><a href="#">子功能1</a></li>
												</ul>
											</li>
										</ul>
									</li>
								</ul>
								
							</span> <span class="nav navbar-nav navbar-right"> <input
								type='button' id='none' value="首頁"> <input type='button'
								id='none' value="上頁"> <input type='button' id='none'
								value="下頁"> <input type='button' id='none' value="尾頁">
							</span>
						</div>
					</div>

					<section class="container-fuild" id='showDAOJsp'>
						<h3>請選擇功能</h3>
						<%-- 		<jsp:include page='SelectProduct.jsp'/> --%>
					</section>

					<section class="container-fuild" id='showResult'>
						<%--        <jsp:include page='SelectProduct.jsp'/>  --%>
					</section>

					<footer class="container-fuild">
					<h2>測試文字</h2>
						<div id="result" ></div>
					</footer>

				</div>
				<div id="tab2" class="tab_content">
					<h2>測試文字2</h2>
					<p>測試文字2測試文字2測試文字2測試文字2測試文字2測試文字2測試文字2</p>
				</div>
				<div id="tab3" class="tab_content">
					<h2>會員資料表</h2>
					<p>還沒放連結還沒放連結還沒放連結還沒放連結還沒放連結還沒放連結</p>
					<%-- 					<jsp:include page='../_14_Member/IndexMember.jsp'/>  --%>
				</div>
			</div>
		</div>
	</section>
</body>
</html>