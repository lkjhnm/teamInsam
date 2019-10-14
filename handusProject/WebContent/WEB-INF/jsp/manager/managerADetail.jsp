<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<title>관리자페이지|상세보기</title>
<meta name="generator" content="Bootply" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/styles.css">
<style type="text/css">
ul li {
	margin-bottom: 5px;
}

li {
	list-style: none;
}

.tab-link {
	display: list-item;
}

.breadcrumb {
	background-color: transparent;
	margin-bottom: .5rem;
}

.col-left {
	padding-right: 20px;
}

.container-fluid .card {
	border-radius: .75rem;
}

.card {
	border: initial;
	background-color: white;
	box-shadow: 0 1px 15px rgba(0, 0, 0, .04), 0 1px 6px rgba(0, 0, 0, .04);
}

.card .card-body {
	padding: 3rem;
}

.card-body {
	-webkit-box-flex: 1;
	-ms-flex: 1 1 auto;
	flex: 1 1 auto;
	padding: 1.25rem;
}

.glide {
	position: relative;
	width: 100%;
	box-sizing: border-box;
	margin-bottom: 15px;
}

.glide__track {
	overflow: hidden;
}

.glide__slides {
	position: relative;
	width: 100%;
	list-style: none;
	backface-visibility: hidden;
	transform-style: preserve-3d;
	touch-action: pan-Y;
	overflow: hidden;
	padding: 0;
	white-space: nowrap;
	display: flex;
	flex-wrap: nowrap;
	will-change: transform;
}

.glide__slide {
	width: 100%;
	height: 100%;
	flex-shrink: 0;
	white-space: normal;
}

.glide * {
	box-sizing: inherit;
}

.glide.details .glide__slides {
	margin-bottom: 0;
}

.mb-3 {
	margin-bottom: .5rem !important;
}

.separator {
	border-bottom: 1px solid #d7d7d7;
	width: 70%;
	margin: 0 auto;
	margin-left: 25.3%;
}

.mb-5 {
	margin-bottom: 2rem !important;
}

.border-radius {
	border-radius: .75rem;
}

.glide.thumbs {
	cursor: pointer;
	width: 340px;
	margin: 0 auto;
}

.glide__track {
	overflow: hidden;
}

.glide.thumbs .glide__slides {
	margin-bottom: 0;
}

.glide.thumbs li.active, .glide.thumbs li:hover {
	opacity: 1;
}

.glide.thumbs li {
	text-align: center;
	opacity: 4;
}

.glide.thumbs li img {
	width: 60px;
	margin-bottom: 0;
}

.glide.thumbs .glide__arrows .glide__arrow--left {
	border: initial;
	background: initial;
	box-shadow: initial;
	top: 20px;
	left: -50px;
	font-size: 20px;
	color: #f18024;
}

/* .simple-icon-arrow-left:before { */
/* 	content: "\e605"; */
/* } */
.glide.thumbs .glide__arrows .glide__arrow--right {
	border: initial;
	background: initial;
	box-shadow: initial;
	top: 20px;
	right: -50px;
	font-size: 20px;
	color: #f18024;
}

/* .simple-icon-arrow-right:before { */
/*     content: "\e606"; */
/* } */
.glide__arrow {
	position: absolute;
	display: block;
	top: 50%;
	z-index: 2;
	color: #fff;
	text-transform: uppercase;
	padding: 9px 12px;
	background-color: transparent;
	border: 2px solid rgba(255, 255, 255, .5);
	border-radius: 4px;
	box-shadow: 0 0.25em 0.5em 0 rgba(0, 0, 0, .1);
	text-shadow: 0 0.25em 0.5em rgba(0, 0, 0, .1);
	opacity: 1;
	cursor: pointer;
	transition: opacity 150ms ease, border .3s ease-in-out;
	transform: translateY(-50%);
	line-height: 1;
}

.prod_title {
	border-bottom: 1px solid #DFDFDF;
	padding-bottom: 5px;
	margin: 30px 0;
	font-size: 20px;
	font-weight: 400;
}

.product_price {
	margin: 20px 0;
	padding: 5px 10px;
	background-color: #FFF;
	text-align: left;
	border: 2px dashed #E0E0E0;
}

.price {
	font-size: 40px;
	font-weight: 400;
	color: #26B99A;
	margin: 0;
}

.btn {
	border-radius: 3px;
	width: 150px;
	text-align: center;
}

.card-header { .
	card-header: first-child{
    border-radius: calc(.25rem - 1px) calc(.25rem - 1px) 0 0;
}

.tabs {
	margin-right: -.625rem;
	margin-bottom: -.75rem;
	margin-left: -.625rem;
	border-bottom: 0;
}

.tabs .tab-link {
	margin-bottom: -1px;
}

.card {
	box-shadow: rgba(0, 0, 0, 0.04) 0px 1px 15px, rgba(0, 0, 0, 0.04) 0px
		1px 6px;
	border: initial;
	background: rgb(255, 255, 255);
	border-radius: 0.1rem;
}

.card .card-body .card-header .tabs {
	position: relative;
	color: rgb(241, 128, 36);
	border: initial;
}

.panel {
    margin-bottom: 20px;
    background-color: #fff;
    border: 1px solid transparent;
    border-radius: 4px;
    -webkit-box-shadow: 0 1px 1px rgba(0,0,0,.05);
    box-shadow: 0 1px 1px rgba(0,0,0,.05);
}

.panel-heading {
	padding: 0;
}

.panel-heading a {
	display: block;
	padding: 20px 10px;
}

.panel-heading a {
	background: #f7f7f7;
	border-eads
}

.nav-tabs {
    border-bottom: 1px solid #ddd;
}

.nav {
    padding-left: 0;
    margin-bottom: 0;
    list-style: none;
}

.nav-tabs>li {
    float: left;
    margin-bottom: -1px;
}

.nav>li {
    position: relative;
    display: block;
}

.nav-tabs>li.active>a, .nav-tabs>li.active>a:focus, .nav-tabs>li.active>a:hover {
    color: #555;
    cursor: default;
    background-color: #fff;
    border: 1px solid #ddd;
    border-bottom-color: transparent;
   }
   
.nav-tabs>li>a {
    margin-right: 2px;
    line-height: 1.42857143;
    border: 1px solid transparent;
    border-radius: 4px 4px 0 0;
}    
</style>
<script type="text/javascript">
	
	$(document).ready(function() {
		
// 		$('.nav-tabs > li').each(function(idx) {
// 			$(this).on("click", function() {
// 				$('.tab-content > .tab-pane').removeClass('active');
// 				$('.tab-content > .tab-pane').eq(idx).addClass('active');
// 			});
// 		});
		$('ul .nav-tabs a').on("click", function(e) {
			e.preventDefault();
			$(this).tab('show');
		});
	});
	
</script>
</head>
<body>
	<!-- Header -->
	<div id="top-nav" class="navbar navbar-inverse navbar-static-top">
		<jsp:include page="/WEB-INF/jsp/module/ManagerHeader.jsp" />
	</div>
	<!-- /Header -->
	<div class="container-fluid">
		<div class="row">
			<jsp:include page="/WEB-INF/jsp/module/ManagerSideMenu.jsp"></jsp:include>
			<div class="col-12">
				<div class="mb-3">
					<h1>Auction Details</h1>
					<nav
						class="breadcrumb-container d-none d-sm-block d-lg-inline-block"
						aria-label="breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="#">Home</a></li>
							<li class="breadcrumb-item"><a href="#">Library</a></li>
							<li class="breadcrumb-item active">Data</li>
						</ol>
					</nav>
					<div class="separator mb-5"></div>
				</div>
			</div>
			<div class="col-12 col-md-5 col-xl-8 col-left">
				<div class="card mb-4">
					<div class="card-body">
						<div
							class="glide details glide--ltr glide--slider glide--swipeable">
							<div class="glide__track" data-glide-el="track">
								<ul class="glide__slides"
									style="transition: transform 0ms cubic-bezier(0.165, 0.84, 0.44, 1) 0s; width: 3924px; transform: translate3d(0px, 0px, 0px);">
									<li class="glide__slide glide__slide--active"
										style="width: 732px; margin-right: 5px;"><img
										alt="detail"
										src="${pageContext.request.contextPath}/img/foodEx.jpg"
										class="responseive border-0 border-radius img-fluid mb-3"
										style="width: 100%; height: auto;"></li>
									<li class="glide__slide"
										style="width: 607px; margin-left: 5px; margin-right: 5px;">
										<img alt="detail"
										src="${pageContext.request.contextPath}/img/foodEx1.jpg">
									</li>
									<li class="glide__slide glide__slide--active"
										style="width: 732px; margin-right: 5px;"><img
										alt="detail"
										src="${pageContext.request.contextPath}/img/foodEx.jpg"
										class="responseive border-0 border-radius img-fluid mb-3"
										style="width: 100%; height: auto;"></li>
									<li class="glide__slide"
										style="width: 607px; margin-left: 5px; margin-right: 5px;">
										<img alt="detail"
										src="${pageContext.request.contextPath}/img/foodEx1.jpg">
									</li>
									<li class="glide__slide glide__slide--active"
										style="width: 732px; margin-right: 5px;"><img
										alt="detail"
										src="${pageContext.request.contextPath}/img/foodEx.jpg"
										class="responseive border-0 border-radius img-fluid mb-3"
										style="width: 100%; height: auto;"></li>
								</ul>
							</div>
						</div>
						<!-- 밑둥이 사진 -->
						<div
							class="glide thumbs glide--ltr glide--slider glide--swipeable"
							style="width: 350px;">
							<div class="glide__track">
								<ul class="glide__slides"
									style="transition: transform 400ms cubic-bezier(0.165, 0.84, 0.44, 1) 0s; width: 432px; transform: translate3d(0px, 0px, 0px);">
									<li class="glide__slide glide__slide--active active"
										style="width: 62px; margin-right: 5px;"><img alt="thumb"
										src="${pageContext.request.contextPath}/img/foodEx.jpg"
										class="responsive border-0 border-radius img-fluid"></li>

									<li class="glide__slide"
										style="width: 62px; margin-left: 5px; margin-right: 5px;">
										<img alt="thumb"
										src="${pageContext.request.contextPath}/img/foodEx1.jpg"
										class="responsive border-0 border-radius img-fluid">
									</li>

									<li class="glide__slide glide__slide--active active"
										style="width: 62px; margin-right: 5px;"><img alt="thumb"
										src="${pageContext.request.contextPath}/img/foodEx.jpg"
										class="responsive border-0 border-radius img-fluid"></li>

									<li class="glide__slide"
										style="width: 62px; margin-left: 5px; margin-right: 5px;">
										<img alt="thumb"
										src="${pageContext.request.contextPath}/img/foodEx1.jpg"
										class="responsive border-0 border-radius img-fluid">
									</li>

									<li class="glide__slide glide__slide--active active"
										style="width: 62px; margin-right: 5px;"><img alt="thumb"
										src="${pageContext.request.contextPath}/img/foodEx.jpg"
										class="responsive border-0 border-radius img-fluid"></li>
								</ul>
							</div>
							<div class="glide__arrows" style="display: block;">
								<button class="glide__arrow glide__arrow--left">
									<i class="simple-icon-arrow-left"> &#10094; </i>
								</button>
								<button class="glide__arrow glide__arrow--right">
									<i class="simple-icon-arrow-right"> &#10095; </i>
								</button>
							</div>
						</div>
					</div>
				</div>
				<div class="card col-mb-4">
					<div class="card-body" style="margin-top: 45px;">
						<div class="panel">
                        <ul class="nav nav-tabs" id="myTab">
                            <li class="active"><a href="#profile" data-toggle="tab">Profile</a></li>
                            <li><a href="#messages" data-toggle="tab">Details</a></li>
                            <li><a href="#settings" data-toggle="tab">Comments</a></li>
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane active well" id="profile">
                            	<h5>회원 이름 : ${auction.m_pk_writer}</h5>
                            	<h5>회원 아이디 :  ${member.m_id }</h5>
                            	<h5>회원 비밀번호 : ${member.m_password}</h5>
                            	<h5>회원 이메일 : ${member.m_email }</h5>
                            	<h5>회원 휴대번호 : ${member.m_phonenum }</h5>
                            </div>
                            <div class="tab-pane well" id="messages">
                                <h5>${auction.a_details }</h5>
                            </div>
                            <div class="tab-pane well" id="settings">
                                <h5>${auction.a_comment }</h5>
                            </div>
                        </div>
                    </div>
					</div>
				</div>
			</div>
			<div class="card-body">
				<div class="card col-md-3"
					style="border: 0px solid #d7d7d7; padding-bottom: 15px;">
					<h1 class="prod_title" style="font-weight: bold;">
						<font style="vertical-align: inherit;"> 
						<font style="vertical-align: inherit; font-weight: bold;">${auction.a_title} </font>
						</font>
					</h1>
					<p style="margin: 0 0 10px;">
						<font style="vertical-align: inherit;">
						<font style="vertical-align: inherit;"> 로즈우드를 잘라다가 자르고 갈고 가공을 수십번하여 사람들이 좋아하는 모양으로 만든 굿즈입니다.</font>
<%-- 						<font style="vertical-align: inherit;"> ${aution.a_details } </font> --%>
						</font>
					</p>
					<br>
					<div class="date">
						<h3>
							<font style="vertical-align: inherit;">경매기간</font>
						</h3>
<%-- 						<small> <font style="vertical-align: inherit;">${aution.a_starttime } / ${aution.a_endtime }</font> --%>
<!-- 						</small> -->
							<small> <font style="vertical-align: inherit;">2019년 10월 1일 ~ 2019년 10월 31일</font></small>
					</div>
					<br>
					<div>
						<h3 class="price">
							<font style="vertical-align: inherit;">
							<font style="vertical-align: inherit;"> 1,500,000 원 </font>
<%-- 							<font style="vertical-align: inherit;"> ${aution.a_endprice } </font> --%>
							</font>
						</h3>
						<span class="price-tax">
						<font style="vertical-align: inherit;">
<%-- 							<font style="vertical-align: inherit;">시작가금액 : ${aution.a_startprice } </font> --%>
							<font style="vertical-align: inherit;">시작가금액 : 1,000,000 원</font>
						</font>
						</span>
					</div>
					<br>
					<div>
						<input type="button" class="btn btn-default btn-lg" onclick="location.href='Amodify?a_pk=${auction.a_pk}'" value="수정">
<%-- 						<button type="button" class="btn btn-default btn-lg" onclick="location.href='modify?a_pk=${auction.a_pk}'">수정</button> --%>
						<button type="button" class="btn btn-default btn-lg" onclick="">삭제</button>
					</div>
				</div>
			</div>
		</div>
		<div class="row"></div>
	</div>
		<script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
<!-- 		<script src="js/bootstrap.min.js"></script> -->
		<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
		<script src="${pageContext.request.contextPath}/js/scripts.js"></script>
</body>
</html>