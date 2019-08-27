<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Handus Studio:Detail</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/handus.css" />
<link href="https://fonts.googleapis.com/css?family=Hepta+Slab|Nanum+Gothic|Nanum+Myeongjo|Noto+Serif+KR&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,700&display=swap" rel="stylesheet">
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
	.infoButton:hover{
		background-color: #191919;
		color: #FBF9F6; 
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
		letter-spacing: 10px;
	}
	#reservButton, #cartButton {
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
	.locPosition{
		width:100%;
		margin-top:15px;
	}
	.locType{
		display:inline-block;
		width: 150px;
	}
/* 	#auctionTime{ */
/* 		margin-left: 15px; */
/* 		font-weight:600; */
/* 		font-size: 19px; */
/* 	} */

/* 		모달 		*/
	#modalContainer{
		display: none;
		width: 500px;
		height: 700px;
		border: 1px solid black;
		position: fixed;
		background-color: #ffff;
		padding: 20px;
	}
	.calendarBox, .weatherBox{
		width: 450px;
		height: 300px;
		border: 1px solid black;
		margin: 0 auto;
		margin-bottom: 20px;
	}
	.close, .reservation{
		width: 200px;
		height: 45px;
		border : 1px solid #707070;
		text-align: center;
/* 		background-color : #191919; */
		color:#191919;
		display: table-cell;
		vertical-align: middle;
		margin: 20px auto;
	}
	.reservation{
		background-color: #191919;
		color: #ffff;
/* 		margin-right: 40px; */
	}
	#mapBox{
		display: inline-block;
		width: 500px;
		height: 350px;
		background-color: #ffff;
		margin-top: 10px;
		margin-bottom: 30px;
		border: none;
	}
	
/* 		리뷰 		*/
	#reviewContiner{
		margin: 200px auto;
		margin-bottom: 100px;
		width: 1300px;
	}
	.reviewTitle{
		font-size: 45px;
		font-weight: bold;
		font-family: 'Roboto Slab', serif;
	}
	.reviewPosition{
		display:inline-block;
		width:100%;
		border-bottom: 1px solid #707070;
		padding: 40px;
	}
	.reviewType{
		display:inline-block;
		width: 150px;
		margin-left: 20px;
		margin-right: 100px;
	}
	.reviewWrite{
		display: inline-block;
		width: 125px;
		height: 20px;
		padding:5px;
		text-align:center;
		border: 1px solid #707070;
		float: right;
	}
}
</style>
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
<script type="text/javascript">
	var memberNum = 1;				// 회원 번호 
	var studioNum = ${studio.s_pk};	// 게시글 번호
	var isHeart = false;			// 구독중인지 판별
	$(function () {
		// 해당 회원이 게시글에 대해 좋아요를 눌렀는지 확인 후 하트 클래스 추가/삭제
		heartCheck();
		
		// 작가 페이지, 메세지 문의 이동 
		$("#autherPage").on("click", function () {
			alert("작가페이지 이동");
		});
		$("#messagePage").on("click", function () {
			alert("메세지 창");
		});
		// 구독(하트) 버튼 누르기
		$("#subButton").on("click", function () {
			if(isHeart){
				// 까만하트 -> 구독 취소 후 빈 하트
				$.ajax({
					url: "${pageContext.request.contextPath}/heart/offHeart",
					data: {"hs_m_pk":memberNum, "hs_s_pk":studioNum},
					type: "post",
					success: function (result) {
						if(result){
							drawFar();
							isHeart = false;
						}else{
							alert("구독취소 불가");
						}
					},
					error: function () {
						alert("offHeart에러");
					}
				});
			}else{
				// 빈하트 -> 구독 후 까만 하트 
				$.ajax({
					url: "${pageContext.request.contextPath}/heart/onHeart",
					data: {"hs_m_pk":memberNum, "hs_s_pk":studioNum},
					type: "post",
					success: function (result) {
						if(result){
							drawFas();
							isHeart = true;
						}else{
							alert("구독 불가");
						}
					},
					error: function () {
						alert("onHeart에러");
					}
				});
			}
			// 바뀐 좋아요 수 다시 표기하기 
			drawHeartCount();
		});
		// 예약 클릭시 모달 띄우기 
		$("#reservButton").on("click", function () {
			$("#modalContainer").css("top","18%");
			$("#modalContainer").css("left","60%");
			$("#modalContainer").show("slow");
		});
		$(".close").on("click", function () {
			$("#modalContainer").hide("slow");
		});
		// 리뷰 남기기 클릭시 해당 회원이 구매했는지 안했는지 확인 
		$(".reviewWrite").on("click", function () {
			alert(memberNum);
			// ajax로 확인요청 
			
		});
	});
	function heartCheck() {
		$.ajax({
			url: "${pageContext.request.contextPath}/heart/chekHeart",
			data: {"hs_m_pk":memberNum, "hs_s_pk":studioNum},
			type: "post",
			success: function (result) {
				if(result){
					// 까만 하트 
					drawFas();
					isHeart = true;
				}else{
					// 빈 하트 
				}
			},
			error: function () {
				alert("하트체크예외");
			}
		});
	};
	function drawFar() {
		$("i").removeClass("fas");
		$("i").addClass("far");
	};
	function drawFas() {
		$("i").removeClass("far");
		$("i").addClass("fas");
	};
	function drawHeartCount() {
		$.ajax({
			url: "${pageContext.request.contextPath}/heart/countHeart",
			data: {"sNum":${studio.s_pk}},
			type: "post",
			success: function (data) {
				$("#heartCount").text(data);
			},
			error: function () {
				alert("갯수예외");
			}
		});
	};
</script>
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
					<div class='infoPosition'><span>${studio.m_name }</span></div>				
					<div class='infoPosition'>
						<div class='infoButton' id="autherPage"><span> 작가 페이지 </span></div> <div class='infoButton' id="messagePage"><span>메시지 문의</span></div>
					</div>
<!-- 					<div id="button-boundary"></div> -->
					
					<div class='infoPosition'>
						<div class='personnel'><span> ${studio.s_current }명 /  ${studio.s_maximum }명 </span></div>
					</div>
					
					<div id="button-boundary"></div>
					<div class='infoPosition'><span>${studio.c_category }</span></div>
					<div class='infoPosition'><span>${studio.s_comment } </span></div>
					<div class='infoPosition iconContainer'>
						<div><img id='icon' src='${pageContext.request.contextPath }/img/hand-right.svg'>
						<span> 조회수 ${studio.s_read_count } 회 </span></div>
						<div><img id='icon' src='${pageContext.request.contextPath }/img/brush.svg'>
						<span> 리뷰수 <span id="reviewCount">${studio.rs_count }</span> 개 </span></div>
						<div><img id='icon' src='${pageContext.request.contextPath }/img/like.svg'>
						<span> 좋아요 <span id="heartCount">${studio.hs_count }</span> 명 </span></div>
					</div>
					<div id="button-boundary"></div>
					<div class='infoPosition infoBold'>
<!-- 						<span class='smallText'> &lt; 2019/08/21 08:15 입찰 &gt;</span> -->
						<span id='price'> &nbsp;&nbsp;${studio.s_price }원</span>
					</div>
					
<!-- 					<div id="button-boundary"></div> -->
					
					<div class='infoPosition' id="buy_sub_container">
						<div id='buttonContainer'>
							<div id='cartButton'>
								<span><a> My Cart </a></span>
							</div>
							<div id='reservButton'>
								<span><a> Reservation </a></span>
							</div>
							<div id='subButton'>
								<span style='font-size:13px'><i class="far fa-heart"></i></span><span> subscribe </span>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 예약 페이지 모달창 -->
			<div id="modalContainer">
				<div id="modalBox">
					<div class="calendarBox"><span> $달력API </span></div>
					<div class="weatherBox"><span> $날씨API </span></div>
					<div class="reservation"><span> reservation </span></div>
					<div class="close"><span> close </span></div>
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
					<div class='locPosition'><div class='locType'><span> l o c a t i o n </span></div><div id="mapBox"><span> $지도 API </span></div></div>
				</div>
			</div>
			<!-- 리뷰 -->
			<div id="reviewContiner">
				<div class="reviewTitle"><span> S T U D I O &nbsp;&nbsp; R E V I E W </span></div>
				<div id="reviewBox">
					<div class='reviewPosition'>
						<div class='reviewWrite'><span> $리뷰 남기기 </span></div>
<!-- 							<div class="reviewWrite"><span> $리뷰 남기기 </span></div> -->
					</div>
					<div class='reviewPosition'>
						<div class='reviewType'><span> m e m b e r &nbsp; n a m e </span></div>
						<span> $리뷰 내용 </span>
					</div>
					<div class='reviewPosition'>
						<div class='reviewType'><span> m e m b e r &nbsp; n a m e </span></div>
						<span> $리뷰 내용 </span>
					</div>
					<div class='reviewPosition'>
						<div class='reviewType'><span> m e m b e r &nbsp; n a m e </span></div>
						<span> $리뷰 내용 </span>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>