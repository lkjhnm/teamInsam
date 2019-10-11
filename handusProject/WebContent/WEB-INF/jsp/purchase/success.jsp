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
		width: 900px;
/* 		height: 350px; */
		background-color: inherit;
		position:fixed;
		top:38%;
		left:50%;
		transform: translate(-50%,-50%);
		margin-top: 70px;
	}
	#resultTitle{
/* 		margin-top:35px; */
/* 		font-size: 30px; */
/* 		font-weight: 600; */
/* 		text-align: center; */
		text-align: center;
		font-size: 40px;
		margin-top : 60px;
		margin-bottom: 50px;
	}
	.resultBody{
		width: 800px;
		margin: 50px auto;
		font-size: 17px;
		text-align: center;
		border: 1px solid black;
		padding: 20px;
	}
	.resultBody-section{
		padding: 20px;
		margin-top: 30px;
		margin-bottom: 30px;
		text-align: left;
	}
	.resultSub{
		font-size: 19px;
		margin: 0 auto; 
		margin-bottom: 20px; 
		border-bottom: 1px solid black;
		padding-bottom: 3px;
	}
	.result-left{
		float: left;
	}
	.result-right{
		float: right;
	}
	.btnBox{
		margin: 0 auto; 
		margin-top: 50px;
		margin-bottom: 20px;
/* 		float: none; */
		clear: both;
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
			alert("마이페이지 이동!");
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
		<div id="resultTitle"> O R D E R &nbsp;&nbsp; C O M P L E T E </div>
			<div class='resultBody'>
				<div class='resultBody-section result-left'>
					<div class='resultSub'>주문 정보</div>
					<div>주문자: ${orderDetail.M_NAME }님</div>
					<div>주문번호: ${orderDetail.NUM }</div>
					<div>주문일자: ${orderDetail.ORDER_DATE }</div>
					<div>총 상품 갯수: ${orderDetail.COUNT }개</div>
				</div>
				<div class='resultBody-section result-right'>
					<div class="resultSub">결제 정보</div>
					<div>결제금액: ${orderDetail.PRICE }원</div>
					<div>결제수단: ${orderDetail.PAY_METHOD }</div>
					<div>결제일자: ${orderDetail.APPROVE_DATE }</div>
				</div>
				
			<div class="btnBox">
				<div class="reButton" ><button id="myCart">마이페이지</button></div>
				<div class="reButton" ><button id="goShowping">쇼핑하기</button></div>
			</div>
			</div>
		</div>
	</div>
</body>
</html>