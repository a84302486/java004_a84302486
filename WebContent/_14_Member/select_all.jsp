﻿<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"  import="java.util.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link rel='stylesheet' href='${pageContext.request.contextPath}/css/styles.css'  type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>會員</title>
</head>
<body>
<H1>會員查詢成功</h1>

<Font color='blue' >
<Table border=1>
<tr>
<c:forEach var="e" items="${mb}">
	
    	<li>${ e }</li>
</c:forEach> 
</tr>   	

</Table>
</font>


</body>
</html>