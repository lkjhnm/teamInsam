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
		width: 80%;
		height: 800px;
		margin:0 auto;
		padding-top: 100px;
	}
	#profile_container{
		width: 80%;
		margin: 0 auto;
		margin-bottom: 150px;
	}
	#profile_image{
		width: 250px;
		height: 250px;
		margin: 20px;
		margin-left: 50px;
		float:left;
	}
	#profile_info_container{
		width:650px;
		height:150px;
		margin-top:25px;
		margin-left:90px;
		float:left;
	}
	#profile_info_container>div{
		border-bottom: 1px solid #191919;
		margin-bottom: 20px;
		display:flex;
		justify-content: space-between;
	}
	.info_title{
		font-weight:600;
	}
	.info_value{
		font-weight:500;
	}
	legend{
		font-size: 32px;
		margin-left:50px;
	}
	
	.list{ 
		margin-bottom:55px;
		margin-top:55px;
		border: 1px solid #191919;
		overflow: hidden;
		position:relative;
		height: 302px;
	}
	.list > div{
		
	}
	.list > div > div{
		height:230px;
		margin-bottom:55px;
		margin-top:55px;
	}
	.list img{
		width:230px;
		height:230px;
		margin: 35px;
		border: 1px solid #191919;
	}
	.list_container{
		width: 80%;
		margin: 100px auto;
	}
	.item-detail{
		postion:relative;
		top:0;
		left:0;
	}
	.tab_menu{
		width: 130px;
		font-size: 22px;
	}
	#tab_title{
		width: 150px;
		display:inline-block;
		font-size: 30px;
	}
	#insta_container{
		width: 80%;
		height: 500px;
		margin: 150px auto;
		background-color: blue;
	}
	.slide_button{
		position:relative;
		font-size: 80px;
		top:280px;
	}
	.slide_button:hover{
		cursor:pointer;
		color: #ff1d43;
	}
	.left{
		left:-50px;
	}
	.right{
		left: 1215px;
	}	
	#auction_container{
		position:relative;
	}
	img:hover{
		cursor: pointer;
	}
	#profile_info_container>div#button_container{
		margin-top:60px;
		border-bottom:0px;
		justify-content: flex-end;
	}
	#button_container div{
		width: 150px;
		height: 30px;
		border: 1px solid #191919;
		text-align: center;
		line-height: 30px;
		margin-left: 5px;
		background-color: #191919;
		color:#fff;
	}
	#button_container div:hover{
		cursor:pointer;
	}
</style>
<script>
	$(function(){
		
		getListOfType(1,function(data){		// ITEM 데이터 가져오기	
			$("#item_container").css("width",302*data.length)
			$.each(data,function(i,item){
				
			})
			imgSlide("item_container")
		})
		
		getListOfType(2,function(data){		// AUCTION 데이터 가져오기
			$("#auction_container").css("width", 302*data.length)
			$.each(data,function(i,item){
				var img = $("<img src='${pageContext.request.contextPath }/auction/auctionImg?ai_pk="+item.AI_PK+"'>")
				$(img).on("click",function(){
					location.href="${pageContext.request.contextPath}/auction/detail?a_pk="+item.A_PK;
				})
				$("#auction_container").append(img)
			})
			imgSlide("auction_container")
		})
		
		getListOfType(3,function(data){		// STUDIO 데이터 가져오기
			$("#studio_container").css("width", 302*data.length)
			$.each(data,function(i,item){
				
			})
			imgSlide("studio_container")
		})
		
		
		$("#subBtn").on("click",function(){
			
			var result = confirm("구독 하시겠습니까?")
			
			if(result){
				$.ajax({
					url:"${pageContext.request.contextPath}/user/subscribe/1",
					type:"post",
					data:{"ms_fk": "${M_PK_WRITER}","m_pk_user": "${m_pk}"},
					dataType:"json",
					success:function(data){
						alert(data)
					}
				})
			}
		})	
		
	})	// 온로드 끝----------------
	
	function getListOfType(type,func){
		
		$.ajax({
			url:"${pageContext.request.contextPath}/author/getList/"+type,
			type:"post",
			data: {"m_pk": '${M_PK_WRITER}' },
			dataType: "json",
			success: function(data){
				func(data)
				console.log(data)
			}
		})
	}
	
	// 이미지 슬라이드 쇼
	function imgSlide(cont_name){
		var position = 0;
		var train = $("#"+cont_name)
		var count = $(train).children().length - 4;
		var left = $(train).parent().prev().prev().prev()
		var right = $(train).parent().prev().prev()
		
		if(count < 4){
			left.css("opacity","0")
			right.css("opacity","0")
		}
		
		$(left).on("click",function(){
			if(position -1 < 0){
				return;
			}
			position = position <= 0 ? 0 : position - 1;
			
			
			var left = position == 0 ? 0 : (-300)*position;

			$(train).animate({
				"left" : left
			})
		})
		
		$(right).on("click",function(){
			if(position + 1 > count){
				return;
			}
			position = position >= count ? count : position + 1;
			
			
			var left = position == count ? (-300)*count : (-300)*position;
			
			$(train).animate({
				"left" : left
			})
		})
	}
</script>
</head>
<body>
	<div class='container'>
		<jsp:include page="/WEB-INF/jsp/module/header.jsp"/>
		
		<div id="main">
			<div id="profile_container">
				<fieldset>
					<legend>PROFILE</legend>
					<img id="profile_image" src="${pageContext.request.contextPath }/author/authorImg?ap_pk=${AP_PK}">
					<div id="profile_info_container">
						<div><span class="info_title">NAME</span><span class='info_value'>${AT_NAME }</span></div>
						<div><span class="info_title">EMAIL</span><span class='info_value'>${AT_EMAIL }</span></div>
						<div><span class="info_title">STUDIO</span><span class='info_value'>${AT_STUDIO }</span></div>
						<div>
							<span class="info_title">ADDRESS</span>
							<span class='info_value'>${AT_ADDRESS }</span>
						</div>
						<div id="button_container">
							<div id="subBtn">구 독</div>
							<div>메시지</div>
						</div>
					</div>
				</fieldset>
			</div>
			
			<div class='list_container'>
				<span class='slide_button left'><i class="fas fa-caret-left"></i></span>
				<span class='slide_button right'><i class="fas fa-caret-right"></i></span>
				<div class="tab_menu" id="itemBtn">ITEM</div>
				<div class="list">
					<div id="item_container">
					</div>
				</div>

				<span class='slide_button left'><i class="fas fa-caret-left"></i></span>
				<span class='slide_button right'><i class="fas fa-caret-right"></i></span>
				<div class="tab_menu" id="auctionBtn">AUCTION</div>
				<div class="list">
					<div id="auction_container">
					</div>
				</div>

				<span class='slide_button left'><i class="fas fa-caret-left"></i></span>
				<span class='slide_button right'><i class="fas fa-caret-right"></i></span>
				<div class="tab_menu" id="studioBtn">STUDIO</div>
				<div class="list">
					<div id="studio_container">
					</div>
				</div>
			</div>
			
			<div id="insta_container">
				
			</div>
		</div>
	</div>
</body>
</html>