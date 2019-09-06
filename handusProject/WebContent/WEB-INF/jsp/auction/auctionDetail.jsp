<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	#thumnailContainer{
		width: 92px;
		height: 425px;
		position:absolute;
		left: 805px;
		top: 110px;
		z-index: 103;
		overflow:hidden;
	}
	.thumnail{
		width: 90px;
		height: 90px;
		background-color: #fff;
		margin-top: 10px;
		border: 1px solid #e3e2de;
	}
	#thumbnail_train{
		position:relative;
		top:0;
		left:0;
	}
	#auctionInfo{
		width: 500px;
		height: 850px;
		position: absolute;
		top:0;
		left:30px;
		color: #544a4a;
		font-size: 18px;
		background-color:#FBF9F6;
	}
	.auctionInfoContainer{
		width: 850px;
		height: 850px;
		background-color:#FBF9F6;
		position: absolute;
		top:0;
		left:850px;
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
	.iconContainer{
		height: 100px;
	}
	.iconContainer div{
		margin-top: 15px;
	}
	#price{
		font-size: 24px;
	}
	.button{
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
	
	#buyButton:hover{
		cursor:pointer;
	}
	#subButton:hover{
		cursor:pointer;
	}
/* 	아이템 디테일 및 스펙  */
	.currentPrice{
		
	}
	#auctionInfoPrice{
		letter-spacing: 5px;
	}
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
		margin-left: 250px;
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
/* 	차트 */
	#chartContainer{
		width:850px;
		height:850px;
		position:absolute;
		top:0;
		left:0;
		display:none;
	}
	#auctionChart{
		width: 600px;
		height:600px;
		position:absolute;
		top:50%;
		left:50%;
		transform:translate(-50%, -50%);
		z-index: 103;
	}
	.infoButton:hover{
		cursor:pointer;
		color:#ff1d43;
		border-color:#ff1d43;
	}
/* 	모달 */
	#biddingModal{
		width:600px;
		height:200px;
		background-color: #EBE9E5;
		position:absolute;
		top: 525px;
		left:1500px;
		transform:translate(-50%, -50%);
		box-shadow : rgba(0,0,0,0.5) 0 0 0 9999px;
		border: 2px solid #191919;
	}
	#modalTitle{
		font-size: 18px;
		border-bottom: 1px solid #707070;
		padding: 10px 10px 10px 30px;
	}
	#modalContainer{
		width:100%;
		height: 1000px;
		position :fixed;
		top:0;
		left:0;
		display:none;
		z-index:150;
	}
	.modalPosition{
		width: 100%;
		margin: 10px;
	}
	#modalBody{
		width: 90%;
		height: 125px;
		margin: 0 auto;
		border-bottom: 1px solid #707070;
	}
	#modalClose{
		position: absolute;
		top:5px;
		right:10px;
	}
	#modalClose:hover{
		cursor:pointer;
	}
	#bidButton{
		width: 200px;
		height: 35px;
		position: absolute;
		border: 1px solid #707070;
		background-color: #191919;
		color: #fff;
		bottom: 35px;
		right: 30px;
		text-align: center;
		line-height: 35px;
	}
	#bidContainer{
		position:absolute;
		bottom: 35px;
		left: 30px;
		width: 340px;
		display:flex;
		justify-content: initial;
	}
	#bidInput{
		width: 150px;
		height: 33px;
		border-top:0;
		border-left:0;
		border-right:0;
		border-bottom:1px solid #707070;
		text-align: center;
		background-color: inherit;
	}
	#bidInput:hover{
		cursor:pointer;
	}
	.priceBtn{
		width: 40px;
		height:35px;
		font-size: 25px;
		font-weight:600;
		text-align: center;
		line-height: 35px;
	}
	.priceBtn:hover{
		cursor:pointer;
		color: #ff1d43;
	}
	#modalBoundary{
		height:10px;
	}
	#calculate{
		width: 230px;
		height: 235px;
		background-color: #EBE9E5;
		border: 1px solid #191919;
		border-radius: 5px;
		position:absolute;
		top:355px;
		left: 1500px;
		z-index: 106; 
		display:none;
	}
	#calculateTitle{
		height: 40px;
		font-size: 15px;
		font-weight: 1000;
		text-align: center;
		line-height: 40px;
		border-bottom: 1px solid #707070;
	}
	#unitButtonBox{
		height: 125px;
		display: flex;
		justify-content: initial;
		flex-wrap: wrap;
	}
	.unitButton{
		width: 85px;
		height: 25px;
		background-color: #dbdbdb;
		color: #191919;
		border: 1px solid #707070;
		margin: 10px auto;
		text-align: center;
		line-height: 25px;
		font-size: 13px;
	}
	.unitButton:hover{
		cursor: pointer;
	}
	#setButtonBox{
		height: 60px;
	}
	#setButton{
		width: 90px;
		height: 30px;
		margin: 25px auto;
		background-color: #191919;
		color:#fff;
		text-align: center;
		line-height: 30px;
	}
	#setButton:hover{
		cursor:pointer;
	}
	#bidButton:hover{
		cursor:pointer;
	}
	#up-arrow{
		font-size:25px;
		position: relative;
		top:90px;
		left:840px;
		z-index:103;
	}
	#down-arrow{
		font-size:25px;
		position: relative;
		top:510px;
		left:840px;
		z-index:103;
	}
</style>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
<script src="${pageContext.request.contextPath }/js/sockjs.js"></script>
<script src="${pageContext.request.contextPath }/js/stomp.js"></script>
<sec:authorize access="isAnonymous()" var="isAnony"></sec:authorize>
<script>
	var dps;
	var chart;
	$(function(){
		var chartShow = false;
		var modalShow = false;
		var calculateShow = false;
		var increments = 1000;
		var isAnony = ${isAnony};
		
		var formatDate = ${auction.a_remain}
		setTimeout(() => {
			formatDate = formatDate - 1000;
			$("#auctionTime").text(msToTime(formatDate))
			
			setInterval(() => {
				$("#auctionTime").text(msToTime(formatDate))
				formatDate = formatDate - 1000;
			}, 1000)
		}, 1000 - new Date().getMilliseconds());
		
		$("#chartBtn").on("click",showChart)
		
		$("#buyButton").on("click",function(){
			if(isAnony){
				location.href='${pageContext.request.contextPath}/member/loginForm'
				return;
			}
			if(!modalShow && !chartShow){
				$("#modalContainer").show();
				showChart();
			}else if(!modalShow && chartShow){
				$("#modalContainer").show();
			}
			modalShow = !modalShow
		})
			
		$("#modalClose").on("click",function(e){
			$("#modalContainer").hide();
			showChart();
			modalShow = !modalShow
		})
		
		function showChart(){
			if(!chartShow){
				//옥션 그래프 데이터 요청
				$.ajax({
					url: "graph",
					data: {"a_pk": '${auction.a_pk}'},
					type : 'get',
					dataType: "json",
					success: function(data){
						$(".currentPrice").text(" " +comma(data[data.length - 1].y))
						dps = data;
						
						$("#chartContainer").fadeIn(1000)
						$("#auctionImg").animate({
							opacity: '0.1'
						},500)
						$(".thumnail").animate({
							opacity: '0.1'
						},500)
						makeChart(dps);
					}
				})	
			}else{
				$("#chartContainer").fadeOut(500)
				$("#auctionImg").animate({
					opacity: '1'
				},500)
				$(".thumnail").animate({
					opacity: '1'
				},500)
			}
			chartShow = !chartShow
		}
		
		$("#bidInput").on("click",function(){
			if(!calculateShow){
				$("#calculate").show()
			}else{
				$("#calculate").hide()
			}
			calculateShow = !calculateShow
		})
		
		$(".unitButton").on("click",function(){
			$(this).css({
				'color' : "#ff1d43",
				'border-color' :"#ff1d43"
			})
			$(this).addClass("checked")
			
			$(this).siblings().css({
				'color': "#191919",
				'border-color':"#707070"
			})
			$(this).siblings().removeClass("checked")
		})
		
		$("#setButton").on("click",function(){
			increments = $("#unitButtonBox").children(".checked").children("input").val()
			$("#calculate").hide()
			calculateShow = false;
		})
		
		$("#minusBtn").on("click",function(){
			var nowVal = Number($("#bidInput").val()) - Number(increments);
			$("#bidInput").val(nowVal)
		})
		$("#plusBtn").on("click",function(){
			var nowVal = Number($("#bidInput").val()) + Number(increments);
			$("#bidInput").val(nowVal)
		})
		
// 		입찰 
		$("#bidButton").on("click",function(){
			$.ajax({
				url: "bidding",
				type : "post",
				data : {"ag_bidding": $("#bidInput").val() , 
						"a_pk": "${auction.a_pk}",
						"m_pk_user" : "${m_pk}"					// %Q 유저부분 수정
						},
				dataType: "json",
				success: function(data){
// 					var result = data[0].result			%Q 입찰 성공과 실패 알람 어떻게할지 고민하기
					
// 					if(result){
// 						data.shift();
// 						makeChart(data);
// 						$(".currentPrice").text(comma(data[data.length - 1].y))
// 					}else{
// 						alert(data[0].msg)
// 					}
				}
			})
		})
		
		connect();
		imgSlide();
		
		$(".thumnail").first().css("border-color","#191919")
		$(".thumnail").on("click",function(){
			$(this).css("border-color","#191919")
			$(this).siblings().css("border-color","#e3e2de" )
			$("#auctionImg").attr("src", $(this).attr("src"))
		})
	})
// 	윈도우 온로드 종료  --------------------------------------------------------------

		//이미지 슬라이드 쇼
		function imgSlide(){
			var position = 0;
			var count = $("#thumbnail_train").children().length -4;
			
			console.log(count)
			
			$("#up-arrow > span").on("click",function(){
				
				if(position -1 < 0){
					return;
				}
				position = position <= 0 ? 0 : position - 1;
				
				
				var top = position == 0 ? 0 : (-105)*position;

				$("#thumbnail_train").animate({
					"top" : top 
				})
			})
			
			$("#down-arrow >span").on("click",function(){
				
				if(position + 1 > count){
					return;
				}
				position = position >= count ? count : position + 1;
				
				
				var top = position == count ? (-105)*count : (-105)*position;
				
				$("#thumbnail_train").animate({
					"top" : top
				})
			})
		}
	function makeChart(dps){
		
		chart = new CanvasJS.Chart("auctionChart",{
			animationEnabled : true,
			backgroundColor:"transparent",
			 axisX:{
				    gridThickness: 0,
				    tickLength: 0,
				    lineThickness: 0,
				    interlacedColor: "rgba(0,0,0,0)",
				    labelFormatter: function(){
				      return " ";
				    }
				  },
				  axisY:{
				    gridThickness: 0,
				    tickLength: 0,
				    lineThickness: 0,
				    interlacedColor: "rgba(0,0,0,0)",
				    labelFormatter: function(){
				      return " ";
				    }
				  },
			data: [{
				type: "line",
				color:'blue',
				lineThickness : 5,
				markerColor: "red",
				markerSize: 10,
				dataPoints: dps
			}]
		})
		
		chart.render()
	}
	
	function msToTime(duration) {
        var milliseconds = parseInt((duration%1000)/100)
            , seconds = parseInt((duration/1000)%60)
            , minutes = parseInt((duration/(1000*60))%60)
            , hours = parseInt((duration/(1000*60*60))%24)
			, days = parseInt((duration/(1000*60*60*24))%30);
        
        hours = (hours < 10) ? "0" + hours : hours;
        minutes = (minutes < 10) ? "0" + minutes : minutes;
        seconds = (seconds < 10) ? "0" + seconds : seconds;
		days = (days < 1) ? "" : days+"일 ";
        return days + hours + ":" + minutes + ":" + seconds;
    }
	
	function comma(num){
	    var len, point, str; 
	       
	    num = num + ""; 
	    point = num.length % 3 ;
	    len = num.length; 
	   
	    str = num.substring(0, point); 
	    while (point < len) { 
	        if (str != "") str += ","; 
	        str += num.substring(point, point + 3); 
	        point += 3; 
	    }
	  
	    return str +"원";
	}
	
	
// 	웹소켓
	
	var sock;
	var stompClient;
	
	function connect(){
		sock = new SockJS("${pageContext.request.contextPath}/connect");
		stompClient = Stomp.over(sock);
		stompClient.connect({},function(){
			stompClient.subscribe("/subscribe/bidding/${auction.a_pk}",function(webSocketData){
				var data = JSON.parse(webSocketData.body);
				
				if(data[0].result){
					$("#bidTime").text("< " + data[0].regDate + " >")
					data.shift()
					makeChart(data);
					$(".currentPrice").text(comma(data[data.length - 1].y))
					$(".currentPrice").css("color","#ff1d43")
					setTimeout(() => {
						$(".currentPrice").css("color","#544a4a")
					},2000)
				}
			})
			
			stompClient.subscribe("/subscribe/alarm/${auction.a_pk}",function(webSocketData){	// 애를 개인 구독 페이지로 넘긴다.
				var data = webSocketData.body;
				alert(data);
			})
		})
	}
</script>
</head>
<body>
	<div class='container'>
		<jsp:include page="/WEB-INF/jsp/module/header.jsp"/>

		<div id="main">
			<div id="auctionInfoBox">
				<img id="auctionImg" src="${pageContext.request.contextPath }/auction/auctionImg?ai_pk=${auctionImg[0].img_pk}">
				<div id="thumnailContainer">
					<div id="thumbnail_train">
					<c:forEach items="${auctionImg }" var="img">
						<c:if test="${fn:length(auctionImg) > 1 }">
							<img class='thumnail' src="${pageContext.request.contextPath }/auction/auctionImg?ai_pk=${img.img_pk}">			
						</c:if>
					</c:forEach>
					</div>
				</div>
				<c:if test="${fn:length(auctionImg) > 4 }">
					<div id="up-arrow"><span><i class="fas fa-chevron-up"></i></span></div>
					<div id="down-arrow"><span><i class="fas fa-chevron-down"></i></span></div>
				</c:if>
				<div id="chartContainer">
					<div id="auctionChart"></div>
				</div>
				<div class="auctionInfoContainer">
					<div id="auctionInfo">
						<div class='infoPosition infoBold'><span> ${auction.a_title } </span></div>
						<div class='infoPosition'><span> 작가 이름 </span></div>				
						<div class='infoPosition'>
							<div class='infoButton'><span> 작가 페이지 </span></div> <div class='infoButton'><span>메시지 문의</span></div>
						</div>
						<div id="button-boundary"></div>
						
						
						<div class='infoPosition'>
							<div class='infoButton' id="chartBtn"><span> 실시간 차트 </span></div>
						</div>
						
						<div id="button-boundary"></div>
						<div class='infoPosition'><span> ${auction.c_category } </span></div>
						<div class='infoPosition'><span> ${auction.a_comment }</span></div>
						<div class='infoPosition iconContainer'>
							<div><img id='icon' src='${pageContext.request.contextPath }/img/hand-right.svg'>
							<span> 조회수 ${auction.a_readCount } 명 </span></div>
							<div><img id='icon' src='${pageContext.request.contextPath }/img/like.svg'>
							<span> 구독자 650 명 </span></div>
						</div>
						<div id="button-boundary"></div>
						<div class='infoPosition'>
							<c:choose>
								<c:when test="${auction.a_start eq false}">
									<span class="infoBold">
										<fmt:formatDate value="${auction.a_startTime }" pattern="yyyy/MM/dd 경매 시작"/>
									</span>
								</c:when>
								<c:when test="${auction.a_end }">
									<span class="infoBold"> 이미 종료된 경매입니다. </span>									
								</c:when>
								<c:otherwise>
									<span> 종료 시간 </span><span id="auctionTime"> ${auction.a_remainText}</span>
								</c:otherwise>			
							</c:choose>
						</div>  
						<div class='infoPosition'></div>
						<div class='infoPosition infoBold'>
							
							<c:choose>
								<c:when test="${auction.a_start eq false}">
									<span class="infoBold">
										시작 가격 
									</span>
								</c:when>
								<c:when test="${auction.a_end }">
									<span class='smallText' id="bidTime">
										 &lt; <fmt:formatDate value="${auction.ag_regDate }" pattern="yyyy/MM/dd kk:mm 낙찰" /> &gt; 
									</span>									
								</c:when>
								<c:otherwise>
									<span class='smallText' id="bidTime">
										 &lt; <fmt:formatDate value="${auction.ag_regDate }" pattern="yyyy/MM/dd kk:mm 입찰" /> &gt; 
									</span>
								</c:otherwise>			
							</c:choose>
							&nbsp;
							<span class='currentPrice' id="auctionInfoPrice"> 
								<fmt:formatNumber value="${auction.a_currentPrice }" pattern="#,###원"/>
							</span>
						</div>
						<div id="button-boundary"></div>
						
						<div class='infoPosition' id="buy_sub_container">
							<div id='buttonContainer'>
								<c:choose>
									<c:when test="${auction.a_end }">
										<div class="button">
											종 료
										</div>
									</c:when>
									<c:otherwise>
										<c:if test="${auction.a_start eq true }">
											<div class="button" id='buyButton'>
												입 찰
											</div>
										</c:if>
										<div id='subButton'>
												<span style='font-size:13px'><i class="far fa-heart"></i></span><span> 구 독 </span>
										</div>
									</c:otherwise>
								</c:choose>
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
		<div id="modalContainer">
			<div id="biddingModal">
				<div class='infoBold' id="modalTitle"><div id="modalClose">x</div> <span>${auction.a_title }</span> </div>
				<div id="modalBody">
					<div class='modalPosition'>
						<div><span>시작 가격 : <fmt:formatNumber value="${auction.a_startPrice }" pattern="#,###원"/></span></div>
						<div id='modalBoundary'></div>
						<div><span>최고 가격 : </span><span class='currentPrice'> 
							<fmt:formatNumber value="${auction.a_currentPrice }" pattern="#,###원"/></span>
						</div>
					</div>
				</div>
				<div id="bidContainer">
					<div class='priceBtn' id="minusBtn"> - </div>
					<input id="bidInput" type="number" name="bidding" readonly="readonly" min="${auction.a_currentPrice }" 
						value="${auction.a_currentPrice }">
					<div class='priceBtn' id="plusBtn"> + </div>
					
				</div>

				<div id="bidButton">입 찰</div>
		
			</div>
			<div id="calculate">
				<div id="calculateTitle"> 입력 단위 설정 </div>
				<div id="unitButtonBox">
					<div class='unitButton'> + 1천 <input type="hidden" value="1000"/></div>
					<div class='unitButton'> + 5천 <input type="hidden" value="5000"/></div>
					<div class='unitButton'> + 1만 <input type="hidden" value="10000"/></div>
					<div class='unitButton'> + 10만 <input type="hidden" value="100000"/></div>
					<div class='unitButton'> + 100만 <input type="hidden" value="1000000"/></div>
					<div class='unitButton'> + 1000만 <input type="hidden" value="10000000"/></div>
				</div>
				<div id="setButtonBox">
					<div id="setButton"> 설 정 </div>				
				</div>
			</div>
		</div>
	</div>
</body>
</html>