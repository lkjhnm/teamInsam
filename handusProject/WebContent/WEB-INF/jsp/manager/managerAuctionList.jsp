<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<title>HANDUS|관리자 페이지-경매</title>
<meta name="generator" content="Bootply" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/styles.css">
<style type="text/css">
.breadcrumb {
	background-color: transparent;
	margin-bottom: .5rem;
}

.item-list .item>.item-row {
	padding: 0 15 px;
}

.item-list .item-col>div {
	width: 100%;
}
</style>
</head>
<body>
	<!-- Header -->
	<div id="top-nav" class="navbar navbar-inverse navbar-static-top">
		<jsp:include page="/WEB-INF/jsp/module/ManagerHeader.jsp" />
	</div>
	<!-- /Header -->
	<!-- Main -->
	<div class="container-fluid">
		<div class="row">
			<jsp:include page="/WEB-INF/jsp/module/ManagerSideMenu.jsp"></jsp:include>
			<!-- /col-3 -->
			<div class="col-12">
				<div class="mb-3">
					<h1>Auction list</h1>
					<nav
						class="breadcrumb-container d-none d-sm-block d-lg-inline-block"
						aria-label="breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="#">Home</a></li>
							<li class="breadcrumb-item"><a href="#">Library</a></li>
							<li class="breadcrumb-item active">Data</li>
						</ol>
					</nav>
				</div>
				<div class="col-md-9 card items">
					<div class="item-row">
						<div class="">
							<table class="table table-hover">
								<thead>
									<tr>
										<th scope="col">No</th>
										<th scope="col">title</th>
										<th scope="col">Name</th>
										<th scope="col">Comment</th>
										<th scope="col">Term</th>
										<th scope="col">S.Price</th>
										<th scope="col">E.Price</th>
										<th scope="col">Date</th>
									</tr>
								</thead>
								<c:forEach items="${auctionList }" var="item">
									<tbody>
										<tr>
											<td>${item.a_pk }</td>
											<td><a href='Adetail?a_pk=${item.a_pk}'>${item.a_title}</a></td>
											<td>${item.m_pk_writer }</td>
											<td>${item.a_comment }</td>
											<td>${item.a_startTime } ~ ${item.a_endTime}</td>
											<td>${item.a_startPrice }</td>
											<td>${item.a_endPrice}</td>
											<td>${item.a_regDate }</td>
										</tr>
									</tbody>
								</c:forEach>
							</table>
						</div>
					</div>
					<div>

					</div>
				</div>
			</div>
		</div>
	</div>
	<script
		src="//ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
		<script src="${pageContext.request.contextPath}/js/scripts.js"></script>
</body>
</html>