<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	#studioListContainer{
		width:80%;
		font-family: 'Nanum Myeongjo', serif;
	}
	.container{
		display:flex;
		justify-content: flex-start;
	}
/* 	페이지 상단  */
	.sortBox{
		position:relative;
		top: 0;
		left: 0;
		height: 200px;
	}
	
	#sort{
		position: absolute;
		top: 100px;
		right: 185px;
	}
	#pageTitle{
		font-size: 40px;
		position: absolute;
		top: 70px;
		left: 55px;
		font-family: 'Hepta Slab', serif;
	}
	/* select */
	select {
    -webkit-appearance: none;  /* 네이티브 외형 감추기 */
    -moz-appearance: none;
    appearance: none;
/*     background: url(이미지 경로) no-repeat 95% 50%;  /* 화살표 모양의 이미지 */ 
	
	width: 170px; /* 원하는 너비설정 */
    padding: .8em .5em; /* 여백으로 높이 설정 */
    font-family: inherit;  /* 폰트 상속 */
   								/* 네이티브 화살표를 커스텀 화살표로 대체 */
    border: 1px solid #999;
    -webkit-appearance: none; /* 네이티브 외형 감추기 */
    -moz-appearance: none;
    appearance: none;
	
	}
	/* IE 10, 11의 네이티브 화살표 숨기기 */
	select::-ms-expand {
	    display: none;
	}
	
/* 	리스트 목록  */
	.studioList{
		display: flex;
		flex-wrap: wrap;
		justify-content: initial;
		font-size: 0.8em;
	}
	.studioBox{
		width: 400px;
		height:400px;
		margin: 50px 0 50px 50px;
		position: relative;
		top:0;
		left:0;
	}
	
	.studioImg{
		width: 400px;
		height:400px;
		background-color : #fff;
		position:absolute;
		top:0;
		left:0;
	}
	.studioImg:hover{
		cursor: pointer;
	}

/* 	아이콘 및 제목 */
	.imgChange{
		position:absolute;
		bottom:-35px;
		right: 10px;
	}
	.imgChange span{
		font-size: 15px;
	}
	.imgChange span:hover{
		cursor:pointer;
	}
	.studioTitle{
		position: absolute;
		bottom: -35px;
		left: 10px;
		font-size: 20px;
	}
	.studioTitle a{
		color: black;
		text-decoration: none;
	}
	.studioTitle a:hover{
		color: #ab926c;
	}
	
/* 	상세 정보  */
	.studioInfo{
		position: absolute;
		bottom: 30px;
		right: 0;
		display:none;
		opacity:0;
	}
	.info{
		font-size: 25px;
	}
	
/* 	사이드 카테고리 */
	#sideCategoryContainer{
		width: 20%;
		height:1080px;
		margin-top:250px;
		color:#544a4a;
	}
	#sideGrid{
		width: 250px;
		height: 100%;
		margin: 0 auto;
	}
	.categoryTitle{
		font-size: 16px;
		font-weight: 600;
		margin: 102px 0 45px 0;
	}
	#category ul{
		list-style: none;
		padding-left: 20px;
	}
	#category ul li{
		margin-bottom: 15px;
		font-size:15px;
	}
	#category ul li a{
		color: inherit;
		text-decoration: none;
	}
	
/* 페이징 처리  */
	#pageContainer{
		margin-top: 100px;
		text-align: center;
		padding-right: 125px;
	}
	.page{
		font-size:20px;
		color:#191919;
		letter-spacing: 10px;
		font-weight:600;
		text-decoration: none;
		cursor:pointer;
	}
	.page:hover{
		color:#ff1d43;
	}
	#start{
		letter-spacing: 0px;
	}
	#end{
		letter-spacing:0px;
	}
</style>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
	var memberNum = 1;	// 회원 번호, 세션에서 얻어오면 됨 
	var studioNum; 		// 게시글 번호, 리스트에서 얻어옴 
	var isHeart;
	$(function () {
		// 좋아요 하기, 좋아요 취소하기 
		$(".imgChange").on("click", function () {
			isHeart = $(this).attr("data-iH");
			studioNum = $(this).attr("data-sN");
			if(isHeart === "true"){
				offHeart(studioNum);
				$(this).attr("data-iH", false);
			}else{
				// 왜 값이 false 인데 여기로 안 떨어지지 
				onHeart(studioNum);
				$(this).attr("data-iH", true);
			}
		});
	});
	function onHeart(studioNum) {
		$.ajax({
			url: "${pageContext.request.contextPath}/heart/onHeartS",
			data: {"hs_m_pk":memberNum, "hs_s_pk":studioNum},
			type: "post",
			success: function (result) {
				if(result){
					drawFas(studioNum);
				}else{
					alert("구독 불가");
				}
			},
			error: function () {
				alert("onHeart에러");
			}
		});
	};
	function offHeart(studioNum) {
		$.ajax({
			url: "${pageContext.request.contextPath}/heart/offHeartS",
			data: {"hs_m_pk":memberNum, "hs_s_pk":studioNum},
			type: "post",
			success: function (result) {
				if(result){
					drawFar(studioNum);
				}else{
					alert("구독취소 불가");
				}
			},
			error: function () {
				alert("offHeart에러");
			}
		});
	};
	function drawFar(studioNum) {
		// 해당 게시글 번호 속성을 가지고 있는 div의 i 속성 변경 
		var faHeart = $("i[data-fa='"+studioNum+"']");
		faHeart.removeClass("fas");
		faHeart.addClass("far");
	};
	function drawFas(studioNum) {
		var faHeart = $("i[data-fa='"+studioNum+"']");
		faHeart.removeClass("far");
		faHeart.addClass("fas");
	};
</script>
</head>
<body>
	<div class="container">
		<jsp:include page="/WEB-INF/jsp/module/header.jsp"/>
		<div id="sideCategoryContainer">
			<div id="sideGrid"> 
				<div id="category">
					<div class="categoryTitle"><span> C A T E G O R Y ----- </span></div>
					<ul>
						<li><a href="${pageContext.request.contextPath }/studio/list"> A L L</a> </li>
						<li><a href="${pageContext.request.contextPath }/studio/list?type=ceramics"> C E R A M I C S </a></li>
						<li><a href="${pageContext.request.contextPath }/studio/list?type=metal"> M E T A L </a></li>
						<li><a href="${pageContext.request.contextPath }/studio/list?type=glass"> G L A S S </a></li>
						<li><a href="${pageContext.request.contextPath }/studio/list?type=embroidery"> E M B R O I D E R Y </a></li>
						<li><a href="${pageContext.request.contextPath }/studio/list?type=leather"> L E A T H E R </a></li>
						<li><a href="${pageContext.request.contextPath }/studio/list?type=wood"> W O O D </a></li>
					</ul>
				</div>
			</div>
		</div>
		<div id="studioListContainer">
			<div class='sortBox'>
				<p id="pageTitle"> Studio </p>
				<div id="sort">
					<select>
						<option>Sort&hellip;</option>
						<option>최신순</option>
						<option>인기순</option>
						<option>별점순</option>
					</select>
				</div>
			</div>
			<div class="studioList">
				<!-- 리스트 그리기 -->
				<c:forEach items="${studioList }" var="studio">
					<div class="studioBox">
						<img alt="" src="">
						<span><a href="detail?num=${studio.s_pk}"><img class='studioImg'></a></span>
						<div class="studioTitle">
							<span><a href='detail?num=${studio.s_pk}'>${studio.s_title }</a></span>
						</div>
					</div>
				</c:forEach>
			</div>
			
			<!-- 페이징 -->
			<div id="pageContainer">
				<a class='page' id="start" href="${pageContext.request.contextPath }/studio/list?page=1&type=${type}">
					<i class="fas fa-caret-left"></i><i class="fas fa-caret-left"></i>
				</a>&nbsp;&nbsp;
				<a class='page' href="${pageContext.request.contextPath }/studio/list?page=${curPage <= 1 ? 1 : curPage -1 }&type=${type}">
					<i class="fas fa-caret-left"></i>
				</a>
				<c:forEach begin="${startPage }" end="${endPage }" var="page">
					<c:choose>
						<c:when test="${page eq curPage}">
							<span class='page' style='color:#ff1d43; cursor:default;'>${page }</span>
						</c:when>
						<c:otherwise>
							<a class='page' href="${pageContext.request.contextPath }/studio/list?page=${page}&type=${type}"> ${page }</a>					
						</c:otherwise>
					</c:choose>
				</c:forEach>
				&nbsp;&nbsp;
				<a class='page' href="${pageContext.request.contextPath }/studio/list?page=${curPage >= total ? total : curPage + 1}&type=${type}">
					<i class="fas fa-caret-right"></i>
				</a>
				<a class='page' id="end" href="${pageContext.request.contextPath }/studio/list?page=${total}&type=${type}">
					<i class="fas fa-caret-right"></i><i class="fas fa-caret-right"></i>
				</a>
			</div>
		</div>
	</div>
</body>
</html>