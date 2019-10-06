<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/handus.css" />
<link href="https://fonts.googleapis.com/css?family=Hepta+Slab|Nanum+Gothic|Nanum+Myeongjo|Noto+Serif+KR&display=swap" rel="stylesheet">
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://kit.fontawesome.com/c62d0d5d4f.js"></script>
<style>
	#alarmNav{
		height:50px;
		background-color: #191919;
		display:flex;
		justify-content: center;
	}
	#alarmNav>ul{
		list-style: none;
		margin:0;
		padding:0;
		width:100%;
		display:flex;
		justify-content: space-around;
	}
	#alarmNav li{
		border-bottom: 1px solid #fff;
		color:#fff;
		margin:10px;
		padding:5px;
	}
	#alarmNav li:hover{
		cursor:pointer;
		color: #ff1d43;
		border-bottom-color: #ff1d43;
	}	
	.alarm{
		height: 100px;
		text-align: center;
		display: flex;
		align-items: center;
		justify-content: space-evenly;
 		border-bottom: 1px solid #191919; 
	}
	img{
		border-radius:50%;
		border: 1px solid #191919;
	}
	.moreBtn:hover{
		cursor:pointer;
		color:#ff1d43;
	}
	.message{
		font-weight: 600;
	}
</style>
<script type="text/javascript">
	$(function(){
		console.log("${alarmList}")
	})
</script>
</head>
<body>
	<div class='alarmContainer'>
		<div id="alarmNav">
			<ul>
				<li> NEW </li>
				<li> READ </li>
				<li> ALL </li>
			</ul>
		</div>
		<div id='messageContainer'>
			<div class='alarm'>
				<img width="65px" height="65px">
				<span class='message'> 작가님 작품이 등록되었습니다. </span>
				<span class='moreBtn'><i class="fas fa-angle-double-right"></i></span>
			</div>
			<div class='alarm'>
				<img width="65px" height="65px">
				<span class='message'> 구독한 경매가 시작되었습니다. </span>
				<span class='moreBtn'><i class="fas fa-angle-double-right"></i></span>
			</div>	
			<div class='alarm'>
				<img width="65px" height="65px">
				<span class='message'> 구독한 경매가 종료되었습니다. </span>
				<span class='moreBtn'><i class="fas fa-angle-double-right"></i></span>
			</div>
							
		</div>
	</div>
</body>
</html>