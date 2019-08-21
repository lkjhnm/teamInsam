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
		transform: rotate(-30deg);
		top: 0;
		left: 0;
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
    background: url('kisspng-arrow-computer-icons-clip-art-5af0ef837bb035.6318196815257393955066.jpg') no-repeat 95% 50%; /* 네이티브 화살표를 커스텀 화살표로 대체 */
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
		justify-content: space-between;
	}
	
	.auctionImg{
		width: 400px;
		height:400px;
		margin: 50px;
		background-color : #fff;
		position: relative;
		top:0;
		left:0;
	}
	.auctionImg:hover{
		cursor: pointer;
	}

/* 	아이콘  */
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
	#auctionTitle{
		position: absolute;
		bottom: -35px;
		left: 10px;
		font-size : 25px;
	}
	
/* 	상세 정보  */
	.auctionInfo{
		position: absolute;
		bottom: 20px;
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
	var inter;
	
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
			inter = setInterval(() => {
				i++;
				if(i == 4){
					$(this).find(".auctionInfo").fadeIn('slow')	
				}
			}, 100);
		})
		$(".auctionImg").on("mouseleave",function(){
			clearInterval(inter)
			$(this).find(".auctionInfo").fadeOut('slow')
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
						<option>Category&hellip;</option>
						<option>도자 공예</option>
						<option>금속 공예</option>
						<option>유리 공예</option>
						<option>자수 공예</option>
						<option>가죽 공예</option>
						<option>나무 공예</option>
					</select>
				</div>
			</div>
		
			<div class="auctionList">
				<div class="auctionImg">
					<div class='imgChange'>
						<span><i class="fas fa-camera"></i></span>
						<span><i class="far fa-user"></i></span>
						<span><i class="far fa-heart"></i></span>
					</div>
					<div class='auctionInfo'>
						<p class='info'><i>작가 이름</i></p>
						<p class='info'><i>현재 입찰가격</i></p>
					</div>
					<div id="auctionTitle">
						<span>작품 제목</span>
					</div>
				</div>
				<div class="auctionImg">
					<div class='imgChange'>
						<span><i class="fas fa-camera"></i></span>
						<span><i class="far fa-user"></i></span>
						<span><i class="far fa-heart"></i></span>
					</div>
					<div class='auctionInfo'>
						<span><i>작가 이름</i></span>
						<span><i>현재 입찰가격</i></span>
					</div>
					<div id="auctionTitle">
						<span>작품 제목</span>
					</div>
				</div>
				<div class="auctionImg">
					<div class='imgChange'>
						<span><i class="fas fa-camera"></i></span>
						<span><i class="far fa-user"></i></span>
						<span><i class="far fa-heart"></i></span>
					</div>
				</div>
				<div class="auctionImg">
					<div class='imgChange'>
						<span><i class="fas fa-camera"></i></span>
						<span><i class="far fa-user"></i></span>
						<span><i class="far fa-heart"></i></span>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>