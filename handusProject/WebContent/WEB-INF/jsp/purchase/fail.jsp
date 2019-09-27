<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Handus</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/handus.css" />
<link href="https://fonts.googleapis.com/css?family=Hepta+Slab|Nanum+Gothic|Nanum+Myeongjo|Noto+Serif+KR&display=swap" rel="stylesheet">
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<style type="text/css">
	#resultBox{
		width: 800px;
		height: 350px;
		background-color: inherit;
		position:fixed;
		top:38%;
		left:50%;
		transform: translate(-50%,-50%);
		border: 1.2px solid #191919;
	}
	#resultTitle{
		margin-top:35px;
		font-size: 30px;
		font-weight: 600;
		text-align: center;
	}
	.resultBody{
		width: 600px;
		margin: 50px auto;
		font-size: 20px;
		text-align: center;
	}
	.btnBox{
		margin: 0 auto; 
		margin-top: 30px;
	}
	.reButton{
		display: inline-block;
		margin: 10px auto;
		text-align: center;
	}
	#myCart, #goShowping{
		width: 150px;
		height: 50px;
		background-color: #191919;
		border: 1px solid #191919;
		color:#fff;
		font-size: 1em;
		margin-left: 10px;
		margin-right: 10px;
	}
	#myCart:hover, #goShowping:hover{
		cursor: pointer;
	}
</style>
<script type="text/javascript">
	$(function () {
		$("#myCart").on("click", function () {
			alert("장바구니로 이동!");
		});
		$("#goShowping").on("click", function () {
			alert("쇼핑하러 가기!");
		});
	});
</script>
</head>
<body>
	<div class='container'> <!-- 필수!! side,header는 필요에따라 추가 하면됩니다. -->
		<jsp:include page="/WEB-INF/jsp/module/header.jsp"/>
		
		<!-- 결과알림창 -->
		<div id="resultBox">
			<div id="resultTitle"> ORDER FAILED </div>
				<div class='resultBody'>
					<c:choose>
						<c:when test="${result == 'cancle'}">
							결제가 취소되었습니다. <br>
							장바구니로 이동하거나, 쇼핑을 계속 하시려면 아래의 버튼을 눌러주세요. 
						</c:when>
						<c:otherwise>
							결제에 실패했습니다. <br>
							장바구니로 이동하거나, 쇼핑을 계속 하시려면 아래의 버튼을 눌러주세요. 
						</c:otherwise>
					</c:choose>
					<div class="btnBox">
						<div class="reButton" ><button id="myCart">장바구니</button></div>
						<div class="reButton" ><button id="goShowping">쇼핑하기</button></div>
					</div>
				</div>
		</div>
		
	</div>
</body>
</html>