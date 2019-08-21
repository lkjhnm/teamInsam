<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HadusFAQ</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/handus.css" />
<style type="text/css">
.title_top {
	border-bottom: 1px solid gray;
	padding-bottom: 20px;
	margin-top: 30px;
	margin-bottom: 30px;
	margin-left: 90px;
}

.contents_handus {
	min-height: 450px;
	margin: 0 auto;
	padding: 50px;
}

.title_top h3 {
	font-size: 24px;
	font-weight: bold;
	color: red;
	margin: 0;
	line-height: 1.0;
	position: relative;
}

.title_top h3 span {
	display: inline-block;
	color: gray;
	font-size: 15px;
	font-weight: normal;
	margin-left: 15px;
}

.faq_wrap {
	margin: auto;
}

#tabList {
	margin: 10px auto;
	margin-left: 90px;
	margin-right: 90px;
	padding: 0;
}

.tabList_btn {
	display: block;
	clear: both;
	margin: 0 0;
	padding: 0;
	border-left: 1px solid #b8b5b0;
	/*  	border-bottom: 1px solid #b8b5b0; */
}

.tabList_btn .btnOn {
	float: left;
 	width: 20%; 
/* 	width: calc(16.66% - 1px); */
	margin: 0 0;
	padding: 0;
	border: 1px #b8b5b0 solid;
	border-left: none;
	text-align: center;
	vertical-align: middle;
	cursor: pointer;
	font-weight: bold;
	color: #000;
	height: 40px;
	line-height: 40px;
	background: #FFD209;
	font-size: 13px;
	s
}

.tabList_btn .btnOff {
	float: left;
 	width: 20%; 
/* 	width: calc(16.66% - 1px); */
	height: 40px;
	line-height: 40px;
	margin: 0;
	padding: 0;
	border: 1px #b8b5b0 solid;
	border-left: none;
	text-align: center;
	vertical-align: middle;
	cursor: pointer;
	font-size: 13px;
	color: #333;
	background: #fafafa;
}

.tabList_contents {
	font-size: 13px;
	color: #333;
	padding-top: 15px;
	size: auto;
	margin-top: 0px;
}

.btnSet {
	display: none;
}

.dfcont {
	display: block;
	clear: both;
	overflow: auto;
}

.dfcont.btnSet {
	text-align: right
}

img {
	border: none;
	vertical-align: top;
}

.dfcont.btnSet.OpenBtn {
	margin-right: 1px;
	cursor: pointer;
	overflow: auto;
}

.dfcont.btnSet.CloseBtn {
	cursor: pointer;
	overflow: auto;
}

.dfcont dt {
	font-weight: bold;
	text-align: left;
	border-bottom: 1px solid #b8b5b0;
	padding: 10px 35px;
	line-height: 18px;
	overflow: auto;
	background: url('${pageContext.request.contextPath }/img/q.jpg') no-repeat 5px 10px;
}

.dfcont dt a {
	text-decoration: none;
	color: #555;
}

p {
	margin-block-start: 1em;
	margin-block-end: 1em;
	margin-inline-start: 0px;
	margin-inline-end: 0px;
}

.dfcont, btnSet {
	text-align: right;
}

.btnSet {
	display: none;
}

.dfcont dd {
	display: none;
	padding: 8px 35px;
	line-height: 1.8;
	color: #666;
	border-bottom: 1px solid #eee;
 	overflow: auto;
 	background: url('${pageContext.request.contextPath }/img/a.png')no-repeat 5px 10px;
}

</style>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://kit.fontawesome.com/c62d0d5d4f.js"></script>
<script type="text/javascript">
	
$(function(){
	
	function returnInfo(n) {
		for(var i = 1; i<4; i++) {
			obj_C = document.getElementById('returnInfo_0'+i);
			if(n == i) {
				obj_C.style.display = "block";
			}else {
				obj_C.style.display = "none";
			}
		};
	};
	
});
	
	
</script>
</head>
<body>
	<div class='container'>
		<!-- 필수!! side,header는 필요에따라 추가 하면됩니다. -->
		<jsp:include page="/WEB-INF/jsp/module/sideMenu.jsp" />
		<jsp:include page="/WEB-INF/jsp/module/header.jsp" />

		<div class="contents_handus">
			<div class="faq_wrap">
				<br>
				<div class="title_top">
					<h3>
						FAQ <span>자주 묻는 질문</span>
					</h3>
				</div>
				<!-- end "titlee_top" -->
			</div>
			<!-- end "faq_wrap -->
			<div id="tabList">
				<div id="returnInfo01" style="display: block">
					<div class="tabList_btn">
						<span class="btnOn" onclick="returnInfo(1);">주문/결제</span> <span
							class="btnOff" onclick="returnInfo(2);">로그인/회원가입</span> <span
							class="btnOff" onclick="returnInfo(3)">기타문의</span>
					</div>
					<!-- end "tabList_btn" -->
					<div class="tabList_contents">
						<div id="dbf" class="dfcont">
<!--  							<p class="btnSet"> -->
<!-- 								<img style='width: 20px; height: 20px;' -->
<%-- 									src="${pageContext.request.contextPath }/img/q.png" class="OpenBtn"> --%>
<%-- 									<img src="${pageContext.request.contextPath }/img/a.png"class="CloseBtn"> --%>
<!-- 							</p>  -->
							<dl>
								<dt>
<%-- 									<img style='width: 20px; height:20px;' src="${pageContext.request.contextPath }/img/q.png"> --%>
									<a href="#">결제 방법에는 무엇무엇이 있나요?</a>
								</dt>
								<dd>질문에 관한 내용 불러온 텍스트</dd>
								<dt>
<%-- 									<img style='width: 20px; height:20px;' src="${pageContext.request.contextPath }/img/q.png"> --%>
									<a href="#">취소/환불은 어떻게 하나요?</a>
								</dt>
								<dd>질문에 관한 내용 불러온 텍스트</dd>
								<dt>
<%-- 									<img style='width: 20px; height:20px;' src="${pageContext.request.contextPath }/img/q.png"> --%>
									<a href="#">장바구니에 담아놓은 상품이 사라졌어요!</a>
								</dt>
								<dd>질문에 관한 내용 불러온 텍스트</dd>
								<dt>
<%-- 									<img style='width: 20px; height:20px;' src="${pageContext.request.contextPath }/img/q.png"> --%>
									<a href="#">적립금/예치금 사용방법</a>
								</dt>
								<dd>질문에 관한 내용 불러온 텍스트</dd>
							</dl>
						</div>
					</div>
				</div>
				<!--  end "returnInfo01" -->
				<div id="returnInfo02" style="display: none">
					<div class="tabList_btn">
						<span class="btnOff" onclick="returnInfo(1);">주문/결제</span> <span
							class="btnOn" onclick="returnInfo(2);">로그인/회원가입</span> <span
							class="btnOff" onclick="returnInfo(3)">기타문의</span>
					</div>
					<!-- end "tabList_btn" -->
					<div class="tabList_contents">
						<div id="dbf2" class="dfcont">
							<dl>
								<dt>
									<a href="#">회원정보 변경은 어떻게 하나요?</a>
								</dt>
								<dt>
									<a href="#">회원탈퇴는 어떻게 하나요?</a>
								</dt>
								<dt>
									<a href="#">ID와 비밀번호를 잊어버렸어요</a>
								</dt>
							</dl>
						</div>
					</div>
				</div>
				<div id="returnInfo03" style="display: none">
					<div class="tabList_btn">
						<span class="btnOff" onclick="returnInfo(1);">주문/결제</span> <span
							class="btnOff" onclick="returnInfo(2);">로그인/회원가입</span> <span
							class="btnOn" onclick="returnInfo(3)">기타문의</span>
					</div>
					<!-- end "03 tabList_btn" -->
					<div class="tabList_contents">
						<div id="dbf3" class="dfcont">
							<dl>
								<dt>
									<a href="#">HANDUS란?</a>
								</dt>
								<dt>
									<a href="#">알람설정은 어떻게 하나요?</a>
								</dt>
								<dt>
									<a href="#">구매후기는 어떻게 남기나요?</a>
								</dt>
								<dt>
									<a href="#">HANDUS에 작품을 판매하고 싶어요!</a>
								</dt>
							</dl>
						</div>
					</div>
					<!-- end "03 tabList_contents" -->
				</div>
				<!-- end returnInfo03 -->
			</div>
			<!-- end "tabList" -->
		</div>
		<!-- end "contents_handus -->
	</div>






















</body>
</html>