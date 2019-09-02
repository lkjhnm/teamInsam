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
	.infoButton:hover, .reviewButton:hover, .smallFont:hover, .delModButton:hover{
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
	.letterSpacing{
		letter-spacing: 3px;
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
	.reviewButton, .delModButton{
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
	.delModButton{
		width: 60px;
	}
	.marginRight{
		margin-right: 5px;
	}
	.reviewDate{
		font-size: 0.7em;
		width: 90px;
		text-align: center;
		margin: 0 auto;
		margin-top: 3px;
	}
	.starBox{
		width: 100px;
		margin: 0 auto;
		margin-top: 5px;
		font-size: 12px;
	}
	.starBox span{
		margin: 0 auto; 
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
		font-size: 0.9em;
		margin: 0 auto;
		margin-top: 5px;
		padding: 3px;
		border: 1px solid #707070;
		width: 70px;
	}
	.reviewArea, .reviewArea2{
		resize: none;
		padding: 5px;
		background-color: #ffff;
		border: none;
		overflow: auto;
		outline: none;
		box-shadow: none;
		border-radius: 5px;
	}
	textarea{
		font-family: 'Nanum Myeongjo', serif;
		letter-spacing: 1px;
		word-spacing: 2.5px;
	}
	.reviewArea2{
		background-color: #FBF9F6;
	}
	.reviewArea:focus, .reviewArea:hover, .redBorder:focus, .redBorder:hover {
		border: 1px solid #FF1D43;
		border-radius: 5px;
		background-color: #ffff;
	}
}
</style>
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
 <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=486df4f7ba9d0fcd564c18d5601724f6&libraries=services,clusterer"></script>
<script type="text/javascript">
	var memberNum = 1;				// 회원 번호 
	var studioNum = ${studio.s_pk};	// 게시글 번호
	var isHeart = false;			// 구독중인지 판별
	var isLock = false;				
	var isReview = true;			// 리뷰 남기기 창 (초기값: false)
	var modBtn = 0; 				// 수정 버튼 기능 0=수정창보이기, 1=수정로직실행
	var mapX = 127.02448266126561;
	var mapY = 37.50312464278207;
	$(function () {
		// 해당 회원이 게시글에 대해 좋아요를 눌렀는지 확인 후 하트 클래스 추가/삭제
		heartCheck();
		// 리뷰 그리기
		drawReview();
		// 지도 API 
		// 지도 - 그리기 
		var mapBox = document.getElementById("mapBox");
		var mapOption = {
			center: new kakao.maps.LatLng(33.450701, 126.570667), 	// 지도의 중심 좌표 설정 
			level: 3 	// 지도의 축소, 확대 정도 
		};
		var map = new kakao.maps.Map(mapBox, mapOption); 	// 지도 객체 생성 (지도 그릴곳, 옵션 )파라미터 대입 
		var loc = "${studio.s_location }";
		var geocoder = new kakao.maps.services.Geocoder();
		geocoder.addressSearch(loc, function (result, status) {
			if(status == kakao.maps.services.Status.OK){
				var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
				var marker = new kakao.maps.Marker({
					map: map,
				    position: coords
				});
				var infowindow = new kakao.maps.InfoWindow({
		            content: '<div style="width:150px;text-align:center;padding:6px 0;">${studio.s_name }</div>'
		        });
		        infowindow.open(map, marker);
		        map.setCenter(coords);
			}
		});
		
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
		// 리뷰 남기기 버튼 
		$(".reviewWrite").on("click", function () {
			// ajax로 확인요청 후 맞으면 isReview(구매했으면) = true 로 변경 
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
						closeArea();
					}else{
						alert("리뷰 등록 실패");
					}
				},
				error: function () {
					alert("별점을 등록해주세요");
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
	function drawReviewCount() {
		$.ajax({
			url: "${pageContext.request.contextPath}/review/countReview",
			data: {"sNum":${studio.s_pk}},
			type: "post",
			success: function (data) {
				$("#reviewCount").text(data);
			},
			error: function () {
				alert("갯수예외");
			}
		});
	};
	// 리뷰 그리기 
	function drawReview() {
		$("#reviewBox div:gt(5)").remove();
		$.ajax({
			url: "${pageContext.request.contextPath}/review/drawReview",
			data: {"sNum":"${studio.s_pk}"},
			type: "post",
			dataType: "json", 
			success: function (data) {
				var list = data;
				// 리스트 만큼 돌면서 그리기 
				for(var i = 0; i < list.length; i++){
					var div1 = $("<div class='reviewPosition'></div>");
					var div11 = $("<div class='reviewType'></div>");
					div11.append($("<span class='letterSpacing'></span>").text(list[i].rs_m_name));
					var date = new Date(list[i].rs_reg_date);
					div11.append($("<div class='reviewDate'></div>")
							.append($("<span></span>").text(getFormatDate(date))));
					var divStar = $("<div class='starBox'></div>");
					// 별그리기 = 별갯수만큼 반복문 돌면서 fas = list[i].rs_grade
					var sGrade = list[i].rs_grade;
					for(var j = 1; j <= 5; j ++){
						if(j <= sGrade){
							var starSpan = $("<span style='font-size:12px'></span>");
							starSpan.append("<i class='fas fa-star' data-what='star' data-value='"+(j)+"'></i>");
							divStar.append(starSpan);
						}else{
							var starSpan = $("<span style='font-size:12px'></span>");
							starSpan.append("<i class='far fa-star' data-what='star' data-value='"+(j)+"'></i>");
							divStar.append(starSpan);
						}
					}
					div11.append(divStar);
					var div22 = $("<div class='reviewContent'></div>");
					var textArea = $("<textarea rows='4' cols='105' class='reviewArea2' id='modifyCon"+list[i].rs_pk+"' readonly='readonly'></textarea>").val(list[i].rs_content);
					div22.append($("<span></span>").append(textArea));
					// 게시글 쓴 사람 번호 = 회원 번호 확인
					if(memberNum==list[i].rs_m_pk){
						// 삭제 버튼
						btnSpan1 = $("<span class='delModButton'></span>").text("삭제");
						(function (n) {
							btnSpan1.on("click", function () {
								if(confirm("리뷰를 삭제하시겠습니까?")){
									removeReview(list[n].rs_pk);
								}
							});
						})(i);
						// 수정버튼 
						btnSpan2 = $("<span class='delModButton marginRight'></span>").text("수정");
						(function (n) {
							btnSpan2.on("click", function () {
								// redBorder클래스 추가, readonly 속성 지우기 
								var modifyArea = $("textArea[id=modifyCon"+list[n].rs_pk+"]");
								// 0일땐 입력 가능하도록 
								if(modBtn == 0){
									modifyArea.removeAttr("readonly").addClass("redBorder");
									modifyArea.focus();
									modBtn = 1;
								// 1일땐 수정로직 실행하도록, 입력하고 다시 입력 불가능하게 만들기 
								}else{
									modifyReview(list[n].rs_pk, modifyArea.val());
									modifyArea.attr("readonly", "readonly").removeClass("redBorder");
									modBtn = 0; 
								}
							});
						})(i);
						div1.append(div11).append(div22).append(btnSpan1);
						div1.append(div11).append(div22).append(btnSpan2);
					}else{
						// 신고 버튼
						btnSpan = $("<span class='reviewButton'></span>").text("신고");
						(function (n) {
							btnSpan.on("click", function () {
								alert(list[n].rs_pk+" 신고");
							});
						})(i);
						div1.append(div11).append(div22).append(btnSpan);
					}
					$("#reviewBox").append(div1);
				}
				drawReviewCount();
			},
			error: function () {
				alert("리뷰 불러오기 에러");
			}
		});
	};
	function getFormatDate(date){ 
		var year = date.getFullYear();			// 년도 
		var month = (1 + date.getMonth());		// 월
		month = month >= 10 ? month : '0' + month;	//month 두자리로 저장 
		var day = date.getDate();				// 일
		day = day >= 10 ? day : '0' + day;		//day 두자리로 저장 
		return year + '-' + month + '-' + day; 
	}
	function removeReview(rsNum) {
		$.ajax({
			url: "${pageContext.request.contextPath}/review/removeReview",
			data: {"rsNum":rsNum},
			success: function (result) {
				if(result){
					drawReview();
				}else{
					alert("삭제 예외");
				}
			},
			error: function () {
				alert("리뷰 삭제 에러");
			}
		});
	};
	function modifyReview(rsNum, content) {
		$.ajax({
			url: "${pageContext.request.contextPath}/review/modifyReview",
			data: {"rs_pk":rsNum, "rs_content":content},
			success: function (result) {
				if(result){
					alert("수정됐습니다");
					drawReview();
				}else{
					alert("수정 예외");
				}
			},
			error: function () {
				alert("리뷰 수정 에러");
			}
		});
	};
	function closeArea() {
		$("#writeContent").val(" ");
		$("#reviewInput").css("display", "none");
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
				</div>
				<div id="specBox">
					<div class='infoBold'><span>STUDIO LOCATION</span></div>
					<div class='specPosition'><div class='specType'><span> s t u d i o </span></div><span> ${studio.s_name } </span></div>
					<div class='specPosition'><div class='specType'><span> a d d r e s s </span></div><span> ${studio.s_location } </span></div>
					<div class='locPosition'><div class='locType'><span> l o c a t i o n </span></div>
						<div id="mapBox"><span> </span></div>
					</div>
				</div>
			</div>
			<!-- 리뷰 -->
			<div id="reviewContiner">
				<div class="reviewTitle"><span> S T U D I O &nbsp;&nbsp; R E V I E W </span></div>
				<div id="reviewBox">
				<!-- 리뷰 버튼 -->
					<div class='reviewPosition'>
						<div class='reviewWrite'><span> 리뷰 남기기 </span></div>
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
<!-- 					<div class='reviewPosition'> -->
<!-- 						<div class='reviewType'>	 -->
<!-- 							<span> m e m b e r &nbsp; n a m e </span> -->
<!-- 							<div class='reviewDate'><span> 2019-XX-XX </span></div> -->
<!-- 							<div class="starBox">	 -->
<!-- 								<span style='font-size:12px'><i class="far fa-star" data-what="star" data-value='1'></i></span> -->
<!-- 								<span style='font-size:12px'><i class="far fa-star" data-what="star" data-value='2'></i></span> -->
<!-- 								<span style='font-size:12px'><i class="far fa-star" data-what="star" data-value='3'></i></span> -->
<!-- 								<span style='font-size:12px'><i class="far fa-star" data-what="star" data-value='4'></i></span> -->
<!-- 								<span style='font-size:12px'><i class="far fa-star" data-what="star" data-value='5'></i></span> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 						<div class="reviewContent"><span> <textarea rows="4" cols="90" class="reviewArea2" id="modifyContent" readonly="readonly"> aaaa </textarea> </span></div> -->
<!-- 						<span class="delModButton"> 삭제 </span> -->
<!-- 						<span class="delModButton marginRight"> 수정 </span> -->
<!-- 					</div> -->
				</div>
			</div>
		</div>
	</div>
</body>
</html>