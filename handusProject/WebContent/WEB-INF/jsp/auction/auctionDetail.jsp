<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Handus</title>
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
	#auctionInfoBox{
		width: 90%;
		height: 800px;
		margin: 175px auto;
		position:relative;
		top: 0;
		left: 0;
	}
	#auctionImg{
		width: 850px;
		height: 850px;
 		background-color: #fff; 
		position: absolute;
		top: 0;
		left: 0;
	}
	#auctionInfo{
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
/* 	왼쪽에 빈공간을 만들고 버튼들을 오른쪽에 배치시키는 방법을 알아보다가 집에 갔음 */
	#buyButton{
		width: 300px;
		height: 50px;
		border : 1px solid #707070;
		text-align: center;
		background-color : #191919;
		color:#fff;
		display: table-cell;
		vertical-align: middle;
		margin-left: 100px;
	}
	#blank{
		width: 100px;
		height: 100%;
	}

</style>
</head>
<body>
	<div class='container'>
		<jsp:include page="/WEB-INF/jsp/module/sideMenu.jsp" />
		<jsp:include page="/WEB-INF/jsp/module/header.jsp"/>
		
		<div id="main">
			<div id="auctionInfoBox">
				<img id="auctionImg">
				<div id="auctionInfo">
					<div class='infoPosition infoBold'><span> 작품 제목 </span></div>
					<div class='infoPosition'><span> 작가 이름 </span></div>				
					<div class='infoPosition'><span>유리공예 카카오 라이언</span></div>
					<div class='infoPosition'>
						<div class='infoButton'><span> 작가 페이지 </span></div> <div class='infoButton'><span>메시지 문의</span></div>
					</div>
					<div id="button-boundary"></div>
					<div class='infoPosition infoBold'>
						<span class='smallText'> &lt; 2019/08/21 08:15 입찰 &gt;</span>
						<span> &nbsp;&nbsp;5 0, 0 0 0 원</span>
					</div>
					
					
					<div class='infoPosition'>
						<div class='infoButton'><span> 실시간 차트 </span></div>
					</div>
					<div id="button-boundary"></div>
					
					<div class='infoPosition' id="buy_sub_container">
						<div id='blank'>
						</div>
						<div>
							<div id='buyButton'>
								<span>입 찰</span>
							</div>
							<div id='subButton'>
								<span>구 독</span>
							</div>
						</div>
					</div>
					
				</div>
			</div>
		</div>
	</div>
</body>
</html>