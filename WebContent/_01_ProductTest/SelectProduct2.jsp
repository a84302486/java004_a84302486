<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link rel='stylesheet' href='${pageContext.request.contextPath}/css/styles.css' type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>

<script type="text/JavaScript">
  
	 function getQueryAction(servlet){ 	
	   	var xhr = new XMLHttpRequest();
	   	xhr.open("POST", servlet, true);
	   	xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	   	xhr.send();
		}
	 
</script>

<title>MVC</title>
<body >
<CENTER>
	<font size="4" color="red" face="Tahoma"> 	
		<Form>		 
			<div>			 			
				列出所有產品資料:<input type="submit" value="開始查詢" onclick="getQueryAction('SelectFindAll2');">
			</div>			
		</Form>
			
		<Form  >
			<div>
				用序號查詢:<input type="text" name="productId"  size="20" placeholder="不輸入將搜尋全部">
				<input type="submit" value="開始查詢" onclick="getQueryAction('SelectFindByPrimaryKey');">
			</div>			
		</Form>

	</font>
	</CENTER>
</body>
</html>