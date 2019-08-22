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
	#buyButton{
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
		display:inline-block;
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
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
	$(function(){
		var formatDate = ${remainTime}
		
		setTimeout(() => {
			setInterval(() => {
				$("#auctionTime").text(msToTime(formatDate))
				formatDate = formatDate - 1000;			
			}, 1000)	
		}, 600);
		
	})
	
	function msToTime(duration) {
        var milliseconds = parseInt((duration%1000)/100)
            , seconds = parseInt((duration/1000)%60)
            , minutes = parseInt((duration/(1000*60))%60)
            , hours = parseInt((duration/(1000*60*60))%24)
			, days = parseInt((duration/(1000*60*60*24))%30);
        
        hours = (hours < 10) ? "0" + hours : hours;
        minutes = (minutes < 10) ? "0" + minutes : minutes;
        seconds = (seconds < 10) ? "0" + seconds : seconds;

        return days +"일 "+ hours + ":" + minutes + ":" + seconds;
    }
</script>
</head>
<body>
	<div class='container'>
		<jsp:include page="/WEB-INF/jsp/module/sideMenu.jsp" />
		<jsp:include page="/WEB-INF/jsp/module/header.jsp"/>
		sdsd
		<div id="main">
			<div id="auctionInfoBox">
				<img id="auctionImg">
				<div id="auctionInfo">
					<div class='infoPosition infoBold'><span> 작품 제목 </span></div>
					<div class='infoPosition'><span> 작가 이름 </span></div>				
					<div class='infoPosition'>
						<div class='infoButton'><span> 작가 페이지 </span></div> <div class='infoButton'><span>메시지 문의</span></div>
					</div>
					<div id="button-boundary"></div>
					
					
					<div class='infoPosition'>
						<div class='infoButton'><span> 실시간 차트 </span></div>
					</div>
					
					<div id="button-boundary"></div>
					<div class='infoPosition'><span> 유리공예 </span></div>
					<div class='infoPosition'><span> 카카오 프렌즈와 콜라보하여 만든  라이언 유리공예 </span></div>
					<div class='infoPosition iconContainer'>
						<div><img id='icon' src='${pageContext.request.contextPath }/img/hand-right.svg'>
						<span> 조회수 999 명 </span></div>
						<div><img id='icon' src='${pageContext.request.contextPath }/img/brush.svg'>
						<span> 리뷰수 77 개 </span></div>
						<div><img id='icon' src='${pageContext.request.contextPath }/img/like.svg'>
						<span> 구독자 650 명 </span></div>
					</div>
					<div id="button-boundary"></div>
					<div class='infoPosition'><span> 남은 시간 </span><span id="auctionTime"> ${remainTimeText}</span></div>
					<div class='infoPosition infoBold'>
						<span class='smallText'> &lt; 2019/08/21 08:15 입찰 &gt;</span>
						<span id='price'> &nbsp;&nbsp;5 0, 0 0 0 원</span>
					</div>
					
					<div id="button-boundary"></div>
					
					<div class='infoPosition' id="buy_sub_container">
						<div id='buttonContainer'>
							<div id='buyButton'>
								<span>입 찰</span>
							</div>
							<div id='subButton'>
								<span style='font-size:13px'><i class="far fa-heart"></i></span><span> 구 독 </span>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div id="detailContainer">
				<div id="detailBox">
					<div class='infoBold'><span>ITEM DETAIL</span></div>
					<ul>
						<li>코디의 주역이 될 한발.</li>
						<li>· 치마도 바지도 일치하는 레이디 아름다움 펌프스.</li>
						<li>· 다리를 단단히 잡아주는 인상적인 3 개의 스트랩</li>
						<li>· 6.5cm 힐
					</ul>
				</div>
				<div id="specBox">
					<div class='infoBold'><span>ITEM SPEC</span></div>
					<div class='specPosition'><div class='specType'><span> c o u n t r y </span></div><span> MADE IN KOREA</span></div>
					<div class='specPosition'><div class='specType'><span> m a t e r i a l </span></div><span> GLASS </span></div>
					<div class='specPosition'><div class='specType'><span> c o l o r </span></div><span> ASH BROWN</span></div>
					<div class='specPosition'><div class='specType'><span> s i z e </span></div><span> 200 * 150 * 150 (cm)</span></div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>