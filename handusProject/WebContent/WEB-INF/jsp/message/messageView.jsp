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
<script type="text/javascript" src="${pageContext.request.contextPath}/js/sockjs.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/stomp.js"></script>
<style type="text/css">
	.container{
		padding: 0;
		width: 100%;
		margin: 0 auto;
		
	}
	#message{
		height: 600px;
	}
	
	#title{
		border-bottom: 1px solid black;
		height: 20px;
		text-align: center;
		padding: 10px;
		position: fixed;
		width: 100%;
		background-color: #FBF9F6;
	}
	
	#body{
		padding: 15px;
		top: 40px;
		position: fixed;
		width: 415px;
		height: 460px;
		overflow: auto;
	}
	.message-box{
		width: 250px;
		border-radius: 8px;
		border: 1px solid black;
		padding: 10px 10px;
		margin-bottom: 11px;
	}
	.box-time{
		margin-top: 7px;
		font-size: 0.7em;
	}
	.yourMsg{
		background-color: black;
		color: #FBF9F6;
		float: left;
	}
	.myMsg{
		float: right;
		text-align: right;
	}
	
	
	#sender{
		border-top: 1px solid black;
		text-align: center;
		padding: 10px 5px;
		position: fixed;
		bottom: 0; 
		width: 100%;
		background-color: #FBF9F6;
	}
	textarea{
		border: none;
		border-bottom: 1px solid black;
		background-color: #FBF9F6;
		border-radius: 3px;
	}
	textarea:focus{
		outline: none;
	}
	button[type='submit']{
		outline: none;
		border: none;
		width: 80px;
		background-color: black;
		color: #FBF9F6;
		padding: 5px;
	}
	.message-write, .write-buttn{
		display: inline-block;
	}
	.message-write{
		position: relative;
		bottom: 5px;
		left: 10px;
		margin-right: 20px;
		margin-top: 10px;
/* 		float: left; */
	}
	.write-buttn{
		position: relative;
		bottom: 10px;
		right: 10px;
/* 		float: right; */
	}
</style>
<script type="text/javascript">
	
	var yourId = ${yourID};
	
	$(function () {
		connect();
		scrollAuto();
		
		// 전송 버튼 
		$("#sendBtn").on("click", function () {
			// 전송 버튼 : 메세지 DB에 저장, 웹소켓에 메세지 보내기 
			var msg = $("#message-text").val();
			// DB에 메세지 저장 
			$.ajax({
				url: "${pageContext.request.contextPath}/message/sendMsg",
				data: {
					"m_pk": '${myId}',
					"msg": msg,
					"chat_num": '${chatNum}'
				},
				dataType: "json",
				success: function (data) {
					// append 
					var myMsg = $("<div class='message-box myMsg'><div>");
					var msgContent = $("<div class='box-content'>"+data.content+"</div>");
					var msgTime = $("<div class='box-time'>"+data.time+"</div>");
					myMsg.append(msgContent).append(msgTime);
					$("#body").append(myMsg);
					scrollAuto();
					
					// sendMsg 
					sendMsg(msg, yourId);
				},
				error: function () {
					alert("메세지 저장 에러");
				}
			});
			
		});
	});
	
	
	// 소켓 연결 
	var sock;
	var stompClient;
	function connect() {
		if(sock==null){
			// 웹소켓에 연결 
			sock = new SockJS("${pageContext.request.contextPath}/connect");
			// 메세지 송신, 수신 
			stompClient = Stomp.over(sock);
			
			stompClient.connect({}, function () {
				var myId = ${myId};
				stompClient.subscribe("/subscribe/send"+myId, function (message) {
					// 작성된 url로 메세지가 들어오면 함수 실행 
					alert("들어온메세지: "+message);
					addYourMsg(message);
					scrollAuto();
					
					// read > 1 
					
					
				});
			});
		}
	};
	// 들어온 메세지 append 
	function addYourMsg(message) {
		var myMsg = $("<div class='message-box yourMsg'><div>");
		var msgContent = $("<div class='box-content'>"+message.msg+"</div>");
		var msgTime = $("<div class='box-time'>"+message.time+"</div>");
		myMsg.append(msgContent).append(msgTime);
		$("#body").append(myMsg);
	};
	
	// 메세지 전송 
	function sendMsg(msg, yourId) {
		alert("SEND>> Msg: "+msg+"to send: "+yourId);
		stompClient.send("/handus/send"+yourId, {}, msg);
		$("#message-text").val("");
	};
	
	function scrollAuto() {
		$("#body").scrollTop( 1300 );
	};
	
	function read() {
		$.ajax({
			url: "${pageContext.request.contextPath}/message/read",
			data: {
				"chatNum": '${chatNum}'
			},
			dataType: "json",
			success: function (result) {
				if(result) alert("read 업데이트됨");
			},
			error: function () {
				alert("read 업데이트 에러");
			}
		});
	};
</script>
</head>
<body>
	<div class='container'> <!-- 필수!! side,header는 필요에따라 추가 하면됩니다. -->
		<div id="message">
			<!-- 상대방 이름 -->
			<div id="title">
				<span class="you-name"> ${yourName } </span>
			</div>
			<!-- 메세지 내용 -->
			<div id="body">
				<!-- 반복문 -->
				<c:forEach items="${msgList }" var="message">
					<!-- 내가 보낸 메세지인지 확인 -->
					<c:choose>
						<c:when test="${message.MD_WRITER_PK eq myId }">
							<div class="message-box myMsg">
								<div class="box-content">${message.MD_CONTENT }</div>
								<div class="box-time">${message.MD_WRITEDATE }</div>
							</div>
						</c:when>
						<c:otherwise>
							<div class="message-box yourMsg">
								<div class="box-content">${message.MD_CONTENT }</div>
								<div class="box-time">${message.MD_WRITEDATE }</div>
							</div>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				
				
			</div>
			<!-- 메세지 보내는 부분 -->
			<div id="sender">
				<div class="message-write"><textarea onkeyup="xSize(this)" cols="40" id="message-text"></textarea></div>
				<!-- textare 크기 조절 함수  -->
				<script>
				    function xSize(e)
				    {
				        e.style.height = '1px';
				        var h = (e.scrollHeight + 12);
				        if(h>=90) h = 90;
				        e.style.height = h + 'px';
				    }
				</script>
				<div class="write-buttn"><button type="submit" id="sendBtn"> 전송 </button></div>
			</div>
		</div>
		
		
	</div>
</body>
</html>