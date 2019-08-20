<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Handus Auction</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/handus.css" />
<style>
	#main{
		width:80%;
		height: 100%;
		margin: 0 auto;
		background-color: red;
	}
</style>
</head>
<body>
	<div class="container">
		<jsp:include page="/WEB-INF/jsp/module/sideMenu.jsp" />
		<jsp:include page="/WEB-INF/jsp/module/header.jsp"/>
		
		<div id="main">
			
		</div>
	</div>
</body>
</html>