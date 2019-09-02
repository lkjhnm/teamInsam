<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hadus|FAQ</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/handus.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/handusFAQ.css" />
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

.faq-content-table tr td {
	font-size: 12pt;
	color: #333333;
	text-align: left;
	border-bottom: 1px solid #dcdcdc;
	font-family: 'nanumgothic';
}

.faq-content-table tr td .tit{
	text-align: left;
	margin-left: 20px;
	padding: 20px 0 20px 42px;
	background:
		url("http://image.oliveyoung.co.kr/pc-static-root/image/comm/ico_faq14x15.png")
		no-repeat 0 23px;
	color: #222;
	font-size: 14px;
	line-height: 18px;
	cursor: pointer;
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
	
		/* 메뉴 리스트 */
// 		$(document).ready(function() {
// 			$(".tit").on("click", function() {
// 				$(this).next().toggleClass().addClass("open")
// 			})
// 		});
		function drawList() {
					alert("123");
					$("#faq-content-table tr:gt(0)").remove();
					var table = $("#faq-content-table");
					$.ajax({
						url: "faqList",
						type: "post",
						dataType : "json",
						success:function(d){
							var faqArr =d.faqList;
							//json 문자열 객체화
							var jsonObject = JSON.parse(d);
							//javascript Object를 json 문자열로 만들기
							var jsonStr = JSON.stringify(jsonObject);
							alert("jsonStr: " + jsonStr);
							
							var faqArr = jsonObject;
							for(var i=0; i<faqArr.length; i++) {
								var tr = $("<tr>");
								
								tr.append($("<td>").text(faqArr[i].faq_idNum));
								tr.append($("<td>").text(faqArr[i].faq_title));
								tr.append($("<td>").text(faqArr[i].faq_conent));
								tr.append($("<td>").text(faqArr[i].faq_category));
								
								var idNum = faqArr[i].faq_idNum;
								
							}
						},
						error:function(){
							alert("예외발생");
						}
					});
		}
		function faqChange(val) {
			$(".faq-title-td").each(function(i,element){
				if((i+1) == val) {
					$(".faq-title-td:nth-child("+(i+1)+")").addClass("selected");
				}else {
					$(".faq-title-td:nth-child("+(i+1)+")").removeClass("selected");
				}
			});
		}
		
		//메뉴탭
		$(document).ready(function(){
			$("#order").on("click", function(){ //id order 버튼을 클릭하면 이벤트 함수 실행
				
			drawList();
	
			});
		});
		
		$(document).ready(function(){
			$(".faq-title-td:nth-child(1)").addClass("selected");
			listView("1");
		});
		
		//faq 글 목록 펼치기/접기
		$(document).ready(function(){
			$("#faq-content-table tr").hide(); //class가 faq-content-table인 tbody을 모두 감춘다. (펼쳐질 내용을 감춰두기 위한 작업)

			$("#faq-content-table").find('.faq-title').parent().show(); //class가 faq-title인 td가 속한 tr을 보이기 위한 작업
			$("#faq-content-table .faq-title").parent().click(function() { //class가 title인 td가 속한 tr을 클릭하면 함수실행
				$("#faq-content-table tr").hide();
				$("#faq-content-table").find('.faq-title').parent().show();
//	 			$("#faq-content-table").find('.faq-title').css('background-color', '#fff'); //class가 title인 td가 속한 tr에 배경색을 흰색으로 지정
				$("#faq-content-table").find('.faq-contents').css('background-color', '#fff');
//	 			$("#faq-content-table").find('.tit').css('color', '#969937'); //적용하면 제목 클릭했을 때 모든 제목이 체색됨
				var tr = $("#faq-content-table tr");
				
				var rindex = $(this).parent().children().index(this); //클릭한 tr의 인덱스를 찾아 변수에 저장
	  			$(this).children().find('.tit').css('color', '#969937'); //클릭한 tr(제목)에만 배경색을 회색으로 지정
				for(var i = rindex; i<rindex + 2; i++) { //클릭한 tr의 다음(1이면 2) tr 인덱스를 찾기위한 작업
					$(tr[i]).show(); //찾아낸 인덱스 tr을 보이기 위한 작업
				}
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
					<h3 style="letter-spacing: 0.2em;">SERVICE CENTER</h3>
				</div>
				<!-- end "title_top" -->
				<div class="faq_search">
					<form id="sForm" name="sForm">
						<fieldset class="search-faq">
							<legend>FAQ 검색</legend>
							<label for="inqTitNm">Search</label>
							<div class="input">
								<input type="text" id="inqTitNm" name="inqTitNm"
									title="검색어를 입력하세요." placeholder="질문을 검색하세요."> <input
									type="submit" id="searchFaq" value="검색">
							</div>
						</fieldset>
					</form>
				</div>
				<!-- end "faq_search" -->
				<div class="faq-content-wrap">
					<table class="faq-title-table">
						<tbody>
							<tr>
								<!-- category는 나중에 변수명에 따라서 바뀌는 부분 -->
								<td class="faq-title-td" id="order" onclick="javascript:faqList(order)">주문/결제</td>
								<td class="faq-title-td" id="member" onclick="javascript:faqList(member)">로그인/회원정보</td>
								<td class="faq-title-td" id="other" onclick="javascript:faqList(other)">기타문의</td>
							</tr>
						</tbody>
					</table>
		
					<div id="faq-tabLoad">
						<div class="list-customer">
							<table class="faq-content-table" id="faq-content-table">
								<tbody>
									<c:forEach items="${faqList }" var="faq">
									<tr class="tr-hover" id ="ex1_Result1">
										<td class="faq-title">
											<p class="tit">${faq.faq_title}</p>
										</td>
									</tr>
									<tr class="faq-detail" id="ex1_Result2">
										<td colspan="2" class="faq-contents">
											<p style="float: left;">${faq.faq_content }</p>
										</td>
									</tr>
									<tr class="tr-hover">
										<td class="faq-title">
											<p class="tit">질문2입니다</p>
										</td>
									</tr>
									<tr class="faq-detail">
										<td colspan="2" class="faq-contents">
											<p style="float: left;">답변2입니다</p>
										</td>
									</tr>
									<tr class="tr-hover">

										<td class="faq-title">
											<p class="tit">질문3</p>
										</td>
									</tr>
									<tr class="faq-detail">
										<td colspan="2" class="faq-contents">
											<p style="float: left;">답변3입니다</p>
										</td>
									</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>

			</div>
			<!-- end "faq_wrap -->
		</div>
		<!-- end "contents_handus -->
		<script type="text/javascript">
// 			$("#faq-title-table tr").click(function(){
				
// 				var str = "";
// 				var tdArr = new Array();
				
// 				//현재 클릭된 Row(<tr>)
// 				var tr = $(this);
// 				var td = tr.children();
				
// 				//tr.text()는 클릭된 Row 즉 tr에 있는 모든 값을 가져온다
// 				console.log("클릭한 Row의 모든 데이터 : " + tr.text());
				
// 				//반복문을 이용해서 배열에 값을 담아 사용할 수도 있음
// 				td.each(function(i){
// 					tdArr.push(td.eq(i).text());
// 				});
// 				console.log("배열에 담긴 값 : " + tdArr);
				
// 				//td.eq(index)를 통해 값을 가져올 수도 있다.
// 				var inNum = td.eq(0).text();
// 				var title = td.eq(1).text();
// 				var content = td.eq(2).text();
				
// 				str += "* 클릭된 Row의 td값 = No. : <font color = 'red'>" + no + "</font>" +
// 				", 제목 : <font color='red'>" + userid + "</font>" +
//                 ", 내용 : <font color='red'>" + name + "</font>";
                
//                 $("#ex1_Result1").html(" * 클릭한 Row의 모든 데이터 = " + tr.text());        
//                 $("#ex1_Result2").html(str);

// 			})
		</script>
	</div>












</body>
</html>