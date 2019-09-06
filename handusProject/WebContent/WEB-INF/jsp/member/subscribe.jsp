<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Handus</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/handus.css" />
<link href="https://fonts.googleapis.com/css?family=Hepta+Slab|Nanum+Gothic|Nanum+Myeongjo|Noto+Serif+KR&display=swap" rel="stylesheet">
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<style>
	#main{
		width:70%;
		margin: 0 auto;
		padding-top: 100px;
	}
	#title{
		font-size: 50px;
		margin-bottom:100px;
		text-align:center;
	}
	.list{ 
		margin-bottom:55px;
		margin-top:55px;
		border: 1px solid #191919;
	}
	.list > div{
		border-bottom-style: dashed;
		border-bottom-color: #ebe7dd;
		display:flex;
	}
	.list > div > div{
		height:230px;
		margin-bottom:55px;
		margin-top:55px;
		margin-left: 75px;
	}
	.list img{
		width:230px;
		height:230px;
		margin: 45px;
	}
	.list_container{
		width:1325px;
		margin: 0px auto;
	}
	.item-detail{
		postion:relative;
		top:0;
		left:0;
	}
	.tab_menu{
		width: 130px;
		display:inline-block;
		font-size: 22px;
		text-align: center;
	}
	.tab_menu:hover{
		cursor:pointer;
	}
	#tab_title{
		width: 150px;
		display:inline-block;
		font-size: 30px;
	}
	.author_info>div{
		width: 500px;
		border-bottom:1px solid #191919;
		display:flex;
		justify-content: space-between;
		margin-bottom:20px;
	}
	.info-title{
		font-weight:600;
	}
	.author_btn_container{
		width: 250px;
		height:230px;
	}
	.author_btn{
		width: 120px;
		height: 25px;
		line-height:25px;
		text-align:center;
		padding: 5px;
		background-color: #191919;
		color:#fff;
		float:right;
		margin-bottom: 5px;
	}
	.author_btn:hover{
		cursor:pointer;
	}
</style>
<script>
	$(function(){
		
		$(".tab_menu").first().css("color","#ff1d43");
		$(".tab_menu").first().siblings().css("opacity","0.5")
		
		$(".tab_menu").on("click",function(){
			$(this).css({"color":"#ff1d43", "opacity":"1"})
			$(this).siblings().not("#tab_title").css({"opacity":"0.5","color":"#191919"})
		})
		
		$("#alarmBtn").on("click",function(){
			location.href="subscribe"
		})
	})
</script>
</head>
<body>
	<div class='container'>
		<jsp:include page="/WEB-INF/jsp/module/header.jsp"/>
		
		<div id="main">
			<div id="title">SUBSCRIBE</div>
			<div class='list_container'>
				<div id="tab_menu_container">
					<div class="tab_menu">AUTHOR</div>
					<div class="tab_menu">STUDIO</div>
					<div class="tab_menu">AUCTION</div>
				</div>
				<div class="list">
					<div>
						<img>
						<div class='author_info'>
							<div><span class='info-title'>NAME</span><span>자가비</span></div>
							<div><span class='info-title'>EMAIL</span><span>potato@haetae.com</span></div>
							<div><span class='info-title'>CAREER</span><span> 2013/12/23 ~ </span></div>
							<div><span class='info-title'>STUDIO</span><span>맛있는 감자공방</span></div>
							<div><span class='info-title'>STUDIO-ADDRESS</span><span>서울시 강남구 역삼동 강남대로 어딘가</span></div>
						</div>
						<div class='author_btn_container'>
							<div class='author_btn'>구독 취소</div>
							<div class='author_btn'>1:1 문의</div>
							<div class='author_btn'>SNS</div>
							<div class='author_btn'>작품 검색</div>
						</div>
					</div>
					<div>
						<img>
						<div></div>
					</div>
					<div>
						<img>
						<div></div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>