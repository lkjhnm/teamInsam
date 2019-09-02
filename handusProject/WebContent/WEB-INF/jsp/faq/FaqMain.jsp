<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HadusFAQ</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/handus.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/handusFAQ.css" />
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://kit.fontawesome.com/c62d0d5d4f.js"></script>
<style type="text/css">
	
	
	body, h1, h2, h4, h5, h6, div, p, span, strong, em, blockquote, pre, address, ul, ol, li, dl, dt, dd, form, fieldset, input, select, label, textarea, img, a {
    margin: 0;
/*     paddSing: 0px; */
    border: 0;/*;word-break:break-all;*/
    }
    
    a{
    	text-decoration: none;
    }
    
    .title_top{
		text-align: center;
		font-size: 40px;
		
    }
    
    .title_top h3:after {
    	content: "";
    	display: block;
    	 width: 120px;
    	border-bottom: 1px solid #707070;
        margin: 20px auto;
    }
    
    .AreaBtn {
    	overflow: auto;
    	margin-left: 34%
    }
    
    .faq_search {
    	overflow: auto;
    }
  
	ul {
		list-style: none;
	}
	
	legend {
    position: absolute;
    overflow: hidden;
    visibility: hidden;
    height: 0;
    z-index: -1;
	}
</style>
<script type="text/javascript">
	
	$(function(){
		/* 메뉴 리스트 */
		$(document).ready(function(){
// 			$(".list-customer>ul>li>.tit").click(function(){
// 				$(this).next("ul").toggleClass("conts");
// 			});
		$(".tit").on("click",function(){
				$(this).next().toggleClass("conts")
			})
		});
		
	});
	
// 	$(function(){
// 		/* 메뉴 리스트 */
// 		$('.list-customer >ul>li> .conts').hide(); //초기 상태에서 서브메뉴 숨김
// 		$('.list-customer >ul>li> .conts').click(function(){ //#AllList를 클릭하면
// 			$('.list-customer >ul>li .conts').slideToggle(); //#AllList .conts 를  슬라이드 토글
// 		});
		
		
// 	});
	
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
					<h3>
						Service Center
					</h3>
				</div> 
				<!-- end "title_top" -->
				<div class="AreaBtn">
					<ul class="iconTab" id="depth1">
						<li class="">
							<a href="" class="depthlaTag">주문/결제</a>
						</li>
						<li class="">
							<a href="" class="depthlaTag">로그인/회원가입</a>
						</li>
						<li class="">
							<a href="" class="depthlaTag">기타</a>
						</li>
					</ul>
				</div>
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
				<div class="TabConts">
					<div class="list-customer">
						<ul id="AllList">
							<li>
								<p class="tit">
									<strong>주문/결제</strong>
									결제 방법에는 무엇무엇이 있나요?
								</p>
								<ul class="conts">
									<li class="question">
										<p class="p0"></p>
										<p>결제방법에 관한 답변</p>
										<p></p>
									</li>
								</ul>
							</li>
							<li>
								<p class="tit">
									<strong>주문/결제</strong>
									결제/현금 영수증 조회  및 출력방법
								</p>
								<ul class="conts">
									<li class="question">
										<p class="p0"></p>
										<p>결제/현금 영수증 조회  및 출력방법에 관한 답변</p>
										<p></p>
									</li>
								</ul>
							</li>
							<li>
								<p class="tit">
									<strong>주문/결제</strong>
									적립금/예치금 사용방법
								</p>
								<ul class="conts">
									<li class="question">
										<p class="p0"></p>
										<p>적립금/예치금 사용방법에 관한 답변</p>
										<p></p>
									</li>
								</ul>
							</li>
							<li>
								<p class="tit">
									<strong>주문/결제</strong>
									장바구니에 담아놓은 상품이 사라졌어요!
								</p>
								<ul class="conts">
									<li class="question">
										<p class="p0"></p>
										<p>장바구니에 관한 답변</p>
									</li>
								</ul>
							</li>
							<li>
								<p class="tit">
									<strong>주문/결제</strong>
									취소/환불은 어떻게 하나요?
								</p>
								<ul class="conts">
									<li class="question">
										<p class="p0"></p>
										<p>취소/환불에 관한 답변</p>
										<p></p>
									</li>
								</ul>
							</li>
						</ul>
					</div>
					<!-- end "list-customer" -->
				</div>
				<!-- end "TabConts" -->
			</div>
			<!-- end "faq_wrap -->
		</div>
		<!-- end "contents_handus -->
	</div>










</body>
</html>