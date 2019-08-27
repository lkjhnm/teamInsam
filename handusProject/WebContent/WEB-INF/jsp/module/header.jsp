<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="https://fonts.googleapis.com/css?family=Hepta+Slab|Nanum+Gothic|Nanum+Myeongjo|Noto+Serif+KR&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/c62d0d5d4f.js"></script>
<script type="text/javascript">
	$(function(){
		
		var url = window.location.pathname;
		var indexS = url.indexOf('/',1)
		var indexL = url.indexOf('/',indexS+1)
		var page = url.substring(indexS+1,indexL)
		var headInter;
		
		switch(page){
			case 'auction':
				$("#menuAuction").css("color", "#ff1d43")
				$("#menuAuction").css("border-top","1px solid #707070")
				break;
			case 'item':
				$("#menuItem").css("color", "#ff1d43")
				$("#menuItem").css("border-top","1px solid #707070")
				break;
			case 'studio':
				$("#menuStudio").css("color", "#ff1d43")
				$("#menuStudio").css("border-top","1px solid #707070")
				break;
		}
		
		$(".menuLink").on("mouseover",function(){
			var i = 0;
			headInter = setInterval(() => {
				i++
				if(i == 2){
					$(this).siblings().animate({
						opacity : '0.2'
					})
				}
			}, 100);
		})
		$(".menuLink").on("mouseleave",function(){
			clearInterval(headInter)
			$(this).siblings().animate({
				opacity : '1'
			})
		})
		
		$("#menuAuction").on("click",function(){
			location.href='${pageContext.request.contextPath}/auction/list'
		})
		$("#menuStudio").on("click",function(){
			location.href='${pageContext.request.contextPath}/studio/list'
		})
		
		$("#headerTitle").on("click",function(){
			location.href="${pageContext.request.contextPath}/main"
		})
		
		$("#loginHeader").on("click",function(){
			location.href="${pageContext.request.contextPath}/member/login"
		})
	})
</script>
<div id="header">
	<div id="menuContainer">
		<span class='menuLink' id="menuItem">I T E M</span>
		<span class='menuLink' id="menuAuction">A U C T I O N</span>
		<span class='menuLink' id="menuStudio">S T U D I O</span>
	</div>
	<span id="headerTitle">
		<i>Handus</i>
	</span>
	<div id="iconContainer">
		<span id="loginHeader"><img src="${pageContext.request.contextPath }/img/header-icon-account.svg"></span>
		<span id="subscribeHeader"><img src="${pageContext.request.contextPath }/img/header-icon-bookmark.svg"></span>
		<span id="shoppingCartHeader"><img src="${pageContext.request.contextPath }/img/header-icon-cart.svg"></span>
	</div>
</div>
