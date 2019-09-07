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
	.myPage-title{
		font-size:25px;
		margin-left: 50px;
	}
	.myPage_container{
		display: flex;
		justify-content: center;
		margin: 0 auto;
	}
	.myPage_container > div{
		margin: 25px;
	}
	.information{
		width:525px;
		height:150px;
		margin:0 auto;
	}
	.information div{
		border-bottom: 1px solid #191919;
		margin-bottom: 20px;
		display:flex;
		justify-content: space-between;
	}
	.info-title{
		font-weight:600;
	}
	.info-value{
		font-weight:500;
	}
	fieldset{
		display:inline-block;
		width: 625px;
	}
	#top-container{
		width: 1325px;
		margin: 0px auto;
		margin-bottom: 150px;
	}
	.information ul{
		margin: 0;
	} 
	.information li{
		list-style: none;
		float:left;
		border-top : 1px solid #191919;
		border-left : 1px solid #191919;
		border-right : 1px solid #191919;
		padding: 1px;
	}
	#category-menu{
		position:relative;
		top:0;
		left:0;
	}
	.hide{
		display:none;
	}
	.hide:hover{
		color:#ff1d43;
		cursor:pointer;
	}
	#category-value{
		font-weight:500;
	}
	#category-value:hover{
		cursor:pointer;
		color:#ff1d43;
	}

	.count:hover{
		cursor:pointer;
		color:#ff1d43;
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
</style>
<script>
	$(function(){
		
// 		$("#category-value").on("click",function(){
// 			$("#category-menu").css({
// 				"background-color":"#191919",
// 				"color":"#fff"
// 			})
// 			$(".hide").css({
// 				"display":"inline"
// 			})
// 			$('#category-value').css("display","none")		
// 		})
		
// 		$("#category-menu").children(".info-value").not("#category-value").on("click",function(){
// 			var value = $(this).text()
// 			$("#category-value").text(value)
// 			$("#category-value").css("display","inline")
// 			$(".hide").css("display","none")
// 			$("#category-menu").css({
// 				"background-color":"inherit",
// 				"color":"#191919"
// 			})
// 			isClick = false;
// 		})
		
		$("#tab_title").next().css("color","#ff1d43");
		$("#tab_title").next().siblings().not("#tab_title").css("opacity","0.5")
		
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
			<div id="top-container">
				
				<fieldset>
					<legend class="myPage-title">PROFILE</legend>
					<div class="myPage_container">
						<div class="information">
							<div><span class="info-title">NAME </span><span class="info-value"> 최대철 </span></div>
							<div><span class="info-title">PHONE</span><span class="info-value">010-9023-8852</span></div>
							<div><span class="info-title">EMAIL </span> <span class="info-value">cdc9308@naver.com </span> </div>
							<div><span class="info-title">ADDRESS </span><span class="info-value">서울시 동대문구 답십리2동 대림아파트</span></div>
						</div>
					</div>
				</fieldset>
				<fieldset>
					<legend class="myPage-title">ALARM</legend>
					<div class="myPage_container">
						<div class="information">
<!-- 							<div id="category-menu"><span class="info-title">CATEGORY</span> -->
<!-- 									<span class='info-value' id="category-value">Author</span> -->
<!-- 									<span class="info-value hide"> Author </span> -->
<!-- 									<span class="info-value hide"> Studio </span> -->
<!-- 									<span class="info-value hide"> Auction </span> -->
<!-- 							</div> -->
							<div><span class="info-title">SUBSCRIBE</span><span class="info-value count" id="alarmBtn"> [ 6 ]</span></div>
							<div><span class="info-title">MESSAGE</span><span class="info-value count"> [ 0 ] </span></div>
						</div>
					</div>
				</fieldset>
			</div>
			<div class='list_container'>
				<div id="tab_menu_container">
					<div id="tab_title">CATEGORY</div>
					<div class="tab_menu">ITEM</div>
					<div class="tab_menu">AUCTION</div>
					<div class="tab_menu">STUDIO</div>
				</div>
				<div class="list">
					<div>
						<img>
						<div><span>제목</span></div>
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