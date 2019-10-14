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
		font-weight: bold;
		width: 10px;
		height: 10px;
		border-radius: 10px;
		margin-left: 5px;
	}
	.alarm-red{
		background-color: #FF1D43;
	}
</style>
<script type="text/javascript">
	var sock;
	var stompClient;
	function connect() {
		if(sock==null){
			sock = new SockJS("${pageContext.request.contextPath}/connect");
			stompClient = Stomp.over(sock);
			stompClient.connect({}, function () {
				
				var myId = ${myId };
				stompClient.subscribe("/subscribe/chatList/"+myId, function (message) {
					var msg = message.body;
					if(msg != 'drawList'){
						read(msg);
					}
					drawList();
				});
			});
		}
		alert("소켓 연결");
	};
	
	
	$(function () {
		connect();
		drawList();
		
	});
	
	// 채팅방 목록 그리기 
	function drawList() {
		$("#msg-body div:gt(1)").remove();
		
		$.ajax({
			url: "${pageContext.request.contextPath}/message/drawList",
			dataType: "json",
			success: function (list) {
				// 리스트 그리기 
				for(var i = 0; i < list.length; i++){
					let msg = $("<div class='messages' data-num='"+list[i].ML_NUM+"'></div>");
					var sender = $("<div class='msg-sender'>"+list[i].your_name+"</div>");
					
					// 읽은 메세지인지 안읽은 메세지인지 확인 
					if(list[i].ML_READ == 0 && list[i].ML_WRITER != ${myId} ){
						var reciever = $("<div class='msg-recieve'>").append($("<div class='msg-contents'>"+list[i].MSG_CONTENT+"</div>"))
						.append($("<div class='msg-date'>"+list[i].ML_UPDATE_DATE+"<span class='alarm-msg alarm-red' data-type="+list[i].ML_NUM+"></span> </div>"));
					}else{
						var reciever = $("<div class='msg-recieve'>").append($("<div class='msg-contents'>"+list[i].MSG_CONTENT+"</div>"))
						.append($("<div class='msg-date'>"+list[i].ML_UPDATE_DATE+"<span class='alarm-msg' data-type="+list[i].ML_NUM+"></span> </div>"));
					}
					
					// div 클릭시 해당 번호의 메세지창 열기 
					(function (n) {
						msg.on("click", function () {
							$(this).find(".alarm-red").removeClass("alarm-red");
							var ml_num = $(this).attr("data-num");
							window.open('${pageContext.request.contextPath}/message/chat?chatNum='+list[n].ML_NUM+'&yourId='+list[n].your_id, '_blank', 'width=440, height=600, resizable=no, location=no, toolbar=no, menubar=no');
						});
					})(i);
					
					msg.append(sender);
					msg.append(reciever);
					
					$("#msg-body").append(msg);
				}
				
			},
			error: function () {
				alert("목록 그리기 에러");
			}
		});
	};
	
	function read(num) {
		$.ajax({
			url: "${pageContext.request.contextPath}/message/read",
			data: {
				"chatNum": num
			},
			dataType: "json",
			success: function (result) {
				if(result) alert("read+1"+num);
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
		
		<div id="messageList">
			<div id="msg-body">
				<div class="title">M E S S A G E</div>
				<div class="button"><span class="send-button"> 받은 메세지 </span></div>
				
			</div>
		</div>
		
	</div>
</body>
</html>
