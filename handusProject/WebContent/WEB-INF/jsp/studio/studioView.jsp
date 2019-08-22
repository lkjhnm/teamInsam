<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Handus Studio:Detail</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/handus.css" />
<link href="https://fonts.googleapis.com/css?family=Hepta+Slab|Nanum+Gothic|Nanum+Myeongjo|Noto+Serif+KR&display=swap" rel="stylesheet">
<style>
	body{
		font-family: 'Hepta Slab', serif;
	}
	
	#main{
		width:80%;
		margin: 0 auto;
		font-family: 'Nanum Myeongjo', serif;
	}
	#studioInfoBox{
		width: 90%;
		height: 800px;
		margin: 175px auto;
		position:relative;
		top: 0;
		left: 0;
	}
	#studioImg{
		width: 850px;
		height: 850px;
 		background-color: #fff; 
		position: absolute;
		top: 0;
		left: 0;
	}
	#studioInfo{
		width: 500px;
		height: 850px;
		position: absolute;
		top:0;
		right:0;
		color: #544a4a;
		font-size: 18px;
	}
	.infoBold{
		font-weight: 600;
	}
	.infoPosition{
		margin: 25px 0 0 60px;
	}
	.smallText{
		font-size: 12px;
	}
	#writers{
		margin-top: 60px;
		margin-bottom: 60px;
	}
	#writers span i{
		margin-top: 20px;
		font-size: 50px;
	}
	#button-boundary{
		height: 10px;
		margin: 20px;
	}
	.infoButton{
		display: inline-block;
		width: 125px;
		height: 20px;
		padding:5px;
		text-align:center;
		border: 1px solid #707070;
	}
	.personnel{
		display: inline-block;
		width: 200px;
		height: 20px;
		padding:5px;
		text-align:center;
		border: 1px solid #707070;
	}
	#icon{
		width:30px;
		height:15px;
	}
	.iconContainer div{
		margin-top: 15px;
	}
	#price{
		font-size: 24px;
	}
	#buyButton, #cartButton {
		width: 300px;
		height: 45px;
		border : 1px solid #707070;
		text-align: center;
		background-color : #191919;
		color:#fff;
		display: table-cell;
		vertical-align: middle;
		margin-left: 100px;
	}
	#subButton{
		width:300px;
		height: 30px;
		border: 1px solid #707070;
		margin-top: 5px;
		text-align: center;
		line-height: 30px;
	}

	#blank{
		width: 100px;
		height: 100%;
		display:inline-block;
	}
	#buttonContainer{
/* 		display:inline-block; */
	}
	
/* 	아이템 디테일 및 스펙  */
	#detailContainer{
		height: 400px;
		display:flex;
		justify-content: initial;
	}
	#detailBox{
		margin-left: 200px;
		width: 400px;
		height: 280px;
	}
	#detailBox ul {
		margin-top: 20px;
		list-style: none;
		padding :0;
	}
	#detailBox ul li{
		margin-top:10px;
	}
	#specBox{
		margin-left: 100px;
		width: 500px;
		height: 280px;
	}
	.specPosition{
		width:100%;
		margin-top:15px;
		border-bottom: 1px solid #707070;
	}
	.specType{
		display:inline-block;
		width: 150px;
	}
	#auctionTime{
		margin-left: 15px;
		font-weight:600;
		font-size: 19px;
	}
</style>
</head>
<body>
	<div class='container'>
		<jsp:include page="/WEB-INF/jsp/module/sideMenu.jsp" />
		<jsp:include page="/WEB-INF/jsp/module/header.jsp"/>
		
		<div id="main">
			<div id="studioInfoBox">
				<img id="studioImg">
				<div id="studioInfo">
					<div class='infoPosition infoBold'><span>${studio.s_title }</span></div>
					<div class='infoPosition'><span>${member.m_name }</span></div>				
					<div class='infoPosition'>
						<div class='infoButton'><span> $작가 페이지 </span></div> <div class='infoButton'><span>메시지 문의</span></div>
					</div>
<!-- 					<div id="button-boundary"></div> -->
					
					<div class='infoPosition'>
						<div class='personnel'><span> $현재인원 / $최대인원 </span></div>
					</div>
					
					<div id="button-boundary"></div>
					<div class='infoPosition'><span>${studio.s_category }카테고리</span></div>
					<div class='infoPosition'><span>${studio.s_comment } </span></div>
					<div class='infoPosition iconContainer'>
						<div><img id='icon' src='${pageContext.request.contextPath }/img/hand-right.svg'>
						<span> 조회수 ${studio.s_read_count } 명 </span></div>
						<div><img id='icon' src='${pageContext.request.contextPath }/img/brush.svg'>
						<span> 리뷰수 77 개 </span></div>
						<div><img id='icon' src='${pageContext.request.contextPath }/img/like.svg'>
						<span> 구독자 650 명 </span></div>
					</div>
					<div id="button-boundary"></div>
					<div class='infoPosition infoBold'>
<!-- 						<span class='smallText'> &lt; 2019/08/21 08:15 입찰 &gt;</span> -->
						<span id='price'> &nbsp;&nbsp;5 0, 0 0 0 원</span>
					</div>
					
					<div id="button-boundary"></div>
					
					<div class='infoPosition' id="buy_sub_container">
						<div id='buttonContainer'>
							<div id='cartButton'>
								<span><a> My Cart </a></span>
							</div>
							<div id='buyButton'>
								<span><a> Reservation </a></span>
							</div>
							<div id='subButton'>
								<span style='font-size:13px'><i class="far fa-heart"></i></span><span> subscribe </span>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 설명, 규격 -->
			<div id="detailContainer">
				<div id="detailBox">
					<div class='infoBold'><span>ITEM DETAIL</span></div>
						<p>${studio.s_content }</p>
<!-- 					<ul> -->
<!-- 						<li>코디의 주역이 될 한발.</li> -->
<!-- 						<li>· 치마도 바지도 일치하는 레이디 아름다움 펌프스.</li> -->
<!-- 						<li>· 다리를 단단히 잡아주는 인상적인 3 개의 스트랩</li> -->
<!-- 						<li>· 6.5cm 힐 -->
<!-- 					</ul> -->
				</div>
				<div id="specBox">
					<div class='infoBold'><span>STUDIO LOCATION</span></div>
					<div class='specPosition'><div class='specType'><span> s t u d i o </span></div><span> HAND STUDIO </span></div>
					<div class='specPosition'><div class='specType'><span> a d d r e s s </span></div><span> ${studio.s_location } </span></div>
					<div class='specPosition'><div class='specType'><span> l o c a t i o n </span></div><span> $지도 API </span></div>
				</div>
			</div>
			<!-- 리뷰 -->
		</div>
	</div>
</body>
</html>