<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	}
	#validateContainer{
		width: 75%;
		margin:0 auto;
		padding-top: 125px;
	}
	#validateTitle{
		font-size: 23px;
		margin-left:35px;
	}
	.text-position{
		width: 90%;
		margin: 10px auto;
		font-size: 16px;
	}
	.signUpBox{
		width: 90%;
		height: 60px;
		margin: 20px auto;
		line-height: 30px;
		font-weight: 400;
	}
	.signUpBox input{
		width: 500px;
		height: 30px;
		border-top:0;
		border-left:0;
		border-right:0;
		border-bottom: 1px solid #191919;
		background-color: inherit;
	}
	.signUpBox input:focus{
		outline: none;
	}
	.signUpBox button{
		width: 120px;
		height: 30px;
		background-color: #191919;
		color: #fff;
		border: none;
	}
	.signUpBox button:hover{
		cursor:pointer;
	}
</style>
</head>
<body>
	<div class='container'>
		<jsp:include page="/WEB-INF/jsp/module/header.jsp"/>
		
		<div id="main">
			<div id="validateContainer">
				<fieldset>
					<legend id="validateTitle"> E M A I L &nbsp; V A L I D A T E</legend>
					<form action="#">
						<div class="text-position"> 
							회원 가입을 위한 이메일을 발송하였습니다.<br>			
						</div>
						<div class='signUpBox'>
							<label> VALIDATE <br>
									<input type="text" id="m_confirm"> &nbsp;<button type="submit">S U B M I T</button>
							</label>
						</div>
					</form>
				</fieldset>
			</div>
		</div>
	</div>
</body>
</html>