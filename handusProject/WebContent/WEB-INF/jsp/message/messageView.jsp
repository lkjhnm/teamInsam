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
		padding: 0;
		width: 100%;
		margin: 0 auto;
		
	}
	#title{
		border-bottom: 1px solid black;
		height: 20px;
		text-align: center;
		padding: 10px;
	}
	
	
	#body{
		padding: 15px;
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
$(function () {
	// 전송버튼 
	
	// 구독(웹소켓)
	
});
</script>
</head>
<body>
	<div class='container'> <!-- 필수!! side,header는 필요에따라 추가 하면됩니다. -->
		<div id="message">
			<!-- 상대방 이름 -->
			<div id="title">
				<span class="you-name"> $상대 이름 </span>
			</div>
			<!-- 메세지 내용 -->
			<div id="body">
				<!-- 반복문 -->
				<c:forEach items="" var="">
					<!-- 누가 보낸 메세지인지 확인 (if)문 -->
					
				</c:forEach>
				
				<div class="message-box yourMsg">
					<div class="box-content"> $상대방이 보낸 메세지 입니다. 상대방이 보낸 메세지 입니다. </div>
					<div class="box-time"> 10월 02일  오전 11:44</div>
				</div>
				<div class="message-box myMsg">
					<div class="box-content"> $내가 보낸 메세지 입니다. </div>
					<div class="box-time"> 10월 02일  오후 01:11</div>
				</div>
				<div class="message-box myMsg">
					<div class="box-content"> $내가 보낸 메세지 입니다. </div>
					<div class="box-time"> 10월 02일  오후 01:59</div>
				</div>
				
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
				<div class="write-buttn"><button type="submit"> 전송 </button></div>
			</div>
		</div>
		
		
	</div>
</body>
</html>