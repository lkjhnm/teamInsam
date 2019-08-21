<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Handus</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/handus.css" />
<style>
	
	#main{
		width:80%;
		margin: 0 auto;
/* 		background-color: red; */
	}
	#auctionInfo{
		width: 90%;
		height: 800px;
		margin: 0 auto;
/* 		background-color: blue; */
		position:relative;
		top: 0;
		left: 0;
	}
	#auctionImg{
		width: 700px;
		height: 700px;
		background-color: #fff;
		position: absolute;
		top: 0;
		left: 0;
	}
</style>
</head>
<body>
	<div class='container'>
		<jsp:include page="/WEB-INF/jsp/module/sideMenu.jsp" />
		<jsp:include page="/WEB-INF/jsp/module/header.jsp"/>
		
		<div id="main">
			<div id="auctionInfo">
				<img id="auctionImg">
			</div>
		</div>
	</div>
</body>
</html>