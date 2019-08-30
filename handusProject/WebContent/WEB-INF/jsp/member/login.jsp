<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> handus </title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/handus.css" />
<link href="https://fonts.googleapis.com/css?family=Hepta+Slab|Nanum+Gothic|Nanum+Myeongjo|Noto+Serif+KR&display=swap" rel="stylesheet">
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<style>
	body{
		font-family: 'Hepta Slab', serif;
	}
	#main{
		width: 80%;
		margin: 0 auto;
		font-family: 'Nanum Myeongjo', serif;
	}
	#loginTitle{
		text-align: center;
		font-size: 50px;
		padding-top : 125px;
	}
	#loginContainer{
		width: 80%;
		height: 500px;
		margin: 50px auto;
	}
	.loginBox{
		width: 500px;
		height: 60px;
		margin: 20px auto;
		line-height: 30px;
		font-weight: 600;
	}
	.loginBox input{
		width: 500px;
		height: 30px;
		background-color: inherit;
		border-color: #191919;
		border-top: 0;
		border-left: 0;
		border-right: 0;
		border-bottom: 1px solid;
	}
	.loginBox input:focus{
		outline:none;
	}
	#buttonBox{
		width: 500px;
		height: 100px;
		margin: 50px auto;
	}
	#buttonBox input{
		width : 503px;
		height: 50px;
		background-color: #191919;
		color: #fff;
		border: none;
	}
	#buttonBox input:focus{
		outline: none;
	}
	#buttonBox input:hover{
		cursor:pointer;
	}
	#apiButtonBox{
		margin-top : 20px;
		width: 503px;
		height: 50px;
		display: flex;
		justify-content: space-between;
	}
	.apiButton img{
		width: 250px;
		height: 50px;
	}
	.apiButton img:hover{
		cursor:pointer;
	}
	#signUp{
		width: 500px;
		margin: 0 auto;
		text-align: right;
		font-size: 14px;
		font-weight: 600;
	}
	#signUp a{
		font-size: 20px;
		text-decoration: underline;
	}
	#signUp a:link{
		color:#4a3400;
	}
	#signUp a:visited{
		color:#4a3400;
	}
	#signUp a:hover{
		color:#ff1d43;
	}
</style>
</head>
<body>
	<div class='container'>
		<jsp:include page="/WEB-INF/jsp/module/header.jsp"/>
		
		<div id="main">
			<div id="loginTitle">
				L O G I N
			</div>
			<div id="loginContainer">
				<form action="login" method="post">
					<div class='loginBox'>
						<label> I D 
							<input type="text" name="username" autocomplete="off"></label>
					</div>
					<div class='loginBox'>
						<label> PASSWORD  
							<input type="password" name="password"></label></div>
					<div id='buttonBox'>
						<input type="submit" value="LOGIN">
						<div id="apiButtonBox">
							<div id="kakaoButton" class='apiButton'>
								<img src="${pageContext.request.contextPath}/img/kakao_account_login_btn_medium_narrow.png">
							</div>
							<div id="naverButton" class='apiButton'>
								<img src="${pageContext.request.contextPath}/img/Log_in_with NAVER_Official_Green.png">
							</div>
						</div>
					</div>
				</form>
				
				<div id="signUp"><span> Are you not our Member? &nbsp;&nbsp;</span><a href="signUp">Sign Up</a></div>
			</div>
		</div>
	</div>
</body>
</html>