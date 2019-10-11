<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<title>HANDUS|관리자 페이지</title>
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
<script type="text/javascript">
	$(document).ready(function() {
		//perPageNum select 박스 설정
		setPerPageNumSelect();
		
		//prev 버튼 활성화, 비활성화 처리
		var canPrev = '${pageMaker.prev}';
		if(canPrev !== 'true') {
			$('#page-prev').addClass("disabled");
		}
		
		//next 버튼 활성화, 비활성화 처리
		var canNext = ${pageMaker.next};
		if(canNext !== 'true') {
			$('#page-next').addClass('disabled');
		}
		
		//현재 페이지 파란색으로 활성화
		var thisPage = '${pageMaker.cri.page}';
		//매번 refresh되므로 다른 페이지 removeClass 할 필요는 없다.
		$('#page' + thisPage).addClass('active');
	});
</script>
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
					<h1>Member list</h1>
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
										<th scope="col">회원번호</th>
										<th scope="col">이름</th>
										<th scope="col">이메일</th>
										<th scope="col">인증여부(E/P)</th>
									</tr>
								</thead>
								<c:forEach items="${memberList }" var="member">
									<tbody>
										<tr>
											<td scope="row">${member.m_pk }</td>
											<td><a href='Mdetail?m_pk=${member.m_pk }'>${member.m_name }</a></td>
											<td>${member.m_email }</td>
											<td>${member.m_eval }/${member.m_pval }</td>
										</tr>
									</tbody>
								</c:forEach>
								<tr>
									<td colspan="2">
										<form action="boardList">
											<select name="type">
												<option value="4">작성자</option>
											</select> <input type="text" name="keyword" placeholder="검색어를 입력하세요">
											<input type="submit" value="검색">
										</form>
									</td>
								</tr>
							</table>
						</div>
					</div>
					<%-- 페이지 네비게이션 --%>
					<div class="box-footer">
						<div class="text-center">
							<nav class="pagination">
								<ul class="pagination">
									<!-- prev 버튼 -->
									<li id="page=prev" class="page-item disabled">
										<a class="page-link" href="memberList${pageMaker.makeQuery(pageMaker.startPage-1)}" aria-label="Prev">&laquo;</a>
									</li>
									<!-- 페이지 번호 (시작 페이지 번호부터 끝 페이지 번호까지)-->
									<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
										<li class="page-item active" id="page${idx}">
											<a class="page-link" href="memberList${pageMaker.makeQuery(idx)}"></a>
										</li>
									</c:forEach>	
									<!-- next 버튼 -->
									<li class="page-item" id="page-next">
										<a class="page-link" href="memberList${pageMaker.makeQuery(pageMaker.endPage +1)}" aria-label="NextS">&raquo;</a>
									</li>
								</ul>
							</nav>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$(function() {
			function setPerPageNumSelect() {
				var perPageNum = "${pageMaker.cri.perPageNum}";
				var $perPageSel = $('#perPageSel');
				var thisPage = '${pageMaker.cri.page}';
				$perPageSel.val(perPageNum).prop("selected", true);
				
				//perPageNum 이 바뀌면 링크이동
				$perPageSel.on('change', function() {
					//pageMaker.makeQuery 사용 못하는 이유 : makeQuery는 page만을 매개변수로 받기에 변경된 perPageNum을 반영못함	
					window.location.href= "memberList?page="+thisPage+&perPageNum="perPageSel.val()";
				});
			}
		});
	</script>
	<script
		src="//ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
		<script src="${pageContext.request.contextPath}/js/scripts.js"></script>
</body>
</html>