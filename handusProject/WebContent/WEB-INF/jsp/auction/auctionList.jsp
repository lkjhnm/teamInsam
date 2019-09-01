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
<link href="https://fonts.googleapis.com/css?family=Hepta+Slab|Nanum+Gothic|Nanum+Myeongjo|Noto+Serif+KR&display=swap" rel="stylesheet">
<style>
	body{
		font-family: 'Hepta Slab', serif;
	}
	#auctionListContainer{
		width:80%;
		font-family: 'Nanum Myeongjo', serif;
	}
	.container{
		display:flex;
		justify-content: flex-start;
	}
/* 	페이지 상단  */
	.sortBox{
		position:relative;
		top: 0;
		left: 0;
		height: 200px;
	}
	
	#sort{
		position: absolute;
		top: 100px;
		right: 185px;
	}
	#pageTitle{
		font-size: 40px;
		position: absolute;
		top: 70px;
		left: 55px;
		font-family: 'Hepta Slab', serif;
	}
	/* select */
	select {
    -webkit-appearance: none;  /* 네이티브 외형 감추기 */
    -moz-appearance: none;
    appearance: none;
/*     background: url(이미지 경로) no-repeat 95% 50%;  /* 화살표 모양의 이미지 */ 
	
	width: 170px; /* 원하는 너비설정 */
    padding: .8em .5em; /* 여백으로 높이 설정 */
    font-family: inherit;  /* 폰트 상속 */
   								/* 네이티브 화살표를 커스텀 화살표로 대체 */
    border: 1px solid #999;
    -webkit-appearance: none; /* 네이티브 외형 감추기 */
    -moz-appearance: none;
    appearance: none;
	
	}
	/* IE 10, 11의 네이티브 화살표 숨기기 */
	select::-ms-expand {
	    display: none;
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
		margin: 50px 0 50px 50px;
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
		opacity:0;
	}
	.info{
		font-size: 25px;
	}
	
/* 	사이드 카테고리 */
	#sideCategoryContainer{
		width: 20%;
		height:1080px;
		margin-top:250px;
		color:#544a4a;
	}
	#sideGrid{
		width: 250px;
		height: 100%;
		margin: 0 auto;
	}
	.categoryTitle{
		font-size: 16px;
		font-weight: 600;
		margin: 102px 0 45px 0;
	}
	#category ul{
		list-style: none;
		padding-left: 20px;
	}
	#category ul li{
		margin-bottom: 15px;
		font-size:15px;
	}
	#category ul li a{
		color: inherit;
		text-decoration: none;
	}
</style>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
	var isSub = false;
	var auctionInter;
	
	$(function(){
		console.log( "${sessionScope}")
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
					$(this).next().css('display','block')
					$(this).next().animate({
						opacity : '1.0'
					},600)	
				}
			}, 100);
		})
		
		$(".auctionImg").on("mouseleave",function(){
			clearInterval(auctionInter)
			$(this).next().animate({
				opacity : '0'
			},600,function(){
				$(this).css('display','none')				
			})
		})
		
		$("#category ul li a").on("mouseover",function(){
			$(this).css('color','#ff1d43')
		})
		$("#category ul li a").on("mouseleave",function(){
			$(this).css('color','#544a4a')
		})
	})
</script>
</head>
<body>
	<div class="container">
<%-- 		<jsp:include page="/WEB-INF/jsp/module/sideMenu.jsp" /> --%>
		<jsp:include page="/WEB-INF/jsp/module/header.jsp"/>
		<div id="sideCategoryContainer">
			<div id="sideGrid">
				<div id="category">
					<div class="categoryTitle"><span> C A T E G O R Y ----- </span></div>
					<ul>
						<li><a href="#"> A L L</a> </li>
						<li><a href="#"> C E R A M I C S </a></li>
						<li><a href="#"> M E T A L </a></li>
						<li><a href="#"> G L A S S </a></li>
						<li><a href="#"> E M B R O I D E R Y </a></li>
						<li><a href="#"> L E A T H E R </a></li>
						<li><a href="#"> W O O D </a></li>
					</ul>
				</div>
			</div>
		</div>
		<div id="auctionListContainer">
			<div class='sortBox'>
				<p id="pageTitle"> Auction </p>
				<div id="sort">
					<select>
						<option>Sort&hellip;</option>
						<option>최신순</option>
						<option>인기순</option>
						<option>별점순</option>
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