<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<title>HANDUS|관리자 페이지</title>
<meta name="generator" content="Bootply" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<!--[if lt IE 9]>
			<script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/styles.css">

<style type="text/css">

.container-fluid .card {
    border-radius: .75rem;
}


.card {
    border: initial;
    background: #fff;
    border-radius: .1rem;
    box-shadow: 0 1px 15px rgba(0,0,0,.04), 0 1px 6px rgba(0,0,0,.04);
}



.card .card-body {
	padding: 1.75rem;
}

.card-body {
	-webkit-box-flex: 1;
	-ms-flex: 1 1 auto;
	flex: 1 1 auto;
	padding: 1.25rem;
}

.text-center {
    text-align: center!important;
}

.pb-5, .py-5 {
    padding-bottom: 3rem!important;
}

.pt-5, .py-5 {
    padding-top: 3rem!important;
}

.list-thumbnail {
    border-radius: 50%;
    padding: 0;
    border: initial;
    height: auto;
    max-width: unset;
    height: 100px;
    object-fit: cover;
    width: unset;
    S
}

.img-thumbnail {
  	position: relative;
    display: inline-block;
    background: url(cat.jpg) center center no-repeat;
    border-radius: 50%;
    width: 130px;
    height: 130px;
}

h5 {
    font-size: 20px;
}

.color-theme-1 {
	padding-top: 15px;
    color: #f18024;
	
}

.font-weight-semibold {
    font-weight: 600;
}



.pl-3, .px-3 {
    padding-left: 1rem!important;
}
.pr-3, .px-3 {
    padding-right: 1rem!important;
}
.pt-3, .py-3 {
    padding-top: 1rem!important;
}
.pb-0, .py-0 {
    padding-bottom: 0!important;
}
.align-items-center {
    -webkit-box-align: center!important;
    -ms-flex-align: center!important;
    align-items: center!important;
}



</style>
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
			<div class="col-md-6 col-center" style="margin: 0 auto;">
				<div class="card mb-8">
					<div class="card-body text-center pt-5 pb-5">
						<h2>Edit auction</h2>
						<form action="Amodify" method="post">
							<input type="hidden" name="a_pk" value="${auction.a_pk }">
								<img alt="thumb" class="img-thumbnail border-0 rounded-circle mb-4 list-thumbnail mx-auto" src="${pageContext.request.contextPath}/img/foodEx.jpg">
								<h5 class="mb-0 font-weight-semibold color-theme-1 mb-3">${auction.m_pk_writer}</h5>
							<div class="pl-3 pr-3 pt-3 pb-0 flex-grow-1 d-flex align-items-center">
							<table style="margin: 0 auto;">
								<tr>
									<th>제목 : </th>
									<td><input type="text" name="a_title" value ="${auction.a_title }" style="width: 100%; padding: 5px; margin: 10px;"></td>
								</tr>
								
								<tr>
									<th>기간 : </th>
									<td><input type="date" name="a_starttime" value ="${auction.a_startTime}" style="margin: 10px; height: 30px;"> ~ <input type="date" name="a_endtime" value ="${auction.a_endTime }" style="margin: 10px; height: 30px;"></td>
								</tr>
								
								<tr>
									<th>색상 : </th>
									<td><input type="color" name="a_color1" style="margin: 10px;"> / <input type="text" name="a_color" value="${auction.a_color }" style="margin: 10px; width: 70%;"></td>
								</tr>
								
								<tr>
									<th>내용 : </th>
									<td><textarea rows="6" cols="50" style="margin: 10px;"></textarea></td>
								</tr>
								
								<tr>
									<td colspan="2" align="center">
										<input type="submit" value = "수정">
										<input type="reset"  value = "다시작성">
										<input type="button" value ="목록" onclick="location.href='managerAuctionList'">
									</td>
								</tr>
							</table>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script
		src="//ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
	<!-- 		<script src="js/bootstrap.min.js"></script> -->
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/scripts.js"></script>
</body>
</html>