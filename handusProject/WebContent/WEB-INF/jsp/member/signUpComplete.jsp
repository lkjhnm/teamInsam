<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Handus</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/handus.css" />
<link href="https://fonts.googleapis.com/css?family=Hepta+Slab|Nanum+Gothic|Nanum+Myeongjo|Noto+Serif+KR&display=swap" rel="stylesheet">
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<style>
	#main{
		width: 70%;
		margin: 0 auto;
		padding-top: 100px;
	}
	#comtitle{
		text-align: center;
		font-size: 35px;
		font-weight: 600;
	}
	
	.text{
		width: 625px;
		font-size: 18px;
		margin: 10px auto;
	}
	.boundary{
		margin-top: 30px;
		height: 50px;
	}
	#textBox{
		width: 800px;
		margin: 5px auto;
		border:1px solid #191919;
		padding: 30px;
	}
	#footer{
		height: 100px;
		width: 100%;
		background-color: inherit;
		border-top:1px solid #191919;
		position: fixed;
		bottom:0;
		text-align: center;
		padding-top: 100px;
	}
	#reSubmit{
		width: 100px;
		height: 30px;
		background-color: #191919;
		border: 1px solid #191919;
		color:#fff;
	}
	#confirm{
		width: 100px;
		height: 30px;
		background-color: #191919;
		border: 1px solid #191919;
		color:#fff;
	}
	.reButton{
		width: 625px;
		font-size: 18px;
		margin: 10px auto;
		text-align: end;
	}
	#resultModal{
		display:none;
		width: 650px;
		height: 300px;
		background-color: inherit;
		position:fixed;
		top:38%;
		left:50%;
		transform: translate(-50%,-50%);
		border: 3px solid #191919;
	}
	#modalTitle{
		margin-top:20px;
		font-size: 30px;
		font-weight: 600;
		text-align: center;
		
	}
	.modalBody{
		width: 400px;
		margin: 60px auto;
		font-size: 20px;
		text-align: center;
	}
	#reSubmit{
		cursor:pointer;
	}
	#reButton{
		cursor:pointer;
	}
</style>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.username" var="userid"/>
	<script>
	$(function(){
		$("#reSubmit").on("click",function(){
			$.ajax({
				url:"reSendMail",
				type:"post",
				data: {m_id : "${userid}"},
				dataType:"json",
				success:function(result){
					$(".modalBody").text("이메일을 재전송 하였습니다.")
					$("#resultModal").css({"display":"block"})
				},
				error:function(){
					alert("에라")
				}
			})
		})
	})
	</script>
</sec:authorize>
<sec:authorize access="isAnonymous()">
	<script>
		$(function(){
			$("#reSubmit").on("click",function(){
				$.ajax({
					url:"reSendMail",
					type:"post",
					data: {m_pk : "${m_pk}"},
					dataType:"json",
					success:function(result){
						$(".modalBody").text("이메일을 재전송 하였습니다.")
						$("#resultModal").css({"display":"block"})
					}					
				})
			})
		})					
	</script>
</sec:authorize>
<script>
	$(function(){
		
		var result = "${result}";

		if(result == 'true'){
			$("#resultModal").css({"display":"block"})
		}else if(result == 'false'){
			$("#resultModal").css({"display":"block"})
		}
		
		$("#confirm").on("click",function(){
			if(result == 'true'){
				location.href='loginForm';
			}else{
				$("#resultModal").css({"display":"none"})
			}			
		})
			
	})
</script>
</head>
<body>
	<div class='container'>
		<jsp:include page="/WEB-INF/jsp/module/header.jsp"/>
		
		<div id="main">
			<div id="comtitle"> WELCOME HANDUS  </div>
			<div class='boundary'></div>
			<div id="textBox">
				<div class='text'> 회원님의 안전한 가입을 위해 기재하신 이메일로 인증번호를 발송하였습니다.</div>
				<div class='text'> 만약, 이메일이 오지 않았다면 재전송 버튼을 눌러주세요.</div>
				<div class='reButton'><button id="reSubmit">재전송</button></div>
			</div>
		</div>
	</div>
	<div id="resultModal">
		<div id="modalTitle"> HANDUS </div>
		<div class='modalBody'>
			<c:choose>
				<c:when test="${result eq true }">
						이메일 인증에 성공하였습니다. 
				</c:when>
				<c:when test="${result eq false }">
						만료된 이메일 입니다. <br> 재전송 버튼을 클릭해주세요.
				</c:when>
			</c:choose>
		</div>
		<div class="reButton" style="width:285px;"><button id="confirm">확 인</button></div>
	</div>
	<div id="footer">
		카피라이트 어쩌구 저쩌구 으아아아아 누가 나중에 수정하겠지
	</div>
</body>
</html>