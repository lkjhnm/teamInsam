<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%-- <%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hadus|FAQ</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/handus.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/handusFAQ.css" />
<link href="https://fonts.googleapis.com/css?family=Hepta+Slab|Nanum+Gothic|Nanum+Myeongjo|Noto+Serif+KR&display=swap" rel="stylesheet" S/>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://kit.fontawesome.com/c62d0d5d4f.js"></script>
<style type="text/css">
a {
	text-decoration: none;
	color: #20130F;
}

.faq-title-td:visited {
	background-color: #98ab12;
}

ul {
	list-style: none;
}

p {
	padding-top: 20px;
	padding-bottom: 20px;
}

h4 {
	font-family: 'Ubuntu', sans-serif;
}

.faq-content-table tr .category {
	 width : 70px; 
}


.faq-content-table tr td {
	margin: auto;
	font-size: 12pt;
	color: #333333;
	text-align: left;
	border-bottom: 1px solid #dcdcdc;
	overflow: auto;
}

.faq-content-table tr td .tit {
	text-align: left;
	margin: auto;
	padding: 20px 0 20px 42px;
	background:
		url("${pageContext.request.contextPath}/resources/img/a.png")
		no-repeat 0 23px;
	color: #222;
	font-size: 14px;
	line-height: 18px;
	margin: auto;
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
</style>

<script type="text/javascript">
	
		//faq 화면 보자마자 list뿌리기
		$(document).ready(function(){
			var table = $("#faq-content-table");
			$.ajax({
				url: "faqList",
				type: "post",
				dataType : "json",
				success:function(d){
						console.log(d);
					var faqArr =d;
					for(var i=0; i<faqArr.length; i++) {
						//category 확인
						console.log(faqArr[i].faq_category);
						if(faqArr[i].faq_category == "주문/결제") {
							//테이블 그려줌
							//제목
							var tr = $("<tr>");
							tr.append($("<td class='category' style='font-size: 12px; font-weight: bold;' colsapn='2'>").text(faqArr[i].faq_category));
								var mytitle = $("<a href=\"#\">").text(faqArr[i].faq_title);
							var titletd = $("<td class='title' colsapn='2'>").append(mytitle);
							tr.append(titletd);
							var tr1 = $("<tr>");
							var mycontent = $("<p class='tit'>").text(faqArr[i].faq_content);
							var contenttd = $("<td class='contents' colspan='2'>").append(mycontent);
							tr1.append(contenttd);
							
							var num = faqArr[i].faq_idNum;
							table.append(tr);
							table.append(tr1);
							
							$('.list-customer tr').hide();
							$('.list customer tr td').hide();
							$('.list-customer').find('.title').parent().show(); 
							$('.list-customer .title').parent().on("click", function() {
							$('.list-customer tr').hide();
							$('.list-customer').find('.title').parent().show();								
							var tr = $('.list-customer tr');
							var rindex = $(this).parent().children().index(this); 
							$(this).children().css('color', '#000000'); 
							for(var i = rindex; i<rindex+2; i++) {
								$(tr[i]).show();
								
								}
							});
							$('.list-customer tr').on("click", function(){
								$('.contents').css('background-color','#ffffff');
							});
						}
					}
				},
				error:function(){
					
				}
			});
			
		});
		
		$(document).ready(function(){
			$("#order").on("click", function(){ //id order 버튼을 클릭하면 이벤트 함수 실행
				drawList();
				function drawList() {
					$("#faq-content-table").empty();
					$("#faq-content-table tr:gt(0)").remove();
					var table = $("#faq-content-table");
					$.ajax({
						url: "faqList",
						type: "post",
						dataType : "json",
						success:function(d){
 							console.log(d);
							var faqArr =d;
							for(var i=0; i<faqArr.length; i++) {
								//category 확인
								console.log(faqArr[i].faq_category);
								//제목 클릭시 (code or category)파라미터 호출 > 해당하는 제목에 관련된 content 불러오기
								if(faqArr[i].faq_category == "주문/결제") {
									//테이블 그려줌
									//제목
									var tr = $("<tr>");
									tr.append($("<td class='category' style='font-size: 12px; font-weight: bold;' colsapn='2'>").text(faqArr[i].faq_category));
	 								var mytitle = $("<a href=\"#\">").text(faqArr[i].faq_title);
									var titletd = $("<td class='title' colsapn='2'>").append(mytitle);
									tr.append(titletd);
									var tr1 = $("<tr>");
									var mycontent = $("<p class='tit'>").text(faqArr[i].faq_content);
									var contenttd = $("<td class='contents' colspan='2'>").append(mycontent);
									tr1.append(contenttd);
									
	 								var num = faqArr[i].faq_idNum;
									//테이블 그린걸 html에 뿌려주기
									table.append(tr);
									table.append(tr1);
									
									//제목 클릭시 답변 클릭
									$('.list-customer tr').hide();
									$('.list customer tr td').hide();
									$('.list-customer').find('.title').parent().show(); //class가 title인 td가 속한 tr을 보이기 위한 작업
									$('.list-customer .title').parent().on("click", function() {
									$('.list-customer tr').hide();
									$('.list-customer').find('.title').parent().show();
										
									var tr = $('.list-customer tr');
									var rindex = $(this).parent().children().index(this); //클릭한 tr의 인덱스를 찾아 변수에 저장
									$(this).children().css('color', '#000000'); // 클릭한 tr(제목)에만 글씨색을 회색으로 지정
									for(var i = rindex; i<rindex+2; i++) { //클릭한 tr의 다음(1이면 2) tr 인덱스를 찾기 위한 작업
										$(tr[i]).show(); //찾아낸 인덱스 tr을 보이기 위한 작업
										
										}
									});
									$('.list-customer tr').on("click", function(){
										$('.contents').css('background-color','#ffffff');
									});
								}
							}
						},
						error:function(){
							
						}
					});
				}
			});
			$("#member").on("click", function(){
//				alert("456");
				$("#faq-content-table").empty();
				var table = $("#faq-content-table");
				$.ajax({
					url: "faqList",
					type: "post",
					dataType : "json",
					success: function(d){
						var faqArr =d;
						for(var i=0; i<faqArr.length; i++) {
							console.log(faqArr[i].faq_category);
							if(faqArr[i].faq_category == "로그인/회원") {
								var tr = $("<tr>");
								tr.append($("<td class='category' style='font-size: 12px; font-weight: bold;' colsapn='2'>").text(faqArr[i].faq_category));
 								var mytitle = $("<a href=\"#\">").text(faqArr[i].faq_title);
								var titletd = $("<td class='title' colsapn='2'>").append(mytitle);
								tr.append(titletd);
								var tr1 = $("<tr>");
								var mycontent = $("<p class='tit'>").text(faqArr[i].faq_content);
								var contenttd = $("<td class='contents' colspan='2'>").append(mycontent);
								tr1.append(contenttd);
								
 								var num = faqArr[i].faq_idNum;
								//테이블 그린걸 html에 뿌려주기
								table.append(tr);
								table.append(tr1);
								
								//제목 클릭시 답변 클릭
								$('.list-customer tr').hide();
								$('.list customer tr td').hide();
								$('.list-customer').find('.title').parent().show(); //class가 title인 td가 속한 tr을 보이기 위한 작업
								$('.list-customer .title').parent().on("click", function() {
								$('.list-customer tr').hide();
								$('.list-customer').find('.title').parent().show();
								var tr = $('.list-customer tr');
								var rindex = $(this).parent().children().index(this); //클릭한 tr의 인덱스를 찾아 변수에 저장
								$(this).children('.title').css('color', '#94a655'); // 클릭한 tr(제목)에만 글씨색을 회색으로 지정
								for(var i = rindex; i<rindex+2; i++) { //클릭한 tr의 다음(1이면 2) tr 인덱스를 찾기 위한 작업
									$(tr[i]).show(); //찾아낸 인덱스 tr을 보이기 위한 작업
									}
								});
								$('.list-customer tr').on("click", function(){
									$('.contents').css('background-color','#ffffff');
								});
							}
						}
					},
					error : function(){
						
					}
						
				});
				
			});
			$("#other").on("click",function(){
				$("#faq-content-table").empty();
				var table = $("#faq-content-table");
				$.ajax({
					url : "faqList",
					type: "post",
					dataType : "json",
					success: function(d){
						var faqArr = d;
						for(var i=0; i<faqArr.length; i++) {
							if(faqArr[i].faq_category == "기타문의") {
								var tr = $("<tr>");
								tr.append($("<td class='category' style='font-size: 12px; font-weight: bold;' colsapn='2'>").text(faqArr[i].faq_category));
 								var mytitle = $("<a href=\"#\">").text(faqArr[i].faq_title);
								var titletd = $("<td class='title' colsapn='2'>").append(mytitle);
								tr.append(titletd);
								var tr1 = $("<tr>");
								var mycontent = $("<p class='tit'>").text(faqArr[i].faq_content);
								var contenttd = $("<td class='contents' colspan='2'>").append(mycontent);
								tr1.append(contenttd);
								
 								var num = faqArr[i].faq_idNum;
								//테이블 그린걸 html에 뿌려주기
								table.append(tr);
								table.append(tr1);
								
								//제목 클릭시 답변 클릭
								$('.list-customer tr').hide();
								$('.list customer tr td').hide();
								$('.list-customer').find('.title').parent().show(); //class가 title인 td가 속한 tr을 보이기 위한 작업
								$('.list-customer .title').parent().on("click", function() {
								$('.list-customer tr').hide();
								$('.list-customer').find('.title').parent().show();
									
								var tr = $('.list-customer tr');
								var rindex = $(this).parent().children().index(this); //클릭한 tr의 인덱스를 찾아 변수에 저장
								$(this).children().css('color', '#000000'); // 클릭한 tr(제목)에만 글씨색을 회색으로 지정
								for(var i = rindex; i<rindex+2; i++) { //클릭한 tr의 다음(1이면 2) tr 인덱스를 찾기 위한 작업
									$(tr[i]).show(); //찾아낸 인덱스 tr을 보이기 위한 작업
									}
								});
								$('.list-customer tr').on("click", function(){
									$('.contents').css('background-color','#ffffff');
								});
							}
						}
					},
					error : function(){
						
					}
				});
			});
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
					<h4 style="letter-spacing: 0.2em;">SERVICE CENTER</h4>
				</div>
				<!-- end "title_top" -->
				<div class="inSub">
					<h3>
						FAQ
						<span>자주 묻는 질문들</span>
					</h3>
				</div>	
				<div class="faq-content-wrap">
					<table class="faq-title-table">
						<tbody>
							<tr>
								<!-- category는 나중에 변수명에 따라서 바뀌는 부분 -->
								<td class="faq-title-td" id="order" >주문/결제</td>
								<td class="faq-title-td" id="member">로그인/회원정보</td>
								<td class="faq-title-td" id="other">기타문의</td>
							</tr>
						</tbody>
					</table>
		
					<div id="faq-tabLoad">
						<div class="list-customer">
							<table class="faq-content-table" id="faq-content-table">
								<tr>
									
								</tr>
							</table>
						</div>
					</div>
						<p class="common1s-text">찾으시는 질문이 없다면?</p>
					<div class="area1sButton">
						<a href="#" class="btnGreen">1:1문의하기</a>
					</div>
				</div>
				<!-- end "faq-content-wrap" -->
			</div>
			<!-- end "faq_wrap -->
		</div>
		<!-- end "contents_handus -->
	</div>

</body>
</html>