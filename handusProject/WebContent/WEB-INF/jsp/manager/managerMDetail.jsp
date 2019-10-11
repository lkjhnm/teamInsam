<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<title>HANDUS|관리자페이지</title>
<meta name="generator" content="Bootply" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css">
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
	padding: 18px;
	position: relative;
	margin-bottom: 10px;
	background: #fff;
}


.col-left {
	padding-right: 20px;
}

@media (min-width: 1200px)
.col-xl-4 {
    -webkit-box-flex: 0;
    -ms-flex: 0 0 33.33333%;
    flex: 0 0 33.33333%;
    max-width: 33.33333%;
}

@media (min-width: 992px)
.col-lg-5 {
    -webkit-box-flex: 0;
    -ms-flex: 0 0 41.66667%;
    flex: 0 0 41.66667%;
    max-width: 41.66667%;
}


.mb-4, .my-4 {
    margin-bottom: 1.5rem!important;
}

.card-top-buttons {
    padding: 1.3rem;
    right: 0;
    top: 0;
}
.position-absolute {
    position: absolute!important;
}

button:not(:disabled) {
    cursor: pointer;
}

.icon-button {
    padding: 0;
    font-size: 14px;
    width: 34px;
    height: 34px;
    line-height: 34px;
}
.btn-outline-white {
    color: #fff;
    border-color: #fff;
    background-color: initial;
}

.simple-icon-pencil {
	font-family: 'simple-line-icons';
    speak: none;
    font-style: normal;
    font-weight: normal;
    font-variant: normal;
    text-transform: none;
    line-height: 1;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
}

.list-thumbnail {
    border-radius: .1rem;
    padding: 0;
    border: initial;
    height: auto;
    max-width: unset;
    height: 85px;
    object-fit: cover;
    width: unset;
}


.text-muted {
    color: #909090!important;
}
.text-small {
    font-size: 12px;
    line-height: .9rem!important;
    padding: 5px;
}
.mb-2, .my-2 {
    margin-bottom: .5rem!important;
}
.mb-3, .my-3 {
    margin-bottom: 1rem!important;
}

p {
    font-size: 15px;
    padding: 5px;
    line-height: 1.3rem;
    font-family: Nunito,sans-serif;
}

p {
    margin-top: 0;
    margin-bottom: 1rem;
}


h5 {
    font-size: 20px;
}

.rounded .card {
    border-radius: .75rem;
}

.card-top-buttons {
    padding: 1.3rem;
    right: 0;
    top: 0;
}
.position-absolute {
    position: absolute!important;
}

button:not(:disabled) {
    cursor: pointer;
}


.btn-header-light {
    color: #d7d7d7;
    border-color: transparent;
    background: 0 0;
}

.card .card-title {
    margin-bottom: 2rem;
}

.position-relative {
    position: relative!important;
}
.d-block {
    display: block!important;
}
a {
    color: #3a3a3a;
    transition: color .2s;
    outline: initial!important;
}

.rounded .list-thumbnail {
    border-radius: .75rem;
}

.border-0 {
    border: 0!important;
}
.pl-3, .px-3 {
    padding-left: 1rem!important;
}
.pb-2, .py-2 {
    padding-bottom: .5rem!important;
}
.pr-2, .px-2 {
    padding-right: .5rem!important;
}
.pt-2, .py-2 {
    padding-top: .5rem!important;
}
.list-item-heading {
    font-size: 1rem;
}

.rounded .list-thumbnail {
    border-radius: .75rem;
}

.position-relative {
    position: relative!important;
}

.border-0 {
    border: 0!important;
}

tbody {
    display: table-row-group;
    vertical-align: middle;
    border-color: inherit;
}

body, input, textarea, select, button, table {
    color: #555;
    font-size: 14px;
    font-family: Arial, nbgr, '나눔바른고딕', '돋음';
    *font-family: nbgr;
    line-height: 24px;
}

.table_row .input th, .table_col .input th {
    padding-top: 22px;
}




.table_col th {
    padding-left: 40px;
    background-color: #f8f8f8;
    color: #222;
    text-align: left;
}

.member_info .table_col td {
    padding: 15px 20px;
}

.table_col th {
    padding-left: 40px;
    background-color: #f8f8f8;
    color: #222;
    text-align: left;
}

.member_info .table_col td {
    padding: 15px 20px;
}

label {
    vertical-align: middle;
}
.table_row .input th, .table_col .input th {
    padding-top: 22px;
}

.member_info .table_col td {
    padding: 15px 20px;
}

.table_col td {
    background-color: #fff;
}

.input_txt input {
    display: block;
    width: 100%;
    height: 32px;
    padding: 0 15px;
    border: 1px solid #ddd;
    color: #888;
    font-size: 14px;
    line-height: 32px;
}

input[type='text'], input[type='password'], input[type='text'], input[type='tel'] {
    -webkit-border-radius: 0;
    -webkit-appearance: none;
}

.table_row table, .table_col table, .board_list table {
    width: 100%;
    border: 0 none;
    border-collapse: collapse;
}

.table_col th, .table_col td {
    padding: 23px 20px 21px 20px;
    border-bottom: 1px solid #ddd;
}
.table_row th, .table_row td, .table_col th, .table_col td, .board_list th, .board_list td {
    vertical-align: top;
}
table th {
    color: #222;
    font-weight: normal;
}

.table_header {
	padding-top: 22px;
	padding-left: 20px;
    position: relative;
    padding-bottom: 5px;
}

.h1_tit, .h2_tit, .h3_tit, .h4_tit, .h5_tit {
    margin: 0;
    color: #222;
    font-weight: normal;
}
.h3_tit {
	margin-top: 20px;
    font-size: 22px;
}
.btn {
    display: inline-block;
    min-width: 128px;
    height: 38px;
    margin: 0 3px;
    *margin: 0 5px;
    padding: 0 15px;
    border: 1px solid #333;
    border-radius: 3px;
    background-color: #fff;
    color: #333;
    text-align: center;
    line-height: 38px;
    vertical-align: middle;
    cursor: pointer;
    transition: border .5s, background .5s, color .5s;
}
	
</style>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script> 
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/scripts.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
			
		$("#Mdelete").on("click", function() {
			if(confirm("정말 삭제 하시겠습니까?") == true) {
				document.removefrm.submit();
				alert("삭제되었습니다.");
				location.href="managerMember";
			} else {
				alert("취소되었습니다.");
				return false;
			}			
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
				<div class="tab-content">
					<div class="tab-pane show active" id="first" role="tabpane1" aria-labelledby = "first-tab">
						<div class="row">
							<div class="col-12 col-lg-6 col-xl-4 col-left">
								<div class="card mb-6">
									<div class="card-body col-center">
									<form action="Mdelete" method="post" name="removefrm">
										<div class="table_col">
											<div class="table_header">
												<h3 class="h3_tit">기본정보</h3>
											</div>
											<div class="con-tb-userInfo">
												<input type="hidden" name="m_pk" value="${member.m_pk}">
											<table>
												<colgroup>
												<col style="width: 25%">
												<col>
												</colgroup>
												<tbody>
													<tr class="input">
														<th scope="row" style="font-weight: bold;">이름</th>
														<td>
															<div class="input_group">
																<span id="hg_nm_area">${member.m_name}</span>
															</div>
														</td>
													</tr>
													<tr>
														<th scope="row" style="font-weight: bold;">아이디</th>
														<td>
															<span id="mbr_id_area" name="m_id">${member.m_id}</span>
														</td>
													</tr>
													<tr>
														<th scope="row" style="font-weight: bold;">비밀번호</th>
														<td>
															<div class="mbr_pw_area">${member.m_password}</div>
														</td>
													</tr>
													<tr>
														<th scope="row">
															<label for="mob_no_1">휴대전화</label>
														</th>
														<td>
															<div class="phon_write" style="width: 326px;">
																<span>
																	${member.m_phonenum }
																</span>
															</div>
														</td>
													</tr>
													<tr>
														<th scope="row">
															<label for="email_addr1">이메일</label>
														</th>
														<td>
															<div class="email_write" style="width: 415px;">
																<span>
																	<input type="text" class="text-small" id="m_email" value="${member.m_email}" disabled="disabled" style="border: 1px solid #ddd;">
																</span>
															</div>
														</td>
													</tr>
													<tr class="input">
														<th scope="row" style="font-weight: bold;">주소</th>
														<td>
															<div class="input_group">
																<span id="hg_nm_area">${member.m_address}</span>
															</div>
														</td>
													</tr>
												</tbody>
											</table>
											</div>
										</div>
									</form>
									</div>
									<div style="text-align: center; padding: 20px;">
										<input class="btn" type="button" value="목록" onclick="location.href='managerMember'">
<%-- 										<input class="btn" type="button" onclick="location.href='Mmodify?m_pk=${member.m_pk}'" value="수정"> --%>
										<input class="btn" id="Mdelete" type="button" value="삭제">
									</div>
								</div> 						
							</div>
							<div class="col-12 col-lg-7 col-xl-8 col-right"></div>
						</div>	
					</div>
				</div>	
			</div>			
		</div>
	</div>	
</body>
</html>