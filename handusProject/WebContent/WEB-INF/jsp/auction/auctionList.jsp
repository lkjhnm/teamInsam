<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
		padding: 0;
	}
	
/* 	페이지 상단  */
	.categoryBox{
		position:relative;
		top: 0;
		left: 0;
		height: 200px;
	}
	
	#category{
		position: absolute;
		top: 100px;
		right: 50px;
	}
	#pageTitle{
		font-size: 40px;
		position: absolute;
		transform: rotate(-20deg);
		top: 0;
		left: -40px;
	}
	
/* 	리스트 목록  */
	
	.auctionList{
		display: flex;
		flex-wrap: wrap;
		justify-content: initial;
	}
	.auctionBox{
		width: 400px;
		height:400px;
		margin: 50px;
		position: relative;
		top:0;
		left:0;
	}
	
	.auctionImg{
		width: 400px;
		height:400px;
		background-color : #fff;
		position:absolute;
		top:0;
		left:0;
	}
	.auctionImg:hover{
		cursor: pointer;
	}

/* 	아이콘 및 제목 */
	.imgChange{
		position:absolute;
		bottom:-35px;
		right: 10px;
	}
	.imgChange span{
		font-size: 25px;
	}
	.imgChange span:hover{
		cursor:pointer;
	}
	.auctionTitle{
		position: absolute;
		bottom: -35px;
		left: 10px;
		font-size : 25px;
	}
	.auctionTitle a{
		color: black;
		text-decoration: none;
	}
	.auctionTitle a:hover{
		color: #ab926c;
	}
/* 	상세 정보  */
	.auctionInfo{
		position: absolute;
		bottom: 30px;
		right: 0;
		display:none;
	}
	.info{
		font-size: 25px;
	}
</style>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
	var isSub = false;
	var auctionInter;
	
	$(function(){
		$(".fa-heart").on('click',function(){
			if(!isSub){
				var result = confirm("알람 등록 하시겠습니까?");
				if(result){
					$(this).removeClass("far");
					$(this).addClass("fas");
					isSub = !isSub;
				}
			}else{
				var result = confirm("알람 등록 취소 하시겠습니까?");
				if(result){
					$(this).removeClass("fas");
					$(this).addClass("far");
					isSub = !isSub;
				}
			}
		})
		
		$(".auctionImg").on("mouseenter",function(e){
			var i = 0;
			auctionInter = setInterval(() => {
				i++;
				if(i == 4){
					$(this).next().fadeIn('slow')	
				}
			}, 100);
		})
		$(".auctionImg").on("mouseleave",function(){
			clearInterval(auctionInter)
			$(this).next().fadeOut('slow')
		})
	})
</script>
</head>
<body>
	<div class="container">
		<jsp:include page="/WEB-INF/jsp/module/sideMenu.jsp" />
		<jsp:include page="/WEB-INF/jsp/module/header.jsp"/>

		<div id="main">
			<div class='categoryBox'>
				<p id="pageTitle">Handus <br> Auction </p>
				<div id="category">
					<select>
						<option>도자 공예</option>
						<option>금속 공예</option>
						<option>유리 공예</option>
						<option>자수 공예</option>
						<option>가죽 공예</option>
						<option>목 공예</option>
					</select>
				</div>
			</div>
			<div class="auctionList">
				<c:forEach items="${auctionList }" var="item">
					<div class="auctionBox">
						<div class='imgChange'>
							<span><i class="fas fa-camera"></i></span>
							<span><i class="far fa-user"></i></span>
							<span><i class="far fa-heart"></i></span>
						</div>
						<img class='auctionImg'>
						<div class='auctionInfo'>
							<p class='info'><i>작가 ${item.m_pk_writer }</i></p>
							<p class='info'><i>현재 가격 <fmt:formatNumber value="${item.a_startPrice }" pattern="#,###원"/></i></p>
						</div>
						<div class="auctionTitle">
							<span><a href='detail?a_pk=${item.a_pk}'>${item.a_title }</a></span>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
</body>
</html>