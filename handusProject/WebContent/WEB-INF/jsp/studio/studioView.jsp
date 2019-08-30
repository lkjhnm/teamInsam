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
	.infoButton:hover, .reviewButton:hover, .smallFont:hover{
		cursor:pointer;
		color: #ff1d43; 
		border-color:#ff1d43;
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
		cursor:pointer;
	}
	#subButton{
		width:300px;
		height: 30px;
		border: 1px solid #707070;
		margin-top: 5px;
		text-align: center;
		line-height: 30px;
		cursor:pointer;
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
		padding: 20px;
	}
	.reviewType{
		display:inline-block;
		width: 150px;
		margin-left: 20px;
		margin-right: 100px;
		margin-top: 20px;
		margin-bottom: 20px;
		text-align: center;
	}
	.reviewWrite{
		display: inline-block;
		width: 125px;
		height: 20px;
		padding:5px;
		text-align:center;
		border: 1px solid #707070;
		float: right;
		cursor: pointer;
	}
	#reviewInput{
		display: none;  
	}
	.reviewButton{
		display: inline-block;
		width: 125px;
		height: 20px;
		padding:5px;
		text-align:center;
		border: 1px solid #707070;
		float: right;
		cursor: pointer;
		margin-top: 22px;
	}
	.reviewDate{
		font-size: 0.7em;
		width: 90px;
		text-align: center;
		margin: 0 auto;
		margin-top: 3px;
	}
	.reviewContent{
		display: inline-block;
		vertical-align: middle;
	}
	.starGrade{
		display: inline-block;
		width: 100px;
		cursor: pointer;
		margin-top: 8px;
	}
	.smallFont{
/* 		display: inline-block; */
		font-size: 0.9em;
		margin: 0 auto;
		margin-top: 5px;
		padding: 3px;
		border: 1px solid #707070;
		width: 70px;
	}
	.reviewArea{
		resize: none;
		padding: 5px;
		background-color: #ffff;
		border: none;
		overflow: auto;
		outline: none;
		box-shadow: none;
		border-radius: 5px;
	}
	.reviewArea:focus, .reviewArea:hover {
		border: 1px solid #FF1D43;
		border-radius: 5px;
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
	var isLock = false;				
	var isReview = true;			// 리뷰 남기기 창 (초기값: false)
	$(function () {
		// 해당 회원이 게시글에 대해 좋아요를 눌렀는지 확인 후 하트 클래스 추가/삭제
		heartCheck();
// 왜 HS_COUNT 가 자꾸 3으로 뜨는지 모르겟음 (DB에서 3으로 뜸... 확인해야함 )
		drawHeartCount();
		// 리뷰 그리기
		drawReview();
		
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
							drawFarHeart();
							isHeart = false;
							drawHeartCount();
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
							drawFasHeart();
							isHeart = true;
							drawHeartCount();
						}else{
							alert("구독 불가");
						}
					},
					error: function () {
						alert("onHeart에러");
					}
				});
			}
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
		// 리뷰 남기기
		$(".reviewWrite").on("click", function () {
			// ajax로 확인요청 후 맞으면 isReview = true 로 변경 
			if(isReview){
				$("#reviewInput").css("display", "block");
				isReview = false;
			}else{
				$("#reviewInput").css("display", "none");
				isReview = true;
			}
		});
		$(".reviewArea").on("click", function () {
			$(this).removeAttr("placeholder"); 
		});
		// (마우스온: isLock=false)
		$(".starGrade span i").on("mouseover", function () {
			if(!isLock){
				// prevAll : 형제요소만 선택 가능 
				$(this).parent().prevAll().children().removeClass("far").addClass("fas");
				// <div> 의 span의 i 요소 선택 
				$(this).removeClass("far").addClass("fas");
			}
		});
		// (마우스아웃 isLock=false)
		$(".starGrade span i").on("mouseout", function () {
			if(!isLock){
				$(this).parent().prevAll().children().removeClass("fas").addClass("far");
				$(this).removeClass("fas").addClass("far");
			}
		});
		// (마우스 클릭 isLock=true)
		$(".starGrade span i").on("click", function () {
			isLock = true;
			if(isLock){
				$(this).parent().prevAll().children().removeClass("far").addClass("fas");
				$(this).removeClass("far").addClass("fas").attr("grade", "here");
// 			var score = $("i[grade='here']").attr("data-value");
// 			alert("점수: "+score);
			}
		});
		// 별점수정 
		$(".smallFont").on("click", function () {
			isLock = false;
			$(".starGrade span i").removeClass("fas").removeClass("far").addClass("far").removeAttr("grade");
		});
		// 리뷰 등록
		$("#registerReview").on("click", function () {
			// 해당 별의 점수 가져오기 
			var score = $("i[grade='here']").attr("data-value");
			var content = $("#writeContent").val();
			$.ajax({
				url: "${pageContext.request.contextPath}/review/writeReview",
				data: {"mNum": memberNum,
					"grade": score,
					"content": content,
					"sNum": studioNum
				},
				type: "post",
				success: function (result) {
					if(result){
						alert("리뷰가 등록되었습니다");
						drawReview();
					}else{
						alert("리뷰 등록 실패");
					}
				},
				error: function () {
					alert("리뷰 등록 에러");
				}
			});
		});
	});  // ------------------------------------- onload 끝 
	function heartCheck() {
		$.ajax({
			url: "${pageContext.request.contextPath}/heart/chekHeart",
			data: {"hs_m_pk":memberNum, "hs_s_pk":studioNum},
			type: "post",
			success: function (result) {
				if(result){
					// 까만 하트 
					drawFasHeart();
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
	function drawFarHeart() {
		$("i[data-what='heart']").removeClass("fas");
		$("i[data-what='heart']").addClass("far");
	};
	function drawFasHeart() {
		$("i[data-what='heart']").removeClass("far");
		$("i[data-what='heart']").addClass("fas");
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
	// 리뷰 그리기 
	function drawReview() {
		$("#reviewBox div:gt[1]").remove();
		$.ajax({
			url: "${pageContext.request.contextPath}/review/drawReview",
			data: {"sNum":${studio.s_pk}},
			type: "post",
			success: function (data) {
				var list = data;
				// 리스트 만큼 돌면서 그리기 
				for(var i = 0; i < list.length; i++){
					var div1 = $("<div class='reviewPosition'></div>");
					var div21 = $("<div class='reviewType'></div>");
					div21.append($("<span></span>").text(list[i].rs_m_name));
					div21.append($("<div class='reviewDate'></div>")
							.append($("<span></span>").text(list[i].rs_reg_date)));
					var div22 = $("<div class='reviewContent'></div>");
					div22.append($("<span></span>").text(list[i].rs_content));
					var btnSpan;
					// 게시글 쓴 사람 번호 = 회원 번호 확인
					if(memberNum==list[i].rs_m_pk){
						// 삭제 버튼 
						btnSpan = $("<span class='reviewButton'></span>").text("삭제");
						(function (n) {
							btnSpan.on("click", function () {
								alert(list[n].rs_pk+" 삭제");
							});
						})(i);
					}else{
						// 신고 버튼
						btnSpan = $("<span class='reviewButton'></span>").text("신고");
						(function (n) {
							btnSpan.on("click", function () {
								alert(list[n].rs_pk+" 신고");
							});
						})(i);
					}
					div1.append(div21).append(div22).append(btnSpan);
					$("#reviewBox").append(div1);
				}
			},
			error: function () {
				alert("리뷰 불러오기 에러");
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
<!-- 							<div id='cartButton'> -->
<!-- 								<span><a> My Cart </a></span> -->
<!-- 							</div> -->
							<div id='reservButton'>
								<span><a> Reservation </a></span>
							</div>
							<div id='subButton'>
								<span style='font-size:13px'><i class="far fa-heart" data-what="heart"></i></span><span> subscribe </span>
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
					<!-- 후기 입력란  -->
					<div class='reviewPosition' id="reviewInput">
						<div class='reviewType'>
							<span id="review-memberName"> m e m b e r &nbsp; n a m e </span>
							<div class="starGrade">
								<span style='font-size:12px'><i class="far fa-star" data-what="star" data-value='1'></i></span>
								<span style='font-size:12px'><i class="far fa-star" data-what="star" data-value='2'></i></span>
								<span style='font-size:12px'><i class="far fa-star" data-what="star" data-value='3'></i></span>
								<span style='font-size:12px'><i class="far fa-star" data-what="star" data-value='4'></i></span>
								<span style='font-size:12px'><i class="far fa-star" data-what="star" data-value='5'></i></span>
							</div>
							<div class="smallFont"><span> 별점수정 </span></div>
						</div>
<!-- 						<span> <input type="text" name="RS_CONTENT" class=""> </span> -->
						<span> <textarea rows="4" cols="105" class="reviewArea" id="writeContent"></textarea> </span>
						<span class="reviewButton" id="registerReview"> 등록 </span>
					</div>
					<!-- ajax로 그릴 부분  -->
					<div class='reviewPosition'>
						<div class='reviewType'>
							<span> m e m b e r &nbsp; n a m e </span>
							<div class='reviewDate'><span> 2019-XX-XX </span></div>
						</div>
						<div class="reviewContent"><span> $리뷰 내용 </span></div>
						<span class="reviewButton" id="delDecReview"> 삭제 </span>
					</div>
					
				</div>
			</div>
		</div>
	</div>
</body>
</html>