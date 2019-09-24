<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		width:70%;
		margin: 0 auto;
		padding-top: 100px;
	}
	.myPage-title{
		font-size:25px;
		margin-left: 50px;
	}
	.myPage_container{
		display: flex;
		justify-content: center;
		margin: 0 auto;
	}
	.myPage_container > div{
		margin: 25px;
	}
	.information{
		width:525px;
		height:150px;
		margin:0 auto;
	}
	.information>div{
		border-bottom: 1px solid #191919;
		margin-bottom: 10px;
		display:flex;
		justify-content: space-between;
		padding: 5px;
	}
	.info-title{
		font-weight:600;
	}
	.info-value{
		font-weight:500;
	}
	fieldset{
		display:inline-block;
		width: 625px;
	}
	#top-container{
		width: 1325px;
		margin: 0px auto;
		margin-bottom: 150px;
	}
	.information ul{
		margin: 0;
	} 
	.information li{
		list-style: none;
		float:left;
		border-top : 1px solid #191919;
		border-left : 1px solid #191919;
		border-right : 1px solid #191919;
		padding: 1px;
	}
	#category-menu{
		position:relative;
		top:0;
		left:0;
	}
	.hide{
		display:none;
	}
	.hide:hover{
		color:#ff1d43;
		cursor:pointer;
	}
	#category-value{
		font-weight:500;
	}
	#category-value:hover{
		cursor:pointer;
		color:#ff1d43;
	}

	.count:hover{
		cursor:pointer;
		color:#ff1d43;
	}
	.list{ 
		margin-bottom:55px;
		margin-top:55px;
		border: 1px solid #191919;
	}
	.list > div{
		border-bottom-style: dashed;
		border-bottom-color: #ebe7dd;
		display:flex;
	}
	.list > div > div{
		height:230px;
		margin-bottom:55px;
		margin-top:55px;
	}
	.list img{
		width:230px;
		height:230px;
		margin: 45px;
	}
	.list_container{
		width:1325px;
		margin: 0px auto;
	}
	.item-detail{
		postion:relative;
		top:0;
		left:0;
	}
	.tab_menu{
		width: 130px;
		display:inline-block;
		font-size: 22px;
		text-align: center;
	}
	.tab_menu:hover{
		cursor:pointer;
	}
	#tab_title{
		width: 220px;
		display:inline-block;
		font-size: 30px;
	}
	#mypage_title{
		text-align: center;
		font-size: 35px;
		font-weight: 500;
		margin-bottom: 130px;
	}
	#userBtnContainer>div{
		width: 100px;
		height: 35px;
		line-height: 35px;
		background-color: #191919;
		color: #fff;
		text-align: center;
		float:right;
		margin-right: 2px;
	}
	#userBtnContainer>div:hover{
		cursor:pointer;
	}
	.modifyMode{
		display:none;
	}
	#userBtnContainer{
		width: 210px;
		height:35px;
		position:relative;
		left: 445px;
	}
	.modify-input{
		display:none;
		font-weight:550;
		background-color: inherit;
		border:none;
		width: 225px;
		color:#191919;
		outline: none;
	}
	.hover{
		cursor:pointer;
	}
</style>
<script>
	$(function(){
		
		$("#tab_title").next().css("color","#ff1d43");
		$("#tab_title").next().siblings().not("#tab_title").css("opacity","0.5")
		
		$(".tab_menu").on("click",function(){
			$(this).css({"color":"#ff1d43", "opacity":"1"})
			$(this).siblings().not("#tab_title").css({"opacity":"0.5","color":"#191919"})
		})
		
		$("#alarmBtn").on("click",function(){
			location.href="subscribe"
		})
		
		$("#regAuthor").on("click",function(){
			location.href="${pageContext.request.contextPath}/author/signUp";
		})
		
		var isMod = false;
		$("#modifyInfoBtn").on("click",function(){
			$(".Nmodify").css("display","none");
			$(".modifyMode").css("display","block");
			$("#userInfo_container").children().css("border","1px solid #ff1d43").addClass("hover");
			
			isMod =true;
			
			$(".hover").on("click",function(){
				if(!isMod){
					return;
				}
				$(this).children("input").css("display","block").focus().val("");
				$(this).children(".info-value").css("display","none");
			})
		})
		
		$("#modifyCancel").on("click",function(){
			$(".Nmodify").css("display","block");
			$(".modifyMode").css("display","none");
			$(".info-value").css("display","block");
			$(".modify-input").css("display","none");
			$("#userInfo_container").children().css("border","none").css("border-bottom","1px solid #191919").removeClass("hover");
			isMod=false;
		})
		
		//정보 수정하기 코딩...
		$("#modifyConfirm").on("click",function(){
			
			var tmp = $("#m_name").val();
			var m_name = tmp == "" ? $("#m_name").prev().text() : tmp;
			tmp = $("#m_phonenum").val();
			var m_phonenum = tmp == "" ? $("#m_phonenum").prev().text() : tmp;
			tmp = $("#m_email").val();
			var m_email = tmp == "" ? $("#m_email").prev().text() : tmp;
			tmp = $("#m_address").val();
			var m_address = tmp == "" ? $("#m_address").prev().text() : tmp;
			
			$.ajax({
				url:'${pageContext.request.contextPath}/user/modify',
				type:"post",
				dataType:"json",
				data :{"m_name":m_name, "m_phonenum":m_phonenum, "m_email":m_email, "m_address":m_address, "m_pk":"${m_pk}"},
				success: function(data){
					if(data){
						$("#m_name").prev().text(m_name)
						$("#m_phonenum").prev().text(m_phonenum)
						$("#m_email").prev().text(m_email)
						$("#m_address").prev().text(m_address)
						
						$("#userInfo_container").children().css("border","none").css("border-bottom","1px solid #191919")
						.removeClass("hover");
						
						$(".info-value").css("display","block");
						$(".modify-input").css("display","none");
						$(".Nmodify").css("display","block");
						$(".modifyMode").css("display","none");
						isMod = false;
					}
				}
			})			
		})
	})	
</script>
</head>
<body>
	<div class='container'>
		<jsp:include page="/WEB-INF/jsp/module/header.jsp"/>
		
		<div id="main">
			<div id="mypage_title">MY PAGE</div>
			<div id="top-container">
				
				<sec:authorize access="hasRole('ROLE_AUTHOR_NV')" var="justMember"></sec:authorize>
				<div id="userBtnContainer">
					<c:choose>
						<c:when test="${justMember }">
								<div class='Nmodify' id="modifyInfoBtn">수정 하기</div>
								<div class='Nmodify' id="regAuthor">작가 등록</div>
								<div class='modifyMode' id="modifyCancel">취 소</div>
								<div class='modifyMode' id="modifyConfirm">확 인</div>
						</c:when>
						<c:otherwise>
							<div class='Nmodify' id="modifyInfoBtn">수정 하기</div>	
							<div class='modifyMode' id="modifyCancel">취 소</div>
							<div class='modifyMode' id="modifyConfirm">확 인</div>
						</c:otherwise>
					</c:choose>
				</div>
								
				<fieldset>
					<legend class="myPage-title">PROFILE</legend>
					<div class="myPage_container">
						<div class="information" id="userInfo_container">
							<div>
								<span class="info-title">NAME </span>
								<span class="info-value"> ${M_NAME } </span>
								<input class='modify-input' type="text" id="m_name">
							</div>
							<div>
								<span class="info-title">PHONE</span>
								<span class="info-value">${M_PHONENUM }</span>
								<input class='modify-input' type="text" id="m_phonenum">
							</div>
							<div>
								<span class="info-title">EMAIL </span> 
								<span class="info-value">${M_EMAIL } </span> 
								<input class='modify-input' type="text" id="m_email">
							</div>
							<div>
								<span class="info-title">ADDRESS </span>
								<span class="info-value">${M_ADDRESS }</span>
								<input class='modify-input' type="text" id="m_address">
							</div>
						</div>
					</div>
				</fieldset>
				<fieldset>
					<legend class="myPage-title">ALARM</legend>
					<div class="myPage_container">
						<div class="information">
							<div><span class="info-title">SUBSCRIBE</span><span class="info-value count" id="alarmBtn"> [ ${M_SUB_COUNT } ]</span></div>
							<div><span class="info-title">MESSAGE</span><span class="info-value count"> [ ? ] </span></div>
						</div>
						
					</div>
				</fieldset>
			</div>
			<div class='list_container'>
				<div id="tab_menu_container">
					<div id="tab_title">SHOPPING LIST</div>
					<div class="tab_menu">ITEM</div>
					<div class="tab_menu">AUCTION</div>
					<div class="tab_menu">STUDIO</div>
				</div>
				<div class="list">
					<div>
						<img>
						<div><span>제목</span></div>
					</div>
					<div>
						<img>
						<div></div>
					</div>
					<div>
						<img>
						<div></div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>