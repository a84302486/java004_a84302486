<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="../WebShop/shop_index.jsp">購物平台</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse " id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                	<li><a href="../WebShop/index.html"><img src="../WebShop/images/iconmonstr-home-8-16.png"> 網站首頁</a></li>
                	<li><a href="../WebShop/cartEdit.jsp"><img src="../WebShop/images/iconmonstr-shopping-cart-3-16.png"> 購物清單</a></li>
                	<li>
                	<c:choose>
						<c:when test="${empty MemberLoginOK}">
							<a href="../WebShop/login_and_register.jsp"><span class="glyphicon glyphicon-log-in"></span> 登入註冊</a>
						</c:when>
            			<c:otherwise>
            				<li class="dropdown">
                                <a id="drop1" href="#" role="button" class="dropdown-toggle" data-toggle="dropdown">
                                <span class="glyphicon glyphicon-user"></span>我的帳戶 <b class="caret"></b></a>
                                   <ul class="dropdown-menu" role="menu" aria-labelledby="drop1">
                                      <li role="presentation"><a role="menuitem" tabindex="-1" href="../WebShop/memberManage.jsp">帳戶資料</a></li>
                                      <li role="presentation"><a role="menuitem" tabindex="-1" href="../_22_ShoppingTrackingList/SelectTracking.do">產品追蹤清單</a></li>
                                      <li role="presentation"><a role="menuitem" tabindex="-1" href="/java004/WebShop/logout.jsp">登出</a></li>     
                                   </ul>
                            </li>
						</c:otherwise>
        			</c:choose>
                    </li>
								
                 </ul>   
            </div>
        </div>
     
    </nav>
