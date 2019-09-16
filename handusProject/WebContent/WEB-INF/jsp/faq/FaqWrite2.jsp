<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hadus|FAQ</title>
<%
	String contextPath = request.getContextPath();
	request.setAttribute("contextPath", contextPath);
%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/handus.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/handusFAQ2.css" />
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://kit.fontawesome.com/c62d0d5d4f.js"></script>
<style type="text/css">
ul {
	list-style: none;
}

p {
	padding-top: 20px;
	padding-bottom: 20px;
}


a {
	text-decoration: none;
}


legend {
	position: absolute;
	overflow: hidden;
	visibility: hidden;
	height: 0;
	z-index: -1;
}

.faq_search label {
	display: inline-block;
	margin: 0 20px 0 0;
	color: #222;
	font-size: 20px;
	line-height: 38px;
	vertical-align: middle;
}

fieldset {
	border: 0;
}

/* tbody { */
/* 	display: table-row-group; */
/* 	vertical-align: middle; */
/* 	border-color: inherit; */
/* } */
</style>

<script type="text/javascript">

// $(document).ready(function(){
// 	function returnInfo(menuId) {
// 		var id = "#" + menuId;
// 		$("span.tabMenu").removeClass("btnOn");
// 		$("span.tabMenu").addClass("btnOff");
// 		$(id).addClass("btnOn");
// 	}
	
// 	$("#order").text();
	
// });


	$(function() {
		/* 메뉴 탭리스트 */
// 		function returnInfo(evt, menu) {
// 			var i, x, tablinks;
// 			x = document.getElementsByClassName("list");
// 			for( i = 0; i<x.length; i++) {
// 				x[i].style.display = "none";
// 			}
// 			tablinks = document.getElementsByClassName("tablinks");
// 			for( i=0; i<x.length; i++) {
// 				tablinks[i].className = tablinks[i].className.replace("btnOn", "");
// 			}
// 			document.getElementbyId(menu).style.display = "block";
// 			evt.currentTarget.className += "btnOn";
// 		}
		
		
		
		$("#order").on("click", function() {
			$("#order").addClass("btnOn").css('background-color', 'white');	
			$("#order").removeClass("btnOff").css('background-color', '#98ab12');
		});
		$("#login").on("click", function() {
			$("#login").addClass("btnOn").css('background-color', 'white');	
			$("#login").removeClass("btnOff").css('background-color', '#98ab12');
			
		});
		$("#other").on("click", function() {
			$("#other").addClass("btnOn").css('background-color', 'white');	
			$("#other").removeClass("btnOff").css('background-color', '#98ab12');
		});
		$("dt")
			
		
		
		
		
//		faqToggle("#tablelist-contents-faq1 dl dt");
// 		faqToggle("#tablelist-contents-faq2 dl dt");
// 		faqToggle("#tablelist-contents-faq3 dl dt");
		
		// 탭메뉴
		
		
		
		
		// 질문/답변 펼치기접기
// 		$(document).ready(function()){
// 			function faqToggle(selector){
// 				$(selector).each(function(){
// 					$(this).click(function(){
// 						if($(this).next().is(":hidden")){
// 							$(this).next().show();
// 						}else {
// 							$(this).next().hide();
// 						}
// 					});
// 				});
// 			}
// 		}

// 		function returnInfo(n)
// 			 {
// 				for(var i = 1; i < 7; i++) {
// 					obj_C = document.getElementById('returnInfo_0'+i);
// 					if ( n == i ) 	{obj_C.style.display = "block";}
// 					else 			{obj_C.style.display = "none";}
// 				}
// 			}
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
				<div class="title_top">
					<h3 style="letter-spacing: 0.2em;">SERVICE CENTER</h3>
				</div>
				<!-- end "title_top" -->
				<div class="faq_search">
					<form id="sForm" name="sForm">
						<fieldset class="search-faq">
							<legend>FAQ 검색</legend>
							<label for="inqTitNm">Search</label>
							<div class="input">
								<input type="text" id="inqTitNm" name="inqTitNm" title="검색어를 입력하세요." placeholder="질문을 검색하세요.">
								<input type="submit" id="searchFaq" value="검색">
							</div>
						</fieldset>
					</form>
				</div>
				<!-- end "faq_search" -->
				<div class="faq-content-wrap">
					<div id="faq-tablist">
						<div id="returnInfo_01" class="returnInfo">
							<div class="tablist_menu">							
								<span id="order" class="tabMenu btnOn" ><a href="javascript:returnIfo(order)">주문/결제</a></span>
								<span id="login" class="tabMenu btnOff"><a href="javascript:returnInfo(login)">로그인/회원</a></span>
								<span id="other" class="tabMenu btnOff"><a href="javascript:returnInfo(other)">기타 문의</a></span>
							</div>
							<div class="tablist-contents">
								<div id="tablelist-contents-faq1" class="tablist-contents-faq">
<%-- 									<c:forEach items="${allFaq}" var="faq"> --%>
									<dl id="faqs">
										<dt><a href="#">제목1</a></dt>
										<dd>답변1</dd>
										<dt><a href="#">제목2</a></dt>
										<dd>답변2</dd>
										<dt><a href="#">제목3</a></dt>
										<dd>답변3</dd>
									</dl>
<%-- 									</c:forEach> --%>
								</div>
							</div>
						</div>
					</div>
					<!--  end "faq-tablist" -->
				</div>
				<!-- end "faq-content-wrap" -->
			</div>
			<!-- end "faq_wrap -->
		</div>
		<!-- end "contents_handus -->
	</div>


</body>
</html>