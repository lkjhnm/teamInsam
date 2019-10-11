<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Handus</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/handus.css" />
<link href="https://fonts.googleapis.com/css?family=Hepta+Slab|Nanum+Gothic|Nanum+Myeongjo|Noto+Serif+KR&display=swap" rel="stylesheet">
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<style type="text/css">
	.container{
		width: 400px;
		margin: 0 auto;
		padding: 20px;
	}
	.title{
		text-align: center;
		margin: 0 auto;
		font-weight: bolder;
		font-size: 1.2em;
		margin-bottom: 30px;
		margin-top: 20px;
	}
	.send-button{
		width: 100px;
		color: #FBF9F6; 
		padding: 9px 15px;
		background-color: black;
		font-size: 0.8em;
		text-align: center;
	}
	.button{
		border-bottom: 1px solid black;
		height: 29px;
	}
	
	#msg-body{
		clear: both;
		border-collapse: collapse;
	}
	.messages{
		border: 1px solid black;
		border-top: none;
		height: 50px;
		padding: 10px 20px;
	}
	.messages:hover{
		cursor: pointer;
		background-color: rgba(0,0,0,0.05);
	}
	.msg-sender{
		font-weight: bold;
		margin-bottom: 3px;
	}
	.msg-recieve{
		font-size: 0.9em;
	}
	.msg-contents, .msg-date, .alarm-msg{
		display: inline-block;
	}
	.msg-contents{
		width: 180px;
	}
	.msg-date{
		float: right;
	}
	.alarm-msg{
		color: #FF1D43;
		font-weight: bold;
	}
</style>
<script type="text/javascript">
	$(function () {
		$("#msg-icon").on("click", function () {
			alert("새 메세지 보내기");
			
		});
		
		var chatNum = 1; // 목록 그리면서 받아와서 저장 
		// 클릭 -> 채팅방 열기
		$(".messages").on("click", function () {
// 			alert("채팅방 열기!"); 
			window.open('${pageContext.request.contextPath}/message/chat?chatNum='+chatNum , '_blank', 'width=440, height=600, resizable=no, location=no, toolbar=no, menubar=no');
		});
		
	});
</script>
</head>
<body>
	<div class='container'> <!-- 필수!! side,header는 필요에따라 추가 하면됩니다. -->	
		
		<div id="messageList">
			<div id="msg-body">
				<div class="title">M E S S A G E</div>
				<div class="button"><span class="send-button"> 받은 메세지 </span></div>
<!-- 			<table> -->
<!-- 				<tr class="messages"> -->
<!-- 					<td class="msg-sender"> $보낸사람 </td> -->
<!-- 					<td class="msg-recieve"> -->
<!-- 						<span class="msg-contents"> $최근 메세지 내용 </span> -->
<!-- 						<span class="msg-date"> 10월 02일 <span class="alarm-msg"> (0)</span></span> -->
<!-- 					</td> -->
<!-- 				</tr> -->
<!-- 			</table> -->
				<!-- 반복문 / javascript 출력 -->
				<div class="messages">
					<input value="$방번호" type="hidden">
					<div class="msg-sender"> $보낸사람 </div>
					<div class="msg-recieve">
						<div class="msg-contents"> $최근 메세지 내용 </div>
						<div class="msg-date"> 10월 02일 <span class="alarm-msg"> (1) </span> </div>
					</div>
				</div>
<!-- 				<div class="messages"> -->
<!-- 					<div class="msg-sender"> $보낸사람 </div> -->
<!-- 					<div class="msg-recieve"> -->
<!-- 						<div class="msg-contents"> $최근 메세지 내용 </div> -->
<!-- 						<div class="msg-date"> 10월 01일 <span> (0) </span> </div> -->
<!-- 					</div> -->
<!-- 				</div> -->
				
				
			</div>
		</div>
		
	</div>
</body>
</html>
